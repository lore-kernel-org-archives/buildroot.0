From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:44 +0200
Subject: [Buildroot] [PATCH 21/23] qt: add a Kconfig menu entry to enable an
	optional custom qconfig.h
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-22-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't twiddle with Makfiles, use Kconfig instead.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/Config.in |   12 ++++++++++++
 package/qt/qt.mk     |   24 +++++++++---------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 01e63ef..859f1c8 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -324,4 +324,16 @@ config BR2_PACKAGE_QT_SCRIPTTOOLS
 	  Build the Qt Script Tools module.
 	  if unsure, say n.
 
+config BR2_PACKAGE_QT_QCONFIG_FILE
+	string "Optional qconfig.h"
+	help
+	  Optional path to a qconfig.h file for fine-grained Qt
+	  customization.
+
+	  This file is copied to the appropriate destination in the Qt
+	  source tree and an appropriate option is passed to configure.
+	  No further intervention is necessary.
+
+	  If unsure, leave empty.
+
 endif # BR2_PACKAGE_QT
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 3784dea..deb303e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -18,23 +18,17 @@ QT_SITE:=http://get.qtsoftware.com/qt/source
 QT_CAT:=$(BZCAT)
 QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
 
+QT_QCONFIG_FILE:=$(call qstrip,$(BR2_PACKAGE_QT_QCONFIG_FILE))
+
 QT_CONFIGURE:=#empty
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
 QT_CONFIGURE += -opensource -confirm-license
 endif
 
-# If you want extra tweaking you can copy
-# $(QT_TARGET_DIR)/src/corelib/global/qconfig-myfile.h
-# to the qt packages directory (where this .mk file is) and
-# remove the comment.
-# QT_QCONFIG_COMMAND:=-qconfig myfile
-#
-# For the options you can set in this file, look at
-# $(QT_TARGET_DIR)/src/corelib/global/qfeatures.txt
-#
-QT_QCONFIG_FILE:=package/qt/qconfig-myfile.h
-QT_QCONFIG_FILE_LOCATION:=/src/corelib/global/
+ifneq ($(QT_QCONFIG_FILE),)
+QT_CONFIGURE += -qconfig local
+endif
 
 ifeq ($(BR2_LARGEFILE),y)
 QT_CONFIGURE+= -largefile
@@ -393,7 +387,7 @@ $(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
 		qt-$(QT_VERSION)-\*.patch.$(ARCH)
 	touch $@
 
-$(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked
+$(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked $(QT_QCONFIG_FILE)
 	-[ -f $(QT_TARGET_DIR)/Makefile ] && $(MAKE) -C $(QT_TARGET_DIR) confclean
 ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
@@ -411,8 +405,9 @@ endif
 	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS))
 	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS))
 	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS))
-	-[ -f $(QT_QCONFIG_FILE) ] && cp $(QT_QCONFIG_FILE) \
-		$(QT_TARGET_DIR)/$(QT_QCONFIG_FILE_LOCATION)
+ifneq ($(QT_QCONFIG_FILE),)
+	cp -pf $(QT_QCONFIG_FILE) $(QT_TARGET_DIR)/src/corelib/global/qconfig-local.h
+endif
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
 	(cd $(QT_TARGET_DIR); \
@@ -423,7 +418,6 @@ endif
 		$(if $(QUIET),-silent,-verbose) \
 		-force-pkg-config \
 		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
-		$(QT_QCONFIG_COMMAND) \
 		$(QT_CONFIGURE) \
 		-no-xinerama \
 		-no-cups \
-- 
1.6.3.3
