From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 16:11:16 +0200
Subject: [Buildroot] [git commit] xf86-video-intel: Fixed cross-compile
	patch to apply to version 2.4.2
Message-ID: <20090727143326.D5B83777EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=33a3e7ba2e3fe9ba0b5d198c0488d006f28eb273
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maurice van der Pot <griffon26@kfk4ever.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...iver_xf86-video-intel-2.4.2-cross-compile.patch |   42 +++++++++-----------
 1 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch
index ff476bd..ecf1571 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.4.2-cross-compile.patch
@@ -1,30 +1,26 @@
---- xf86-video-intel-2.4.2/configure.ac.orig	2007-06-10 20:59:27.000000000 +0200
-+++ xf86-video-intel-2.4.2/configure.ac	2007-06-10 20:59:50.000000000 +0200
-@@ -92,13 +92,14 @@ AC_HEADER_STDC
+diff -ruN xf86-video-intel-2.4.2/configure.ac xf86-video-intel-2.4.2-patched/configure.ac
+--- xf86-video-intel-2.4.2/configure.ac	2008-08-26 03:28:31.000000000 +0200
++++ xf86-video-intel-2.4.2-patched/configure.ac	2009-07-27 13:39:49.000000000 +0200
+@@ -91,6 +91,7 @@
+ # Checks for header files.
+ AC_HEADER_STDC
  
- AC_MSG_CHECKING([whether to include DRI support])
- if test x$DRI = xauto; then
-+ 	if test "$cross_compiling" = "no" ; then
++if test "$cross_compiling" = "no" ; then
+ if test x$DRI != xno; then
          AC_CHECK_FILE([${sdkdir}/dri.h],
                        [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
--	AC_CHECK_FILE([${sdkdir}/damage.h],
-+		AC_CHECK_FILE([${sdkdir}/damage.h],
-                       [have_damage_h="yes"], [have_damage_h="no"])
- 
-         if test "$have_dri_h" = yes -a \
-@@ -108,6 +109,12 @@ if test x$DRI = xauto; then
-         else
+@@ -111,6 +112,14 @@
                  DRI="no"
          fi
-+ 	else
-+ 		have_dri_h="yes"
-+ 		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+		DRI="yes"
-+ 	fi
  fi
++else
++if test x$DRI != xno; then
++	have_dri_h="yes"
++	have_sarea_h="yes"
++	have_dristruct_h="yes"
++	DRI="yes"
++fi
++fi
  AC_MSG_RESULT([$DRI])
+ 
+ save_CFLAGS="$CFLAGS"
-- 
1.6.3.3
