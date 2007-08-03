From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri,  3 Aug 2007 08:14:38 +0200
Subject: [Buildroot] [PATCH 1/1] qtopia4: Add more image support options,
	cleanup makefile and comments
Message-ID: <1186121678769-git-send-email-hcegtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds options for the image support available in Qtopia, more
specific GIF and MNG. It also will depend on libpng if the user has selected to
compile that library.

This patch also tries to clean up the configure and installing of Qtopia, both
the library for staging_dir and the library for the target. I have tested this
on AVR32 and it compiles successfull and I can also compile other Qt
applications using this setup.

A test on other platforms would have been nice.

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
---
 package/qtopia4/Config.in  |   66 ++++++++++++--------
 package/qtopia4/qtopia4.mk |  149 +++++++++++++++++++++++++++++--------------
 2 files changed, 140 insertions(+), 75 deletions(-)

diff --git a/package/qtopia4/Config.in b/package/qtopia4/Config.in
index 912f8da..e1cfc33 100644
--- a/package/qtopia4/Config.in
+++ b/package/qtopia4/Config.in
@@ -11,10 +11,10 @@ config BR2_PACKAGE_QTOPIA4
 	  http://www.trolltech.com/
 
 config BR2_PACKAGE_QTOPIA4_DEBUG
-        bool "Compile with debug support"
-        default y
+	bool "Compile with debug support"
+	default y
 	depends BR2_PACKAGE_QTOPIA4
-        help
+	help
 
 choice
 	prompt "Qtopia 4 Core license type"
@@ -28,7 +28,7 @@ choice
 
 	config BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMERCIAL
 		bool "Comercial license"
-endchoice
+	endchoice
 
 config BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED
 	bool "Approve Qtopia Core 4 GPL licence"
@@ -42,43 +42,57 @@ config BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED
 
 	  For full GPL version 2 see http://www.gnu.org/licenses/gpl.txt
 
-
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME
-        string "Qtopia Core 4 Commercial License Username"
-        default ""
+	string "Qtopia Core 4 Commercial License Username"
+	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMERCIAL
-        help
-            Commercial users can download their source directly by providing a username.
+	help
+	  Commercial users can download their source directly by providing a username.
 
 
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
-        string "Qtopia Core 4 Commercial License Password"
-        default ""
+	string "Qtopia Core 4 Commercial License Password"
+	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMERCIAL
-        help
-            Commercial users can download their source directly by providing a password.
+	help
+	  Commercial users can download their source directly by providing a password.
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
-        bool "Compatibility with Qt3"
-        default y
+	bool "Compatibility with Qt3"
+	default y
 	depends BR2_PACKAGE_QTOPIA4
-        help
-	    Turns on support for older Qt3.
+	help
+	  Turns on support for older Qt3.
 
 config BR2_PACKAGE_QTOPIA4_DEPTHS
-        string "color depths to support"
-        default "-depths 8"
+	string "color depths to support"
+	default "-depths 8"
 	depends BR2_PACKAGE_QTOPIA4
-        help
-	    Which color depths to support for the library. Default is "-depths
-	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
+	help
+	  Which color depths to support for the library. Default is "-depths
+	  8". Is specified by a comma separated list, i.e. -depths 24,16,8.
+
+config BR2_PACKAGE_QTOPIA4_GIF
+	bool "Enable GIF support"
+	default n
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  This compiles and installs the plugin for GIF reading support.
+
+config BR2_PACKAGE_QTOPIA4_LIBMNG
+	bool "Enable libmng support"
+	default n
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  This compiles and installs the plugin for MNG support.
 
 config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
-        string "The embedded platform we are making Qtopia4 for"
+	string "The embedded platform we are making Qtopia4 for"
 	default "arm"	if BR2_arm
 	default "arm"	if BR2_armeb
+	default "avr32" if BR2_avr32
 	default "x86"	if BR2_i386
-	default "x86_64"	if BR2_x86_64
+	default "x86_64" if BR2_x86_64
 	default "mips"	if BR2_mips
 	default "mips"	if BR2_mipsel
 # Not that I really believe these will work..
@@ -91,5 +105,5 @@ config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
 	default "generic"	if BR2_sh64
 	default "generic"	if BR2_sparc
 	depends BR2_PACKAGE_QTOPIA4
-        help
-	    The platform.
+	help
+	  The platform.
diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index ea2499e..a924e5e 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -63,28 +63,41 @@ QTOPIA4_LARGEFILE=-largefile
 else
 QTOPIA4_LARGEFILE=-no-largefile
 endif
+
 ifeq ($(BR2_PACKAGE_QTOPIA4_QT3SUPPORT),y)
 QTOPIA4_QT3SUPPORT=-qt3support
 else
 QTOPIA4_QT3SUPPORT=-no-qt3support
 endif
