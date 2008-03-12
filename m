From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 06:53:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080312135303.CCD1B120150@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 06:53:02 -0700 (Wed, 12 Mar 2008)
New Revision: 21315

Log:
Fix Qtopia Core 4 compile and installation and bump to version 4.4.0

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-03-12 13:11:29 UTC (rev 21314)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-03-12 13:53:02 UTC (rev 21315)
@@ -12,7 +12,6 @@
 	bool "Compile with debug support"
 	default n
 	depends BR2_PACKAGE_QTOPIA4
-	help
 
 choice
 	prompt "Library type"
@@ -60,7 +59,7 @@
 	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
-	    Commercial users can download their source directly by providing a username.
+	  Commercial users can download their source directly by providing a username.
 
 
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
@@ -68,23 +67,15 @@
 	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
-	    Commercial users can download their source directly by providing a password.
+	  Commercial users can download their source directly by providing a password.
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	default y
 	depends BR2_PACKAGE_QTOPIA4
 	help
-	    Turns on support for older Qt3.
+	  Turns on support for older Qt3.
 
-config BR2_PACKAGE_QTOPIA4_DEPTHS
-	string "color depths to support"
-	default "-depths 8"
-	depends BR2_PACKAGE_QTOPIA4
-	help
-	    Which color depths to support for the library. Default is "-depths
-	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
-
 config BR2_PACKAGE_QTOPIA4_GIF
 	bool "Enable GIF support"
 	default n
@@ -95,39 +86,80 @@
 config BR2_PACKAGE_QTOPIA4_LIBMNG
 	bool "Enable libmng support"
 	default n
-	select BR2_PACKAGE_LIBPNG
 	depends BR2_PACKAGE_QTOPIA4
 	help
 	  This compiles and installs the plugin for MNG support.
 
 choice
-	prompt "libjpeg support"
+	prompt "JPEG support"
 	depends BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_NOJPEG
 	help
 	  Select libjpeg support.
 
 config BR2_PACKAGE_QTOPIA4_NOJPEG
-	bool
-	prompt "No jpeg support"
-	help
-	  Disable JPEG support
+	bool "No jpeg support"
 
 config BR2_PACKAGE_QTOPIA4_SYSTEMJPEG
-	bool
+	bool "Use system libjpeg"
 	select BR2_PACKAGE_JPEG
-	prompt "use system libjpeg"
-	help
-	  Link against system libjpeg
 
 config BR2_PACKAGE_QTOPIA4_QTJPEG
-	bool
-	prompt "use qt libjpeg"
+	bool "Use Qt libjpeg"
+
+endchoice
+
+choice
+	prompt "PNG support"
+	depends BR2_PACKAGE_QTOPIA4
+	default BR2_PACKAGE_QTOPIA4_NOPNG
 	help
-	  Link against libjpeg proveded with Qt
+	  Select which library to use if PNG support should be enabled.
+
+config BR2_PACKAGE_QTOPIA4_NOPNG
+	bool "No PNG support"
+
+config BR2_PACKAGE_QTOPIA4_SYSTEMPNG
+	bool "Use system libpng"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_QTOPIA4_QTPNG
+	bool "Use Qt bundled libpng"
+
 endchoice
 
 choice
+	prompt "TIFF support"
+	depends BR2_PACKAGE_QTOPIA4
+	default BR2_PACKAGE_QTOPIA4_NOTIFF
+	help
+	  Select which library to use if TIFF support should be enabled.
+
+config BR2_PACKAGE_QTOPIA4_NOTIFF
+	bool "No TIFF support"
+
+config BR2_PACKAGE_QTOPIA4_SYSTEMTIFF
+	bool "Use system libtiff"
+	select BR2_PACKAGE_TIFF
+
+config BR2_PACKAGE_QTOPIA4_QTTIFF
+	bool "Use Qt bundled libtiff"
+
+endchoice
+
+config BR2_PACKAGE_QTOPIA4_SQL
+	bool "Enable SQL support"
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  Enable all the SQL drivers it QtSql library.
+
+config BR2_PACKAGE_QTOPIA4_OPENSSL
+	bool "Enable OpenSSL support"
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  Enable support for the OpenSSL encryption library.
+
+choice
 	prompt "zlib support"
 	depends BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_QTZLIB
