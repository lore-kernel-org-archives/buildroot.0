From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 22 Oct 2008 07:39:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xlib_libFS
Message-ID: <20081022143947.08EE43C666@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-22 07:39:46 -0700 (Wed, 22 Oct 2008)
New Revision: 23765

Log:
x11r7/libFS susv3-legacy: update to what got applied upstream

For details, see:
http://lists.freedesktop.org/archives/xorg/2008-October/039630.html

Modified:
   trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch	2008-10-22 13:36:10 UTC (rev 23764)
+++ trunk/buildroot/package/x11r7/xlib_libFS/xlib_libFS-susv3-legacy.patch	2008-10-22 14:39:46 UTC (rev 23765)
@@ -1,4 +1,10 @@
-libFS: use memcpy instead of bcopy
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Subject: [PATCH] libFS: use memmove instead of bcopy
+
+bcopy is marked as legacy in SuSv3 and not available in the default
+configuration of uClibc. Replace with memmove proposed by SuSv3.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 ---
  src/FSOpenServ.c |    2 +-
  src/FSlibInt.c   |    2 +-
@@ -15,7 +21,7 @@
  	    return (FSServer *) 0;
  	}
 -	bcopy(ad, alts[i].name, altlen);
-+	memcpy(alts[i].name, ad, altlen);
++	memmove(alts[i].name, ad, altlen);
  	alts[i].name[altlen] = '\0';
  	ad += altlen + ((4 - (altlen + 2)) & 3);
      }
@@ -28,7 +34,7 @@
  {
      if (svr->bufptr + (len) <= svr->bufmax) {
 -	bcopy(data, svr->bufptr, (int) len);
-+	memcpy(svr->bufptr, data, (int) len);
++	memmove(svr->bufptr, data, (int) len);
  	svr->bufptr += ((len) + 3) & ~3;
      } else {
  	_FSSend(svr, data, len);
@@ -41,7 +47,7 @@
  #define Data(svr, data, len) \
  	if (svr->bufptr + (len) <= svr->bufmax) {\
 -		bcopy(data, svr->bufptr, (int)len);\
-+		memcpy(svr->bufptr, data, (int)len);	\
++		memmove(svr->bufptr, data, (int)len);	\
  		svr->bufptr += ((len) + 3) & ~3;\
  	} else\
  		_FSSend(svr, data, len)
@@ -50,7 +56,7 @@
    { register char *cpvar; \
    for (cpvar = (char *) start; endcond; cpvar = NEXTPTR(cpvar,type), decr) { \
 -    type dummy; bcopy (cpvar, (char *) &dummy, SIZEOF(type)); \
-+    type dummy; memcpy ((char *) &dummy, cpvar, SIZEOF(type));			\
++    type dummy; memmove ((char *) &dummy, cpvar, SIZEOF(type));			\
      tpvar = (type *) cpvar;
  #define ENDITERATE }}
  
@@ -63,7 +69,7 @@
  
  #if (MSKCNT>4)
 -#define COPYBITS(src, dst) bcopy((caddr_t) src, (caddr_t) dst, sizeof(FdSet))
-+#define COPYBITS(src, dst) memcpy((caddr_t) dst, (caddr_t) src, sizeof(FdSet))
++#define COPYBITS(src, dst) memmove((caddr_t) dst, (caddr_t) src, sizeof(FdSet))
  #define CLEARBITS(buf) bzero((caddr_t) buf, sizeof(FdSet))
  #define MASKANDSETBITS(dst, b1, b2)  \
  		      { int cri;			\
