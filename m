From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 21 Oct 2008 08:06:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libFS
Message-ID: <20081021150606.B46983C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-21 08:06:06 -0700 (Tue, 21 Oct 2008)
New Revision: 23756

Log:
x11r7/libFS: use memcpy instead of bcopy

Added:
   trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch


Changeset:
Added: trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch	2008-10-21 15:06:06 UTC (rev 23756)
@@ -0,0 +1,69 @@
+libFS: use memcpy instead of bcopy
+---
+ src/FSOpenServ.c |    2 +-
+ src/FSlibInt.c   |    2 +-
+ src/FSlibint.h   |    4 ++--
+ src/FSlibos.h    |    2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+Index: libFS-1.0.0/src/FSOpenServ.c
+===================================================================
+--- libFS-1.0.0.orig/src/FSOpenServ.c
++++ libFS-1.0.0/src/FSOpenServ.c
+@@ -197,7 +197,7 @@
+ 	    errno = ENOMEM;
+ 	    return (FSServer *) 0;
+ 	}
+-	bcopy(ad, alts[i].name, altlen);
++	memcpy(alts[i].name, ad, altlen);
+ 	alts[i].name[altlen] = '\0';
+ 	ad += altlen + ((4 - (altlen + 2)) & 3);
+     }
+Index: libFS-1.0.0/src/FSlibInt.c
+===================================================================
+--- libFS-1.0.0.orig/src/FSlibInt.c
++++ libFS-1.0.0/src/FSlibInt.c
+@@ -1127,7 +1127,7 @@
+     long        len;
+ {
+     if (svr->bufptr + (len) <= svr->bufmax) {
+-	bcopy(data, svr->bufptr, (int) len);
++	memcpy(svr->bufptr, data, (int) len);
+ 	svr->bufptr += ((len) + 3) & ~3;
+     } else {
+ 	_FSSend(svr, data, len);
+Index: libFS-1.0.0/src/FSlibint.h
+===================================================================
+--- libFS-1.0.0.orig/src/FSlibint.h
++++ libFS-1.0.0/src/FSlibint.h
+@@ -285,7 +285,7 @@
+ #else
+ #define Data(svr, data, len) \
+ 	if (svr->bufptr + (len) <= svr->bufmax) {\
+-		bcopy(data, svr->bufptr, (int)len);\
++		memcpy(svr->bufptr, data, (int)len);	\
+ 		svr->bufptr += ((len) + 3) & ~3;\
+ 	} else\
+ 		_FSSend(svr, data, len)
+@@ -337,7 +337,7 @@
+ #define STARTITERATE(tpvar,type,start,endcond,decr) \
+   { register char *cpvar; \
+   for (cpvar = (char *) start; endcond; cpvar = NEXTPTR(cpvar,type), decr) { \
+-    type dummy; bcopy (cpvar, (char *) &dummy, SIZEOF(type)); \
++    type dummy; memcpy ((char *) &dummy, cpvar, SIZEOF(type));			\
+     tpvar = (type *) cpvar;
+ #define ENDITERATE }}
+ 
+Index: libFS-1.0.0/src/FSlibos.h
+===================================================================
+--- libFS-1.0.0.orig/src/FSlibos.h
++++ libFS-1.0.0/src/FSlibos.h
+@@ -228,7 +228,7 @@
+ #endif
+ 
+ #if (MSKCNT>4)
+-#define COPYBITS(src, dst) bcopy((caddr_t) src, (caddr_t) dst, sizeof(FdSet))
++#define COPYBITS(src, dst) memcpy((caddr_t) dst, (caddr_t) src, sizeof(FdSet))
+ #define CLEARBITS(buf) bzero((caddr_t) buf, sizeof(FdSet))
+ #define MASKANDSETBITS(dst, b1, b2)  \
+ 		      { int cri;			\
