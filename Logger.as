package com.xinguoedu.utils
{
    import flash.external.ExternalInterface; 

	/**
	 * Class that sends log messages to browser console
	 * @author yatsen_yang
	 * @Date  2014-05-08
	 * 
	 */	
    public class Logger 
	{		
        private static const LEVEL_INFO : String = "INFO:";
        private static const LEVEL_ERROR : String = "ERROR:";
      
		/**
		 * 在浏览器控制台输出调试信息 
		 * @param clsName 调试信息所在的类名，方便查找
		 * @param message 调试信息
		 * 
		 */		
        public static function info(clsName:String, message:String) : void 
		{
            outputlog(LEVEL_INFO, String(clsName + '<-->' + message));
        }
		
		
		/**
		 * 在浏览器控制台输出调试信息 
		 * @param clsName 错误发生所在的类名，方便查找
		 * @param message 错误的描述信息
		 * @param details 错误的具体详细信息
		 * 
		 */		
		public static function error(clsName:String, message:String, details:String="") : void 
		{
			outputlog(LEVEL_ERROR, String(clsName + '<-->' + message + '<-->' + details));
		}

        /** Log a message to the console. **/
        private static function outputlog(level : String, message : String) : void 
		{
			ExternalInterface.available ?  ExternalInterface.call('console.log', level + message) : trace(level + message);				
        }
    }
}