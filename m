From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 21:16:15 +0200
Subject: [Buildroot] [git commit branch/next] package/libyuv: new package
Message-ID: <20150828191751.7D8D581DD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebf3a6117c58422ee9e7af99a37b671b1e301c68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: fix license, it's BSD-3c, not BSD-4c.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                   |    1 +
 package/libyuv/0001-i386-sse2.patch |   16 ++++++++++++++++
 package/libyuv/Config.in            |   12 ++++++++++++
 package/libyuv/libyuv.mk            |   18 ++++++++++++++++++
 4 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 69abc78..810f4ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -955,6 +955,7 @@ menu "Multimedia"
 	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/live555/Config.in"
+	source "package/libyuv/Config.in"
 	source "package/mediastreamer/Config.in"
 	source "package/x264/Config.in"
 endmenu
diff --git a/package/libyuv/0001-i386-sse2.patch b/package/libyuv/0001-i386-sse2.patch
new file mode 100644
index 0000000..b8ecb34
--- /dev/null
+++ b/package/libyuv/0001-i386-sse2.patch
@@ -0,0 +1,16 @@
+Fix compilation on non-sse2 platforms
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libyuv-1411.org/include/libyuv/scale_row.h libyuv-1411/include/libyuv/scale_row.h
+--- libyuv-1411.org/include/libyuv/scale_row.h	2015-05-22 23:39:21.000000000 +0200
++++ libyuv-1411/include/libyuv/scale_row.h	2015-05-25 12:35:17.000000000 +0200
+@@ -33,7 +33,7 @@
+ 
+ // The following are available on all x86 platforms:
+ #if !defined(LIBYUV_DISABLE_X86) && \
+-    (defined(_M_IX86) || defined(__x86_64__) || defined(__i386__))
++    (defined(_M_IX86) || defined(__x86_64__) || (defined(__i386__) && defined(__SSE2__)))
+ #define HAS_FIXEDDIV1_X86
+ #define HAS_FIXEDDIV_X86
+ #define HAS_SCALEADDROWS_SSE2
diff --git a/package/libyuv/Config.in b/package/libyuv/Config.in
new file mode 100644
index 0000000..29dcaa4
--- /dev/null
+++ b/package/libyuv/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBYUV
+	bool "libyuv"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	help
+	  libyuv is an open source project that includes YUV scaling
+	  and conversion functionality.
+
+	  https://code.google.com/p/libyuv
+
+comment "libyuv needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/libyuv/libyuv.mk b/package/libyuv/libyuv.mk
new file mode 100644
index 0000000..c00bc05
--- /dev/null
+++ b/package/libyuv/libyuv.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libyuv
+#
+################################################################################
+
+LIBYUV_VERSION = 1ebf86795cb213a37f06eb1ef3713cff080568ea
+# we use the FreeSwitch fork because there is currently no alternative
+# for https://chromium.googlesource.com/libyuv/libyuv which will be
+# deactivated in 2015.
+LIBYUV_SITE = https://freeswitch.org/stash/scm/sd/libyuv.git
+LIBYUV_SITE_METHOD = git
+LIBYUV_LICENSE = BSD-3c
+LIBYUV_LICENSE_FILES = LICENSE
+LIBYUV_INSTALL_STAGING = YES
+LIBYUV_DEPENDENCIES = $(if $(BR2_PACKAGE_JPEG),jpeg)
+
+$(eval $(cmake-package))
