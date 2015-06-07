From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2015 23:58:18 +0200
Subject: [Buildroot] [git commit] xscreensaver: bump version
Message-ID: <20150607221446.6D25680824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bad48c2e1e75b71b391d13a4b731bd7ac699259
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop no longer needed patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-cross-compile-ansi-c-bailout.patch    |   26 ++---
 .../0002-fix-minixpm-build-problem.patch           |  134 --------------------
 .../0003-driver-fix-linking-with-lintl.patch       |   35 -----
 package/xscreensaver/xscreensaver.hash             |    2 +-
 package/xscreensaver/xscreensaver.mk               |    4 +-
 5 files changed, 11 insertions(+), 190 deletions(-)

diff --git a/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch b/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch
index 4d05f03..6da9419 100644
--- a/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch
+++ b/package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch
@@ -2,28 +2,18 @@ The configure bails out when cross-compiling, because it is over-cautious
 about ANSI support in the C compiler. Work around this by disabling the
 bail-out code.
 
+[Peter: updated for 5.32]
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 
 diff -Nurp a/configure b/configure
 --- a/configure	2013-07-16 10:23:32.000000000 +0100
 +++ b/configure	2013-09-22 14:50:07.186953454 +0100
-@@ -3537,9 +3537,7 @@ $as_echo "Solaris: adding -D__EXTENSIONS
-   { $as_echo "$as_me:$LINENO: checking whether the compiler works on ANSI C" >&5
+@@ -4374,7 +4374,6 @@ $as_echo "Solaris: adding -D__EXTENSIONS
+   { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the compiler works on ANSI C" >&5
  $as_echo_n "checking whether the compiler works on ANSI C... " >&6; }
-   if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: Couldn't build even a trivial ANSI C program: check CC." >&5
--$as_echo "$as_me: error: Couldn't build even a trivial ANSI C program: check CC." >&2;}
--   { (exit 1); exit 1; }; }
-+  :
+   if test "$cross_compiling" = yes; then :
+-  as_fn_error $? "Couldn't build even a trivial ANSI C program: check CC." "$LINENO" 5
  else
