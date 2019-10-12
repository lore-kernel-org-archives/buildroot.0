From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 07:56:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libX11: bump version to
 1.6.9
Message-ID: <20191012055629.18055-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patched applied upstream:

0001-makekeys-detach-ourselves-from-X-headers-entirely.patch
https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=0327c427d62f671eced067c6d9b69f4e216a8cac

0002-remove-reliance-on-static-libc.patch
https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=edc7680ed5a03cedb5facf14693823455e12c29c

Removed autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ch-ourselves-from-X-headers-entirely.patch | 39 -------------------
 .../0002-remove-reliance-on-static-libc.patch | 36 -----------------
 package/x11r7/xlib_libX11/xlib_libX11.hash    | 10 ++---
 package/x11r7/xlib_libX11/xlib_libX11.mk      |  3 +-
 4 files changed, 6 insertions(+), 82 deletions(-)
 delete mode 100644 package/x11r7/xlib_libX11/0001-makekeys-detach-ourselves-from-X-headers-entirely.patch
 delete mode 100644 package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch

diff --git a/package/x11r7/xlib_libX11/0001-makekeys-detach-ourselves-from-X-headers-entirely.patch b/package/x11r7/xlib_libX11/0001-makekeys-detach-ourselves-from-X-headers-entirely.patch
deleted file mode 100644
index 6a149aca03..0000000000
--- a/package/x11r7/xlib_libX11/0001-makekeys-detach-ourselves-from-X-headers-entirely.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0327c427d62f671eced067c6d9b69f4e216a8cac Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Mon, 17 Jun 2019 13:36:08 -0400
-Subject: [PATCH] makekeys: Detach ourselves from X headers entirely
-
-Subsequent to a121b7b0c210efe10bf93453b29050282324c906 we are no longer
-building makekeys with enough -I/foo/bar to find the X11 headers, so if
-they're not in a system include path, things fail. Since this utility is
-only needed at build time, there's no real reason to demand the X
-headers be installed for both the build and target machines if cross-
-compiling, we can just assume a vaguely ANSI environment instead.
-
-Tested-by: Niclas Zeising <zeising@daemonic.se>
-Reviewed-by: Keith Packard <keithp@keithp.com>
-Reviewed-by: Matt Turner <mattst88@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- src/util/makekeys.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/util/makekeys.c b/src/util/makekeys.c
-index bcb5b7d5..07563315 100644
---- a/src/util/makekeys.c
-+++ b/src/util/makekeys.c
-@@ -35,8 +35,10 @@ from The Open Group.
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <stdint.h>
-+#include <inttypes.h>
- 
--#include "../Xresinternal.h"
-+typedef uint32_t Signature;
- 
- #define KTNUM 4000
- 
--- 
-2.21.0
-
diff --git a/package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch b/package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch
deleted file mode 100644
index 68fda2889e..0000000000
--- a/package/x11r7/xlib_libX11/0002-remove-reliance-on-static-libc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From fc3c35853429ac7b4b7a1d91f639b7c3b946e1b6 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Mon, 1 Jul 2019 15:26:00 -0400
-Subject: [PATCH] remove reliance on static libc.
-
-As per commit: https://gitlab.freedesktop.org/xorg/lib/libx11/commit/4645e219133458781e3fb48eaea6a74cccb1b9aa
-
-"For Windows targets, libtool uses a wrapper executable, not a wrapper
-script (see [1]), which it compiles with the host compiler.  This
-doesn't work when cross-compiling."
-
-Because of this change, builds fail on Linux hosts without a static libc, this
-patch reverts this change.
-
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- src/util/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/util/Makefile.am b/src/util/Makefile.am
-index 3731437..a051567 100644
---- a/src/util/Makefile.am
-+++ b/src/util/Makefile.am
-@@ -10,7 +10,7 @@ AM_CPPFLAGS = \
- CC = @CC_FOR_BUILD@
- CPPFLAGS = @CPPFLAGS_FOR_BUILD@
- CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@ -all-static
-+LDFLAGS = @LDFLAGS_FOR_BUILD@
- LIBS =
- EXEEXT = @EXEEXT_FOR_BUILD@
- 
--- 
-2.21.0
-
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 26f043d65e..defaa4c982 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-June/002997.html
-md5 c5fa5a86a20e3591bed6c046498d4b8f  libX11-1.6.8.tar.bz2
-sha1 f1ea96fe472a981d378b4f2eec90dcd063f9a407  libX11-1.6.8.tar.bz2
-sha256 b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5  libX11-1.6.8.tar.bz2
-sha512 1de8e0ec466308bc48946d1ce7a7dc6bd3120b1b365cd01afd1bd51dd7369e3d1870dd379b0b7c5b07699095d59761bd23e2e02ab60929de32c39b6885016e76  libX11-1.6.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-October/003025.html
+md5 55adbfb6d4370ecac5e70598c4e7eed2  libX11-1.6.9.tar.bz2
+sha1 62456536411f2540fbd4a3f59ed8af94967124c2  libX11-1.6.9.tar.bz2
+sha256 9cc7e8d000d6193fa5af580d50d689380b8287052270f5bb26a5fb6b58b2bed1  libX11-1.6.9.tar.bz2
+sha512 fc18f0dc17ade1fc37402179f52e1f2b9c7b7d3a1a9590fea13046eb0c5193b4796289431cd99388eac01e8e59de77db45d2c9675d4f05ef8cf3ba6382c3dd31  libX11-1.6.9.tar.bz2
 # Locally computed
 sha256 2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 7c34b97c8d..18949c604d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.6.8
+XLIB_LIBX11_VERSION = 1.6.9
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
 XLIB_LIBX11_LICENSE_FILES = COPYING
 XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_DEPENDENCIES = \
 	libxcb \
 	xutil_util-macros \
-- 
2.20.1
