From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 Jan 2015 20:05:15 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/fbv: Switch to giflib
Message-ID: <1422558315-19150-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--
v2: Rework configure/Make.conf transition from -lungif to -lgif (Peter)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fbv/Config.in             |    4 +-
 package/fbv/fbv-1.0b-giflib.patch |   84 +++++++++++++++++++++++++++++++++++++
 package/fbv/fbv.mk                |    2 +-
 3 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 package/fbv/fbv-1.0b-giflib.patch

diff --git a/package/fbv/Config.in b/package/fbv/Config.in
index b8a9fe4..3160a85 100644
--- a/package/fbv/Config.in
+++ b/package/fbv/Config.in
@@ -26,8 +26,8 @@ config BR2_PACKAGE_FBV_JPEG
 config BR2_PACKAGE_FBV_GIF
 	bool "GIF support"
 	default y
-	select BR2_PACKAGE_LIBUNGIF
+	select BR2_PACKAGE_GIFLIB
 	help
-	  Enable support for GIF using libungif.
+	  Enable support for GIF using giflib.
 
 endif # BR2_PACKAGE_FBV
diff --git a/package/fbv/fbv-1.0b-giflib.patch b/package/fbv/fbv-1.0b-giflib.patch
new file mode 100644
index 0000000..7043353
--- /dev/null
+++ b/package/fbv/fbv-1.0b-giflib.patch
@@ -0,0 +1,84 @@
+Adjust source code to work with giflib 5.1x
+
+Downloaded patch for gif.c from
+https://projects.archlinux.org/svntogit/community.git/plain/trunk/giflib-5.1.patch?h=packages/fbv
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -wbBur fbv-1.0b/gif.c fbv-1.0b.my/gif.c
+--- fbv-1.0b/gif.c	2003-08-25 00:23:02.000000000 +0400
++++ fbv-1.0b.my/gif.c	2014-05-29 18:39:41.337332872 +0400
+@@ -31,10 +31,10 @@
+ #include <string.h>
+ #define min(a,b) ((a) < (b) ? (a) : (b))
+ #define gflush return(FH_ERROR_FILE);
+-#define grflush { DGifCloseFile(gft); return(FH_ERROR_FORMAT); }
+-#define mgrflush { free(lb); free(slb); DGifCloseFile(gft); return(FH_ERROR_FORMAT); }
++#define grflush { DGifCloseFile(gft, NULL); return(FH_ERROR_FORMAT); }
++#define mgrflush { free(lb); free(slb); DGifCloseFile(gft, NULL); return(FH_ERROR_FORMAT); }
+ #define agflush return(FH_ERROR_FORMAT);
+-#define agrflush { DGifCloseFile(gft); return(FH_ERROR_FORMAT); }
++#define agrflush { DGifCloseFile(gft, NULL); return(FH_ERROR_FORMAT); }
+ 
+ 
+ int fh_gif_id(char *name)
+@@ -81,7 +81,7 @@
+     ColorMapObject *cmap;
+     int cmaps;
+ 
+-    gft=DGifOpenFileName(name);
++    gft=DGifOpenFileName(name, NULL);
+     if(gft==NULL){printf("err5\n"); gflush;} //////////
+     do
+     {
+@@ -170,7 +170,7 @@
+ 	}
+     }
+     while( rt!= TERMINATE_RECORD_TYPE );
+-    DGifCloseFile(gft);
++    DGifCloseFile(gft, NULL);
+     return(FH_ERROR_OK);
+ }
+ 
+@@ -184,7 +184,7 @@
+     int extcode;
+     GifRecordType rt;
+ 
+-    gft=DGifOpenFileName(name);
++    gft=DGifOpenFileName(name, NULL);
+     if(gft==NULL) gflush;
+     do
+     {
+@@ -197,7 +197,7 @@
+ 		px=gft->Image.Width;
+ 		py=gft->Image.Height;
+ 		*x=px; *y=py;
+-		DGifCloseFile(gft);
++		DGifCloseFile(gft, NULL);
+ 		return(FH_ERROR_OK);
+ 		break;
+ 	    case EXTENSION_RECORD_TYPE:
+@@ -210,7 +210,7 @@
+ 	}  
+     }
+     while( rt!= TERMINATE_RECORD_TYPE );
+-    DGifCloseFile(gft);
++    DGifCloseFile(gft, NULL);
+     return(FH_ERROR_FORMAT);
+ }
+ #endif
+diff -uNr fbv-1.0b.org/configure fbv-1.0b/configure
+--- fbv-1.0b.org/configure	2004-09-07 13:29:27.000000000 +0200
++++ fbv-1.0b/configure	2015-01-29 19:58:30.374599874 +0100
+@@ -106,9 +106,9 @@
+ ungif="no"
+ echo "libungif check" >>./config.log
+ echo "  1st:" >>./config.log
+-$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
++$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lgif $libs
+ if [ -e \$\$~test ]; then
+-	libs="-lungif $libs" ; ungif="yes"
++	libs="-lgif $libs" ; ungif="yes"
+ else
+ 	echo "  2nd: -lX11 -L$xdir/lib" >>./config.log
+ 	$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index fe24a6f..8788b0e 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -30,7 +30,7 @@ else
 FBV_CONFIGURE_OPTS += --without-libjpeg
 endif
 ifeq ($(BR2_PACKAGE_FBV_GIF),y)
-FBV_DEPENDENCIES += libungif
+FBV_DEPENDENCIES += giflib
 else
 FBV_CONFIGURE_OPTS += --without-libungif
 endif
-- 
1.7.10.4
