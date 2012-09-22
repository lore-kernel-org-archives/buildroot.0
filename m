From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:39 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: bump version
Message-ID: <20120922194145.D99429969B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=759d548e3e591f9bb8450b2874032d1824a5e251
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Allan W. Nielsen.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |    5 +-
 ...server-01-add-dlopen-libs-flags-to-kdrive.patch |   25 ------
 ...server-02-supply-dl-code-with-dlopen-libs.patch |   87 --------------------
 ...rg-server-03-always-enable-forced-outputs.patch |   30 -------
 .../xserver_xorg-server/xserver_xorg-server.mk     |   11 ++-
 5 files changed, 11 insertions(+), 147 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4e284a0..02c2828 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -50,8 +50,9 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	depends on !BR2_avr32
 	help
-	  xorg-server 1.7.5
-	  No description available
+	  X.Org X server
+
+	  http://xorg.freedesktop.org
 
 comment "xorg-xserver is BROKEN on AVR32"
 	depends on BR2_avr32
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-add-dlopen-libs-flags-to-kdrive.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-add-dlopen-libs-flags-to-kdrive.patch
deleted file mode 100644
index 53304be..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-01-add-dlopen-libs-flags-to-kdrive.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 8613e4b0eb04150b1e377871f02b164be5d001e9 Mon Sep 17 00:00:00 2001
-From: Mikhail Gusarov <dottedmag@dottedmag.net>
-Date: Wed, 28 Oct 2009 18:44:27 +0000
-Subject: Add missing DLOPEN_LIBS to kdrive compilation flags
-
-Xfbdev failed to build due to dladdr being used by xorg_backtrace.
-Explicitly add DLOPEN_LIBS to KDRIVE_LIBS as there does not
-seem to be a better place for it.
-
-Signed-off-by: Mikhail Gusarov <dottedmag@dottedmag.net>
-Signed-off-by: Keith Packard <keithp@keithp.com>
----
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -1982,7 +1982,7 @@
-     KDRIVE_LOCAL_LIBS="$MAIN_LIB $DIX_LIB $KDRIVE_LIB $KDRIVE_STUB_LIB $CONFIG_LIB"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $FB_LIB $MI_LIB $KDRIVE_PURE_LIBS"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $KDRIVE_OS_LIB $OS_LIB"
--    KDRIVE_LIBS="$TSLIB_LIBS $KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS"
-+    KDRIVE_LIBS="$TSLIB_LIBS $KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS $DLOPEN_LIBS"
- 
-     AC_SUBST([XEPHYR_LIBS])
-     AC_SUBST([XEPHYR_INCS])
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-supply-dl-code-with-dlopen-libs.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-supply-dl-code-with-dlopen-libs.patch
deleted file mode 100644
index 63d723b..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-02-supply-dl-code-with-dlopen-libs.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From d30637339963950910e5f5fb755b8465ac7dddb4 Mon Sep 17 00:00:00 2001
-From: Mikhail Gusarov <dottedmag@dottedmag.net>
-Date: Thu, 29 Oct 2009 18:46:22 +0000
-Subject: Supply all code using dl*() with DLOPEN_LIBS
-
-Previously DLOPEN_LIBS was managed in top-level configure.ac.
-Instead bundle it with the code using dl*() functions to
-avoid breakages in uncommon configurations.
-
-Signed-off-by: Mikhail Gusarov <dottedmag@dottedmag.net>
-Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
-Signed-off-by: Keith Packard <keithp@keithp.com>
----
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -196,6 +196,7 @@
- dnl has it in libc), or if libdl is needed to get it.
- AC_CHECK_FUNC([dlopen], [],
- 	AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
-+AC_SUBST(DLOPEN_LIBS)
- 
- dnl Checks for library functions.
- AC_FUNC_VPRINTF
-@@ -927,7 +928,7 @@
- 	AC_SUBST(XLIB_CFLAGS)
- 	AC_DEFINE(GLXEXT, 1, [Build GLX extension])
- 	GLX_LIBS='$(top_builddir)/glx/libglx.la'
--	GLX_SYS_LIBS="$GLX_SYS_LIBS $DLOPEN_LIBS"
-+	GLX_SYS_LIBS="$GLX_SYS_LIBS"
- else
-         GLX=no
- fi
-@@ -1483,7 +1484,7 @@
- 	AC_CHECK_FUNCS([pci_device_vgaarb_init])
- 	LIBS=$SAVE_LIBS
- 	CFLAGS=$SAVE_CFLAGS
--	XORG_SYS_LIBS="$XORG_SYS_LIBS $PCIACCESS_LIBS $DLOPEN_LIBS $GLX_SYS_LIBS $SELINUX_LIB"
-+	XORG_SYS_LIBS="$XORG_SYS_LIBS $PCIACCESS_LIBS $GLX_SYS_LIBS $SELINUX_LIB"
- 	XORG_CFLAGS="$XORG_CFLAGS $PCIACCESS_CFLAGS"
- 
- 	case $host_os in
-Index: b/glx/Makefile.am
-===================================================================
---- a/glx/Makefile.am
-+++ b/glx/Makefile.am
-@@ -58,6 +58,8 @@
- libglxdri_la_SOURCES += glxdri2.c
- endif
- 
-+libglxdri_la_LIBADD = $(DLOPEN_LIBS)
-+
- libglx_la_SOURCES = \
- 	$(indirect_sources) \
- 	$(glapi_sources) \
-@@ -95,3 +97,5 @@
-         swap_interval.c \
-         unpack.h \
-         xfont.c
-+
-+libglx_la_LIBADD = $(DLOPEN_LIBS)
-Index: b/hw/xfree86/loader/Makefile.am
-===================================================================
---- a/hw/xfree86/loader/Makefile.am
-+++ b/hw/xfree86/loader/Makefile.am
-@@ -21,6 +21,7 @@
-         dlloader.c \
- 	os.c \
- 	sdksyms.c
-+libloader_la_LIBADD = $(DLOPEN_LIBS)
- 
- CLEANFILES = sdksyms.c sdksyms.dep
- 
-Index: b/os/Makefile.am
-===================================================================
---- a/os/Makefile.am
-+++ b/os/Makefile.am
-@@ -26,6 +26,8 @@
- 	xprintf.c	\
- 	$(XORG_SRCS)
- 
-+libos_la_LIBADD = $(DLOPEN_LIBS)
-+
- if SECURE_RPC
- libos_la_SOURCES += $(SECURERPC_SRCS)
- endif
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-always-enable-forced-outputs.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-always-enable-forced-outputs.patch
deleted file mode 100644
index bf27977..0000000
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-always-enable-forced-outputs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 93ff1bc5884cdfca1132af7fbc06c48e06f218c8 Mon Sep 17 00:00:00 2001
-From: Simon Farnsworth <simon.farnsworth@onelan.co.uk>
-Date: Mon, 15 Feb 2010 12:18:00 +0000
-Subject: Always enable outputs that have been forced on in the configuration file
-
-If the user has gone to the effort of manually enabling an output in
-the configuration file assume that they know what they're doing.
-
-X.org Bug 14611 <http://bugs.freedesktop.org/show_bug.cgi?id=14611>
-
-Signed-off-by: Simon Farnsworth <simon.farnsworth@onelan.co.uk>
-Reviewed-by: Alex Deucher <alexdeucher@gmail.com>
-Signed-off-by: Keith Packard <keithp@keithp.com>
----
-diff --git a/hw/xfree86/modes/xf86Crtc.c b/hw/xfree86/modes/xf86Crtc.c
-index 573fe96..9b1ff28 100644
---- a/hw/xfree86/modes/xf86Crtc.c
-+++ b/hw/xfree86/modes/xf86Crtc.c
-@@ -1573,7 +1573,8 @@ xf86ProbeOutputModes (ScrnInfoPtr scrn, int maxX, int maxY)
- 	 */
- 	output->status = (*output->funcs->detect)(output);
- 
--	if (output->status == XF86OutputStatusDisconnected)
-+	if (output->status == XF86OutputStatusDisconnected &&
-+		!xf86ReturnOptValBool(output->options, OPTION_ENABLE, FALSE))
- 	{
- 	    xf86OutputSetEDID (output, NULL);
- 	    continue;
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 9b2d9ae..a19122d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.7.5
+XSERVER_XORG_SERVER_VERSION = 1.9.4
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
-XSERVER_XORG_SERVER_AUTORECONF = YES
-
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xutil_util-macros 		\
 	xlib_libXfont 			\
@@ -111,6 +109,13 @@ XSERVER_XORG_SERVER_DEPENDENCIES += dbus
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_UDEV),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
+XSERVER_XORG_SERVER_DEPENDENCIES += udev
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += freetype
 endif
