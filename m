From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 17:24:21 +0100
Subject: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK
In-Reply-To: <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
 <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
Message-ID: <6128B65B15A64A418839BAC7EFC1392B@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi

No its failing in UpnpRegisterRootDevice, as i understood from checking the error code, the error is caused by some wrong response
from the webserver (httpd from busybox).
UpnpRegisterRootDevice actually asks the webserver for the upnp device descripter xml file.

As far as i remember UpnpSetWebServerRootDir is needed to set the path to the upnp descripter files (xml).


Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Gustavo Zacarias
Verzonden: woensdag 21 maart 2012 15:26
Aan: Sagaert Johan
CC: buildroot at busybox.net; 'Peter Korsgaard'
Onderwerp: Re: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK

On 2012-03-21 10:32, Sagaert Johan wrote:

> 	/*******************************************
> 	* Next, set your root web server directory.
> 	********************************************/
> 	ret = UpnpSetWebServerRootDir(WEB_ROOT_DIR);
> 	if(ret != UPNP_E_SUCCESS)
> 	{
> 		printf("upnp_init: UpnpSetWebServerRootDir failed with code: %d\n", 
> ret);
> 		return ret;
> 	}
>
> 	SNIP .....

According to the API docs, UpnpSetWebServerRootDir is only for the internal web server:

"UpnpSetWebServerRootDir sets the document root directory for the internal web server. This directory is considered the root
directory (i.e. "/") of the web server."

So i think you're doing something odd there....
Is it really failing you on UpnpInit? I've just made a tiny test case with a powerpc target uclibc 0.9.33 nptl that works just fine
up to that.
Regards.





/*
 ============================================================================
 Name        : easyplusupnpdevice.c
 Author      : js
 Version     : 1.0.0
 Copyright   : Your copyright notice
 Description : Registers eusyplus als Upnp service
 ============================================================================
 */


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>

#include <sys/socket.h>
#include <sys/ioctl.h>
//#include <linux/netdevice.h>
//#include <arpa/inet.h>

//#include <netinet/in.h>

//#include <upnp/upnp.h>
#include "getlocalip.h"

#include <upnp/upnp.h>

int upnp_start(char* hostip);
int upnp_cleanup(void);
int upnp_callback(Upnp_EventType eventtype, void *event,void *cookie);

#define WEB_ROOT_DIR "/opt/www/Upnp"
#define DEVICE_DESC_DOC "device.xml"

UpnpDevice_Handle g_device_handle;
char running=1;

// Define the function to be called when ctrl-c (SIGINT) signal is sent to process
void signal_callback_handler(int signum)
{
	running=0;
//	printf("Caught signal %d\n",signum);
}

int main(void)
{
	int ret=0;    /* General purpose error code */
	char locaal_ip[32];

	g_device_handle=0;

	// Register signal and signal handler
	signal(SIGINT, signal_callback_handler);


	printf("Dummy Upnp V 1.0.1 starting \n");
	/*************************************************
	* First, initialize the library, with the default
	* HostIP and port numbers.
	***************************************************/
	ret = UpnpInit(NULL, 0);
	if(ret != UPNP_E_SUCCESS)
	{
		printf("upnp_init: UpnpInit failed with code: %d\n", ret);
		return ret;
	}

	/*******************************************
	* Next, set your root web server directory.
	********************************************/
	ret = UpnpSetWebServerRootDir(WEB_ROOT_DIR);
	if(ret != UPNP_E_SUCCESS)
	{
		printf("upnp_init: UpnpSetWebServerRootDir failed with code: %d\n", ret);
		return ret;
	}
	//ons eigen adr bepalen
	get_local_ip(AF_INET,"eth0",locaal_ip,sizeof(locaal_ip));

	/* Call your UPnP intiialization function */
	ret = upnp_start(locaal_ip);
	if(UPNP_E_SUCCESS != ret)
	{
		printf("main: upnp_init failed\n");
		upnp_cleanup();
		return ret;
	}

	/*
	* Your device initialized, you now want to wait for some
	* user input before you clean up and close the device.
	*/
	printf("Upnp Service running...\n");

	while (running)
	{
		//ons eigen adr bepalen :UpnpGetServerIpAddress veranderd niet automatisch !!!!
		get_local_ip(AF_INET,"eth0",locaal_ip,sizeof(locaal_ip));

		//printf("IP2=%s\n",locaal_ip);

		if(strcmp(locaal_ip,UpnpGetServerIpAddress())!=0)
		{
			printf("Restarting due to IP change\n");

			//stop
			upnp_cleanup();

			//ret = UpnpInit2("eth0", 0); deze bij gebruik van upnp 1.8.8
			ret = UpnpInit(NULL, 0);
			if(ret != UPNP_E_SUCCESS)
			{
				printf("upnp_init: UpnpInit failed with code: %d\n", ret);
				return ret;
			}

			/*******************************************
			* Next, set your root web server directory.
			********************************************/
			ret = UpnpSetWebServerRootDir(WEB_ROOT_DIR);
			if(ret != UPNP_E_SUCCESS)
			{
				printf("upnp_init: UpnpSetWebServerRootDir failed with code: %d\n", ret);
				return ret;
			}

			//restart
			ret = upnp_start(locaal_ip);
			if(UPNP_E_SUCCESS != ret)
			{
				printf("main: upnp_init failed\n");
				upnp_cleanup();
				return ret;
			}
			printf("Service ReStarted\n");

		}
		sleep(60);
	}
	
	printf("stopping\n");

	/* You got some user input, go ahead and clean up. */
	ret = upnp_cleanup();
	if(UPNP_E_SUCCESS != ret)
	{
	  printf("main: upnp_cleanup failed\n");
	  return ret;
	}
	
	printf("main: end\n");
	return 0;
}



/*
 * Function: upnp_init
 *
 * Description: This function initializes the UPnP library,
 *              sets up the internel web server, registers
 *              your root device, and sends out your initial
 *              device advertisements.
 */
int upnp_start(char* hostip)
{
  int ret = 0;        /* General purpose error code */
  char descpath[512]; /* Path for your description document */

  /* Create your Desc Doc */
  sprintf(descpath, "http://%s/Upnp/%s", hostip, DEVICE_DESC_DOC);
  //sprintf(descpath, "%s/%s", WEB_ROOT_DIR, DEVICE_DESC_DOC);

  printf("Using descr path: [%s]\n",descpath);

  /***************************************************
   * Register your root device with the Upnp library.
   ***************************************************/
  ret = UpnpRegisterRootDevice(descpath,upnp_callback,&g_device_handle,&g_device_handle);
  if(ret != UPNP_E_SUCCESS)
  {
      printf("upnp_init: UpnpRegisterRootDevice failed with code:%d\n", ret);
  }

  /*************************************************
   * Send advertisements about your device every 120s.
   *  zie upnpapi.c tijd moet groter zijn dan 62 !!!
   **************************************************/
  ret = UpnpSendAdvertisement(g_device_handle, 120);
  if(ret != UPNP_E_SUCCESS)
  {
    printf("upnp_init: UpnpSendAdvertisement failed with code: %d\n", ret);
    return ret;
  }
  return






_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
