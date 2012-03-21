From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 14:32:46 +0100
Subject: [Buildroot] [git commit] libupnp: move to version 1.6.14 Not OK
In-Reply-To: <20120321130510.D12F095418@busybox.osuosl.org>
References: <20120321130510.D12F095418@busybox.osuosl.org>
Message-ID: <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I have rebuild my small app with the 1.6.15 and also with 1.6.14 : both fail 
(compile but does not work)

In the past i have tried to use a more recent one and got the same problem.
I am using httpd from busybox as the http server, and i think its related with that.
I do not use the internal http server from libupnp since i need httpd to serve static pages and process cgi-bin.

login: upnp_init: UpnpRegisterRootDevice failed with code:-119
upnp_init: UpnpSendAdvertisement failed with code: -100
main: upnp_init failed
upnp_cleanup: start
upnp_cleanup: UpnpUnRegisterRootDevice failed with code: -100


This is the snippet from my source code :

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
	
	SNIP .....




-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
Verzonden: woensdag 21 maart 2012 13:50
Aan: buildroot at busybox.net
Onderwerp: [Buildroot] [git commit] libupnp: move to version 1.6.14

commit: http://git.buildroot.net/buildroot/commit/?id=bfd26038c5eeac1483387598be82c4c22f463de9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by Sagaert Johan in the mailing list and further testing version
1.6.15 has some issues.
So move to version 1.6.14 which is far more stable and compliant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-no-ipv6.patch => libupnp-1.6.14-no-ipv6.patch} |    0
 package/libupnp/libupnp.mk                         |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libupnp/libupnp-1.6.15-no-ipv6.patch b/package/libupnp/libupnp-1.6.14-no-ipv6.patch
similarity index 100%
rename from package/libupnp/libupnp-1.6.15-no-ipv6.patch
rename to package/libupnp/libupnp-1.6.14-no-ipv6.patch
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk index 1fa07ca..5ac68c3 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBUPNP_VERSION = 1.6.15
+LIBUPNP_VERSION = 1.6.14
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
