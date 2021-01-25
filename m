From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 20:49:47 +0100
Subject: [Buildroot] [PATCH v3,
 4/6] package/gmrender-resurrect: add libupnp 1.14.x support
In-Reply-To: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125194949.1173139-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using libupnp 1.14.x is needed to fix CallStranger a.k.a. CVE-2020-12695

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Drop-UpnpInit.patch                  | 175 ++++++++++++++++++
 package/gmrender-resurrect/Config.in          |   2 +-
 .../gmrender-resurrect/gmrender-resurrect.mk  |   2 +-
 3 files changed, 177 insertions(+), 2 deletions(-)
 create mode 100644 package/gmrender-resurrect/0001-Drop-UpnpInit.patch

diff --git a/package/gmrender-resurrect/0001-Drop-UpnpInit.patch b/package/gmrender-resurrect/0001-Drop-UpnpInit.patch
new file mode 100644
index 0000000000..18ec7bb515
--- /dev/null
+++ b/package/gmrender-resurrect/0001-Drop-UpnpInit.patch
@@ -0,0 +1,175 @@
+From dc8c4d4dc234311b3099e7f1efadf5d9733c81e9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 21 Aug 2020 21:29:00 +0200
+Subject: [PATCH] Drop UpnpInit
+
+UpnpInit has been dropped from libupnp 1.14.x as it can't be fixed
+against CallStranger a.k.a. CVE-2020-12695 so replace it by UpnpInit2
+which is available since version 1.6.7 and
+https://github.com/pupnp/pupnp/commit/2bcbdffd89a70364147d345ec5e70a3fce5cbc29
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/hzeller/gmrender-resurrect/pull/214]
+---
+ dist-scripts/centos7/README.md     |  2 +-
+ dist-scripts/debian/gmediarender.1 |  8 ++------
+ dist-scripts/fedora/README.md      |  2 +-
+ src/main.c                         | 13 ++++---------
+ src/upnp_device.c                  | 18 +++++++++---------
+ src/upnp_device.h                  |  2 +-
+ 6 files changed, 18 insertions(+), 27 deletions(-)
+
+diff --git a/dist-scripts/centos7/README.md b/dist-scripts/centos7/README.md
+index 278d777..ed82fb6 100644
+--- a/dist-scripts/centos7/README.md
++++ b/dist-scripts/centos7/README.md
+@@ -45,7 +45,7 @@ Additional configuration is also recommended, sice there's no configuration file
+     # vi /etc/systemd/system/gmediarender.service.d/customize.conf   # or nano, or emacs, or whatever editor you like
+     [Service]
+     ExecStart=
+-    ExecStart=/usr/bin/gmediarender --port=49494 --ip-address=<your_IP_address> -f "DLNA Renderer GMediaRender"
++    ExecStart=/usr/bin/gmediarender --port=49494 --interface-name=<your_interface_name> -f "DLNA Renderer GMediaRender"
+ 
+     # systemctl daemon-reload
+     # systemctl start gmediarender.service
+diff --git a/dist-scripts/debian/gmediarender.1 b/dist-scripts/debian/gmediarender.1
+index 96123ff..b2b1359 100644
+--- a/dist-scripts/debian/gmediarender.1
++++ b/dist-scripts/debian/gmediarender.1
+@@ -50,12 +50,8 @@ Usually, it is desirable for the renderer
+ to show up on controllers under a recognisable and unique name. This is 
+ the option to set that name.
+ .TP
+-.B \-I, \-\-ip\-address \fI\<ip-address\>\fP
+-The local IP address the service is running and advertised on.  
+-
+-This can 
+-only be a single address, and must be explicitly specified (i.e. not 
+-0.0.0.0).
++.B \-I, \-\-interface\-name \fI\<interface-name\>\fP
++The local interface name the service is running and advertised on.
+ .TP
+ .B \-p, \-\-port \fI\<port>\fP
+ Port to listen to. [49152..65535].
+diff --git a/dist-scripts/fedora/README.md b/dist-scripts/fedora/README.md
+index 7b9ea4b..45aa536 100644
+--- a/dist-scripts/fedora/README.md
++++ b/dist-scripts/fedora/README.md
+@@ -43,7 +43,7 @@ Additional configuration is also recommended, sice there's no configuration file
+     # vi /etc/systemd/system/gmediarender.service.d/customize.conf   # or nano, or emacs, or whatever editor you like
+     [Service]
+     ExecStart=
+-    ExecStart=/usr/bin/gmediarender --port=49494 --ip-address=<your_IP_address> -f "DLNA Renderer GMediaRender"
++    ExecStart=/usr/bin/gmediarender --port=49494 --interface-name=<your_interface_name> -f "DLNA Renderer GMediaRender"
+ 
+     # systemctl daemon-reload
+     # systemctl start gmediarender.service
+diff --git a/src/main.c b/src/main.c
+index ef720e3..2030c49 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -69,11 +69,7 @@ static gboolean show_transport_scpd = FALSE;
+ static gboolean show_outputs = FALSE;
+ static gboolean daemon_mode = FALSE;
+ 
+-// IP-address seems strange in libupnp: they actually don't bind to
+-// that address, but to INADDR_ANY (miniserver.c in upnp library).
+-// Apparently they just use this for the advertisement ? Anyway, 0.0.0.0 would
+-// not work.
+-static const gchar *ip_address = NULL;
++static const gchar *interface_name = NULL;
+ static int listen_port = 49494;
+ 
+ #ifdef GMRENDER_UUID
+@@ -92,9 +88,8 @@ static const gchar *mime_filter = NULL;
+ static GOptionEntry option_entries[] = {
+ 	{ "version", 0, 0, G_OPTION_ARG_NONE, &show_version,
+ 	  "Output version information and exit", NULL },
+-	{ "ip-address", 'I', 0, G_OPTION_ARG_STRING, &ip_address,
+-	  "The local IP address the service is running and advertised "
+-	  "(only one, 0.0.0.0 won't work)", NULL },
++	{ "interface-name", 'I', 0, G_OPTION_ARG_STRING, &interface_name,
++	  "The local interface name the service is running and advertised", NULL },
+ 	// The following is not very reliable, as libupnp does not set
+ 	// SO_REUSEADDR by default, so it might increment (sending patch).
+ 	{ "port", 'p', 0, G_OPTION_ARG_INT, &listen_port,
+@@ -302,7 +297,7 @@ int main(int argc, char **argv)
+ 			  listen_port);
+ 		return EXIT_FAILURE;
+ 	}
+-	device = upnp_device_init(upnp_renderer, ip_address, listen_port);
++	device = upnp_device_init(upnp_renderer, interface_name, listen_port);
+ 	if (device == NULL) {
+ 		Log_error("main", "ERROR: Failed to initialize UPnP device");
+ 		return EXIT_FAILURE;
+diff --git a/src/upnp_device.c b/src/upnp_device.c
+index db65e4f..3151238 100644
+--- a/src/upnp_device.c
++++ b/src/upnp_device.c
+@@ -416,13 +416,13 @@ static UPNP_CALLBACK(event_handler, EventType, event, userdata)
+ 
+ static gboolean initialize_device(struct upnp_device_descriptor *device_def,
+ 				  struct upnp_device *result_device,
+-				  const char *ip_address,
++				  const char *interface_name,
+ 				  unsigned short port)
+ {
+ 	int rc;
+ 	char *buf;
+ 
+-	rc = UpnpInit(ip_address, port);
++	rc = UpnpInit2(interface_name, port);
+ 	/* There have been situations reported in which UPNP had issues
+ 	 * initializing right after network came up. #129
+ 	 */
+@@ -430,13 +430,13 @@ static gboolean initialize_device(struct upnp_device_descriptor *device_def,
+ 	static const int kRetryTimeMs = 1000;
+ 	while (rc != UPNP_E_SUCCESS && retries_left--) {
+ 		usleep(kRetryTimeMs * 1000);
+-		Log_error("upnp", "UpnpInit(ip=%s, port=%d) Error: %s (%d). Retrying... (%ds)",
+-			  ip_address, port, UpnpGetErrorMessage(rc), rc, retries_left);
+-		rc = UpnpInit(ip_address, port);
++		Log_error("upnp", "UpnpInit2(interface=%s, port=%d) Error: %s (%d). Retrying... (%ds)",
++			  interface_name, port, UpnpGetErrorMessage(rc), rc, retries_left);
++		rc = UpnpInit2(interface_name, port);
+ 	}
+ 	if (UPNP_E_SUCCESS != rc) {
+-		Log_error("upnp", "UpnpInit(ip=%s, port=%d) Error: %s (%d). Giving up.",
+-			  ip_address, port, UpnpGetErrorMessage(rc), rc);
++		Log_error("upnp", "UpnpInit2(interface=%s, port=%d) Error: %s (%d). Giving up.",
++			  interface_name, port, UpnpGetErrorMessage(rc), rc);
+ 		return FALSE;
+ 	}
+ 	Log_info("upnp", "Registered IP=%s port=%d\n",
+@@ -483,7 +483,7 @@ static gboolean initialize_device(struct upnp_device_descriptor *device_def,
+ }
+ 
+ struct upnp_device *upnp_device_init(struct upnp_device_descriptor *device_def,
+-				     const char *ip_address,
++				     const char *interface_name,
+ 				     unsigned short port)
+ {
+ 	int rc;
+@@ -516,7 +516,7 @@ struct upnp_device *upnp_device_init(struct upnp_device_descriptor *device_def,
+ 		webserver_register_buf(srv->scpd_url, buf, "text/xml");
+ 	}
+ 
+-	if (!initialize_device(device_def, result_device, ip_address, port)) {
++	if (!initialize_device(device_def, result_device, interface_name, port)) {
+ 		UpnpFinish();
+ 		free(result_device);
+ 		return NULL;
+diff --git a/src/upnp_device.h b/src/upnp_device.h
+index 3e635e1..8c8e783 100644
+--- a/src/upnp_device.h
++++ b/src/upnp_device.h
+@@ -49,7 +49,7 @@ struct upnp_device;
+ struct action_event;
+ 
+ struct upnp_device *upnp_device_init(struct upnp_device_descriptor *device_def,
+-				     const char *ip_address,
++				     const char *interface_name,
+ 				     unsigned short port);
+ 
+ void upnp_device_shutdown(struct upnp_device *device);
diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index e7424e3b22..db655ad7f4 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 	depends on BR2_USE_MMU # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
-	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBUPNP
 	help
 	  UPnP (DLNA) media renderer based on gstreamer
 
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index e25be39493..3500ab3760 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -13,6 +13,6 @@ GMRENDER_RESURRECT_LICENSE = GPL-2.0+
 GMRENDER_RESURRECT_LICENSE_FILES = COPYING
 GMRENDER_RESURRECT_DEPENDENCIES = \
 	gstreamer1 \
-	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
+	libupnp
 
 $(eval $(autotools-package))
-- 
2.29.2