+
+QTOPIA4_DEP_LIBS:=
+ifeq ($(BR2_PACKAGE_JPEG),y)
+QTOPIA4_DEP_LIBS+=jpeg
+endif
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+QTOPIA4_DEP_LIBS+=libpng
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 QTOPIA4_TSLIB=-qt-mouse-tslib
-QTOPIA4_TSLIB_DEP=tslib
+QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
 QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
 #"))
 endif
+
 ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
 QTOPIA4_DEBUG="-debug $(QTOPIA4_TSLIB_DEB)"
 else
 QTOPIA4_DEBUG=-release
 endif
+
 ifeq ($(BR2_ENDIAN),"LITTLE")
 QTOPIA4_ENDIAN=-little-endian
 else
 QTOPIA4_ENDIAN=-big-endian
 endif
+
 ifeq ($(BR2_PACKAGE_QTOPIA4_DEPTHS),"")
 QTOPIA4_DEPTHS=-depths 8
 else
@@ -92,21 +105,43 @@ QTOPIA4_DEPTHS:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_DEPTHS)))
 #"))
 endif
 
+ifeq ($(BR2_PACKAGE_QTOPIA4_GIF),y)
+QTOPIA4_GIF_LIB=-qt-gif
+else
+QTOPIA4_GIF_LIB=-no-gif
+endif
+
+ifeq ($(BR2_PACKAGE_QTOPIA4_LIBMNG),y)
+QTOPIA4_MNG_LIB=-qt-libmng
+else
+QTOPIA4_MNG_LIB=-no-libmng
+endif
+
 QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
 #"))
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
 #"))
 
 
