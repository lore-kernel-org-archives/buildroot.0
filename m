From: Viacheslav Volkov <sv99@inbox.ru>
Date: Wed, 28 Oct 2015 10:59:00 +0300
Subject: [Buildroot] [PATCH v2] v4l2grab: new package
Message-ID: <1446019140-21478-1-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I not find libv4l2grab utility in the v4l2 distribution.
Exist sample code in the documentation:
http://www.linuxtv.org/downloads/v4l-dvb-apis/v4l2grab-example.html

The utility based on this example.

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
Changes v1 -> v2:
  - many changes suggested by Thomas Petazzoni
  - add license info
---
package/Config.in            |  1 +
 package/v4l2grab/Config.in   | 16 ++++++++++++++++
 package/v4l2grab/v4l2grab.mk | 15 +++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/v4l2grab/Config.in
 create mode 100644 package/v4l2grab/v4l2grab.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..75a5120 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -40,6 +40,7 @@ menu "Audio and video applications"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
 	source "package/upmpdcli/Config.in"
+	source "package/v4l2grab/Config.in"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
diff --git a/package/v4l2grab/Config.in b/package/v4l2grab/Config.in
new file mode 100644
index 0000000..951d5e3
--- /dev/null
+++ b/package/v4l2grab/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_V4L2GRAB
+	bool "v4l2grab"
+	# dependencies from lib4l
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
+	# wait for libv4l 1.7+ for musl compatibility
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBV4L
+	help
+	  Utility for grabbing JPEGs form V4L2 devices.
+
+	  http://www.twam.info/software/v4l2grab-grabbing-jpegs-from-v4l2-devices
diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
new file mode 100644
index 0000000..12b4c3f
--- /dev/null
+++ b/package/v4l2grab/v4l2grab.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# v4l2grab
+#
+################################################################################
+
+V4L2GRAB_VERSION = 7815752fafb8b797047e819a08a3b6e2f2880846
+V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
+V4L2GRAB_LICENSE = GPLv2+
+V4L2GRAB_LICENSE_FILE = LICENSE
+# Fetched from github, no pre-generated configure script provided
+V4L2GRAB_AUTORECONF = YES
+V4L2GRAB_DEPENDENCIES = libjpeg libv4l
+
+$(eval $(autotools-package))
-- 
2.6.1