-   cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
-@@ -8616,7 +8614,7 @@ fi
- $as_echo "$ac_cv_xpointer" >&6; }
-   if test "$ac_cv_xpointer" != yes; then
-    cat >>confdefs.h <<\_ACEOF
--#define XPointer char*
-+/* #define XPointer char* */
- _ACEOF
- 
-   fi
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
diff --git a/package/xscreensaver/0002-fix-minixpm-build-problem.patch b/package/xscreensaver/0002-fix-minixpm-build-problem.patch
deleted file mode 100644
index 842fb20..0000000
--- a/package/xscreensaver/0002-fix-minixpm-build-problem.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-Fix compile and link errors related to the minixpm code.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/hacks/Makefile.in b/hacks/Makefile.in
---- a/hacks/Makefile.in	2013-07-16 10:23:32.000000000 +0100
-+++ b/hacks/Makefile.in	2013-09-22 18:47:56.389238980 +0100
-@@ -73,17 +73,22 @@ UTIL_SRCS	= $(UTILS_SRC)/alpha.c $(UTILS
- 		  $(UTILS_SRC)/minixpm.c \
- 		  $(UTILS_SRC)/yarandom.c $(UTILS_SRC)/erase.c \
- 		  $(UTILS_SRC)/xshm.c $(UTILS_SRC)/xdbe.c \
--		  $(UTILS_SRC)/textclient.c
-+		  $(UTILS_SRC)/colorbars.c \
-+		  $(UTILS_SRC)/fade.c \
-+		  $(UTILS_SRC)/textclient.c \
-+		  $(UTILS_SRC)/overlay.c
- UTIL_OBJS	= $(UTILS_BIN)/alpha.o $(UTILS_BIN)/colors.o \
- 		  $(UTILS_BIN)/grabclient.o \
- 		  $(UTILS_BIN)/hsv.o $(UTILS_BIN)/resources.o \
- 		  $(UTILS_BIN)/spline.o $(UTILS_BIN)/usleep.o \
- 		  $(UTILS_BIN)/visual.o $(UTILS_BIN)/logo.o \
--		  $(UTILS_SRC)/minixpm.c \
-+		  $(UTILS_BIN)/minixpm.o \
- 		  $(UTILS_BIN)/yarandom.o $(UTILS_BIN)/erase.o \
- 		  $(UTILS_BIN)/xshm.o $(UTILS_BIN)/xdbe.o \
- 		  $(UTILS_BIN)/colorbars.o \
--		  $(UTILS_SRC)/textclient.o
-+		  $(UTILS_BIN)/fade.o \
-+		  $(UTILS_BIN)/textclient.o \
-+		  $(UTILS_BIN)/overlay.o
- 
- SRCS		= attraction.c blitspin.c bouboule.c braid.c bubbles.c \
- 		  bubbles-default.c decayscreen.c deco.c drift.c flag.c \
-@@ -559,11 +564,11 @@ xscreensaver-sgigl: xscreensaver-sgigl.c
- attraction:	attraction.o	$(HACK_OBJS) $(COL) $(SPL)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)
- 
--blitspin:	blitspin.o	$(HACK_OBJS) $(GRAB) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(XPM) $(XPM_LIBS)
-+blitspin:	blitspin.o	$(HACK_OBJS) $(GRAB) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(XPM) $(MINIXPM) $(XPM_LIBS)
- 
--bubbles:	bubbles.o	$(HACK_OBJS) bubbles-default.o $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) bubbles-default.o $(XPM) $(XPM_LIBS)
-+bubbles:	bubbles.o	$(HACK_OBJS) bubbles-default.o $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) bubbles-default.o $(XPM) $(MINIXPM) $(XPM_LIBS)
- 
- decayscreen:	decayscreen.o	$(HACK_OBJS) $(GRAB)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(HACK_LIBS)
-@@ -604,8 +609,8 @@ moire:		moire.o		$(HACK_OBJS) $(COL) $(S
- moire2:		moire2.o	$(HACK_OBJS) $(COL) $(DBE)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(DBE) $(HACK_LIBS)
- 
--noseguy:	noseguy.o	$(HACK_OBJS) $(XPM) $(TEXT)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(XPM) $(TEXT) $(XPM_LIBS) $(TEXT_LIBS)
-+noseguy:	noseguy.o	$(HACK_OBJS) $(XPM) $(TEXT) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(XPM) $(TEXT) $(MINIXPM) $(XPM_LIBS) $(TEXT_LIBS)
- 
- pedal:		pedal.o		$(HACK_OBJS) $(HSV) $(ERASE)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HSV) $(ERASE) $(HACK_LIBS)
-@@ -658,14 +663,14 @@ interference:  interference.o	$(HACK_OBJ
- truchet:	 truchet.o	$(HACK_OBJS) $(COL)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)
- 
--bsod:	 	bsod.o		$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM) $(XPM_LIBS)
-+bsod:	 	bsod.o		$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(APPLE2) $(XPM) $(MINIXPM) $(XPM_LIBS)
- 
- apple2:	 	apple2.o apple2-main.o	$(HACK_OBJS) $(ATV) $(GRAB) $(TEXT)
- 	$(CC_HACK) -o $@ $@.o	apple2-main.o $(HACK_OBJS) $(ATV) $(GRAB) $(TEXT) $(XPM_LIBS) $(TEXT_LIBS)
- 
--xanalogtv: 	xanalogtv.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(XPM_LIBS) $(HACK_LIBS)
-+xanalogtv: 	xanalogtv.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM) $(XPM_LIBS) $(HACK_LIBS)
- 
- distort:	distort.o	$(HACK_OBJS) $(GRAB) $(SHM)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(GRAB) $(SHM) $(HACK_LIBS)
-@@ -688,8 +693,8 @@ compass:	compass.o	$(HACK_OBJS) $(DBE)
- squiral:	squiral.o	$(HACK_OBJS) $(COL)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(HACK_LIBS)
- 
--xflame:		xflame.o	$(HACK_OBJS) $(SHM) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SHM) $(XPM) $(XPM_LIBS)
-+xflame:		xflame.o	$(HACK_OBJS) $(SHM) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(SHM) $(XPM) $(MINIXPM) $(XPM_LIBS)
- 
- wander:		wander.o	$(HACK_OBJS) $(COL) $(ERASE)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(ERASE) $(HACK_LIBS)
-@@ -703,8 +708,8 @@ critical:	critical.o	$(HACK_OBJS) $(COL)
- phosphor:	phosphor.o	$(HACK_OBJS) $(TEXT) $(COL)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(COL) $(HACK_LIBS) $(TEXT_LIBS)
- 
--xmatrix:	xmatrix.o	$(HACK_OBJS) $(TEXT) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(XPM) $(XPM_LIBS) $(TEXT_LIBS)
-+xmatrix:	xmatrix.o	$(HACK_OBJS) $(TEXT) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(TEXT) $(XPM) $(MINIXPM) $(XPM_LIBS) $(TEXT_LIBS)
- 
- petri:		petri.o		$(HACK_OBJS) $(COL) $(SPL)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(COL) $(SPL) $(HACK_LIBS)
-@@ -787,8 +792,8 @@ cloudlife:	cloudlife.o	$(HACK_OBJS) $(CO
- fontglide:	fontglide.o	$(HACK_OBJS) $(DBE) $(TEXT)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(DBE) $(TEXT) $(HACK_LIBS) $(TEXT_LIBS)
- 
--pong: 	pong.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(XPM_LIBS) $(HACK_LIBS)
-+pong: 	pong.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(ATV) $(GRAB) $(XPM) $(MINIXPM) $(XPM_LIBS) $(HACK_LIBS)
- 
- wormhole: 	wormhole.o	$(HACK_OBJS)
- 	$(CC_HACK) -o $@ $@.o	$(HACK_OBJS) $(HACK_LIBS)
-@@ -856,8 +861,8 @@ braid:		braid.o		$(XLOCK_OBJS) $(ERASE)
- drift:		drift.o		$(XLOCK_OBJS) $(ERASE)
- 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)
- 
--flag:		flag.o		$(XLOCK_OBJS) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(XPM) $(XPM_LIBS)
-+flag:		flag.o		$(XLOCK_OBJS) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(XPM) $(MINIXPM) $(XPM_LIBS)
- 
- forest:		forest.o	$(XLOCK_OBJS) $(ERASE)
- 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(ERASE) $(HACK_LIBS)
-@@ -959,8 +964,8 @@ thornbird:	thornbird.o	$(XLOCK_OBJS)
- 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)
- 
- PACOBJS=pacman_ai.o pacman_level.o
--pacman:		pacman.o 	$(PACOBJS) $(XLOCK_OBJS) $(XPM)
--	$(CC_HACK) -o $@ $@.o	$(PACOBJS) $(XLOCK_OBJS) $(XPM) $(XPM_LIBS)
-+pacman:		pacman.o 	$(PACOBJS) $(XLOCK_OBJS) $(XPM) $(MINIXPM)
-+	$(CC_HACK) -o $@ $@.o	$(PACOBJS) $(XLOCK_OBJS) $(XPM) $(MINIXPM) $(XPM_LIBS)
- 
- fiberlamp:	fiberlamp.o	$(XLOCK_OBJS)
- 	$(CC_HACK) -o $@ $@.o	$(XLOCK_OBJS) $(HACK_LIBS)
diff --git a/package/xscreensaver/0003-driver-fix-linking-with-lintl.patch b/package/xscreensaver/0003-driver-fix-linking-with-lintl.patch
deleted file mode 100644
index 51551c6..0000000
--- a/package/xscreensaver/0003-driver-fix-linking-with-lintl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2336fa7901733a434c38637bf39f3e282e78e1c1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Wed, 27 Aug 2014 22:44:21 +0200
-Subject: [PATCH 1/1] driver: fix linking with lintl
-
-The libintl is missing during xscreensaver build if
-glib2 was build with gettext.
-
-xscreensaver.o: In function `main':
-undefined reference to `libintl_bindtextdomain'
-undefined reference to `libintl_textdomain'
-
-Backport a patch applied in 5.28
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- driver/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/driver/Makefile.in b/driver/Makefile.in
-index af077ca..ce7055c 100644
---- a/driver/Makefile.in
-+++ b/driver/Makefile.in
-@@ -776,7 +776,7 @@ XScreenSaver_Xm_ad.h: XScreenSaver-Xm.ad
- # The executables linked in this directory.
- #
- xscreensaver: $(SAVER_OBJS)
--	$(CC) $(LDFLAGS) -o $@ $(SAVER_OBJS) $(SAVER_LIBS)
-+	$(CC) $(LDFLAGS) -o $@ $(SAVER_OBJS) $(SAVER_LIBS) $(INTL_LIBS)
- 
- xscreensaver-command: $(CMD_OBJS)
- 	$(CC) $(LDFLAGS) -o $@ $(CMD_OBJS) $(CMD_LIBS)
--- 
-1.9.3
-
diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 2217f82..7e7a07e 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 47b703ed22dce46a08f11ddd7d67d52e4f7ad8df844bdf956431069a0db36797 xscreensaver-5.22.tar.gz
+sha256 4252a6079d2d2f5b342e8bdd172cbad5f0af73daf4e412b61a68344d91ca93bd xscreensaver-5.32.tar.gz
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index c78c8ce..ec714fe 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 5.22
+XSCREENSAVER_VERSION = 5.32
 XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
 
 # N.B. GPLv2+ code (in the hacks/glx subdirectory) is not currently built.
@@ -12,7 +12,7 @@ XSCREENSAVER_LICENSE = MIT-like GPLv2+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 
 XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) host-intltool
 
 # otherwise we end up with host include/library dirs passed to the
 # compiler/linker
