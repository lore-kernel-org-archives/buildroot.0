From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libFS to 1.0.2
Message-ID: <20100308133651.9AC99776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=991cd5b49925136de27d2cc4b1f952a44eb645c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libFS/Config.in                 |    2 +-
 .../x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch |   75 --------------------
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 3 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch

diff --git a/package/x11r7/xlib_libFS/Config.in b/package/x11r7/xlib_libFS/Config.in
index 7449148..865825f 100644
--- a/package/x11r7/xlib_libFS/Config.in
+++ b/package/x11r7/xlib_libFS/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	help
-	  libFS 1.0.0
+	  libFS 1.0.2
 	  X.Org FS library
diff --git a/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch b/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch
deleted file mode 100644
index 90dde5e..0000000
--- a/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Subject: [PATCH] libFS: use memmove instead of bcopy
-
-bcopy is marked as legacy in SuSv3 and not available in the default
-configuration of uClibc. Replace with memmove proposed by SuSv3.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/FSOpenServ.c |    2 +-
- src/FSlibInt.c   |    2 +-
- src/FSlibint.h   |    4 ++--
- src/FSlibos.h    |    2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
-Index: libFS-1.0.0/src/FSOpenServ.c
-===================================================================
---- libFS-1.0.0.orig/src/FSOpenServ.c
-+++ libFS-1.0.0/src/FSOpenServ.c
-@@ -197,7 +197,7 @@
- 	    errno = ENOMEM;
- 	    return (FSServer *) 0;
- 	}
--	bcopy(ad, alts[i].name, altlen);
-+	memmove(alts[i].name, ad, altlen);
- 	alts[i].name[altlen] = '\0';
- 	ad += altlen + ((4 - (altlen + 2)) & 3);
-     }
-Index: libFS-1.0.0/src/FSlibInt.c
-===================================================================
---- libFS-1.0.0.orig/src/FSlibInt.c
-+++ libFS-1.0.0/src/FSlibInt.c
-@@ -1127,7 +1127,7 @@
-     long        len;
- {
-     if (svr->bufptr + (len) <= svr->bufmax) {
--	bcopy(data, svr->bufptr, (int) len);
-+	memmove(svr->bufptr, data, (int) len);
- 	svr->bufptr += ((len) + 3) & ~3;
-     } else {
- 	_FSSend(svr, data, len);
-Index: libFS-1.0.0/src/FSlibint.h
-===================================================================
---- libFS-1.0.0.orig/src/FSlibint.h
-+++ libFS-1.0.0/src/FSlibint.h
-@@ -285,7 +285,7 @@
- #else
- #define Data(svr, data, len) \
- 	if (svr->bufptr + (len) <= svr->bufmax) {\
--		bcopy(data, svr->bufptr, (int)len);\
-+		memmove(svr->bufptr, data, (int)len);	\
- 		svr->bufptr += ((len) + 3) & ~3;\
- 	} else\
- 		_FSSend(svr, data, len)
-@@ -337,7 +337,7 @@
- #define STARTITERATE(tpvar,type,start,endcond,decr) \
-   { register char *cpvar; \
-   for (cpvar = (char *) start; endcond; cpvar = NEXTPTR(cpvar,type), decr) { \
--    type dummy; bcopy (cpvar, (char *) &dummy, SIZEOF(type)); \
-+    type dummy; memmove ((char *) &dummy, cpvar, SIZEOF(type));			\
-     tpvar = (type *) cpvar;
- #define ENDITERATE }}
- 
-Index: libFS-1.0.0/src/FSlibos.h
-===================================================================
---- libFS-1.0.0.orig/src/FSlibos.h
-+++ libFS-1.0.0/src/FSlibos.h
-@@ -228,7 +228,7 @@
- #endif
- 
- #if (MSKCNT>4)
--#define COPYBITS(src, dst) bcopy((caddr_t) src, (caddr_t) dst, sizeof(FdSet))
-+#define COPYBITS(src, dst) memmove((caddr_t) dst, (caddr_t) src, sizeof(FdSet))
- #define CLEARBITS(buf) bzero((caddr_t) buf, sizeof(FdSet))
- #define MASKANDSETBITS(dst, b1, b2)  \
- 		      { int cri;			\
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 4d41b59..e7a92e6 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFS_VERSION = 1.0.1
+XLIB_LIBFS_VERSION = 1.0.2
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
 XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFS_AUTORECONF = NO
-- 
1.6.3.3
