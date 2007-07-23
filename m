From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 01:59:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fbv
Message-ID: <20070723085911.B87E4A6602@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 01:59:10 -0700 (Mon, 23 Jul 2007)
New Revision: 19208

Log:
Add fbv 'frame buffer viewer' package

Added:
   trunk/buildroot/package/fbv/
   trunk/buildroot/package/fbv/Config.in
   trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch
   trunk/buildroot/package/fbv/fbv-1.0b-fix-24bpp-support-on-big-endian.patch
   trunk/buildroot/package/fbv/fbv.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-23 08:54:47 UTC (rev 19207)
+++ trunk/buildroot/package/Config.in	2007-07-23 08:59:10 UTC (rev 19208)
@@ -285,6 +285,9 @@
 
 comment "graphic libraries"
 source "package/directfb/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || BR2_avr32
+source "package/fbv/Config.in"
+endif
 source "package/jpeg/Config.in"
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"

Added: trunk/buildroot/package/fbv/Config.in
===================================================================
--- trunk/buildroot/package/fbv/Config.in	                        (rev 0)
+++ trunk/buildroot/package/fbv/Config.in	2007-07-23 08:59:10 UTC (rev 19208)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FBV
+	bool "fbv"
+	default n
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBUNGIF
+	help
+	  fbv is a very simple graphic file viewer for the framebuffer console,
+	  capable of displaying GIF, JPEG, PNG and BMP files using libungif,
+	  libjpeg and libpng.
+
+	  http://freshmeat.net/projects/fbv/

Added: trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch
===================================================================
--- trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch	                        (rev 0)
+++ trunk/buildroot/package/fbv/fbv-1.0b-avr32.patch	2007-07-23 08:59:10 UTC (rev 19208)
@@ -0,0 +1,144 @@
+diff -ur fbv-1.0b/configure fbv-1.0b-avr32/configure
+--- fbv-1.0b/configure	2004-09-07 13:29:27.000000000 +0200
++++ fbv-1.0b-avr32/configure	2006-05-04 11:10:06.000000000 +0200
+@@ -21,6 +21,7 @@
+ unset png
+ unset bmp
+ unset dfb
++unset CC
+ 
+ help(){
+ cat << EOF >&2
+@@ -33,6 +34,7 @@
+ General:
+   --help	print this message
+   --libs=LIBS	additional libraries required (try -lX11 for ungif, -lz for PNG)
++  --cc=CC	specify compiler to use
+   
+ Directory and file names:
+   --prefix=PREFIX	install files in PREFIX [/usr/local]
+@@ -53,7 +55,7 @@
+ --long help,\
+ prefix:,srcdir:,bindir:,\
+ infodir:,mandir:,\
+-without-libungif,without-libjpeg,without-libpng,without-bmp,libs: \
++without-libungif,without-libjpeg,without-libpng,without-bmp,libs:,cc: \
+ -n "$BASENAME" -- "$@")
+ 
+ if [ $? != 0 ] ; then help ; exit 1 ; fi
+@@ -65,6 +67,7 @@
+ 	case "$1" in
+ 		-h|--help) help ; exit 0 ;;
+ 		--libs) libs="$2"; shift 2 ;;
++		--cc) CC="$2"; shift 2 ;;
+ 		--prefix) prefix="$2" ; shift 2 ;;
+ 		--srcdir) srcdir="$2" ; shift 2 ;;
+ 		--bindir) bindir="$2" ; shift 2 ;;
+@@ -80,6 +83,7 @@
+ 	esac
+ done
+ 
++[ -z "$CC" ] && CC=cc
+ [ -z "$prefix" ] && prefix="/usr/local"
+ [ -z "$bindir" ] && bindir="${prefix}/bin"
+ [ -z "$mandir" ] && mandir="${prefix}/man"
+@@ -106,12 +110,12 @@
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
+@@ -124,7 +128,7 @@
+ echo -n "checking for libjpeg presence... "
+ if [ "$jpeg" != "disabled" ]; then
+ jpeg="no"
+-cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
++$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -ljpeg $libs
+ if [ -e \$\$~test ]; then
+ 	libs="-ljpeg $libs" ; jpeg="yes"
+ fi
+@@ -135,7 +139,7 @@
+ echo -n "checking for libpng presence... "
+ if [ "$png" != "disabled" ]; then
+ png="no"
+-cc 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
++$CC 2>>./config.log >>./config.log -o \$\$~test \$\$~test.c -lpng $libs
+ if [ -e \$\$~test ]; then
+ 	libs="-lpng $libs" ; png="yes"
+ fi
+diff -ur fbv-1.0b/fb_display.c fbv-1.0b-avr32/fb_display.c
+--- fbv-1.0b/fb_display.c	2004-09-07 14:09:43.000000000 +0200
++++ fbv-1.0b-avr32/fb_display.c	2006-05-04 13:30:25.000000000 +0200
+@@ -18,8 +18,6 @@
+     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+ 
+-#include <linux/fb.h>
+-
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+@@ -31,7 +29,9 @@
+ #include <asm/types.h>
+ #include <string.h>
+ #include <errno.h>
++#include <linux/fb.h>
+ #include "config.h"
++
+ /* Public Use Functions:
+  *
+  * extern void fb_display(unsigned char *rgbbuff,
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

Added: trunk/buildroot/package/fbv/fbv-1.0b-fix-24bpp-support-on-big-endian.patch
===================================================================
--- trunk/buildroot/package/fbv/fbv-1.0b-fix-24bpp-support-on-big-endian.patch	                        (rev 0)
+++ trunk/buildroot/package/fbv/fbv-1.0b-fix-24bpp-support-on-big-endian.patch	2007-07-23 08:59:10 UTC (rev 19208)
@@ -0,0 +1,32 @@
+diff -upr a/fb_display.c b/fb_display.c
+--- a/fb_display.c	2007-06-01 16:52:45.000000000 +0200
++++ b/fb_display.c	2007-06-01 16:51:43.000000000 +0200
+@@ -307,7 +307,7 @@ void* convertRGB2FB(int fh, unsigned cha
+ {
+     unsigned long i;
+     void *fbbuff = NULL;
+-	u_int8_t  *c_fbbuff;
++    u_int8_t  *c_fbbuff;
+     u_int16_t *s_fbbuff;
+     u_int32_t *i_fbbuff;
+ 
+@@ -335,6 +335,16 @@ void* convertRGB2FB(int fh, unsigned cha
+ 	    fbbuff = (void *) s_fbbuff;
+ 	    break;
+ 	case 24:
++	    *cpp = 3;
++	    c_fbbuff = (unsigned char *) malloc(count * 3 * sizeof(unsigned char));
++	    for(i = 0; i < (3 * count); i += 3) {
++		/* Big endian framebuffer. */
++		c_fbbuff[i] = rgbbuff[i+2];
++		c_fbbuff[i+1] = rgbbuff[i+1];
++		c_fbbuff[i+2] = rgbbuff[i];
++	    }
++	    fbbuff = (void *) c_fbbuff;
++	    break;
+ 	case 32:
+ 	    *cpp = 4;
+ 	    i_fbbuff = (unsigned int *) malloc(count * sizeof(unsigned int));
+Only in build_avr32/fbv-1.0b-modified: .fb_display.c.swp
+Binary files build_avr32/fbv-1.0b/fb_display.o and build_avr32/fbv-1.0b-modified/fb_display.o differ
+Binary files build_avr32/fbv-1.0b/fbv and build_avr32/fbv-1.0b-modified/fbv differ