@@ -146,7 +178,7 @@
 	prompt "Qt zlib"
 	help
 	  Use the zlib bundled with Qt.
-	
+
 config BR2_PACKAGE_QTOPIA4_SYSTEMZLIB
 	bool
 	select BR2_PACKAGE_ZLIB
@@ -154,7 +186,6 @@
 	help
 	  Use the shared zlib from the system.
 endchoice
-								    
 
 config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
 	string "The embedded platform we are making Qtopia4 for"
@@ -176,4 +207,4 @@
 	default "generic"	if BR2_sparc
 	depends BR2_PACKAGE_QTOPIA4
 	help
-	    The platform.
+	  The platform.

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-12 13:11:29 UTC (rev 21314)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-03-12 13:53:02 UTC (rev 21315)
@@ -13,10 +13,10 @@
 
 # BUG: In "OpenSuSE 10.2", dbus.h is at dbus-1.0/dbus/dbus.h
 # instead of at "dbus/dbus.h"
-# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus) 
+# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-QTOPIA4_VERSION:=4.3.2
+QTOPIA4_VERSION:=4.4.0-snapshot-20080312
 QTOPIA4_CAT:=$(ZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
@@ -26,28 +26,19 @@
 
 # What to download, free or commercial version.
 ifneq ($(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME),)
-
 QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
-QTOPIA4_SOURCE:=qtopia-core-commercial-src-$(QTOPIA4_VERSION).tar.gz
-QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qtopia-core-commercial-src-$(QTOPIA4_VERSION)
-QTOPIA4_HOST_DIR:=$(TOOL_BUILD_DIR)/qtopia-core-commercial-src-$(QTOPIA4_VERSION)
+QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.gz
+QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
 QTOPIA4_NO_SQL_OCI:=-no-sql-oci
 QTOPIA4_NO_SQL_TDS:=-no-sql-tds
 QTOPIA4_NO_SQL_DB2:=-no-sql-db2
-
-else
-
-# Good, good, we are free:
-
-QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source/
-QTOPIA4_SOURCE:=qtopia-core-opensource-src-$(QTOPIA4_VERSION).tar.gz
-QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qtopia-core-opensource-src-$(QTOPIA4_VERSION)
-QTOPIA4_HOST_DIR:=$(TOOL_BUILD_DIR)/qtopia-core-opensource-src-$(QTOPIA4_VERSION)
-
+else # Good, good, we are free:
+QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/snapshots
+QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.gz
+QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
 ifeq ($(BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED),y)
 QTOPIA4_APPROVE_GPL_LICENSE:=-confirm-license
 endif
-
 endif
 
 # If you want extra tweaking you can copy
@@ -74,16 +65,7 @@
 QTOPIA4_QT3SUPPORT=-no-qt3support
 endif
 
-QTOPIA4_DEP_LIBS:=
-ifeq ($(BR2_PACKAGE_JPEG),y)
-QTOPIA4_DEP_LIBS+=jpeg
-endif
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-QTOPIA4_DEP_LIBS+=libpng
-endif
-
 ifeq ($(BR2_PACKAGE_TSLIB),y)
-#BUG: Qtopia refuse to recognize -qt-mouse-tslib
 QTOPIA4_TSLIB=-qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
@@ -109,44 +91,85 @@
 QTOPIA4_ENDIAN=-big-endian
 endif
 
-ifeq ($(BR2_PACKAGE_QTOPIA4_DEPTHS),"")
-QTOPIA4_DEPTHS=-depths 8
-else
-QTOPIA4_DEPTHS:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_DEPTHS)))
-#"))
-endif
-
 ifeq ($(BR2_PACKAGE_QTOPIA4_GIF),y)
-QTOPIA4_GIF_LIB=-qt-gif
+QTOPIA4_GIF=-qt-gif
 else
-QTOPIA4_GIF_LIB=-no-gif
+QTOPIA4_GIF=-no-gif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_LIBMNG),y)
-QTOPIA4_MNG_LIB=-qt-libmng
+QTOPIA4_MNG=-qt-libmng
 else
