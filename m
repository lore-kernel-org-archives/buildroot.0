From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 11:59:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  qtopia4
Message-ID: <20061213195907.655FD48591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 11:59:07 -0800 (Wed, 13 Dec 2006)
New Revision: 16904

Log:
- Thomas Lundquist added qtopia4 support. Untested.


Added:
   trunk/buildroot/package/qtopia4/
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-12-13 19:57:05 UTC (rev 16903)
+++ trunk/buildroot/package/Config.in	2006-12-13 19:59:07 UTC (rev 16904)
@@ -126,6 +126,7 @@
 source "package/psmisc/Config.in"
 source "package/python/Config.in"
 source "package/qte/Config.in"
+source "package/qtopia4/Config.in"
 source "package/raidtools/Config.in"
 source "package/readline/Config.in"
 source "package/rsync/Config.in"

Added: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2006-12-13 19:57:05 UTC (rev 16903)
+++ trunk/buildroot/package/qtopia4/Config.in	2006-12-13 19:59:07 UTC (rev 16904)
@@ -0,0 +1,60 @@
+config BR2_PACKAGE_QTOPIA4
+	bool "qtopia4"
+	default n
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_PTHREADS_NATIVE
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  Qtopia core 4.
+
+	  http://www.trolltech.com/
+
+config BR2_PACKAGE_QTOPIA4_DEBUG
+        bool "Compile with debug support"
+        default y 
+	depends BR2_PACKAGE_QTOPIA4
+        help
+
+config BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME
+        string "Qtopia Core 4 Commercial License Username"
+        default ""
+	depends BR2_PACKAGE_QTOPIA4
+        help
+            Commercial users can download their source directly by providing a username.
+
+
+config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
+        string "Qtopia Core 4 Commercial License Password"
+        default ""
+	depends BR2_PACKAGE_QTOPIA4
+        help
+            Commercial users can download their source directly by providing a password.
+
+config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
+        bool "Compatibility with Qt3"
+        default y 
+	depends BR2_PACKAGE_QTOPIA4
+        help
+	    Turns on support for older Qt3.
+
+config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
+        string "The embedded platform we are making Qtopia4 for"
+	default "arm"	if BR2_arm
+	default "arm"	if BR2_armeb
+	default "x86"	if BR2_i386
+	default "x86_64"	if BR2_x86_64
+	default "mips"	if BR2_mips
+	default "mips"	if BR2_mipsel
+# Not that I really believe these will work..
+	default "generic"	if BR2_alpha
+	default "generic"	if BR2_chris
+	default "generic"	if BR2_m68k
+	default "generic"	if BR2_nios2
+	default "generic"	if BR2_powerpc
+	default "generic"	if BR2_sh
+	default "generic"	if BR2_sh64
+	default "generic"	if BR2_sparc
+	depends BR2_PACKAGE_QTOPIA4
+        help
+	    The platform.

