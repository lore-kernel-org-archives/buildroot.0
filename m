From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 02:03:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbv
Message-ID: <20080424090326.304B73C7E5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-24 02:03:25 -0700 (Thu, 24 Apr 2008)
New Revision: 21824

Log:
fbv: use .patch.$ARCH naming convention


Added:
   trunk/buildroot/package/fbv/fbv-1.0b-arch.patch.avr32
   trunk/buildroot/package/fbv/fbv-1.0b-cross.patch
   trunk/buildroot/package/fbv/fbv-1.0b-include.patch

Removed:
   trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch

Modified:
   trunk/buildroot/package/fbv/fbv.mk


Changeset:
Added: trunk/buildroot/package/fbv/fbv-1.0b-arch.patch.avr32
===================================================================
--- trunk/buildroot/package/fbv/fbv-1.0b-arch.patch.avr32	                        (rev 0)
+++ trunk/buildroot/package/fbv/fbv-1.0b-arch.patch.avr32	2008-04-24 09:03:25 UTC (rev 21824)
@@ -0,0 +1,48 @@
+diff -ur fbv-1.0b/fb_display.c fbv-1.0b-avr32/fb_display.c
+--- fbv-1.0b/fb_display.c	2004-09-07 14:09:43.000000000 +0200
++++ fbv-1.0b-avr32/fb_display.c	2006-05-04 13:30:25.000000000 +0200
+@@ -276,9 +276,6 @@
+ 	    for(i = 0; i < yc; i++, fbptr += scr_xs * cpp, imptr += pic_xs * cpp)
+ 			memcpy(fbptr, imptr, xc * cpp);
+ 		
+-	if(cpp == 1)
+-	    set8map(fh, &map_back);
+-	
+ 	munmap(fb, scr_xs * scr_ys * cpp);
+ }
+ 
+@@ -293,17 +290,17 @@
+ inline static unsigned short make15color(unsigned char r, unsigned char g, unsigned char b)
+ {
+     return (
+-	(((r >> 3) & 31) << 10) |
++	(((r >> 3) & 31)) |
+ 	(((g >> 3) & 31) << 5)  |
+-	 ((b >> 3) & 31)        );
++	 ((b >> 3) & 31) << 10);
+ }
+ 
+ inline static unsigned short make16color(unsigned char r, unsigned char g, unsigned char b)
+ {
+     return (
+-	(((r >> 3) & 31) << 11) |
+-	(((g >> 2) & 63) << 5)  |
+-	 ((b >> 3) & 31)        );
++	(((r >> 3) & 31))      |
++	(((g >> 3) & 31) << 5) |
++	 ((b >> 3) & 31) << 10);
+ }
+ 
+ void* convertRGB2FB(int fh, unsigned char *rgbbuff, unsigned long count, int bpp, int *cpp)
+@@ -342,9 +339,9 @@
+ 	    *cpp = 4;
+ 	    i_fbbuff = (unsigned int *) malloc(count * sizeof(unsigned int));
+ 	    for(i = 0; i < count ; i++)
+-		i_fbbuff[i] = ((rgbbuff[i*3] << 16) & 0xFF0000) |
++		i_fbbuff[i] = ((rgbbuff[i*3+2] << 16) & 0xFF0000) |
+ 			    ((rgbbuff[i*3+1] << 8) & 0xFF00) |
+-			    (rgbbuff[i*3+2] & 0xFF);
++			    (rgbbuff[i*3] & 0xFF);
+ 	    fbbuff = (void *) i_fbbuff;
+ 	    break;
+ 	default:

