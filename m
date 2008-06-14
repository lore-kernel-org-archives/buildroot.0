From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Jun 2008 14:01:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dbus dbus-glib
	editors/vim expat freetyp etc...
Message-ID: <20080614210117.A21FF3C8CD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-14 14:01:16 -0700 (Sat, 14 Jun 2008)
New Revision: 22342

Log:
packages: fix pkgconfig depencies and select pkgconfig where needed



Modified:
   trunk/buildroot/package/dbus-glib/Config.in
   trunk/buildroot/package/dbus/Config.in
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/editors/vim/Config.in
   trunk/buildroot/package/editors/vim/vim.mk
   trunk/buildroot/package/expat/Config.in
   trunk/buildroot/package/freetype/Config.in
   trunk/buildroot/package/gettext/Config.in
   trunk/buildroot/package/gqview/Config.in
   trunk/buildroot/package/gqview/gqview.mk
   trunk/buildroot/package/hal/Config.in
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/java/classpath/Config.in
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/java/jamvm/Config.in
   trunk/buildroot/package/java/jamvm/jamvm.mk
   trunk/buildroot/package/libdaemon/Config.in
   trunk/buildroot/package/libdrm/Config.in
   trunk/buildroot/package/libgtk2/Config.in
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libogg/Config.in
   trunk/buildroot/package/libpng/Config.in
   trunk/buildroot/package/libusb/Config.in
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/libvorbis/Config.in
   trunk/buildroot/package/matchbox/Config.in
   trunk/buildroot/package/matchbox/matchbox.mk
   trunk/buildroot/package/midori/Config.in
   trunk/buildroot/package/midori/midori.mk
   trunk/buildroot/package/ntfs-3g/Config.in
   trunk/buildroot/package/pcmanfm/Config.in
   trunk/buildroot/package/pcmanfm/pcmanfm.mk
   trunk/buildroot/package/sylpheed/Config.in
   trunk/buildroot/package/sylpheed/sylpheed.mk


Changeset:
Modified: trunk/buildroot/package/dbus/Config.in
===================================================================
--- trunk/buildroot/package/dbus/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/dbus/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -2,6 +2,7 @@
 	bool "dbus"
 	default n
 	depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  The D-Bus message bus system.
 

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/dbus/dbus.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -83,7 +83,7 @@
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
 
-dbus: uclibc $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
+dbus: uclibc pkgconfig $(DBUS_XML_DEP) $(TARGET_DIR)/$(DBUS_TARGET_BINARY)
 
 dbus-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/session.conf

Modified: trunk/buildroot/package/dbus-glib/Config.in
===================================================================
--- trunk/buildroot/package/dbus-glib/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/dbus-glib/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -3,6 +3,7 @@
 	default n
 	depends on BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  GLib bindings for D-Bus.
 

Modified: trunk/buildroot/package/editors/vim/Config.in
===================================================================
--- trunk/buildroot/package/editors/vim/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/editors/vim/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -2,6 +2,7 @@
 	bool "vim"
 	default n
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  VIM Text editor
 

Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/editors/vim/vim.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -86,7 +86,7 @@
 	)
 endif
 
-vim: ncurses vim-source $(TARGET_DIR)/usr/bin/vim
+vim: uclibc pkgconfig ncurses vim-source $(TARGET_DIR)/usr/bin/vim
 
 #############################################################
 #

Modified: trunk/buildroot/package/expat/Config.in
===================================================================
--- trunk/buildroot/package/expat/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/expat/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -3,6 +3,7 @@
 config BR2_PACKAGE_EXPAT
 	bool"expat"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  The Expat XML Parser.
 

Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/freetype/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FREETYPE
 	bool "freetype"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	a free, high-quality and portable font engine.
 

Modified: trunk/buildroot/package/gettext/Config.in
===================================================================
--- trunk/buildroot/package/gettext/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/gettext/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GETTEXT
 	bool "gettext"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual

Modified: trunk/buildroot/package/gqview/Config.in
===================================================================
--- trunk/buildroot/package/gqview/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/gqview/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GQVIEW
 	bool "gqview"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  GQview is an image viewer for Unix operating systems (developed on Linux).
 

Modified: trunk/buildroot/package/gqview/gqview.mk
===================================================================
--- trunk/buildroot/package/gqview/gqview.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/gqview/gqview.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -12,7 +12,7 @@
 
 GQVIEW_CONF_OPT = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 
-GQVIEW_DEPENDENCIES = uclibc libgtk2
+GQVIEW_DEPENDENCIES = uclibc pkgconfig libgtk2
 
 $(eval $(call AUTOTARGETS,package,gqview))
 

