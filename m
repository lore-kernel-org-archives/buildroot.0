From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 18:39:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  tinyx tinyx-old
Message-ID: <20070821013929.D57EAA614F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 18:39:29 -0700 (Mon, 20 Aug 2007)
New Revision: 19597

Log:
Reintroduce possibility to use old makefile for tiny-x as a test

Added:
   trunk/buildroot/package/tinyx-old/
   trunk/buildroot/package/tinyx-old/Config.in
   trunk/buildroot/package/tinyx-old/tinyx-011010.patch
   trunk/buildroot/package/tinyx-old/tinyx-build.patch
   trunk/buildroot/package/tinyx-old/tinyx-config.patch
   trunk/buildroot/package/tinyx-old/tinyx.mk

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/tinyx/tinyx.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-21 01:34:40 UTC (rev 19596)
+++ trunk/buildroot/package/Config.in	2007-08-21 01:39:29 UTC (rev 19597)
@@ -324,6 +324,7 @@
 endif
 if BR2_PACKAGE_XSERVER_tinyx
 source "package/tinyx/Config.in"
+source "package/tinyx-old/Config.in"
 endif
 
 comment "X libraries and helper libraries"

Modified: trunk/buildroot/package/tinyx/tinyx.mk
===================================================================
--- trunk/buildroot/package/tinyx/tinyx.mk	2007-08-21 01:34:40 UTC (rev 19596)
+++ trunk/buildroot/package/tinyx/tinyx.mk	2007-08-21 01:39:29 UTC (rev 19597)
@@ -24,7 +24,7 @@
 
 ifneq ($(strip $(BR2_PACKAGE_XORG)),y)
 ifeq ($(strip $(BR2_PACKAGE_TINYX)),y)
-
+ifeq ($(strip $(BR2_PACKAGE_TINYX_OLD)),y)
 #############################################################
 # You may want to change these.
 #############################################################
@@ -154,3 +154,4 @@
 TARGETS+=tinyx
 endif
 endif
+endif

Added: trunk/buildroot/package/tinyx-old/Config.in
===================================================================
--- trunk/buildroot/package/tinyx-old/Config.in	                        (rev 0)
+++ trunk/buildroot/package/tinyx-old/Config.in	2007-08-21 01:39:29 UTC (rev 19597)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TINYX_OLD
+	bool "tinyx (old version. which supposedly builds)"
+	default n
+	depends on BR2_PACKAGE_TINYX
+	help
+	  A tiny X server.  Also known as 'Xfbdev' and 'kdrive'.

