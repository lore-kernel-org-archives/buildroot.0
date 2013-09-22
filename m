From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 22 Sep 2013 18:53:18 +0100
Subject: [Buildroot] [PATCH] xapp_xscreensaver: new package
Message-ID: <1379872398-25558-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/x11r7/Config.in                            |   1 +
 package/x11r7/xapp_xscreensaver/Config.in          |  22 ++++
 ...ver-0001-fix-cross-compile-ansi-c-bailout.patch |  29 +++++
 ...creensaver-0002-fix-minixpm-build-problem.patch | 134 +++++++++++++++++++++
 .../x11r7/xapp_xscreensaver/xapp_xscreensaver.mk   |  24 ++++
 5 files changed, 210 insertions(+)
 create mode 100644 package/x11r7/xapp_xscreensaver/Config.in
 create mode 100644 package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch
 create mode 100644 package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0002-fix-minixpm-build-problem.patch
 create mode 100644 package/x11r7/xapp_xscreensaver/xapp_xscreensaver.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 205079c..19c46a5 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -127,6 +127,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xrandr/Config.in
 		source package/x11r7/xapp_xrdb/Config.in
 		source package/x11r7/xapp_xrefresh/Config.in
+		source package/x11r7/xapp_xscreensaver/Config.in
 		source package/x11r7/xapp_xset/Config.in
 		source package/x11r7/xapp_xsetmode/Config.in
 		source package/x11r7/xapp_xsetpointer/Config.in