-# This is for staging.
-QTOPIA4_STAGING_DIR:=$(STAGING_DIR)/usr/Trolltech
-QTOPIA4_QMAKE=$(QTOPIA4_STAGING_DIR)/bin/qmake
+# Variable for other Qt applications to use
+QTOPIA4_QMAKE:=$(QTOPIA4_HOST_DIR)/bin/qmake
 
 $(DL_DIR)/$(QTOPIA4_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
 
 qtopia4-source: $(DL_DIR)/$(QTOPIA4_SOURCE)
 
+##############################################################################
+#
+# And now for the fun part, we have to do this in a two stage build because
+# Qt saves the library path inside the binary libraries. I.e.
+# libQtCore.so.<version> contains a hardcoded link to where the Qt libraries
+# are installed. Therefor we have to do one build for host/staging where
+# prefix is in our staging_dir, and a second build with prefix /usr for the
+# target.
+#
+##############################################################################
+
 #################################
 #
 # Target
@@ -117,19 +152,19 @@ $(QTOPIA4_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
 	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(QTOPIA4_TARGET_DIR) package/qtopia4/ \
 		qtopia-$(QTOPIA4_VERSION)-\*.patch\*
-	touch $(QTOPIA4_TARGET_DIR)/.unpacked
+	touch $@
 
-# This configure is very tailored towards my needs.
+# This configure is very tailored towards a specific need.
 $(QTOPIA4_TARGET_DIR)/.configured: $(QTOPIA4_TARGET_DIR)/.unpacked
-	# Patching configure to get rid of some feature I dont want.
-	# (I don't want SQL either but there is no option for that at all.
-	# the SQL library will be built even without the plugins/drivers.
+	# Patching configure to get rid of some features I don't want.
+	# (I don't want SQL either but there is no option for that at all,
+	# the SQL library will be built even without the plugins/drivers).
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
 endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
-	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
@@ -150,8 +185,8 @@ endif
 		-no-nis \
 		-no-freetype \
 		-no-accessibility \
-		-no-libmng \
-		-no-gif \
+		$(QTOPIA4_MNG_LIB) \
+		$(QTOPIA4_GIF_LIB) \
 		-no-sql-db2 \
 		-no-sql-ibase \
 		-no-sql-mysql \
@@ -162,38 +197,45 @@ endif
 		-no-sql-sqlite2 \
 		-no-sql-tds \
 		-prefix /usr \
-		-prefix-install \
+		-docdir /usr/share/qt4/doc \
+		-headerdir /usr/include/qt4 \
+		-datadir /usr/share/qt4 \
+		-plugindir /usr/lib/qt4/plugins \
+		-translationdir /usr/share/qt4/translations \
+		-sysconfdir /etc/qt4 \
+		-examplesdir /usr/share/qt4/examples \
+		-demosdir /usr/share/qt4/demos \
+		-fast \
+		-no-rpath \
 		$(QTOPIA4_QT3SUPPORT) \
 		$(QTOPIA4_TSLIB) \
 		$(QTOPIA4_LARGEFILE) \
 		$(QTOPIA4_ENDIAN) \
 		$(QTOPIA4_APPROVE_GPL_LICENSE) \
 	);
-	touch $(QTOPIA4_TARGET_DIR)/.configured
+	touch $@
 
 $(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION): $(QTOPIA4_TARGET_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		-C $(QTOPIA4_TARGET_DIR) sub-src
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR) sub-src
 
-$(STAGING_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION): $(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		INSTALL_ROOT=$(STAGING_DIR) \
-		-C $(QTOPIA4_TARGET_DIR) \
-		sub-src-install_subtargets-ordered \
-		install_qmake install_mkspecs
-
-$(TARGET_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION): $(STAGING_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION)
+$(TARGET_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION): $(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION)
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
-	cp -a $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -a $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -a $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -a $(STAGING_DIR)/usr/lib/*.so.* $(TARGET_DIR)/usr/lib/
-	# We don't need no stinking Sql libraries:
-	-rm $(TARGET_DIR)/usr/lib/*Sql*
-	# Nor Svg
-	-rm $(TARGET_DIR)/usr/lib/*Svg*
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/*.so.$(QTOPIA4_VERSION)
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
+	# Install image plugins if they are built
+	if [ -d $(QTOPIA4_TARGET_DIR)/plugins/imageformats ]; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/qt4/plugins; \
+		cp -dpfr $(QTOPIA4_TARGET_DIR)/plugins/imageformats $(TARGET_DIR)/usr/lib/qt4/plugins; \
+		$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/qt4/plugins/imageformats/*; \
+	fi
+	# Remove Sql libraries, not needed
+	-rm $(TARGET_DIR)/usr/lib/libQtSql*
+	# Remove Svg libraries, not needed
+	-rm $(TARGET_DIR)/usr/lib/libQtSvg*
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.$(QTOPIA4_VERSION)
 
 #################################
 #
@@ -205,19 +247,19 @@ $(QTOPIA4_HOST_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
 	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(QTOPIA4_HOST_DIR) package/qtopia4/ \
 		qtopia-$(QTOPIA4_VERSION)-\*.patch\*
-	touch $(QTOPIA4_HOST_DIR)/.unpacked
+	touch $@
 
-# This configure is very tailored towards my needs.
+# This configure is very tailored towards a specific need.
 $(QTOPIA4_HOST_DIR)/.configured: $(QTOPIA4_HOST_DIR)/.unpacked
 	# Patching configure to get rid of some feature I dont want.
-	# (I don't want SQL either but there is no option for that at all.
-	# the SQL library will be built even without the plugins/drivers.
+	# (I don't want SQL either but there is no option for that at all,
+	# the SQL library will be built even without the plugins/drivers).
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_HOST_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_HOST_DIR)/configure
 endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_HOST_DIR)/configure
-	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_HOST_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_HOST_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_HOST_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_HOST_DIR); rm -rf config.cache; \
@@ -237,7 +279,9 @@ endif
 		-no-cups \
 		-no-nis \
 		-no-freetype \
-		-no-libmng \
+		-no-accessibility \
+		$(QTOPIA4_MNG_LIB) \
+		$(QTOPIA4_GIF_LIB) \
 		-no-sql-db2 \
 		-no-sql-ibase \
 		-no-sql-mysql \
@@ -247,26 +291,33 @@ endif
 		-no-sql-sqlite \
 		-no-sql-sqlite2 \
 		-no-sql-tds \
-		-prefix $(QTOPIA4_STAGING_DIR) \
-		-prefix-install \
+		-prefix $(STAGING_DIR)/usr \
+		-docdir $(STAGING_DIR)/usr/share/qt4/doc \
+		-headerdir $(STAGING_DIR)/usr/include/qt4 \
+		-datadir $(STAGING_DIR)/usr/share/qt4 \
+		-plugindir $(STAGING_DIR)/usr/lib/qt4/plugins \
+		-translationdir $(STAGING_DIR)/usr/share/qt4/translations \
+		-sysconfdir $(STAGING_DIR)/etc/qt4 \
+		-examplesdir $(STAGING_DIR)/usr/share/qt4/examples \
+		-demosdir $(STAGING_DIR)/usr/share/qt4/demos \
+		-fast \
+		-no-rpath \
 		$(QTOPIA4_QT3SUPPORT) \
 		$(QTOPIA4_TSLIB) \
 		$(QTOPIA4_LARGEFILE) \
 		$(QTOPIA4_ENDIAN) \
 		$(QTOPIA4_APPROVE_GPL_LICENSE) \
 	);
-	touch $(QTOPIA4_HOST_DIR)/.configured
+	touch $@
 
 $(QTOPIA4_HOST_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION): $(QTOPIA4_HOST_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		-C $(QTOPIA4_HOST_DIR)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_HOST_DIR)
 
-$(QTOPIA4_STAGING_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION): $(QTOPIA4_HOST_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		-C $(QTOPIA4_HOST_DIR) install
+$(STAGING_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION): $(QTOPIA4_HOST_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_HOST_DIR) install
 
-qtopia4: uclibc zlib $(QTOPIA4_TSLIB_DEP) \
-		$(QTOPIA4_STAGING_DIR)/lib/libQtCore.so.$(QTOPIA4_VERSION) \
+qtopia4: uclibc zlib $(QTOPIA4_DEP_LIBS) \
+		$(STAGING_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION) \
 		$(TARGET_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VERSION)
 
 qtopia4-clean:
-- 
1.5.2.3