Added: trunk/buildroot/package/tinyx-old/tinyx-011010.patch
===================================================================
--- trunk/buildroot/package/tinyx-old/tinyx-011010.patch	                        (rev 0)
+++ trunk/buildroot/package/tinyx-old/tinyx-011010.patch	2007-08-21 01:39:29 UTC (rev 19597)
@@ -0,0 +1,195 @@
+--- xc-011010/config/cf/X11.tmpl.orig	2005-05-12 16:16:17.000000000 -0600
++++ xc-011010/config/cf/X11.tmpl	2005-05-12 16:16:23.000000000 -0600
+@@ -3055,7 +3055,7 @@
+ 	$(RM) index.raw file.nPS file.PS file.txt
+ #endif
+ 
+-#ifndef MakeSimpleDoc(file,srcs)
++#ifndef MakeSimpleDoc
+ #define MakeSimpleDoc(file,srcs) MakeDepSimpleDoc(file,srcs,srcs)
+ #endif
+ 
+--- xc-011010/config/cf/kdrive.cf.orig	2005-05-12 16:14:50.000000000 -0600
++++ xc-011010/config/cf/kdrive.cf	2005-05-12 16:15:03.000000000 -0600
+@@ -201,7 +201,7 @@
+ #undef ServerOSDefines
+ #define ServerOSDefines -DDDXOSINIT
+ 
+-#ifndef Other IConfigFiles
++#ifndef OtherIConfigFiles
+ #define OtherIConfigFile $(IRULESRC)/kdrive.cf
+ #endif
+ 
+diff -Nur --exclude=CVS xc-011010.src/include/extensions/lbxstr.h xc-011010/include/extensions/lbxstr.h
+--- xc-011010.src/include/extensions/lbxstr.h	Tue Jul 31 20:44:35 2001
++++ xc-011010/include/extensions/lbxstr.h	Sun Apr 21 12:35:05 2002
+@@ -25,7 +25,7 @@
+ #ifndef _LBXSTR_H_
+ #define _LBXSTR_H_
+ 
+-#include <X11/extensions/XLbx.h>
++#include "XLbx.h"
+ 
+ #define LBXNAME "LBX"
+ 
+diff -Nur --exclude=CVS xc-011010.src/programs/Xserver/hw/kdrive/fbdev/fbdev.h xc-011010/programs/Xserver/hw/kdrive/fbdev/fbdev.h
+--- xc-011010.src/programs/Xserver/hw/kdrive/fbdev/fbdev.h	Sun Jun  3 17:52:45 2001
++++ xc-011010/programs/Xserver/hw/kdrive/fbdev/fbdev.h	Sun Apr 21 12:36:25 2002
+@@ -29,6 +29,7 @@
+ #include <linux/fb.h>
+ #include <unistd.h>
+ #include <sys/mman.h>
++#include <sys/types.h>
+ #include "kdrive.h"
+ #include "layer.h"
+
+diff -Nur xc-011010.src2/lib/X11/Xlib.h xc-011010/lib/X11/Xlib.h
+--- xc-011010.src/programs/Xserver/hw/kdrive/linux/ts.c	Tue Jul 10 22:58:19 2001
++++ xc-011010/programs/Xserver/hw/kdrive/linux/ts.c	Tue Apr 23 20:16:23 2002
+@@ -33,65 +33,48 @@
+ #include "kdrive.h"
+ #include "Xpoll.h"
+ #include <sys/ioctl.h>
+-#include <linux/h3600_ts.h>	/* touch screen events */
++
++typedef struct {
++  unsigned short          pressure;
++  unsigned short          x;
++  unsigned short          y;
++  unsigned short          pad;
++  struct timeval  stamp;
++} TS_EVENT;
+ 
+ static long lastx = 0, lasty = 0;
+ int TsScreen;
+ extern int TsFbdev;
+ 
+-void
+-TsRead (int tsPort, void *closure)
+-{
+-    TS_EVENT	    event;
+-    long	    buf[3];
+-    int		    n;
+-    long	    pressure;
+-    long	    x, y;
+-    unsigned long   flags;
+-    unsigned long   buttons;
+-
+-    n = Ps2ReadBytes (tsPort, (char *) &event, 
+-			 sizeof (event), sizeof (event));
+-    if (n == sizeof (event))  
+-    {
+-	if (event.pressure) 
+-	{
+-	    /* 
+-	     * HACK ATTACK.  (static global variables used !)
+-	     * Here we test for the touch screen driver actually being on the
+-	     * touch screen, if it is we send absolute coordinates. If not,
+-	     * then we send delta's so that we can track the entire vga screen.
+-	     */
+-	    if (TsScreen == TsFbdev) {
+-	    	flags = KD_BUTTON_1;
+-	    	x = event.x;
+-	    	y = event.y;
+-	    } else {
+-	    	flags = /* KD_BUTTON_1 |*/ KD_MOUSE_DELTA;
+-	    	if ((lastx == 0) || (lasty == 0)) {
+-	    	    x = 0;
+-	    	    y = 0;
+-	    	} else {
+-	    	    x = event.x - lastx;
+-	    	    y = event.y - lasty;
+-	    	}
+-	    	lastx = event.x;
+-	    	lasty = event.y;
+-	    }
+-	} else {
+-	    flags = KD_MOUSE_DELTA;
+-	    x = 0;
+-	    y = 0;
+-	    lastx = 0;
+-	    lasty = 0;
+-	}
+-	KdEnqueueMouseEvent (flags, x, y);
++void TsRead (int tsPort, void *closure) {
++  TS_EVENT        event;
++  long            buf[3];
++  int             n;
++  long            pressure;
++  long            x, y;
++  unsigned long   flags;
++  unsigned long   buttons;
++
++  n = Ps2ReadBytes(tsPort, (char *) &event, sizeof (event), sizeof (event));
++  if (n >= sizeof (event)) {
++    if (event.pressure >= 100) {
++      flags = KD_BUTTON_1;
++      x = (960 - event.x) * 640 / (920);
++      y = (960 - event.y) * 480 / (920);
++      //ErrorF("flags %d x %d y %dn",flags,event.x,event.y);
++    }
++    else {
++      flags = KD_MOUSE_DELTA;
++      x = lastx;
++      y = lasty;
+     }
++    KdEnqueueMouseEvent(flags, x, y);
++  }
+ }
+ 
+ char	*TsNames[] = {
+-  "/dev/ts",	
+-  "/dev/h3600_ts" /* temporary name; note this code can try
++  "/dev/ucb1x00-ts",
++  "/dev/ts" /* temporary name; note this code can try
+ 			   to open more than one device */
+ };
+ 
+@@ -99,9 +82,7 @@
+ 
+ int TsInputType;
+ 
+-int
+-TsInit (void)
+-{
++int TsInit (void) {
+     int	    i;
+     int	    TsPort;
+ 
+diff -Nur xc-011010.src/startx xc-011010/startx
+--- ../../buildroot-tux.Apr25-1/build/xc-011010.src/startx	Thu Apr 25 05:20:35 2002
++++ xc-011010/startx	Sun Apr 28 05:35:35 2002
+@@ -0,0 +1,11 @@
++#!/bin/sh
++killall Xfbdev
++sleep 1
++export DISPLAY=":0"
++/usr/X11R6/bin/Xfbdev -ac &
++sleep 4
++/usr/X11R6/bin/matchbox &
++sleep 1
++/usr/X11R6/bin/minisys &
++/usr/X11R6/bin/minitime &
++/usr/X11R6/bin/rxvt &
+diff -Nur xc-011010.src/lib/Xft/xftgram.y xc-011010/lib/Xft/xftgram.y
+--- ../../buildroot-tux.Apr25-1/build/xc-011010/lib/Xft/xftgram.y	Thu Apr 25 05:20:35 2002
++++ xc-011010/lib/Xft/xftgram.y	Sun Apr 28 05:35:35 2002
+@@ -165,6 +165,7 @@
+ 		    matrix.yx = $4;
+ 		    matrix.__REALLY_YY__ = $5;
+ 		}
++	;
+ number	:   INTEGER
+ 		{ $$ = (double) $1; }
+ 	|   DOUBLE
+diff -Nur xc-011010.src/programs/twm/gram.y xc-011010/programs/twm/gram.y
+--- ../../buildroot-tux.Apr25-1/build/xc-011010/programs/twm/gram.y	Thu Apr 25 05:20:35 2002
++++ xc-011010/programs/twm/gram.y	Sun Apr 28 05:35:35 2002
+@@ -650,6 +650,7 @@
+ 					  RemoveDQuote(ptr);
+ 					  $$ = ptr;
+ 					}
++		;
+ number		: NUMBER		{ $$ = $1; }
+ 		;
+ 

Added: trunk/buildroot/package/tinyx-old/tinyx-build.patch
===================================================================
--- trunk/buildroot/package/tinyx-old/tinyx-build.patch	                        (rev 0)
+++ trunk/buildroot/package/tinyx-old/tinyx-build.patch	2007-08-21 01:39:29 UTC (rev 19597)
@@ -0,0 +1,11 @@
+--- xc-011010/programs/xfs/os/config.c.orig	2001-07-31 18:45:05.000000000 -0600
++++ xc-011010/programs/xfs/os/config.c	2005-05-12 15:51:35.000000000 -0600
+@@ -661,6 +661,8 @@
+     val = config_parse_int (val, &ret, &scan);
+     if (ret == -1)
+ 	return val;
++#ifdef SNFFORMAT
+     SnfSetFormat (bit, byte, glyph, scan);
++#endif
+     return val;
+ }

Added: trunk/buildroot/package/tinyx-old/tinyx-config.patch
===================================================================
--- trunk/buildroot/package/tinyx-old/tinyx-config.patch	                        (rev 0)
+++ trunk/buildroot/package/tinyx-old/tinyx-config.patch	2007-08-21 01:39:29 UTC (rev 19597)
@@ -0,0 +1,112 @@
+--- xc/config/cf/host.def~	2005-04-02 14:51:31.000000000 -0700
++++ xc/config/cf/host.def	2005-04-26 01:22:00.000000000 -0600
+@@ -0,0 +1,36 @@
++#define KDriveXServer		YES
++#define TinyXServer		YES
++#define XfbdevServer		YES
++#define CrossCompiling		YES
++#define ProjectRoot             /usr/X11R6
++#define NothingOutsideProjectRoot	YES
++
++#define HasFreetype2		NO
++#define HasFontconfig		NO
++#define HasLibpng		YES
++#define HasZlib			YES
++
++#define HasExpat		NO
++#define XprtServer		NO
++#define BuildXprintClients	NO
++#define TouchScreen		NO
++#define HasTsLib		NO
++#define BuildDocs		NO
++#define BuildXF86DRI		NO
++#define BuildGlxExt		NO
++#define BuildOSMesaLib		NO
++#define BuildLBX		NO
++#define BuildLowMem		NO
++#define BuildIPv6		NO
++
++/*
++#define XF86CardDrivers		mga glint nv tga s3virge sis rendition \
++				neomagic i740 tdfx savage \
++				cirrus vmware tseng trident chips apm \
++				GlideDriver fbdev i128 \
++				ati AgpGartDrivers DevelDrivers ark \
++				cyrix siliconmotion vesa vga \
++				XF86OSCardDrivers XF86ExtraCardDrivers
++*/
++
++#define XInputDrivers		mouse keyboard
+--- xc/config/cf/cross.def.orig	2001-03-29 19:15:17.000000000 -0700
++++ xc/config/cf/cross.def	2005-05-12 16:09:23.000000000 -0600
+@@ -5,34 +5,56 @@
+  * compiler images.  It will have to be edited to reflect these
+  * given your local configuration.
+  */
++
++#undef Arm32Architecture
+ #undef i386Architecture
++#undef Arm32Architecture
++#undef Arm32Architecture
++
++#if defined(__arm__)
+ #define Arm32Architecture
++#endif
++#if defined(__i386__)
++#defined i386Architecture
++#endif
++#if defined(__mc68000__)
++#define Mc68020Architecture
++#endif
++#if defined(__mips__)
++#define MipsArchitecture
++#endif
++#if defined(__powerpc__)
++#define PpcArchitecture
++#endif
+ 
+ #undef OptimizedCDebugFlags
+-#define OptimizedCDebugFlags 	-O2
+-#define ServerCDebugFlags	-O2
++#define OptimizedCDebugFlags 	-Os
++#define ServerCDebugFlags	-Os
+ #undef StandardDefines
+-#define StandardDefines 	-Dlinux -D__arm__ -D_POSIX_SOURCE \
+-				-D_BSD_SOURCE -D_GNU_SOURCE -DX_LOCALE
+-#undef CcCmd
+-#define StdIncDir /skiff/local/arm-linux/include
+-#define PreIncDir 
++#define StandardDefines 	-Dlinux -D__REPLACE_ARCH__ -D_POSIX_SOURCE \
++  				-D_BSD_SOURCE -D_GNU_SOURCE -DX_LOCALE
++#define StdIncDir REPLACE_STAGING_DIR/include
++#define PreIncDir
+ #undef PostIncDir
+-#define PostIncDir /skiff/local/lib/gcc-lib/arm-linux/2.95.2/include
+-#define CcCmd /skiff/local/bin/arm-linux-gcc
++#define PostIncDir REPLACE_STAGING_DIR/lib/gcc-lib/REPLACE_ARCH-linux-uclibc/3.3.3/include
++#undef CcCmd
++#define CcCmd REPLACE_STAGING_DIR/bin/REPLACE_ARCH-linux-gcc
++#undef HasCplusplus
++#define HasCplusplus NO
+ #undef CplusplusCmd
+-#define HasCplusplus YES
+-#define CplusplusCmd /skiff/local/bin/arm-linux-g++
++#define CplusplusCmd NO
+ #define DoRanlibCmd YES
+-#define RanlibCmd /skiff/local/bin/arm-linux-ranlib
++#define RanlibCmd REPLACE_STAGING_DIR/bin/REPLACE_ARCH-linux-ranlib
+ #undef ExtraLoadFlags
+ #define ExtraLoadFlags
+ #define FbNoPixelAddrCode
+ #undef TermcapLibrary
+-#define TermcapLibrary -ltermcap
++#define TermcapLibrary -lncurses
+ 
+ #undef LdPostLib
+-#define LdPostLib	-L/skiff/local/arm-linux/lib
++#define LdPostLib	-LREPLACE_STAGING_DIR/REPLACE_ARCH-linux-uclibc/lib
++#undef LdCmd
++#define LdCmd REPLACE_STAGING_DIR/bin/REPLACE_ARCH-linux-ld
+ 
+ #undef ExtensionOSDefines
+ #define ExtensionOSDefines

Added: trunk/buildroot/package/tinyx-old/tinyx.mk
===================================================================
--- trunk/buildroot/package/tinyx-old/tinyx.mk	                        (rev 0)
+++ trunk/buildroot/package/tinyx-old/tinyx.mk	2007-08-21 01:39:29 UTC (rev 19597)
@@ -0,0 +1,156 @@
+#############################################################
+#
+# tinyx - a small footprint X-server for the TuxScreen
+#
+#############################################################
+# Copyright (C) 2002 by Tom Walsh <Tom@OpenHardware.net>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU Library General Public License as
+# published by the Free Software Foundation; either version 2 of the
+# License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# Library General Public License for more details.
+#
+# You should have received a copy of the GNU Library General Public
+# License along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+# USA
+#
+
+
+ifneq ($(strip $(BR2_PACKAGE_XORG)),y)
+ifeq ($(strip $(BR2_PACKAGE_TINYX_OLD)),y)
+
+#############################################################
+# You may want to change these.
+#############################################################
+
+TINYX_APPS:=xlsfonts/xlsfonts xmodmap/xmodmap
+#xset/xset xdpyinfo/xdpyinfo xsetroot/xsetroot \
+#	xrdb/xrdb xrandr/xrandr \
+#	xhost/xhost xauth/xauth oclock/oclock xeyes/xeyes
+#
+
+TINYX_LIBS:=ICE X11 Xext Xpm
+# Xaw SM Xt Xmu
+
+#############################################################
+# Stuff below this line shouldn't need changes.
+# if you do change, look in rxvt & matchbox for the impact!
+#############################################################
+#
+# Where resources are found.
+#
+
+TINYX_DIR:=$(BUILD_DIR)/xc-011010
+TINYX_LDIR:=$(TINYX_DIR)/lib
+TINYX_PROGS:=$(TINYX_DIR)/programs
+TINYX_SOURCE:=xc-011010.tar.bz2
+TINYX_SITE:= http://intimate.handhelds.org/jacques/
+TINYX_CF:=$(TINYX_DIR)/config/cf
+#
+# Some things that you may want to change.
+TINYX_XFBDEV:=$(TINYX_DIR)/programs/Xserver/Xfbdev
+TINYX_CAT:=$(BZCAT)
+TINYX_BINX:=$(TARGET_DIR)/usr/X11R6/bin/
+TINYX_LIBX:=$(TARGET_DIR)/usr/lib/
+
+#
+# These rules fetch various tinyx source files.
+#
+$(DL_DIR)/$(TINYX_SOURCE):
+	$(WGET) -P $(DL_DIR) $(TINYX_SITE)/$(TINYX_SOURCE)
+
+#
+# rule to make sure that we have the source, and it is configured.
+#
+$(TINYX_DIR)/.configure: $(DL_DIR)/$(TINYX_SOURCE)
+	$(TINYX_CAT) $(DL_DIR)/$(TINYX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(TINYX_DIR) package/tinyx/ tinyx\*.patch
+	$(SED) 's:REPLACE_STAGING_DIR:$(STAGING_DIR):g' $(TINYX_CF)/cross.def
+	$(SED) 's:REPLACE_ARCH:$(ARCH):g' $(TINYX_CF)/cross.def
+	$(SED) 's:#define CcCmd.*:#define CcCmd $(TARGET_CROSS)gcc:g' $(TINYX_CF)/cross.def
+	$(SED) 's:#define RanlibCmd.*:#define RanlibCmd $(TARGET_CROSS)ranlib:g' $(TINYX_CF)/cross.def
+	$(SED) 's:#define LdCmd.*:#define LdCmd $(TARGET_CROSS)ld:g' $(TINYX_CF)/cross.def
+	touch $(TINYX_DIR)/.configure
+
+#
+# Now that we have the source, build it...
+#
+$(TINYX_XFBDEV): $(TINYX_DIR)/.configure
+	rm -f $(TINYX_BINX)/Xfbdev
+	#make World CROSSCOMPILEFLAGS="CROSSCOMPILEDIR=<cross compiler dir>";
+	#( cd $(TINYX_DIR) ; $(MAKE) World CROSSCOMPILEFLAGS="CROSSCOMPILEDIR=$(STAGING_DIR)/bin" )
+	#( cd $(TINYX_DIR) ; $(TARGET_CONFIGURE_OPTS) $(MAKE) World )
+	#
+	#mv $(TINYX_DIR)/Makefile $(TINYX_DIR)/Makefile.xxxx
+	#echo "AS=$(TARGET_CROSS)as" > $(TINYX_DIR)/Makefile
+	#echo "LD=$(TARGET_CROSS)ld" >> $(TINYX_DIR)/Makefile
+	#echo "NM=$(TARGET_CROSS)nm" >> $(TINYX_DIR)/Makefile
+	#echo "CC=$(TARGET_CROSS)gcc" >> $(TINYX_DIR)/Makefile
+	#echo "GCC=$(TARGET_CROSS)gcc" >> $(TINYX_DIR)/Makefile
+	#echo "CXX=$(TARGET_CROSS)g++" >> $(TINYX_DIR)/Makefile
+	#echo "RANLIB=$(TARGET_CROSS)ranlib" >> $(TINYX_DIR)/Makefile
+	#echo "OBJCOPY=$(TARGET_CROSS)objcopy" >> $(TINYX_DIR)/Makefile
+	#cat $(TINYX_DIR)/Makefile.xxxx >> $(TINYX_DIR)/Makefile
+	( cd $(TINYX_DIR) ; $(MAKE) World )
+
+#
+# Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
+# and add a symbolic link between /usr/bin/X11 and /usr/X11R6/bin
+$(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_XFBDEV)
+	mkdir -p $(STAGING_DIR)/usr/X11R6/lib
+	mkdir -p $(STAGING_DIR)/usr/X11R6/include
+	cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
+	cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
+	ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
+
+#
+# Once Frame Buffer is built, we install executables.
+$(TINYX_BINX)/Xfbdev: $(TINYX_XFBDEV)
+	-mkdir $(TARGET_DIR)/usr/X11R6
+	-mkdir $(TINYX_BINX)
+	for file in $(TINYX_APPS) ; do \
+		cp -f $(TINYX_DIR)/programs/$$file $(TINYX_BINX) ; \
+		$(STRIP) $(TINYX_PROGS)/$$file ; \
+	done
+	cp $(TINYX_DIR)/programs/Xserver/Xfbdev $(TINYX_BINX)
+	$(STRIP) $(TINYX_BINX)/Xfbdev
+	cp -f $(TINYX_DIR)/startx $(TARGET_DIR)/bin
+	chmod a+x $(TARGET_DIR)/bin/startx
+
+#
+# After we have executables installed, install the libraries.
+$(TINYX_LIBX)/libX11.so.6.2: $(TINYX_XFBDEV)
+	for dirs in $(TINYX_LIBS) ; do \
+		file=`find $(TINYX_LDIR)/$$dirs -type f -iname "lib$$dirs.so*"` ; \
+		$(STRIP) --strip-unneeded $$file ; \
+		cp -f $$file $(TINYX_LIBX) ; \
+		file=`find $(TINYX_LDIR)/$$dirs -type l -iname "lib$$dirs.so*"` ; \
+		cp -pRf $$file $(TINYX_LIBX) ; \
+	done
+
+tinyx: zlib $(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2 \
+	$(TINYX_LIBX)/libX11.so.6.2 $(TINYX_BINX)/Xfbdev
+
+tinyx-source: $(DL_DIR)/$(TINYX_SOURCE)
+
+tinyx-clean:
+	-rm -rf $(TARGET_DIR)/usr/X11R6
+	-$(MAKE) -C $(TINYX_DIR) clean
+
+tinyx-dirclean:
+	-rm -rf $(TINYX_DIR)
+	-rm -rf $(TARGET_DIR)/usr/X11R6
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+TARGETS+=tinyx
+endif
+endif
