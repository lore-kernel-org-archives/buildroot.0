From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 21:58:22 +0100
Subject: [Buildroot] [git commit] package/libfreeglut: new package
Message-ID: <20151216210122.C88F182238@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=067a65755b70433f18184ee318045050203fc27c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/libfreeglut/Config.in        | 20 ++++++++++++++++++++
 package/libfreeglut/libfreeglut.hash |  2 ++
 package/libfreeglut/libfreeglut.mk   | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 402921d..6cae946 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -834,6 +834,7 @@ menu "Graphics"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/libfm/Config.in"
 	source "package/libfm-extra/Config.in"
+	source "package/libfreeglut/Config.in"
 	source "package/libfreeimage/Config.in"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
new file mode 100644
index 0000000..e09e7ef
--- /dev/null
+++ b/package/libfreeglut/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBFREEGLUT
+	bool "libfreeglut"
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXXF86VM
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
index 0000000..507cb52
--- /dev/null
+++ b/package/libfreeglut/libfreeglut.mk
@@ -0,0 +1,33 @@
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
+LIBFREEGLUT_DEPENDENCIES = \
+	libgl \
+	libglu \
+	xlib_libXi \
+	xlib_libXrandr \
+	xlib_libXxf86vm
+
+LIBFREEGLUT_CONF_OPTS = -DFREEGLUT_BUILD_DEMOS=OFF
+
+# package depends on X.org which depends on !BR2_STATIC_LIBS
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBFREEGLUT_CONF_OPTS += \
+	-DFREEGLUT_BUILD_SHARED_LIBS=ON \
+	-DFREEGLUT_BUILD_STATIC_LIBS=OFF
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBFREEGLUT_CONF_OPTS += \
+	-DFREEGLUT_BUILD_SHARED_LIBS=ON \
+	-DFREEGLUT_BUILD_STATIC_LIBS=ON
+endif
+
+$(eval $(cmake-package))