diff --git a/package/x11r7/xapp_xscreensaver/Config.in b/package/x11r7/xapp_xscreensaver/Config.in
new file mode 100644
index 0000000..cc93e3b
--- /dev/null
+++ b/package/x11r7/xapp_xscreensaver/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_XAPP_XSCREENSAVER
+	bool "xscreensaver"
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2->pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2->glib2
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBGLADE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXT
+	help
+	  XScreenSaver is the standard screen saver collection shipped on most
+	  Linux and Unix systems running the X11 Window System.
+
+	  On X11 systems, XScreenSaver is two things: it is both a large
+	  collection of screen savers; and it is also the framework for
+	  blanking and locking the screen.
+
+	  http://www.jwz.org/xscreensaver/
+
+comment "xscreensaver requires a toolchain with C++ and thread support enabled"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch b/package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch
new file mode 100644
index 0000000..4d05f03
--- /dev/null
+++ b/package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch
@@ -0,0 +1,29 @@
+The configure bails out when cross-compiling, because it is over-cautious
+about ANSI support in the C compiler. Work around this by disabling the
+bail-out code.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/configure b/configure
+--- a/configure	2013-07-16 10:23:32.000000000 +0100
++++ b/configure	2013-09-22 14:50:07.186953454 +0100
+@@ -3537,9 +3537,7 @@ $as_echo "Solaris: adding -D__EXTENSIONS
+   { $as_echo "$as_me:$LINENO: checking whether the compiler works on ANSI C" >&5
+ $as_echo_n "checking whether the compiler works on ANSI C... " >&6; }
+   if test "$cross_compiling" = yes; then
+-  { { $as_echo "$as_me:$LINENO: error: Couldn't build even a trivial ANSI C program: check CC." >&5
+-$as_echo "$as_me: error: Couldn't build even a trivial ANSI C program: check CC." >&2;}
+-   { (exit 1); exit 1; }; }
++  :
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+@@ -8616,7 +8614,7 @@ fi
+ $as_echo "$ac_cv_xpointer" >&6; }
+   if test "$ac_cv_xpointer" != yes; then
+    cat >>confdefs.h <<\_ACEOF
+-#define XPointer char*
++/* #define XPointer char* */
+ _ACEOF
+ 
+   fi
diff --git a/package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0002-fix-minixpm-build-problem.patch b/package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0002-fix-minixpm-build-problem.patch
new file mode 100644
index 0000000..842fb20
--- /dev/null
+++ b/package/x11r7/xapp_xscreensaver/xapp_xscreensaver-0002-fix-minixpm-build-problem.patch
@@ -0,0 +1,134 @@
+Fix compile and link errors related to the minixpm code.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/hacks/Makefile.in b/hacks/Makefile.in
+--- a/hacks/Makefile.in	2013-07-16 10:23:32.000000000 +0100
++++ b/hacks/Makefile.in	2013-09-22 18:47:56.389238980 +0100
+@@ -73,17 +73,22 @@ UTIL_SRCS	= $(UTILS_SRC)/alpha.c $(UTILS
+ 		  $(UTILS_SRC)/minixpm.c \
+ 		  $(UTILS_SRC)/yarandom.c $(UTILS_SRC)/erase.c \
+ 		  $(UTILS_SRC)/xshm.c $(UTILS_SRC)/xdbe.c \
+-		  $(UTILS_SRC)/textclient.c
++		  $(UTILS_SRC)/colorbars.c \
++		  $(UTILS_SRC)/fade.c \
++		  $(UTILS_SRC)/textclient.c \
++		  $(UTILS_SRC)/overlay.c
+ UTIL_OBJS	= $(UTILS_BIN)/alpha.o $(UTILS_BIN)/colors.o \
+ 		  $(UTILS_BIN)/grabclient.o \
+ 		  $(UTILS_BIN)/hsv.o $(UTILS_BIN)/resources.o \
+ 		  $(UTILS_BIN)/spline.o $(UTILS_BIN)/usleep.o \
+ 		  $(UTILS_BIN)/visual.o $(UTILS_BIN)/logo.o \
+-		  $(UTILS_SRC)/minixpm.c \
++		  $(UTILS_BIN)/minixpm.o \
+ 		  $(UTILS_BIN)/yarandom.o $(UTILS_BIN)/erase.o \
+ 		  $(UTILS_BIN)/xshm.o $(UTILS_BIN)/xdbe.o \
+ 		  $(UTILS_BIN)/colorbars.o \
+-		  $(UTILS_SRC)/textclient.o
++		  $(UTILS_BIN)/fade.o \
++		  $(UTILS_BIN)/textclient.o \
++		  $(UTILS_BIN)/overlay.o
+ 
+ SRCS		= attraction.c blitspin.c bouboule.c braid.c bubbles.c \
+ 		  bubbles-default.c decayscreen.c deco.c drift.c flag.c \
+@@ -559,11 +564,11 @@ xscreensaver-sgigl: xscreensaver-sgigl.c
+ attraction:	attraction.o	$(HACK_OBJS) $(COL) $(SPL)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)
+ 
+-blitspin:	blitspin.o	$(HACK_OBJS) $(GRAB) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(XPM) $(XPM_LIBS)
++blitspin:	blitspin.o	$(HACK_OBJS) $(GRAB) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(XPM) $(MINIXPM) $(XPM_LIBS)
+ 
+-bubbles:	bubbles.o	$(HACK_OBJS) bubbles-default.o $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) bubbles-default.o $(XPM) $(XPM_LIBS)
++bubbles:	bubbles.o	$(HACK_OBJS) bubbles-default.o $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) bubbles-default.o $(XPM) $(MINIXPM) $(XPM_LIBS)
+ 
+ decayscreen:	decayscreen.o	$(HACK_OBJS) $(GRAB)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(HACK_LIBS)
+@@ -604,8 +609,8 @@ moire:		moire.o		$(HACK_OBJS) $(COL) $(S
+ moire2:		moire2.o	$(HACK_OBJS) $(COL) $(DBE)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(DBE) $(HACK_LIBS)
+ 
+-noseguy:	noseguy.o	$(HACK_OBJS) $(XPM) $(TEXT)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(XPM) $(TEXT) $(XPM_LIBS) $(TEXT_LIBS)
++noseguy:	noseguy.o	$(HACK_OBJS) $(XPM) $(TEXT) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(XPM) $(TEXT) $(MINIXPM) $(XPM_LIBS) $(TEXT_LIBS)
+ 
+ pedal:		pedal.o		$(HACK_OBJS) $(HSV) $(ERASE)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(ERASE) $(HACK_LIBS)
+@@ -658,14 +663,14 @@ interference:  interference.o	$(HACK_OBJ
+ truchet:	 truchet.o	$(HACK_OBJS) $(COL)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)
+ 
+-bsod:	 	bsod.o		$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM) $(XPM_LIBS)
++bsod:	 	bsod.o		$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM) $(MINIXPM) $(XPM_LIBS)
+ 
+ apple2:	 	apple2.o apple2-main.o	$(HACK_OBJS) $(ATV) $(GRAB) $(TEXT)
+ 	$(CC_HACK) -o $@ $@.o	apple2-main.o $(HACK_OBJS) $(ATV) $(GRAB) $(TEXT) $(XPM_LIBS) $(TEXT_LIBS)
+ 
+-xanalogtv: 	xanalogtv.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(XPM_LIBS) $(HACK_LIBS)
++xanalogtv: 	xanalogtv.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM) $(XPM_LIBS) $(HACK_LIBS)
+ 
+ distort:	distort.o	$(HACK_OBJS) $(GRAB) $(SHM)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(SHM) $(HACK_LIBS)
+@@ -688,8 +693,8 @@ compass:	compass.o	$(HACK_OBJS) $(DBE)
+ squiral:	squiral.o	$(HACK_OBJS) $(COL)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)
+ 
+-xflame:		xflame.o	$(HACK_OBJS) $(SHM) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SHM) $(XPM) $(XPM_LIBS)
++xflame:		xflame.o	$(HACK_OBJS) $(SHM) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SHM) $(XPM) $(MINIXPM) $(XPM_LIBS)
+ 
+ wander:		wander.o	$(HACK_OBJS) $(COL) $(ERASE)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)
+@@ -703,8 +708,8 @@ critical:	critical.o	$(HACK_OBJS) $(COL)
+ phosphor:	phosphor.o	$(HACK_OBJS) $(TEXT) $(COL)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(COL) $(HACK_LIBS) $(TEXT_LIBS)
+ 
+-xmatrix:	xmatrix.o	$(HACK_OBJS) $(TEXT) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(XPM) $(XPM_LIBS) $(TEXT_LIBS)
++xmatrix:	xmatrix.o	$(HACK_OBJS) $(TEXT) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(XPM) $(MINIXPM) $(XPM_LIBS) $(TEXT_LIBS)
+ 
+ petri:		petri.o		$(HACK_OBJS) $(COL) $(SPL)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)
+@@ -787,8 +792,8 @@ cloudlife:	cloudlife.o	$(HACK_OBJS) $(CO
+ fontglide:	fontglide.o	$(HACK_OBJS) $(DBE) $(TEXT)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(TEXT) $(HACK_LIBS) $(TEXT_LIBS)
+ 
+-pong: 	pong.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(XPM_LIBS) $(HACK_LIBS)
++pong: 	pong.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM) $(XPM_LIBS) $(HACK_LIBS)
+ 
+ wormhole: 	wormhole.o	$(HACK_OBJS)
+ 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)
+@@ -856,8 +861,8 @@ braid:		braid.o		$(XLOCK_OBJS) $(ERASE)
+ drift:		drift.o		$(XLOCK_OBJS) $(ERASE)
+ 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)
+ 
+-flag:		flag.o		$(XLOCK_OBJS) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(XPM) $(XPM_LIBS)
++flag:		flag.o		$(XLOCK_OBJS) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(XPM) $(MINIXPM) $(XPM_LIBS)
+ 
+ forest:		forest.o	$(XLOCK_OBJS) $(ERASE)
+ 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)
+@@ -959,8 +964,8 @@ thornbird:	thornbird.o	$(XLOCK_OBJS)
+ 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)
+ 
+ PACOBJS=pacman_ai.o pacman_level.o
+-pacman:		pacman.o 	$(PACOBJS) $(XLOCK_OBJS) $(XPM)
+-	$(CC_HACK) -o $@ $@.o	$(PACOBJS) $(XLOCK_OBJS) $(XPM) $(XPM_LIBS)
++pacman:		pacman.o 	$(PACOBJS) $(XLOCK_OBJS) $(XPM) $(MINIXPM)
++	$(CC_HACK) -o $@ $@.o	$(PACOBJS) $(XLOCK_OBJS) $(XPM) $(MINIXPM) $(XPM_LIBS)
+ 
+ fiberlamp:	fiberlamp.o	$(XLOCK_OBJS)
+ 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)
diff --git a/package/x11r7/xapp_xscreensaver/xapp_xscreensaver.mk b/package/x11r7/xapp_xscreensaver/xapp_xscreensaver.mk
new file mode 100644
index 0000000..a2ec01d
--- /dev/null
+++ b/package/x11r7/xapp_xscreensaver/xapp_xscreensaver.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# xapp_xscreensaver
+#
+################################################################################
+
+XAPP_XSCREENSAVER_VERSION = 5.22
+XAPP_XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
+XAPP_XSCREENSAVER_SOURCE = xscreensaver-$(XAPP_XSCREENSAVER_VERSION).tar.gz
+
+XAPP_XSCREENSAVER_LICENSE = MIT-like
+XAPP_XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h
+
+XAPP_XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+
+XAPP_XSCREENSAVER_CONF_OPT += \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
+	LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \
+	LIBS=-lintl
+
+XAPP_XSCREENSAVER_INSTALL_TARGET_OPT = install_prefix="$(TARGET_DIR)" install
+
+$(eval $(autotools-package))
-- 
1.8.1.2