-QTOPIA4_MNG_LIB=-no-libmng
+QTOPIA4_MNG=-no-libmng
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTZLIB),y)
 QTOPIA4_ZLIB=-qt-zlib
-endif
+else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMZLIB),y)
 QTOPIA4_ZLIB=-system-zlib
+QTOPIA4_DEP_LIBS+=zlib
 else
 QTOPIA4_ZLIB=-no-zlib
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTJPEG),y)
 QTOPIA4_JPEG=-qt-libjpeg
-endif
+else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMJPEG),y)
 QTOPIA4_JPEG=-system-libjpeg
+QTOPIA4_DEP_LIBS+=jpeg
 else
 QTOPIA4_JPEG=-no-libjpeg
 endif
+endif
 
+ifeq ($(BR2_PACKAGE_QTOPIA4_QTPNG),y)
+QTOPIA4_PNG=-qt-libpng
+else
+ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMPNG),y)
+QTOPIA4_PNG=-system-libpng
+QTOPIA4_DEP_LIBS+=libpng
+else
+QTOPIA4_PNG=-no-libpng
+endif
+endif
 
+ifeq ($(BR2_PACKAGE_QTOPIA4_QTTIFF),y)
+QTOPIA4_TIFF=-qt-libtiff
+else
+ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMTIFF),y)
+QTOPIA4_TIFF=-system-libtiff
+QTOPIA4_DEP_LIBS+=tiff
+else
+QTOPIA4_TIFF=-no-libtiff
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QTOPIA4_OPENSSL),y)
+QTOPIA4_OPENSSL=-openssl
+QTOPIA4_DEP_LIBS+=openssl
+else
+QTOPIA4_OPENSSL=-no-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
+QTOPIA4_SQL_IBASE=-qt-sql-ibase
+QTOPIA4_SQL_MYSQL=-qt-sql-mysql
+QTOPIA4_SQL_ODBC=-qt-sql-odbc
+QTOPIA4_SQL_PSQL=-qt-sql-psql
+QTOPIA4_SQL_SQLITE=-qt-sql-sqlite
+QTOPIA4_SQL_SQLITE2=-qt-sql-sqlite2
+else
+QTOPIA4_SQL_IBASE=-no-sql-ibase
+QTOPIA4_SQL_MYSQL=-no-sql-mysql
+QTOPIA4_SQL_ODBC=-no-sql-odbc
+QTOPIA4_SQL_PSQL=-no-sql-psql
+QTOPIA4_SQL_SQLITE=-no-sql-sqlite
+QTOPIA4_SQL_SQLITE2=-no-sql-sqlite2
+endif
+
 QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
 #"))
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
@@ -154,10 +177,10 @@
 
 
 # Variable for other Qt applications to use
