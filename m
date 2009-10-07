From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:46 +0200
Subject: [Buildroot] [PATCH 23/23] qt: rename QT_TARGET_DIR to QT_DIR
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-24-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QT_TARGET_DIR originate from ancient times when Qt was build for the
target and host separately.

Stick more to the buildroot standard and rename it to QT_DIR.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |   46 +++++++++++++++++++++++-----------------------
 1 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index dbb1fae..6e8fe68 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -16,7 +16,7 @@ QT_VERSION:=4.5.2
 QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.bz2
 QT_SITE:=http://get.qtsoftware.com/qt/source
 QT_CAT:=$(BZCAT)
-QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
+QT_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
 
 QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 QT_QCONFIG_FILE:=$(call qstrip,$(BR2_PACKAGE_QT_QCONFIG_FILE))
@@ -336,7 +336,7 @@ ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
 QT_LIBS += libQtScriptTools.so
 endif
 
-QT_UNSTAGE_FILES := $(QT_TARGET_DIR)/.staged		\
+QT_UNSTAGE_FILES := $(QT_DIR)/.staged			\
 	$(STAGING_DIR)/usr/lib/fonts			\
 	$(STAGING_DIR)/usr/plugins			\
 	$(STAGING_DIR)/usr/translations			\
@@ -346,13 +346,13 @@ QT_UNSTAGE_FILES := $(QT_TARGET_DIR)/.staged		\
 	$(STAGING_DIR)/usr/lib/libphonon.*		\
 	$(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc
 
-QT_UNINSTALL_FILES := $(QT_TARGET_DIR)/.installed	\
+QT_UNINSTALL_FILES := $(QT_DIR)/.installed		\
 	$(TARGET_DIR)/usr/lib/fonts			\
 	$(TARGET_DIR)/usr/plugins			\
 	$(TARGET_DIR)/usr/lib/libQt*			\
 	$(TARGET_DIR)/usr/lib/libphonon.*
 
-QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+QT_QMAKE_CONF:=$(QT_DIR)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
@@ -375,18 +375,18 @@ $(DL_DIR)/$(QT_SOURCE):
 
 qt-source: $(DL_DIR)/$(QT_SOURCE)
 
-$(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
+$(QT_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
 	$(QT_CAT) $(DL_DIR)/$(QT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(QT_TARGET_DIR) package/qt/ \
+	toolchain/patch-kernel.sh $(QT_DIR) package/qt/ \
 		qt-$(QT_VERSION)-\*.patch \
 		qt-$(QT_VERSION)-\*.patch.$(ARCH)
 	touch $@
 
-$(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked $(QT_QCONFIG_FILE)
-	-[ -f $(QT_TARGET_DIR)/Makefile ] && $(MAKE) -C $(QT_TARGET_DIR) confclean
+$(QT_DIR)/.configured: $(QT_DIR)/.unpacked $(QT_QCONFIG_FILE)
+	-[ -f $(QT_DIR)/Makefile ] && $(MAKE) -C $(QT_DIR) confclean
 ifneq ($(BR2_INET_IPV6),y)
-	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
-	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
+	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_DIR)/configure
+	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_DIR)/configure
 endif
 	# Fix compiler path
 	$(call QT_QMAKE_SET,CC,$(TARGET_CC))
@@ -401,11 +401,11 @@ endif
 	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS))
 	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS))
 ifneq ($(QT_QCONFIG_FILE),)
-	cp -pf $(QT_QCONFIG_FILE) $(QT_TARGET_DIR)/src/corelib/global/qconfig-local.h
+	cp -pf $(QT_QCONFIG_FILE) $(QT_DIR)/src/corelib/global/qconfig-local.h
 endif
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
-	(cd $(QT_TARGET_DIR); \
+	(cd $(QT_DIR); \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
@@ -428,16 +428,16 @@ endif
 	)
 	touch $@
 
-$(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured
-	$(MAKE) -C $(QT_TARGET_DIR)
+$(QT_DIR)/.compiled: $(QT_DIR)/.configured
+	$(MAKE) -C $(QT_DIR)
 	touch $@
 
-$(QT_TARGET_DIR)/.staged: $(QT_TARGET_DIR)/.compiled
+$(QT_DIR)/.staged: $(QT_DIR)/.compiled
 	-rm -rf $(QT_UNSTAGE_FILES)
-	$(MAKE) -C $(QT_TARGET_DIR) install
+	$(MAKE) -C $(QT_DIR) install
 	touch $@
 
-$(QT_TARGET_DIR)/.installed: $(QT_TARGET_DIR)/.staged
+$(QT_DIR)/.installed: $(QT_DIR)/.staged
 	-rm -rf $(QT_UNINSTALL_FILES)
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
@@ -459,21 +459,21 @@ endif
 	fi
 	touch $@
 
-qt-install: $(QT_DEP_LIBS) $(QT_TARGET_DIR)/.installed
+qt-install: $(QT_DEP_LIBS) $(QT_DIR)/.installed
 
 qt-uninstall:
 	-rm -rf $(QT_UNSTAGE_FILES) $(QT_UNINSTALL_FILES)
 
 qt-clean:
-	-$(MAKE) -C $(QT_TARGET_DIR) clean
-	-rm -f $(QT_TARGET_DIR)/.compiled
+	-$(MAKE) -C $(QT_DIR) clean
+	-rm -f $(QT_DIR)/.compiled
 
 qt-confclean:
-	-$(MAKE) -C $(QT_TARGET_DIR) confclean
-	-rm -f $(QT_TARGET_DIR)/.configured
+	-$(MAKE) -C $(QT_DIR) confclean
+	-rm -f $(QT_DIR)/.configured
 
 qt-dirclean:
-	rm -rf $(QT_TARGET_DIR)
+	rm -rf $(QT_DIR)
 
 qt: qt-install
 
-- 
1.6.3.3
