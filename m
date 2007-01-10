From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 15:56:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20070110235631.3BE144858B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 15:56:30 -0800 (Wed, 10 Jan 2007)
New Revision: 17236

Log:
update xorg build and installation paths


Modified:
   trunk/buildroot/package/xorg/Config.in
   trunk/buildroot/package/xorg/xorg-config.patch
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/Config.in
===================================================================
--- trunk/buildroot/package/xorg/Config.in	2007-01-10 23:54:35 UTC (rev 17235)
+++ trunk/buildroot/package/xorg/Config.in	2007-01-10 23:56:30 UTC (rev 17236)
@@ -4,6 +4,8 @@
 	depends !BR2_PACKAGE_TINYX
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_PKGCONFIG
 	help
 	  The official X Window system and server.
 

Modified: trunk/buildroot/package/xorg/xorg-config.patch
===================================================================
--- trunk/buildroot/package/xorg/xorg-config.patch	2007-01-10 23:54:35 UTC (rev 17235)
+++ trunk/buildroot/package/xorg/xorg-config.patch	2007-01-10 23:56:30 UTC (rev 17236)
@@ -8,8 +8,8 @@
 +#define ProjectRoot		/usr/X11R6
 +#define NothingOutsideProjectRoot	YES
 +
-+#define HasFreetype2		REPLACE_HAS_FREETYPE2
-+#define Freetype2Dir		REPLACE_STAGING_DIR/usr
++#define HasFreetype2		YES
++#define Freetype2Dir		REPLACE_STAGING_DIR
 +#define HasFontconfig		NO
 +#define HasLibpng		YES
 +#define HasZlib			YES

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-01-10 23:54:35 UTC (rev 17235)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-01-10 23:56:30 UTC (rev 17236)
@@ -41,13 +41,6 @@
 XORG_XSERVER:=$(XORG_DIR)/programs/Xserver/$(XSERVER)
 TARGET_XSERVER:=$(XORG_BINX)/$(XSERVER)
 
-# Check if we should use FreeType2.
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-HAS_FREETYPE2=YES
-else
-HAS_FREETYPE2=NO
-endif
-
 # figure out Xorg's idea of corresponding architecture name
 ifeq ($(BR2_alpha),y)
 XARCH=Alpha
@@ -84,7 +77,6 @@
 	$(XORG_CAT) $(DL_DIR)/$(XORG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(XORG_DIR) package/xorg/ \*.patch
 	$(SED) 's:REPLACE_STAGING_DIR:$(STAGING_DIR):g' $(XORG_HOST_DEF)
-	$(SED) 's:REPLACE_HAS_FREETYPE2:$(HAS_FREETYPE2):g' $(XORG_HOST_DEF)
 	$(SED) 's:REPLACE_GCCINC_DIR:$(shell $(TARGET_CROSS)gcc -print-file-name=include):g' $(XORG_CF)
 	$(SED) 's:REPLACE_STAGING_DIR:$(STAGING_DIR):g' $(XORG_CF)
 	$(SED) 's:REPLACE_ARCH:$(ARCH):g' $(XORG_CF)
@@ -106,8 +98,11 @@
 
 $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2: $(XORG_XSERVER)
 	-mkdir -p $(STAGING_DIR)$(TARGET_LIBX)
+	rm -f $(STAGING_DIR)$(TARGET_LIBX)/pkgconfig
+	ln -fs ../../../lib/pkgconfig $(STAGING_DIR)$(TARGET_LIBX)/pkgconfig
 	( cd $(XORG_DIR); $(MAKE) \
 		DESTDIR=$(STAGING_DIR) install XCURSORGEN=xcursorgen MKFONTSCALE=mkfontscale )
+	$(SED) 's,/usr/X11R6,$(STAGING_DIR)/usr/X11R6,' $(STAGING_DIR)/usr/X11R6/lib/pkgconfig/*.pc
 	touch -c $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2
 
 $(TARGET_XSERVER): $(XORG_XSERVER)
@@ -149,7 +144,7 @@
 	touch -c $(XORG_LIBX)/libX11.so.6.2
 
 
-xorg: zlib png $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2 $(XORG_LIBX)/libX11.so.6.2
+xorg: zlib png pkgconfig freetype $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2 $(XORG_LIBX)/libX11.so.6.2
 
 xorg-source: $(DL_DIR)/$(XORG_SOURCE)
 