Deleted: trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch
===================================================================
--- trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch	2008-04-24 09:03:22 UTC (rev 21823)
+++ trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch	2008-04-24 09:03:25 UTC (rev 21824)
@@ -1,144 +0,0 @@
-diff -ur fbv-1.0b/configure fbv-1.0b-avr32/configure
---- fbv-1.0b/configure	2004-09-07 13:29:27.000000000 +0200
-+++ fbv-1.0b-avr32/configure	2006-05-04 11:10:06.000000000 +0200
-@@ -21,6 +21,7 @@
- unset png
- unset bmp
- unset dfb
-+unset CC
- 
- help(){
- cat << EOF >&2
-@@ -33,6 +34,7 @@
- General:
-   --help	print this message
-   --libs=LIBS	additional libraries required (try -lX11 for ungif, -lz for PNG)
-+  --cc=CC	specify compiler to use
-   
- Directory and file names:
-   --prefix=PREFIX	install files in PREFIX [/usr/local]
-@@ -53,7 +55,7 @@
- --long help,\
- prefix:,srcdir:,bindir:,\
- infodir:,mandir:,\
--without-libungif,without-libjpeg,without-libpng,without-bmp,libs: \
-+without-libungif,without-libjpeg,without-libpng,without-bmp,libs:,cc: \
- -n "$BASENAME" -- "$@")
- 
- if [ $? != 0 ] ; then help ; exit 1 ; fi
-@@ -65,6 +67,7 @@
- 	case "$1" in
- 		-h|--help) help ; exit 0 ;;
- 		--libs) libs="$2"; shift 2 ;;
-+		--cc) CC="$2"; shift 2 ;;
- 		--prefix) prefix="$2" ; shift 2 ;;
- 		--srcdir) srcdir="$2" ; shift 2 ;;
- 		--bindir) bindir="$2" ; shift 2 ;;
-@@ -80,6 +83,7 @@
- 	esac
- done
- 
-+[ -z "$CC" ] && CC=cc
- [ -z "$prefix" ] && prefix="/usr/local"
- [ -z "$bindir" ] && bindir="${prefix}/bin"
- [ -z "$mandir" ] && mandir="${prefix}/man"
-@@ -106,12 +110,12 @@
- ungif="no"
- echo "libungif check" >>./config.log
- echo "  1st:" >>./config.log
--cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
-+$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
- if [ -e \$\$~test ]; then
- 	libs="-lungif $libs" ; ungif="yes"
- else
- 	echo "  2nd: -lX11 -L$xdir/lib" >>./config.log
--	cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
-+	$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
- 	if [ -e \$\$~test ]; then
- 	libs="-lungif -lX11 -L$xdir/lib $libs" ; ungif="yes"
- 	fi
-@@ -124,7 +128,7 @@
- echo -n "checking for libjpeg presence... "
- if [ "$jpeg" != "disabled" ]; then
- jpeg="no"
--cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
-+$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
- if [ -e \$\$~test ]; then
- 	libs="-ljpeg $libs" ; jpeg="yes"
- fi
-@@ -135,7 +139,7 @@
- echo -n "checking for libpng presence... "
- if [ "$png" != "disabled" ]; then
- png="no"
--cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
-+$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
- if [ -e \$\$~test ]; then
- 	libs="-lpng $libs" ; png="yes"
- fi
-diff -ur fbv-1.0b/fb_display.c fbv-1.0b-avr32/fb_display.c
---- fbv-1.0b/fb_display.c	2004-09-07 14:09:43.000000000 +0200
-+++ fbv-1.0b-avr32/fb_display.c	2006-05-04 13:30:25.000000000 +0200
-@@ -18,8 +18,6 @@
-     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
- 
--#include <linux/fb.h>
--
- #include <stdio.h>
- #include <stdlib.h>
- #include <sys/types.h>
-@@ -31,7 +29,9 @@
- #include <asm/types.h>
- #include <string.h>
- #include <errno.h>
-+#include <linux/fb.h>
- #include "config.h"
-+
- /* Public Use Functions:
-  *
-  * extern void fb_display(unsigned char *rgbbuff,
-@@ -276,9 +276,6 @@
- 	    for(i = 0; i < yc; i++, fbptr += scr_xs * cpp, imptr += pic_xs * cpp)
- 			memcpy(fbptr, imptr, xc * cpp);
- 		
--	if(cpp == 1)
--	    set8map(fh, &map_back);
--	
- 	munmap(fb, scr_xs * scr_ys * cpp);
- }
- 
-@@ -293,17 +290,17 @@
- inline static unsigned short make15color(unsigned char r, unsigned char g, unsigned char b)
- {
-     return (
--	(((r >> 3) & 31) << 10) |
-+	(((r >> 3) & 31)) |
- 	(((g >> 3) & 31) << 5)  |
--	 ((b >> 3) & 31)        );
-+	 ((b >> 3) & 31) << 10);
- }
- 
- inline static unsigned short make16color(unsigned char r, unsigned char g, unsigned char b)
- {
-     return (
--	(((r >> 3) & 31) << 11) |
--	(((g >> 2) & 63) << 5)  |
--	 ((b >> 3) & 31)        );
-+	(((r >> 3) & 31))      |
-+	(((g >> 3) & 31) << 5) |
-+	 ((b >> 3) & 31) << 10);
- }
- 
- void* convertRGB2FB(int fh, unsigned char *rgbbuff, unsigned long count, int bpp, int *cpp)
-@@ -342,9 +339,9 @@
- 	    *cpp = 4;
- 	    i_fbbuff = (unsigned int *) malloc(count * sizeof(unsigned int));
- 	    for(i = 0; i < count ; i++)
--		i_fbbuff[i] = ((rgbbuff[i*3] << 16) & 0xFF0000) |
-+		i_fbbuff[i] = ((rgbbuff[i*3+2] << 16) & 0xFF0000) |
- 			    ((rgbbuff[i*3+1] << 8) & 0xFF00) |
--			    (rgbbuff[i*3+2] & 0xFF);
-+			    (rgbbuff[i*3] & 0xFF);
- 	    fbbuff = (void *) i_fbbuff;
- 	    break;
- 	default:

Added: trunk/buildroot/package/fbv/fbv-1.0b-cross.patch
===================================================================
--- trunk/buildroot/package/fbv/fbv-1.0b-cross.patch	                        (rev 0)
+++ trunk/buildroot/package/fbv/fbv-1.0b-cross.patch	2008-04-24 09:03:25 UTC (rev 21824)
@@ -0,0 +1,44 @@
+diff -urpN fbv-1.0b.orig/configure fbv-1.0b/configure
+--- fbv-1.0b.orig/configure	2004-09-07 13:29:27.000000000 +0200
++++ fbv-1.0b/configure	2008-04-24 10:52:37.000000000 +0200
+@@ -80,6 +80,7 @@ while true ; do
+ 	esac
+ done
+ 
++[ -z "$CC" ] && CC=cc
+ [ -z "$prefix" ] && prefix="/usr/local"
+ [ -z "$bindir" ] && bindir="${prefix}/bin"
+ [ -z "$mandir" ] && mandir="${prefix}/man"
+@@ -106,12 +107,12 @@ xdir="/usr/X11R6"
+ ungif="no"
+ echo "libungif check" >>./config.log
+ echo "  1st:" >>./config.log
+-cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
++$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif $libs
+ if [ -e \$\$~test ]; then
+ 	libs="-lungif $libs" ; ungif="yes"
+ else
+ 	echo "  2nd: -lX11 -L$xdir/lib" >>./config.log
+-	cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
++	$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lungif -lX11 -L$xdir/lib $libs
+ 	if [ -e \$\$~test ]; then
+ 	libs="-lungif -lX11 -L$xdir/lib $libs" ; ungif="yes"
+ 	fi
+@@ -124,7 +125,7 @@ echo "libungif: $ungif" >> ./config.log
+ echo -n "checking for libjpeg presence... "
+ if [ "$jpeg" != "disabled" ]; then
+ jpeg="no"
+-cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
++$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
+ if [ -e \$\$~test ]; then
+ 	libs="-ljpeg $libs" ; jpeg="yes"
+ fi
+@@ -135,7 +136,7 @@ echo "libjpeg: $jpeg" >> ./config.log
+ echo -n "checking for libpng presence... "
+ if [ "$png" != "disabled" ]; then
+ png="no"
+-cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
++$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
+ if [ -e \$\$~test ]; then
+ 	libs="-lpng $libs" ; png="yes"
+ fi

Added: trunk/buildroot/package/fbv/fbv-1.0b-include.patch
===================================================================
--- trunk/buildroot/package/fbv/fbv-1.0b-include.patch	                        (rev 0)
+++ trunk/buildroot/package/fbv/fbv-1.0b-include.patch	2008-04-24 09:03:25 UTC (rev 21824)
@@ -0,0 +1,20 @@
+diff -urpN fbv-1.0b.orig/fb_display.c fbv-1.0b/fb_display.c
+--- fbv-1.0b.orig/fb_display.c	2004-09-07 14:09:43.000000000 +0200
++++ fbv-1.0b/fb_display.c	2008-04-24 10:48:29.000000000 +0200
+@@ -18,8 +18,6 @@
+     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+ 
+-#include <linux/fb.h>
+-
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+@@ -31,6 +29,7 @@
+ #include <asm/types.h>
+ #include <string.h>
+ #include <errno.h>
++#include <linux/fb.h>
+ #include "config.h"
+ /* Public Use Functions:
+  *

Modified: trunk/buildroot/package/fbv/fbv.mk
===================================================================
--- trunk/buildroot/package/fbv/fbv.mk	2008-04-24 09:03:22 UTC (rev 21823)
+++ trunk/buildroot/package/fbv/fbv.mk	2008-04-24 09:03:25 UTC (rev 21824)
@@ -18,7 +18,8 @@
 
 $(FBV_DIR)/.unpacked: $(DL_DIR)/$(FBV_SOURCE)
 	$(FBV_CAT) $(DL_DIR)/$(FBV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FBV_DIR) package/fbv/ fbv-$(FBV_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(FBV_DIR) package/fbv/ \
+		fbv-$(FBV_VERSION)\*.patch fbv-$(FBV_VERSION)\*.patch.$(ARCH)
 	touch $@
 
 $(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
@@ -27,7 +28,6 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--prefix=/usr \
-		--cc=$(TARGET_CC) \
 		--libs="-lz -lm" \
 	)
 	touch $@
