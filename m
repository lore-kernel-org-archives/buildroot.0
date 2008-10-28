From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 28 Oct 2008 02:54:31 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix adjustment of qmake.conf
Message-ID: <200810280254.32049.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend the regexp to match spaces and also tabs to replace the qmake
variables with the proper buildroot values. Also use TARGET_AR and
TARGET_STRIP instead of using TARGET_CROSS and set a variable for
qmake.conf to shorten the command line.
---
 package/qtopia4/qtopia4.mk |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index 360b949..c0ced9b 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -218,6 +218,7 @@ QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
 #"))
 
+QTOPIA4_QMAKE_CONF:=$(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 
 # Variable for other Qt applications to use
 QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
@@ -243,14 +244,14 @@ endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
 	#$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
         # Fix compiler path
-	$(SED) '\,QMAKE_CC *=, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_CXX *=, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK *=, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK_SHLIB *=, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_AR *=, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_RANLIB *=, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_STRIP *=, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	
+	$(SED) '\,QMAKE_CC[ 	]*=, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_QMAKE_CONF)
+	$(SED) '\,QMAKE_CXX[ 	]*=, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
+	$(SED) '\,QMAKE_LINK[ 	]*=, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
+	$(SED) '\,QMAKE_LINK_SHLIB[ 	]*=, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_QMAKE_CONF)
+	$(SED) '\,QMAKE_AR[ 	]*=, c\QMAKE_AR = $(TARGET_AR) cqs' $(QTOPIA4_QMAKE_CONF)
+	$(SED) '\,QMAKE_RANLIB[ 	]*=, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_QMAKE_CONF)
+	$(SED) '\,QMAKE_STRIP[ 	]*=, c\QMAKE_STRIP = $(TARGET_STRIP)' $(QTOPIA4_QMAKE_CONF)
+
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 # Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
-- 
1.5.6.4
