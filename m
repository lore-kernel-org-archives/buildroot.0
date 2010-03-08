From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-openchrome to
	0.2.904 and fix building
Message-ID: <20100308133631.1C75B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad1ad5028a2040ec3c17c0d0308c1a0001065214
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    2 +-
 .../openchrome-0.2.903-cross-compile.patch         |   36 --------------------
 .../xdriver_xf86-video-openchrome/openchrome.mk    |   17 ---------
 ...86-video-openchrome-0.2.904-cross-compile.patch |   21 +++++++++++
 .../xdriver_xf86-video-openchrome.mk               |   17 +++++++++
 5 files changed, 39 insertions(+), 54 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-openchrome/openchrome-0.2.903-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-openchrome/openchrome.mk
 create mode 100644 package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 3921a92..2b42fe0 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_OPENCHROME
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBDRM
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/openchrome-0.2.903-cross-compile.patch b/package/x11r7/xdriver_xf86-video-openchrome/openchrome-0.2.903-cross-compile.patch
deleted file mode 100644
index c7bfc93..0000000
--- a/package/x11r7/xdriver_xf86-video-openchrome/openchrome-0.2.903-cross-compile.patch
+++ /dev/null
@@ -1,36 +0,0 @@
---- a/configure.ac	2008-04-09 15:42:55.000000000 -0400
-+++ b/configure.ac	2008-06-23 09:39:06.000000000 -0400
-@@ -87,12 +87,18 @@ if test x$XSERVER_LIBPCIACCESS = xyes; t
- fi
- 
- if test "$DRI" != no; then
-+	if test "$cross_compiling" = "no" ; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
-@@ -133,8 +139,12 @@ AC_MSG_RESULT([$XVMC])
- 
- AM_CONDITIONAL(XVMC, test x$XVMC = xyes)
- 
--AC_CHECK_FILE([${sdkdir}/xf86Module.h],
--              [have_xf86Module_h="yes"], [have_xf86Module_h="no"])
-+if test "$cross_compiling" = "no" ; then
-+	AC_CHECK_FILE([${sdkdir}/xf86Module.h],
-+		[have_xf86Module_h="yes"], [have_xf86Module_h="no"])
-+else
-+	have_xf86Module_h="yes"
-+fi
- 
- # Check the ABI_VIDEODRV_VERSION
- SAVE_CFLAGS="$CFLAGS"
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/openchrome.mk
deleted file mode 100644
index 8ced23e..0000000
--- a/package/x11r7/xdriver_xf86-video-openchrome/openchrome.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-#############################################################
-#
-# openchrome
-#
-#############################################################
-OPENCHROME_VERSION = 0.2.903
-OPENCHROME_SOURCE = xf86-video-openchrome-$(OPENCHROME_VERSION).tar.bz2
-OPENCHROME_SITE = http://www.openchrome.org/releases
-
-OPENCHROME_DEPENDENCIES = xserver_xorg-server libdrm xlib_libX11 xlib_libXvMC xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
-
-OPENCHROME_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
-OPENCHROME_AUTORECONF = YES
-OPENCHROME_CONF_OPT = --enable-shared --disable-static
-
-$(eval $(call AUTOTARGETS,package/x11r7,openchrome))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
new file mode 100644
index 0000000..e259398
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
@@ -0,0 +1,21 @@
+--- a/configure.ac	2008-04-09 15:42:55.000000000 -0400
++++ b/configure.ac	2008-06-23 09:39:06.000000000 -0400
+@@ -87,12 +87,18 @@ if test x$XSERVER_LIBPCIACCESS = xyes; t
+ fi
+ 
+ if test "$DRI" != no; then
++	if test "$cross_compiling" = "no" ; then
+         AC_CHECK_FILE([${sdkdir}/dri.h],
+                       [have_dri_h="yes"], [have_dri_h="no"])
+         AC_CHECK_FILE([${sdkdir}/sarea.h],
+                       [have_sarea_h="yes"], [have_sarea_h="no"])
+         AC_CHECK_FILE([${sdkdir}/dristruct.h],
+                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
++	else
++		have_dri_h="yes"
++		have_sarea_h="yes"
++		have_dristruct_h="yes"
++	fi
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
new file mode 100644
index 0000000..44bc111
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# openchrome
+#
+#############################################################
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.904
+XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://www.openchrome.org/releases
+
+XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = xserver_xorg-server libdrm xlib_libX11 xlib_libXvMC xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
+
+XDRIVER_XF86_VIDEO_OPENCHROME_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_OPENCHROME_CONF_OPT = --enable-shared --disable-static
+
+$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-openchrome))
-- 
1.6.3.3
