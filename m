From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 25 Jan 2007 12:34:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20070125203411.D554F485DE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-25 12:34:10 -0800 (Thu, 25 Jan 2007)
New Revision: 17519

Log:
update DejaVu fonts to the latest
Fix broken keyboard handling


Modified:
   trunk/buildroot/package/xorg/Xsession
   trunk/buildroot/package/xorg/xorg.conf
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/Xsession
===================================================================
--- trunk/buildroot/package/xorg/Xsession	2007-01-25 20:27:27 UTC (rev 17518)
+++ trunk/buildroot/package/xorg/Xsession	2007-01-25 20:34:10 UTC (rev 17519)
@@ -1,5 +1,4 @@
 #!/bin/sh
 export GDK_USE_XFT=1
 export LANG="en_US.UTF-8"
-export LC_ALL="en_US.UTF-8"
 /usr/bin/X11/rxvt -bg black -fg gray90

Modified: trunk/buildroot/package/xorg/xorg.conf
===================================================================
--- trunk/buildroot/package/xorg/xorg.conf	2007-01-25 20:27:27 UTC (rev 17518)
+++ trunk/buildroot/package/xorg/xorg.conf	2007-01-25 20:34:10 UTC (rev 17519)
@@ -23,17 +23,17 @@
 	Load	"bitmap"
 	Load	"dbe"
 	Load	"ddc"
+	Load    "extmod"
 	Load	"freetype"
 	Load	"int10"
+	Load    "vbe"
 EndSection
 
 Section "InputDevice"
-	Identifier	"Generic Keyboard"
-	Driver		"keyboard"
-	Option		"XkbRules"	"xfree86"
-	Option		"XkbModel"	"pc104"
-	Option		"XkbLayout"	"us"
-	Option		"XkbOptions"	"altwin:meta_win"
+	Identifier     "Generic Keyboard"
+	Driver         "kbd"
+	Option         "CoreKeyboard"
+	Option         "XkbLayout" "en_US"
 EndSection
 
 Section "InputDevice"
@@ -56,9 +56,10 @@
 
 Section "Device"
 	Identifier	"Generic VGA Card"
-	Driver		"vesa"
+	#Driver		"vesa"
 	#Driver		"vga"
-	#Driver		"fbdev"
+	Driver		"fbdev"
+	Option "UseFBDev" "True"
 EndSection
 
 Section "Monitor"
@@ -72,26 +73,26 @@
 	Identifier	"Default Screen"
 	Device		"Generic VGA Card"
 	Monitor		"Generic Monitor"
-	DefaultDepth	8
+	#DefaultDepth	8
 	SubSection "Display"
 		Viewport	0 0
 		Depth		4
-		Modes		"640x480"
+		#Modes		"640x480"
 	EndSubSection
 	SubSection "Display"
 		Viewport	0 0
 		Depth		8
-		Modes		"640x480"
+		#Modes		"640x480"
 	EndSubSection
 	SubSection "Display"
 		Viewport	0 0
 		Depth		16
-		Modes		"640x480"
+		#Modes		"640x480"
 	EndSubSection
 	SubSection "Display"
 		Viewport	0 0
 		Depth		24
-		Modes		"640x480"
+		#Modes		"640x480"
 	EndSubSection
 EndSection
 

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-01-25 20:27:27 UTC (rev 17518)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-01-25 20:34:10 UTC (rev 17519)
@@ -10,10 +10,10 @@
 XORG_APPS:=xlsfonts/xlsfonts xmodmap/xmodmap xinit/startx \
 	xauth/xauth xinit/xinit xsetroot/xsetroot xset/xset \
 	mkfontscale/mkfontscale mkfontdir/mkfontdir \
-	#xterm/xterm
+	setxkbmap/setxkbmap #xterm/xterm
 
 XORG_LIBS:= Xft Xrender Xaw Xmu Xt Xcursor Xrandr Xi Xinerama Xfixes \
-	SM ICE Xpm Xp Xext X11 Xmuu Xxf86misc fontenc
+	SM ICE Xpm Xp Xext X11 Xmuu Xxf86misc fontenc xkbfile
 
 
 #############################################################
@@ -37,7 +37,7 @@
 XORG_HOST_DEF:=$(XORG_DIR)/config/cf/host.def
 
 
-DEJAVU_VERSION=2.13
+DEJAVU_VERSION=2.14
 DEJAVU_SOURCE=dejavu-ttf-$(DEJAVU_VERSION).tar.bz2
 DEJAVU_CAT:=$(BZCAT)
 DEJAVU_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/dejavu
@@ -140,9 +140,22 @@
 	cp -LRf $(XORG_DIR)/fonts/bdf/misc/cursor.bdf $(XORG_LIBX)/X11/fonts/misc/
 	cp -f package/xorg/fonts.alias $(XORG_LIBX)/X11/fonts/misc/
 	( cd $(XORG_LIBX)/X11/fonts/misc/; mkfontdir )
+	rm -rf $(XORG_LIBX)/X11/fonts/100dpi
+	rm -rf $(XORG_LIBX)/X11/fonts/75dpi
+	rm -rf $(XORG_LIBX)/X11/fonts/cyrillic
+	rm -rf $(XORG_LIBX)/X11/fonts/local
 	(cd $(TARGET_DIR)/usr/bin; ln -snf $(TARGET_BINX) X11)
+	cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/xkb $(XORG_LIBX)/X11/
+	mv $(XORG_LIBX)/X11/xkb/xkbcomp $(XORG_BINX)/
+	(cd $(XORG_LIBX)/X11/xkb; ln -s ../../../bin/xkbcomp)
+	rm -rf $(XORG_LIBX)/X11/xkb/compiled
+	(cd $(XORG_LIBX)/X11/xkb; ln -s /tmp compiled)
+	cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/icons $(XORG_LIBX)/X11/
+	-cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/locale $(XORG_LIBX)/X11/
+	cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/rgb.txt $(XORG_LIBX)/X11/
+	cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/XKeysymDB $(XORG_LIBX)/X11/
+	cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/XErrorDB $(XORG_LIBX)/X11/
 	mkdir -p $(TARGET_DIR)/etc/X11/
-	cp -LRf $(STAGING_DIR)$(TARGET_LIBX)/X11/rgb* $(XORG_LIBX)/X11/
 	$(SED) "s,^sysclientrc=.*,sysclientrc=/etc/X11/Xsession,g" $(XORG_BINX)/startx
 	$(SED) "s,^sysserverrc=.*,sysserverrc=/etc/X11/Xserver,g" $(XORG_BINX)/startx
 	cp -LRf package/xorg/xorg.conf $(TARGET_DIR)/etc/X11/
@@ -159,8 +172,8 @@
 
 $(XORG_LIBX)/X11/fonts/ttf-dejavu/DejaVuSansMono.ttf: $(DEJAVU_DIR)/.unpacked
 	mkdir -p $(XORG_LIBX)/X11/fonts/ttf-dejavu
-	rm $(DEJAVU_DIR)/*Condensed*.ttf
-	rm $(DEJAVU_DIR)/*ExtraLight*.ttf
+	rm -f $(DEJAVU_DIR)/*Condensed*.ttf
+	rm -f $(DEJAVU_DIR)/*ExtraLight*.ttf
 	cp -LRf $(DEJAVU_DIR)/DejaVu*-Bold.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
 	cp -LRf $(DEJAVU_DIR)/DejaVu*-BoldOblique.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
 	cp -LRf $(DEJAVU_DIR)/DejaVu*-Oblique.ttf $(XORG_LIBX)/X11/fonts/ttf-dejavu/
