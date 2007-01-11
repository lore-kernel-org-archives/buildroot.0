From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 22:17:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20070111061705.CE89B4857B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 22:17:04 -0800 (Wed, 10 Jan 2007)
New Revision: 17238

Log:
more updates to ensure subsequent packages build


Modified:
   trunk/buildroot/package/xorg/Config.in
   trunk/buildroot/package/xorg/xorg-config.patch
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/Config.in
===================================================================
--- trunk/buildroot/package/xorg/Config.in	2007-01-10 23:57:40 UTC (rev 17237)
+++ trunk/buildroot/package/xorg/Config.in	2007-01-11 06:17:04 UTC (rev 17238)
@@ -5,6 +5,7 @@
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_PKGCONFIG
 	help
 	  The official X Window system and server.

Modified: trunk/buildroot/package/xorg/xorg-config.patch
===================================================================
--- trunk/buildroot/package/xorg/xorg-config.patch	2007-01-10 23:57:40 UTC (rev 17237)
+++ trunk/buildroot/package/xorg/xorg-config.patch	2007-01-11 06:17:04 UTC (rev 17238)
@@ -1,6 +1,6 @@
 --- xc/config/cf/host.def~	Thu May 12 15:28:01 MDT 2005
 +++ xc/config/cf/host.def	Thu May 12 15:28:01 MDT 2005
-@@ -0,0 +1,43 @@
+@@ -0,0 +1,44 @@
 +#define KDriveXServer		YES
 +#define TinyXServer		YES
 +#define XfbdevServer		YES
@@ -12,13 +12,14 @@
 +#define Freetype2Dir		REPLACE_STAGING_DIR
 +#define HasFontconfig		NO
 +#define HasLibpng		YES
-+#define HasZlib			YES
++#define HasZlib		YES
 +#define HaveLib64		NO
 +#define LibDirName		lib
 +#define SystemUsrLibDir	/usr/lib
 +#define TkLibDir		/usr/lib
 +
-+#define HasExpat		NO
++#define HasExpat		YES
++#define ExpatDir		REPLACE_STAGING_DIR
 +#define XprtServer		NO
 +#define BuildXprintClients	NO
 +#define TouchScreen		NO

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2007-01-10 23:57:40 UTC (rev 17237)
+++ trunk/buildroot/package/xorg/xorg.mk	2007-01-11 06:17:04 UTC (rev 17238)
@@ -12,7 +12,7 @@
 	mkfontscale/mkfontscale mkfontdir/mkfontdir \
 	#xterm/xterm
 
-XORG_LIBS:= Xft fontconfig expat Xrender Xaw Xmu Xt \
+XORG_LIBS:= Xft fontconfig Xrender Xaw Xmu Xt \
 	SM ICE Xpm Xp Xext X11 Xmuu Xxf86misc
 
 
@@ -97,9 +97,8 @@
 	touch -c $(XORG_XSERVER)
 
 $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2: $(XORG_XSERVER)
-	-mkdir -p $(STAGING_DIR)$(TARGET_LIBX)
-	rm -f $(STAGING_DIR)$(TARGET_LIBX)/pkgconfig
-	ln -fs ../../../lib/pkgconfig $(STAGING_DIR)$(TARGET_LIBX)/pkgconfig
+	-mkdir -p $(STAGING_DIR)/usr/X11R6
+	ln -fs ../../lib $(STAGING_DIR)$(TARGET_LIBX)
 	( cd $(XORG_DIR); $(MAKE) \
 		DESTDIR=$(STAGING_DIR) install XCURSORGEN=xcursorgen MKFONTSCALE=mkfontscale )
 	$(SED) 's,/usr/X11R6,$(STAGING_DIR)/usr/X11R6,' $(STAGING_DIR)/usr/X11R6/lib/pkgconfig/*.pc
@@ -144,7 +143,8 @@
 	touch -c $(XORG_LIBX)/libX11.so.6.2
 
 
-xorg: zlib png pkgconfig freetype $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2 $(XORG_LIBX)/libX11.so.6.2
+xorg: zlib png pkgconfig expat freetype \
+	$(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2 $(XORG_LIBX)/libX11.so.6.2
 
 xorg-source: $(DL_DIR)/$(XORG_SOURCE)
 
