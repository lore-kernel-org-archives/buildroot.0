From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 27 May 2013 23:13:44 +0200
Subject: [Buildroot] [PATCH] Add HW decoding support for Hantro x170
Message-ID: <1369689224-492-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This actually consist in a set of proprietary libs, on2-8170-libs and a
gstreamer plugin making use of those libraries.

on2-8170-libs is probably libc agnostic but this has not been tested
thoroughly.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/multimedia/Config.in                       |  2 ++
 package/multimedia/gst-plugin-x170/Config.in       | 10 ++++++++
 .../gst-plugin-x170-01-correct-CFLAGS.patch        | 28 ++++++++++++++++++++++
 .../multimedia/gst-plugin-x170/gst-plugin-x170.mk  | 14 +++++++++++
 package/multimedia/on2-8170-libs/Config.in         |  8 +++++++
 package/multimedia/on2-8170-libs/on2-8170-libs.mk  | 20 ++++++++++++++++
 6 files changed, 82 insertions(+)
 create mode 100644 package/multimedia/gst-plugin-x170/Config.in
 create mode 100644 package/multimedia/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
 create mode 100644 package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
 create mode 100644 package/multimedia/on2-8170-libs/Config.in
 create mode 100644 package/multimedia/on2-8170-libs/on2-8170-libs.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 931e6d3..e13e9da 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -14,12 +14,14 @@ source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/gst-plugin-x170/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
+source "package/multimedia/on2-8170-libs/Config.in"
 source "package/opus-tools/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/multimedia/gst-plugin-x170/Config.in
new file mode 100644
index 0000000..83ddd1b
--- /dev/null
+++ b/package/multimedia/gst-plugin-x170/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GST_PLUGIN_X170
+	bool "gst-plugin-x170"
+	depends on BR2_PACKAGE_GSTREAMER && BR2_arm926t
+	select BR2_PACKAGE_ON2_8170_LIBS
+	help
+	  GStreamer plug-in to use the Hantro X170 video decoder present on
+	  ATMEL AT91SAM9M10 SoC.
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch b/package/multimedia/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
new file mode 100644
index 0000000..9c32e46
--- /dev/null
+++ b/package/multimedia/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
@@ -0,0 +1,28 @@
+The configure script is correctly getting the CFLAGS needed to compile a plugin
+for gstreamer and storing them in GST_BASE_CFLAGS but the Makefiles are never
+making use of those.
+
+We actually have to use AM_CPPFLAGS as AM_CFLAGS is used everywhere but on the
+real compiling rule...
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+---
+ src/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8cb51d1..6af5d91 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -5,6 +5,8 @@
+ ##############################################################################
+ plugin_LTLIBRARIES = libgstx170.la
+ 
++AM_CPPFLAGS = @GST_BASE_CFLAGS@
++
+ ##############################################################################
+ # for the next set of variables, rename the prefix if you renamed the .la,   #
+ #  e.g. libgstplugin_la_SOURCES => libmysomething_la_SOURCES                 #
+-- 
+1.8.1.2
+
diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
new file mode 100644
index 0000000..e1c42ef
--- /dev/null
+++ b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# gst-plugins-x170
+#
+#############################################################
+GST_PLUGIN_X170_VERSION = 1.0
+GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+
+# There is no generated configure script in the tarball.
+GST_PLUGIN_X170_AUTORECONF = YES
+GST_PLUGIN_X170_AUTORECONF_OPT = -Im4/
+GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
+
+$(eval $(autotools-package))
diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
new file mode 100644
index 0000000..d5d1a58
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ON2_8170_LIBS
+	depends on BR2_arm926t
+	bool "on2-8170-libs"
+	help
+	  Libraries for Hantro X170 video decoder
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
+
diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
new file mode 100644
index 0000000..160b2d9
--- /dev/null
+++ b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# on2-8170-libs
+#
+#############################################################
+ON2_8170_LIBS_VERSION = 1.0
+ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+
+ON2_8170_LIBS_INSTALL_STAGING = YES
+
+define ON2_8170_LIBS_INSTALL_STAGING_CMDS
+	cp -dpf $(@D)/*.a $(@D)/*.so $(STAGING_DIR)/usr/lib
+	cp -dpf $(@D)/*.h $(STAGING_DIR)/usr/include
+endef
+
+define ON2_8170_LIBS_INSTALL_TARGET_CMDS
+	cp -dpf $(@D)/*.so $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
