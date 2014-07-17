From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Jul 2014 07:42:58 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_6/8=5D_libglu=3A_New_package?=
In-Reply-To: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405575780-26496-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed for OpenGL support in xbmc:
https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1070

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in        |    1 +
 package/libglu/Config.in |   10 ++++++++++
 package/libglu/libglu.mk |   17 +++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/libglu/Config.in
 create mode 100644 package/libglu/libglu.mk

diff --git a/package/Config.in b/package/Config.in
index 4b7ccd9..277cbb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -611,6 +611,7 @@ menu "Graphics"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
+	source "package/libglu/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
diff --git a/package/libglu/Config.in b/package/libglu/Config.in
new file mode 100644
index 0000000..de8e1ef
--- /dev/null
+++ b/package/libglu/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBGLU
+	bool "libglu"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Mesa OpenGL Utility library
+
+	  http://cgit.freedesktop.org/mesa/glu/
+
+comment "libglu needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
new file mode 100644
index 0000000..038d281
--- /dev/null
+++ b/package/libglu/libglu.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libglu
+#
+################################################################################
+
+LIBGLU_VERSION = 9.0.0
+LIBGLU_SITE = http://cgit.freedesktop.org/mesa/glu/snapshot
+LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.gz
+LIBGLU_LICENSE = SGI-B-2.0
+LIBGLU_LICENSE_FILES = include/GL/glu.h
+LIBGLU_INSTALL_STAGING = YES
+# upstream does not distribute a autoconf?ed configure script
+LIBGLU_AUTORECONF = YES
+LIBGLU_DEPENDENCIES = libgl
+
+$(eval $(autotools-package))
-- 
1.7.10.4