Added: trunk/buildroot/package/fbv/fbv.mk
===================================================================
--- trunk/buildroot/package/fbv/fbv.mk	                        (rev 0)
+++ trunk/buildroot/package/fbv/fbv.mk	2007-07-23 08:59:10 UTC (rev 19208)
@@ -0,0 +1,54 @@
+#############################################################
+#
+# fbv
+#
+#############################################################
+FBV_VER:=1.0b
+FBV_SOURCE:=fbv-$(FBV_VER).tar.gz
+FBV_SITE:=http://s-tech.elsat.net.pl/fbv
+FBV_DIR:=$(BUILD_DIR)/fbv-$(FBV_VER)
+FBV_CAT:=$(ZCAT)
+FBV_BINARY:=fbv
+FBV_TARGET_BINARY:=usr/bin/$(FBV_BINARY)
+
+$(DL_DIR)/$(FBV_SOURCE):
+	$(WGET) -P $(DL_DIR) $(FBV_SITE)/$(FBV_SOURCE)
+
+$(FBV_DIR)/.unpacked: $(DL_DIR)/$(FBV_SOURCE)
+	$(FBV_CAT) $(DL_DIR)/$(FBV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(FBV_DIR) package/fbv/ fbv-$(FBV_VER)\*.patch\*
+	@touch $@
+
+$(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
+	(cd $(FBV_DIR); \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--prefix=/usr \
+		--cc=$(TARGET_CC) \
+		--libs="-lz -lm" \
+	);
+	@touch $@
+
+$(FBV_DIR)/$(FBV_BINARY): $(FBV_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(FBV_DIR)
+
+$(TARGET_DIR)/$(FBV_TARGET_BINARY): $(FBV_DIR)/$(FBV_BINARY)
+	install -D $(FBV_DIR)/$(FBV_BINARY) $(TARGET_DIR)/$(FBV_TARGET_BINARY)
+
+fbv: uclibc libpng jpeg libungif $(TARGET_DIR)/$(FBV_TARGET_BINARY)
+
+fbv-clean:
+	rm -f $(TARGET_DIR)/$(FBV_TARGET_BINARY)
+	-$(MAKE) -C $(FBV_DIR) clean
+
+fbv-dirclean:
+	rm -rf $(FBV_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_FBV)),y)
+TARGETS+=fbv
+endif
