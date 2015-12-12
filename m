From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Dec 2015 19:31:42 +0100
Subject: [Buildroot] [PATCH 7/8] package/libfreeglut: new package
In-Reply-To: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1449945103-23715-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                    |  1 +
 package/libfreeglut/Config.in        | 19 +++++++++++++++++++
 package/libfreeglut/libfreeglut.hash |  2 ++
 package/libfreeglut/libfreeglut.mk   | 17 +++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/libfreeglut/Config.in
 create mode 100644 package/libfreeglut/libfreeglut.hash
 create mode 100644 package/libfreeglut/libfreeglut.mk

diff --git a/package/Config.in b/package/Config.in
index 4ebc964..3b0e989 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -831,6 +831,7 @@ menu "Graphics"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
+	source "package/libfreeglut/Config.in"
 	source "package/libfreeimage/Config.in"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
new file mode 100644
index 0000000..e67fdae
--- /dev/null
+++ b/package/libfreeglut/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBFREEGLUT
+	bool "libfreeglut"
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	help
+	  FreeGLUT is a free-software/open-source alternative to the
+	  OpenGL Utility Toolkit (GLUT) library. GLUT (and hence
+	  FreeGLUT) takes care of all the system-specific chores required
+	  for creating windows, initializing OpenGL contexts, and
+	  handling input events, to allow for trully portable OpenGL
+	  programs.
+
+	  http://freeglut.sourceforge.net
+
+comment "libfreeglut depends on X.org and needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
new file mode 100644
index 0000000..a69a0b4
--- /dev/null
+++ b/package/libfreeglut/libfreeglut.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/freeglut/files/freeglut/3.0.0/
+sha1	fca52242f9344627a30f11487ee42002e6b0dacd	freeglut-3.0.0.tar.gz
diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
new file mode 100644
index 0000000..893afba
--- /dev/null
+++ b/package/libfreeglut/libfreeglut.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libfreeglut
+#
+################################################################################
+
+LIBFREEGLUT_VERSION = 3.0.0
+LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
+LIBFREEGLUT_SITE = http://downloads.sourceforge.net/freeglut
+LIBFREEGLUT_LICENSE = MIT
+LIBFREEGLUT_LICENSE_FILES = COPYING
+LIBFREEGLUT_INSTALL_STAGING = YES
+LIBFREEGLUT_DEPENDENCIES = libgl libglu xlib_libXi xlib_libXrandr
+
+LIBFREEGLUT_CONF_OPTS += -DFREEGLUT_BUILD_DEMOS=OFF
+
+$(eval $(cmake-package))
-- 
2.6.2
