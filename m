From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:45 +0200
Subject: [Buildroot] [PATCH 22/23] qt: group qstrip macro calls together
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-23-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the sake of beauty group the calls to qstrip together and assign
the result to new variables.

Additionally while we are here remove some excessive newlines.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index deb303e..dbb1fae 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -18,6 +18,7 @@ QT_SITE:=http://get.qtsoftware.com/qt/source
 QT_CAT:=$(BZCAT)
 QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
 
+QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 QT_QCONFIG_FILE:=$(call qstrip,$(BR2_PACKAGE_QT_QCONFIG_FILE))
 
 QT_CONFIGURE:=#empty
@@ -42,7 +43,6 @@ else
 QT_CONFIGURE+= -no-qt3support
 endif
 
-
 ### Pixel depths
 QT_PIXEL_DEPTHS := # empty
 ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_1),y)
@@ -213,7 +213,6 @@ QT_CONFIGURE+= -no-libtiff
 endif
 endif
 
-
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE),y)
 QT_CONFIGURE+= -qt-freetype
 else
@@ -226,7 +225,6 @@ QT_CONFIGURE+= -no-freetype
 endif
 endif
 
-
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),y)
 QT_CONFIGURE+= -openssl
 QT_DEP_LIBS+=openssl
@@ -305,8 +303,6 @@ ifeq ($(BR2_CCACHE),y)
 QT_CONFIGURE += -no-pch
 endif
 
-BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
-
 # Figure out what shared libs to install in the target
 QT_LIBS := libQtCore.so
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
@@ -356,7 +352,7 @@ QT_UNINSTALL_FILES := $(QT_TARGET_DIR)/.installed	\
 	$(TARGET_DIR)/usr/lib/libQt*			\
 	$(TARGET_DIR)/usr/lib/libphonon.*
 
-QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
+QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
@@ -379,7 +375,6 @@ $(DL_DIR)/$(QT_SOURCE):
 
 qt-source: $(DL_DIR)/$(QT_SOURCE)
 
-
 $(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
 	$(QT_CAT) $(DL_DIR)/$(QT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(QT_TARGET_DIR) package/qt/ \
@@ -417,7 +412,7 @@ endif
 		./configure \
 		$(if $(QUIET),-silent,-verbose) \
 		-force-pkg-config \
-		-embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
+		-embedded $(QT_EMB_PLATFORM) \
 		$(QT_CONFIGURE) \
 		-no-xinerama \
 		-no-cups \
-- 
1.6.3.3