Modified: trunk/buildroot/package/hal/Config.in
===================================================================
--- trunk/buildroot/package/hal/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/hal/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -5,5 +5,6 @@
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_UDEV_VOLUME_ID
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  The Hardware Abstraction Layer (HAL) suite.

Modified: trunk/buildroot/package/hal/hal.mk
===================================================================
--- trunk/buildroot/package/hal/hal.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/hal/hal.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -89,7 +89,7 @@
 	done
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libhal*
 
-hal: uclibc dbus-glib hwdata udev-volume_id $(TARGET_DIR)/$(HAL_TARGET_BINARY)
+hal: uclibc pkgconfig dbus-glib hwdata udev-volume_id $(TARGET_DIR)/$(HAL_TARGET_BINARY)
 
 hal-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf

Modified: trunk/buildroot/package/java/classpath/Config.in
===================================================================
--- trunk/buildroot/package/java/classpath/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/java/classpath/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
+	select BR2_PACKAGE_PKGCONFIG
 	default n
 
 	help

Modified: trunk/buildroot/package/java/classpath/classpath.mk
===================================================================
--- trunk/buildroot/package/java/classpath/classpath.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/java/classpath/classpath.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -58,7 +58,7 @@
 		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		--disable-gconf-peer --disable-examples --disable-plugin
 
-CLASSPATH_DEPENDENCIES = uclibc png jpeg tiff
+CLASSPATH_DEPENDENCIES = uclibc pkgconfig png jpeg tiff
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 	CLASSPATH_DEPENDENCIES+= alsa-lib

Modified: trunk/buildroot/package/java/jamvm/Config.in
===================================================================
--- trunk/buildroot/package/java/jamvm/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/java/jamvm/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -2,7 +2,7 @@
 	bool "jamvm"
 	default n
         depends on BR2_PACKAGE_CLASSPATH
-
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  JamVM is a new Java Virtual Machine which conforms to 
 	  the JVM specification version 2 (blue book). 

Modified: trunk/buildroot/package/java/jamvm/jamvm.mk
===================================================================
--- trunk/buildroot/package/java/jamvm/jamvm.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/java/jamvm/jamvm.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -57,7 +57,7 @@
 		--with-classpath-install-dir=/usr \
 
 
-JAMVM_DEPENDENCIES = uclibc classpath
+JAMVM_DEPENDENCIES = uclibc pkgconfig classpath
 
 #Include X libraries when we have an X server
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)

Modified: trunk/buildroot/package/libdaemon/Config.in
===================================================================
--- trunk/buildroot/package/libdaemon/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libdaemon/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBDAEMON
 	bool "libdaemon"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  libdaemon is a lightweight C library that eases the 
 	  writing of UNIX daemons.

Modified: trunk/buildroot/package/libdrm/Config.in
===================================================================
--- trunk/buildroot/package/libdrm/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libdrm/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Direct Rendering Manager
-	
+
 	  http://dri.freedesktop.org/libdrm/

Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libgtk2/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBGTK2
 	bool "libgtk2"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_CAIRO

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -74,6 +74,6 @@
 	LIBGTK2_CONF_OPT += --without-x
 endif
 
-LIBGTK2_DEPENDENCIES = uclibc png jpeg tiff $(LIBGTK2_DEPENDENCIES_EXTRA) libglib2 cups cairo pango atk 
+LIBGTK2_DEPENDENCIES = uclibc pkgconfig png jpeg tiff $(LIBGTK2_DEPENDENCIES_EXTRA) libglib2 cups cairo pango atk
 
 $(eval $(call AUTOTARGETS,package,libgtk2))

Modified: trunk/buildroot/package/libogg/Config.in
===================================================================
--- trunk/buildroot/package/libogg/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libogg/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBOGG
 	bool "libogg"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Ogg is the name of Xiph.org's container format for audio, video, and metadata
 

Modified: trunk/buildroot/package/libpng/Config.in
===================================================================
--- trunk/buildroot/package/libpng/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libpng/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -2,6 +2,7 @@
 	bool "libpng"
 	default n
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Library for handling PNG (Portable Network Graphics)
 	  images.

Modified: trunk/buildroot/package/libusb/Config.in
===================================================================
--- trunk/buildroot/package/libusb/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libusb/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUSB
 	bool "libusb"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Userspace library for accessing USB devices
 

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -59,7 +59,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
 
-libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
+libusb: uclibc pkgconfig $(TARGET_DIR)/$(LIBUSB_BINARY)
 
 libusb-clean:
 	rm -f $(STAGING_DIR)/bin/libusb-config

Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/libvorbis/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -2,6 +2,7 @@
 	bool "libvorbis"
 	default n
 	depends on BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Library for the Vorbis open source audio decoder
 	  Ogg Vorbis is a fully open, non-proprietary, patent-and-royalty-free,

Modified: trunk/buildroot/package/matchbox/Config.in
===================================================================
--- trunk/buildroot/package/matchbox/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/matchbox/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -2,6 +2,7 @@
 	bool "MatchBox Window Manager"
 	default n
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR

Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -618,7 +618,7 @@
 	cp -af $(STAGING_DIR)/usr/share/matchbox/matchbox-keyboard $(TARGET_DIR)/usr/share/matchbox/
 	cp -dpf ./package/matchbox/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
 
-matchbox: uclibc expat $(MATCHBOX_WM_DEPS) $(MATCHBOX_SNOTIFY_DEPS) $(MATCHBOX_LIB_DEPS) $(TARGET_DIR)/usr/lib/libmb.so $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
+matchbox: uclibc pkgconfig expat $(MATCHBOX_WM_DEPS) $(MATCHBOX_SNOTIFY_DEPS) $(MATCHBOX_LIB_DEPS) $(TARGET_DIR)/usr/lib/libmb.so $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
 
 matchbox-panel: uclibc matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN) $(TARGET_DIR)/usr/bin/matchbox-session $(MATCHBOX_PANEL_DEPS)
 

Modified: trunk/buildroot/package/midori/Config.in
===================================================================
--- trunk/buildroot/package/midori/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/midori/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -2,6 +2,7 @@
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
+	select BR2_PACKAGE_PKGCONFIG
 	default n
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
 	help

Modified: trunk/buildroot/package/midori/midori.mk
===================================================================
--- trunk/buildroot/package/midori/midori.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/midori/midori.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -13,9 +13,9 @@
 
 MIDORI_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME)  --prefix=/usr --sysconfdir=/etc \
-		PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig 
+		PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 
 
-MIDORI_DEPENDENCIES = uclibc webkit libsexy $(XSERVER) 
+MIDORI_DEPENDENCIES = uclibc pkgconfig webkit libsexy $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,midori))

Modified: trunk/buildroot/package/ntfs-3g/Config.in
===================================================================
--- trunk/buildroot/package/ntfs-3g/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/ntfs-3g/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NTFS-3G
         bool "ntfs-3g"
         default n
+	select BR2_PACKAGE_PKGCONFIG
         help
 	  The NTFS-3G driver is an open source, freely available read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD, and Haiku. It provides safe and fast handling of the Windows XP, Windows Server 2003, Windows 2000 and Windows Vista file systems. Most POSIX file system operations are supported, with the exception of full file ownership and access right support.
 

Modified: trunk/buildroot/package/pcmanfm/Config.in
===================================================================
--- trunk/buildroot/package/pcmanfm/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/pcmanfm/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
+	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	select BR2_PACKAGE_LIBGTK2

Modified: trunk/buildroot/package/pcmanfm/pcmanfm.mk
===================================================================
--- trunk/buildroot/package/pcmanfm/pcmanfm.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/pcmanfm/pcmanfm.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -13,7 +13,7 @@
 PCMANFM_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 PCMANFM_CONF_OPT = --disable-hal
 
-PCMANFM_DEPENDENCIES = uclibc libgtk2 gamin startup-notification
+PCMANFM_DEPENDENCIES = uclibc pkgconfig libgtk2 gamin startup-notification
 
 $(eval $(call AUTOTARGETS,package,pcmanfm))
 

Modified: trunk/buildroot/package/sylpheed/Config.in
===================================================================
--- trunk/buildroot/package/sylpheed/Config.in	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/sylpheed/Config.in	2008-06-14 21:01:16 UTC (rev 22342)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYLPHEED
 	bool "sylpheed"
 	default n
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  lightweight and user-friendly e-mail client.
 

Modified: trunk/buildroot/package/sylpheed/sylpheed.mk
===================================================================
--- trunk/buildroot/package/sylpheed/sylpheed.mk	2008-06-14 21:01:07 UTC (rev 22341)
+++ trunk/buildroot/package/sylpheed/sylpheed.mk	2008-06-14 21:01:16 UTC (rev 22342)
@@ -14,7 +14,7 @@
 SYLPHEED_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
 
-SYLPHEED_DEPENDENCIES = uclibc 
+SYLPHEED_DEPENDENCIES = uclibc pkgconfig
 
 $(eval $(call AUTOTARGETS,package,sylpheed))
 