-QTOPIA4_QMAKE:=$(QTOPIA4_TARGET_DIR)/bin/qmake
+QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake
 
 $(DL_DIR)/$(QTOPIA4_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
+	$(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
 
 qtopia4-source: $(DL_DIR)/$(QTOPIA4_SOURCE)
 
@@ -168,110 +191,91 @@
 		qtopia-$(QTOPIA4_VERSION)-\*.patch\*
 	touch $@
 
-# This configure is very tailored towards a specific need.
 $(QTOPIA4_TARGET_DIR)/.configured: $(QTOPIA4_TARGET_DIR)/.unpacked
-	# Patching configure to get rid of some features I don't want.
-	# (I don't want SQL either but there is no option for that at all,
-	# the SQL library will be built even without the plugins/drivers).
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
 endif
-
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	
-	# Fix compiler path
-	$(SED) '\,QMAKE_CC, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_CXX, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK_SHLIB, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_AR, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_RANLIB, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_STRIP, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
 		PATH=$(TARGET_PATH) \
-		QPEHOME=/usr \
-		QPEDIR=/usr \
 		./configure \
-		-v \
-		-platform linux-g++ \
+		-verbose \
 		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
-		-xplatform qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++ \
 		$(QTOPIA4_QCONFIG_COMMAND) \
 		$(QTOPIA4_DEBUG) \
 		$(QTOPIA4_SHARED) \
-		$(QTOPIA4_DEPTHS) \
 		-no-stl \
 		-no-cups \
 		-no-nis \
 		-no-freetype \
 		-no-accessibility \
-		$(QTOPIA4_MNG_LIB) \
-		$(QTOPIA4_GIF_LIB) \
+		$(QTOPIA4_MNG) \
+		$(QTOPIA4_GIF) \
 		$(QTOPIA4_JPEG) \
+		$(QTOPIA4_PNG) \
+		$(QTOPIA4_TIFF) \
 		$(QTOPIA4_ZLIB) \
-		-no-sql-ibase \
-		-no-sql-mysql \
-		-no-sql-odbc \
-		-no-sql-psql \
-		-no-sql-sqlite \
-		-no-sql-sqlite2 \
+		$(QTOPIA4_SQL_IBASE) \
+		$(QTOPIA4_SQL_MYSQL) \
+		$(QTOPIA4_SQL_ODBC) \
+		$(QTOPIA4_SQL_PSQL) \
+		$(QTOPIA4_SQL_SQLITE) \
+		$(QTOPIA4_SQL_SQLITE2) \
 		$(QTOPIA4_NO_SQL_DB2) \
 		$(QTOPIA4_NO_SQL_OCI) \
 		$(QTOPIA4_NO_SQL_TDS) \
-		-prefix $(QTOPIA4_TARGET_DIR) \
-		-docdir $(QTOPIA4_TARGET_DIR)/doc \
-		-headerdir $(QTOPIA4_TARGET_DIR)/include \
-		-datadir $(QTOPIA4_TARGET_DIR) \
-		-plugindir $(QTOPIA4_TARGET_DIR)/plugins \
-		-translationdir $(QTOPIA4_TARGET_DIR)/translations \
-		-sysconfdir $(QTOPIA4_TARGET_DIR) \
-		-examplesdir $(QTOPIA4_TARGET_DIR)/examples \
-		-demosdir $(QTOPIA4_TARGET_DIR)/demos \
+		-no-webkit \
+		-no-separate-debug-info \
+		-prefix /usr \
+		-hostprefix $(STAGING_DIR)/usr \
 		-fast \
+		-no-rpath \
 		-nomake examples \
-		-no-rpath \
-		-no-fatal_error \
+		-nomake demos \
 		$(QTOPIA4_QT3SUPPORT) \
 		$(QTOPIA4_TSLIB) \
 		$(QTOPIA4_LARGEFILE) \
 		$(QTOPIA4_ENDIAN) \
 		$(QTOPIA4_APPROVE_GPL_LICENSE) \
-	);
+	)
 	touch $@
 
-$(QTOPIA4_TARGET_DIR)/.built: $(QTOPIA4_TARGET_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR) sub-src
+$(QTOPIA4_TARGET_DIR)/.compiled: $(QTOPIA4_TARGET_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR)
 	touch $@
 
-$(QTOPIA4_TARGET_DIR)/.installed: $(QTOPIA4_TARGET_DIR)/.built
+$(STAGING_DIR)/usr/lib/libQtCore.la: $(QTOPIA4_TARGET_DIR)/.compiled
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(QTOPIA4_TARGET_DIR) install
+
+$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
-	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-	cp -dpf $(QTOPIA4_TARGET_DIR)/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.$(QTOPIA4_VERSION)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
 endif
 	# Install image plugins if they are built
-	if [ -d $(QTOPIA4_TARGET_DIR)/plugins/imageformats ]; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt4/plugins; \
-		cp -dpfr $(QTOPIA4_TARGET_DIR)/plugins/imageformats $(TARGET_DIR)/usr/lib/qt4/plugins; \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/qt4/plugins/imageformats/*; \
+	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
+		mkdir -p $(TARGET_DIR)/usr/plugins; \
+		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
+		$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
 	fi
+ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
 	# Remove Sql libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSql*
+endif
 	# Remove Svg libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSvg*
-	touch $@
 
+qtopia4: uclibc zlib $(QTOPIA4_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
 
-qtopia4: uclibc zlib $(QTOPIA4_DEP_LIBS) $(QTOPIA4_TARGET_DIR)/.installed
-
 qtopia4-clean:
 	-$(MAKE) -C $(QTOPIA4_TARGET_DIR) clean
 
