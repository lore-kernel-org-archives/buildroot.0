From: Hebbar <gururajakr@sanyo.co.in>
Date: Wed, 19 Mar 2008 21:57:01 -0700 (PDT)
Subject: [Buildroot]  [PATCH] Remove bcopy references from xserver_libFS
Message-ID: <16171631.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

xapp_fslsfonts fails because libFS package has references to bcopy function
and xapp_fslsfonts dependson libFS.so

>>> xapp_fslsfonts 1.0.1 Building

<snip>
<snip>
<snip>
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc -Os 
-I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
/opt/buildroot/build_arm/staging_dir -msoft-float  -g -O2   -o fslsfonts 
fslsfonts-fslsfonts.o -L/opt/buildroot/build_arm/staging_dir/usr/lib -lX11
-lFS
/opt/buildroot/build_arm/staging_dir/usr/lib/libFS.so: undefined reference
to `bcopy'
collect2: ld returned 1 exit status
make[2]: *** [fslsfonts] Error 1
make[2]: Leaving directory `/opt/buildroot/build_arm/xapp_fslsfonts-1.0.1'


Below patch removes references to bcopy function in xserver libfs package.

Regards
Gururaja

Signed-off-by: Gururaja Hebbar <gururaja@sanyo.co.in> 

Files changed:
xlib_libFS-1.0.0/src/FSOpenServ.c
xlib_libFS-1.0.0/src/FSlibInt.c
xlib_libFS-1.0.0/src/FSlibint.h
xlib_libFS-1.0.0/src/FSlibos.h


diff -purN xlib_libFS-1.0.0_orig/src/FSOpenServ.c
xlib_libFS-1.0.0/src/FSOpenServ.c
--- xlib_libFS-1.0.0_orig/src/FSOpenServ.c	2005-06-09 11:52:02.000000000
-0400
+++ xlib_libFS-1.0.0/src/FSOpenServ.c	2008-03-20 15:39:50.000000000 -0400
@@ -197,7 +197,7 @@ FSOpenServer(server)
 	    errno = ENOMEM;
 	    return (FSServer *) 0;
 	}
-	bcopy(ad, alts[i].name, altlen);
+	memmove (alts[i].name, ad, altlen); 
 	alts[i].name[altlen] = '\0';
 	ad += altlen + ((4 - (altlen + 2)) & 3);
     }
diff -purN xlib_libFS-1.0.0_orig/src/FSlibInt.c
xlib_libFS-1.0.0/src/FSlibInt.c
--- xlib_libFS-1.0.0_orig/src/FSlibInt.c	2005-05-25 17:47:56.000000000 -0400
+++ xlib_libFS-1.0.0/src/FSlibInt.c	2008-03-20 15:38:18.000000000 -0400
@@ -1127,7 +1127,7 @@ Data(svr, data, len)
     long        len;
 {
     if (svr->bufptr + (len) <= svr->bufmax) {
-	bcopy(data, svr->bufptr, (int) len);
+        memmove (svr->bufptr, data, (int) len); 
 	svr->bufptr += ((len) + 3) & ~3;
     } else {
 	_FSSend(svr, data, len);
diff -purN xlib_libFS-1.0.0_orig/src/FSlibint.h
xlib_libFS-1.0.0/src/FSlibint.h
--- xlib_libFS-1.0.0_orig/src/FSlibint.h	2008-03-20 15:33:14.000000000 -0400
+++ xlib_libFS-1.0.0/src/FSlibint.h	2008-03-20 15:40:38.000000000 -0400
@@ -285,7 +285,7 @@ extern void Data();
 #else
 #define Data(svr, data, len) \
 	if (svr->bufptr + (len) <= svr->bufmax) {\
-		bcopy(data, svr->bufptr, (int)len);\
+		memmove (svr->bufptr, data, (int) len);\
 		svr->bufptr += ((len) + 3) & ~3;\
 	} else\
 		_FSSend(svr, data, len)
@@ -337,7 +337,7 @@ extern void Data();
 #define STARTITERATE(tpvar,type,start,endcond,decr) \
   { register char *cpvar; \
   for (cpvar = (char *) start; endcond; cpvar = NEXTPTR(cpvar,type), decr)
{ \
-    type dummy; bcopy (cpvar, (char *) &dummy, SIZEOF(type)); \
+    type dummy; memmove ((char *) &dummy, cpvar, SIZEOF(type)); \
     tpvar = (type *) cpvar;
 #define ENDITERATE }}
 
diff -purN xlib_libFS-1.0.0_orig/src/FSlibos.h
xlib_libFS-1.0.0/src/FSlibos.h
--- xlib_libFS-1.0.0_orig/src/FSlibos.h	2005-11-08 01:33:25.000000000 -0500
+++ xlib_libFS-1.0.0/src/FSlibos.h	2008-03-20 15:39:13.000000000 -0400
@@ -228,7 +228,7 @@ typedef unsigned long FdSet[MSKCNT];
 #endif
 
 #if (MSKCNT>4)
-#define COPYBITS(src, dst) bcopy((caddr_t) src, (caddr_t) dst,
sizeof(FdSet))
+#define COPYBITS(src, dst) memmove( (caddr_t) dst,(caddr_t) src,
sizeof(FdSet))
 #define CLEARBITS(buf) bzero((caddr_t) buf, sizeof(FdSet))
 #define MASKANDSETBITS(dst, b1, b2)  \
 		      { int cri;			\


http://www.nabble.com/file/p16171631/xlib_libFS_remove_bcopy.patch
xlib_libFS_remove_bcopy.patch 
-- 
View this message in context: http://www.nabble.com/-PATCH--Remove-bcopy-references-from-xserver_libFS-tp16171631p16171631.html
Sent from the BuildRoot mailing list archive at Nabble.com.
