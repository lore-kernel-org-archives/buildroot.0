From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:23 +0100
Subject: [Buildroot] [PATCH 08/10] package/freerdp: drop gstreamer 0.10.x
 support
In-Reply-To: <20200207145026.28384-1-peter@korsgaard.com>
References: <20200207145026.28384-1-peter@korsgaard.com>
Message-ID: <20200207145026.28384-9-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming removal of gstreamer 0.10, the logic for building freerdp
with support for it must go as well.

As there is now a single option for gstreamer (1.x) support, convert the
gstreamer support choice to a normal option for simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           |  7 +++++++
 package/freerdp/Config.in  | 24 +++---------------------
 package/freerdp/freerdp.mk |  9 +--------
 3 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 34f99b54de..96848f7f06 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_FREERDP_GSTREAMER
+	bool "freerdp gstreamer 0.10.x support removed"
+	select BR2_LEGACY
+	help
+	  Gstreamer 0.10.x is no longer available in Buildroot, so
+	  neither is the support in freerdp.
+
 config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER
 	bool "opencv3 gstreamer 0.10.x support removed"
 	select BR2_LEGACY
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 59bc18b672..5705ce0e0c 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -28,36 +28,18 @@ config BR2_PACKAGE_FREERDP
 
 if BR2_PACKAGE_FREERDP
 
-choice
-	bool "gstreamer support"
-	depends on BR2_PACKAGE_XORG7 # xlib-libxrandr
-	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
-
 config BR2_PACKAGE_FREERDP_GSTREAMER1
-	bool "gstreamer-1.x"
+	bool "gstreamer support"
 	depends on BR2_PACKAGE_GSTREAMER1
+	depends on BR2_PACKAGE_XORG7 # xlib-libxrandr
 	# gstreamer-1.x dependencies already dependencies of FreeRDP
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 
-config BR2_PACKAGE_FREERDP_GSTREAMER
-	bool "gstreamer-0.x"
-	depends on BR2_PACKAGE_GSTREAMER
-	# gstreamer-0.x dependencies already dependencies of FreeRDP
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
-	select BR2_PACKAGE_XLIB_LIBXRANDR
-	select BR2_PACKAGE_LIBXML2
-
-config BR2_PACKAGE_FREERDP_GSTREAMER_NO
-	bool "none"
-
-endchoice
-
 comment "gstreamer support needs X.Org"
 	depends on !BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
+	depends on BR2_PACKAGE_GSTREAMER1
 
 config BR2_PACKAGE_FREERDP_SERVER
 	bool "server"
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 293b6b5c01..a477e74cb7 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -12,14 +12,7 @@ FREERDP_LICENSE_FILES = LICENSE
 
 FREERDP_INSTALL_STAGING = YES
 
-FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
-
-ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER),y)
-FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
-FREERDP_DEPENDENCIES += gstreamer gst-plugins-base libxml2
-else
-FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
-endif
+FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
 
 ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER1),y)
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER_1_0=ON
-- 
2.20.1