Added: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2006-12-13 19:57:05 UTC (rev 16903)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2006-12-13 19:59:07 UTC (rev 16904)
@@ -0,0 +1,271 @@
+######################################################################
+#
+# qtopia4 (Qtopia Core 4)
+# http://www.trolltech.com/
+# 
+# This makefile composed by Thomas Lundquist <thomasez@zelow.no>
+#
+# There is two versions built, one for the target and one for
+# staging. The target version is built in the staging_dir and the
+# staging version in the toolchain_dir.
+#
+# BTW, this uses alot of FPU calls and it's pretty slow if you use 
+# the kernels FPU emulation so it's better to choose soft float in the 
+# buildroot config (and uClibc.config of course, if you have your own.)
+#
+######################################################################
+
+QTOPIA4_VER:=4.2.2
+QTOPIA4_CAT:=$(ZCAT)
+
+BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
+#"))
+BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD)))
+#"))
+
+# What to download, free or commercial version.
+ifneq ($(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME),)
+
+QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
+QTOPIA4_SOURCE:=qtopia-core-commercial-src-$(QTOPIA4_VER).tar.gz
+QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qtopia-core-commercial-src-$(QTOPIA4_VER)
+QTOPIA4_HOST_DIR:=$(TOOL_BUILD_DIR)/qtopia-core-commercial-src-$(QTOPIA4_VER)
+
+else
+
+# Good, good, we are free:
+
+QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source/
+QTOPIA4_SOURCE:=qtopia-core-opensource-src-$(QTOPIA4_VER).tar.gz
+QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qtopia-core-opensource-src-$(QTOPIA4_VER)
+QTOPIA4_HOST_DIR:=$(TOOL_BUILD_DIR)/qtopia-core-opensource-src-$(QTOPIA4_VER)
+
+endif
+
+# If you want extra tweaking you can copy 
+# $(QTOPIA4_TARGET_DIR)/src/corelib/global/qconfig-myfile.h
+# to the qtopia4 packages directory (where this .mk file is) and 
+# remove the comment.
+# QTOPIA4_QCONFIG_COMMAND:=-qconfig myfile
+#
+# For the options you can set in this file, look at 
+# $(QTOPIA4_TARGET_DIR)/src/corelib/global/qfeatures.txt
+#
+QTOPIA4_QCONFIG_FILE:=package/qtopia4/qconfig-myfile.h
+QTOPIA4_QCONFIG_FILE_LOCATION:=/src/corelib/global/
+
+ifeq ($(BR2_LARGEFILE),y)
+QTOPIA4_LARGEFILE=-largefile
+else
+QTOPIA4_LARGEFILE=-no-largefile
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_QT3SUPPORT),y)
+QTOPIA4_QT3SUPPORT=-qt3support
+else
+QTOPIA4_QT3SUPPORT=-no-qt3support
+endif
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+QTOPIA4_TSLIB=-qt-mouse-tslib
+QTOPIA4_TSLIB_DEP=tslib
+QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
+QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
+#"))
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
+QTOPIA4_DEBUG="-debug $(QTOPIA4_TSLIB_DEB)"
+else
+QTOPIA4_DEBUG=-release
+endif
+ifeq ($(BR2_ENDIAN),"LITTLE")
+QTOPIA4_ENDIAN=-little-endian
+else
+QTOPIA4_ENDIAN=-big-endian
+endif
+
+QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
+#"))
+BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
+#"))
+
+
+# This is for staging.
+QTOPIA4_STAGING_DIR:=$(STAGING_DIR)/usr/Trolltech
+QTOPIA4_QMAKE=$(QTOPIA4_STAGING_DIR)/bin/qmake
+
+$(DL_DIR)/$(QTOPIA4_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
+
+qtopia4-source: $(DL_DIR)/$(QTOPIA4_SOURCE)
+
+#################################
+#
+# Target
+#
+#################################
+
+$(QTOPIA4_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
+	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(QTOPIA4_TARGET_DIR)/.unpacked
+
+# This configure is very tailored towards my needs.
+$(QTOPIA4_TARGET_DIR)/.configured: $(QTOPIA4_TARGET_DIR)/.unpacked
+	# Patching configure to get rid of some feature I dont want.
+	# (I don't want SQL either but there is no option for that at all. 
+	# the SQL library will be built even without the plugins/drivers.
+	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_TARGET_DIR)/configure
+	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
+	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
+	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
+	 	$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
+	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
+		PATH=$(TARGET_PATH) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		CXXFLAGS="$(TARGET_CXXFLAGS)" \
+		QPEHOME=/usr \
+		QPEDIR=/usr \
+		./configure \
+		-v \
+		-platform linux-g++ \
+		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
+		-xplatform qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++ \
+		$(QTOPIA4_QCONFIG_COMMAND) \
+		$(QTOPIA4_DEBUG) \
+		-depths 8 \
+		-no-cups \
+		-no-nis \
+		-no-freetype \
+		-no-accessibility \
+		-no-libmng \
+		-no-gif \
+		-no-sql-db2 \
+		-no-sql-ibase \
+		-no-sql-mysql \
+		-no-sql-oci \
+		-no-sql-odbc \
+		-no-sql-psql \
+		-no-sql-sqlite \
+		-no-sql-sqlite2 \
+		-no-sql-tds \
+		-prefix /usr \
+		-prefix-install \
+		-L $(STAGING_DIR)/usr/lib \
+		-I $(STAGING_DIR)/usr/include \
+		$(QTOPIA4_QT3SUPPORT) \
+		$(QTOPIA4_TSLIB) \
+		$(QTOPIA4_LARGEFILE) \
+		$(QTOPIA4_ENDIAN) \
+	);
+	touch $(QTOPIA4_TARGET_DIR)/.configured
+
+$(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VER): $(QTOPIA4_TARGET_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(QTOPIA4_TARGET_DIR) sub-src
+
+$(STAGING_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VER): $(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VER)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		INSTALL_ROOT=$(STAGING_DIR) \
+		-C $(QTOPIA4_TARGET_DIR) \
+		sub-src-install_subtargets-ordered \
+		install_qmake install_mkspecs
+
+$(TARGET_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VER): $(STAGING_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VER)
+	mkdir -p $(TARGET_DIR)/usr/lib/fonts
+	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
+	cp -a $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -a $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -a $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -a $(STAGING_DIR)/usr/lib/*.so.* $(TARGET_DIR)/usr/lib/
+	# We don't need no stinking Sql libraries:
+	-rm $(TARGET_DIR)/usr/lib/*Sql*
+	# Nor Svg
+	-rm $(TARGET_DIR)/usr/lib/*Svg*
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/*.so.$(QTOPIA4_VER)
+
+#################################
+#
+# Host/Staging
+#
+#################################
+
+$(QTOPIA4_HOST_DIR)/.unpacked: $(DL_DIR)/$(QTOPIA4_SOURCE)
+	$(QTOPIA4_CAT) $(DL_DIR)/$(QTOPIA4_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(QTOPIA4_HOST_DIR)/.unpacked
+
+# This configure is very tailored towards my needs.
+$(QTOPIA4_HOST_DIR)/.configured: $(QTOPIA4_HOST_DIR)/.unpacked
+	# Patching configure to get rid of some feature I dont want.
+	# (I don't want SQL either but there is no option for that at all. 
+	# the SQL library will be built even without the plugins/drivers.
+	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_HOST_DIR)/configure
+	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_HOST_DIR)/configure
+	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_HOST_DIR)/configure
+	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_HOST_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
+	 	$(QTOPIA4_HOST_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
+	(cd $(QTOPIA4_HOST_DIR); rm -rf config.cache; \
+		PATH=$(TARGET_PATH) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		CXXFLAGS="$(TARGET_CXXFLAGS)" \
+		QPEHOME=/usr \
+		QPEDIR=/usr \
+		./configure \
+		-v \
+		-platform linux-g++ \
+		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
+		-xplatform qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++ \
+		$(QTOPIA4_QCONFIG_COMMAND) \
+		$(QTOPIA4_DEBUG) \
+		-depths 8 \
+		-no-cups \
+		-no-nis \
+		-no-freetype \
+		-no-libmng \
+		-no-sql-db2 \
+		-no-sql-ibase \
+		-no-sql-mysql \
+		-no-sql-oci \
+		-no-sql-odbc \
+		-no-sql-psql \
+		-no-sql-sqlite \
+		-no-sql-sqlite2 \
+		-no-sql-tds \
+		-prefix $(QTOPIA4_STAGING_DIR) \
+		-prefix-install \
+		-L $(STAGING_DIR)/usr/lib \
+		-I $(STAGING_DIR)/usr/include \
+		$(QTOPIA4_QT3SUPPORT) \
+		$(QTOPIA4_TSLIB) \
+		$(QTOPIA4_LARGEFILE) \
+		$(QTOPIA4_ENDIAN) \
+	);
+	touch $(QTOPIA4_HOST_DIR)/.configured
+
+$(QTOPIA4_HOST_DIR)/lib/libQtCore.so.$(QTOPIA4_VER): $(QTOPIA4_HOST_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(QTOPIA4_HOST_DIR)
+
+$(QTOPIA4_STAGING_DIR)/lib/libQtCore.so.$(QTOPIA4_VER): $(QTOPIA4_HOST_DIR)/lib/libQtCore.so.$(QTOPIA4_VER)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(QTOPIA4_HOST_DIR) install
+
+qtopia4: uclibc zlib $(QTOPIA4_TSLIB_DEP) \
+		$(QTOPIA4_STAGING_DIR)/lib/libQtCore.so.$(QTOPIA4_VER) \
+		$(TARGET_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VER)
+
+qtopia4-clean:
+	-$(MAKE) -C $(QTOPIA4_HOST_DIR) clean
+	-$(MAKE) -C $(QTOPIA4_TARGET_DIR) clean
+
+qtopia4-dirclean:
+	rm -rf $(QTOPIA4_HOST_DIR)
+	rm -rf $(QTOPIA4_TARGET_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_QTOPIA4)),y)
+TARGETS+=qtopia4
+endif
