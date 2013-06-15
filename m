From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Jun 2013 23:17:25 +0200
Subject: [Buildroot] [git commit] Add gstreamer plugin for Hantro x170
Message-ID: <20130615212019.3BBFA9AE5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c6a2995ddb045e5c0617997a9f1fe1f4b382571
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Config.in: add comment about glibc dependency]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugin-x170/Config.in       |   13 +++++++++
 .../gst-plugin-x170-01-correct-CFLAGS.patch        |   28 ++++++++++++++++++++
 .../multimedia/gst-plugin-x170/gst-plugin-x170.mk  |   18 ++++++++++++
 4 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 4cb81bf..77c0a22 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -14,6 +14,7 @@ source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/gst-plugin-x170/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/multimedia/gst-plugin-x170/Config.in
new file mode 100644
index 0000000..fd93947
--- /dev/null
+++ b/package/multimedia/gst-plugin-x170/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GST_PLUGIN_X170
+	bool "gst-plugin-x170"
+	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_arm926t
+	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		BR2_TOOLCHAIN_CTNG_eglibc || \
+		BR2_TOOLCHAIN_CTNG_glibc) # on2-8170-libs
+	select BR2_PACKAGE_ON2_8170_LIBS
+	help
+	  GStreamer plug-in to use the Hantro X170 video decoder present on
+	  ATMEL AT91SAM9M10 SoC.
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
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
index 0000000..a6143ed
--- /dev/null
+++ b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# gst-plugins-x170
+#
+################################################################################
+
+GST_PLUGIN_X170_VERSION = 1.0
+GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/
+
+GST_PLUGIN_X170_LICENSE = BSD-1c
+#A license file is included but it is just a placeholder
+
+# There is no generated configure script in the tarball.
+GST_PLUGIN_X170_AUTORECONF = YES
+GST_PLUGIN_X170_AUTORECONF_OPT = -Im4/
+GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
+
+$(eval $(autotools-package))
