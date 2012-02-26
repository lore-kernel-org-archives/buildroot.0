From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 10:13:30 -0200
Subject: [Buildroot] [PATCH 1/3] qt: Add optimization flags, GCC 4.6 fix,
	and impvore QT_MAKE_SET and QT_CONFIGURE_IPV6
Message-ID: <1330258412-28426-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt/qt.mk |   42 +++++++++++++++++++++---------------------
 1 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 5414947..f0045de 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -28,8 +28,11 @@ ifneq ($(QT_CONFIG_FILE),)
 QT_CONFIGURE_OPTS += -config buildroot
 endif
 
-QT_CFLAGS = $(TARGET_CFLAGS)
-QT_CXXFLAGS = $(TARGET_CXXFLAGS)
+QT_FLAGS = -march=$(BR2_GCC_TARGET_ARCH) -mcpu=$(BR2_GCC_TARGET_TUNE)
+
+# XXX: The following flag is a workaround for a GCC bug, detailed by
+# <http://gcc.gnu.org/ml/gcc-patches/2010-11/msg02245.html>
+QT_FLAGS += -fno-strict-volatile-bitfields
 
 ifeq ($(BR2_LARGEFILE),y)
 QT_CONFIGURE_OPTS += -largefile
@@ -39,8 +42,7 @@ QT_CONFIGURE_OPTS += -no-largefile
 # embedded sqlite module forces FILE_OFFSET_BITS=64 unless this is defined
 # webkit internally uses this module as well
 ifneq ($(BR2_PACKAGE_QT_SQLITE_QT)$(BR2_PACKAGE_QT_WEBKIT),)
-QT_CFLAGS += -DSQLITE_DISABLE_LFS
-QT_CXXFLAGS += -DSQLITE_DISABLE_LFS
+QT_FLAGS += -DSQLITE_DISABLE_LFS
 endif
 
 endif
@@ -443,20 +445,18 @@ QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 #
 # Argument 1 is the variable name
 # Argument 2 is the value to set variable to
-# Argument 3 is the base source directory of Qt
+# Argument 3 is a flag, set it to + to append values
 #
 # E.G. use like this:
 # $(call QT_QMAKE_SET,variable,value,directory)
 ################################################################################
 define QT_QMAKE_SET
-	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '/$(1)/d;/include.*qws.conf/a$(1) $(3)= $(2)' $(@D)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
 
 ifneq ($(BR2_INET_IPV6),y)
 define QT_CONFIGURE_IPV6
-	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(@D)/configure
-	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(@D)/configure
+	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/;s/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(@D)/configure
 endef
 endif
 
@@ -471,18 +471,18 @@ define QT_CONFIGURE_CMDS
 	$(QT_CONFIGURE_IPV6)
 	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
-	$(call QT_QMAKE_SET,QMAKE_CC,$(TARGET_CC),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_CXX,$(TARGET_CXX),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_LINK,$(TARGET_CXX),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_LINK_SHLIB,$(TARGET_CXX),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_AR,$(TARGET_AR) cqs,$(@D))
-	$(call QT_QMAKE_SET,QMAKE_OBJCOPY,$(TARGET_OBJCOPY),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_RANLIB,$(TARGET_RANLIB),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_STRIP,$(TARGET_STRIP),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_LFLAGS,$(TARGET_LDFLAGS),$(@D))
-	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/usr/bin/pkg-config,$(@D))
+	$(call QT_QMAKE_SET,QMAKE_CC,$(TARGET_CC))
+	$(call QT_QMAKE_SET,QMAKE_CXX,$(TARGET_CXX))
+	$(call QT_QMAKE_SET,QMAKE_LINK,$(TARGET_CXX))
+	$(call QT_QMAKE_SET,QMAKE_LINK_SHLIB,$(TARGET_CXX))
+	$(call QT_QMAKE_SET,QMAKE_AR,$(TARGET_AR) cqs)
+	$(call QT_QMAKE_SET,QMAKE_OBJCOPY,$(TAGET_OBJCOPY))
+	$(call QT_QMAKE_SET,QMAKE_RANLIB,$(TARGET_RANLIB))
+	$(call QT_QMAKE_SET,QMAKE_STRIP,$(TARGET_STRIP))
+	$(call QT_QMAKE_SET,QMAKE_CFLAGS,$(QT_FLAGS) $(TARGET_CFLAGS),+)
+	$(call QT_QMAKE_SET,QMAKE_CXXFLAGS,$(QT_FLAGS) $(TARGET_CXXFLAGS),+)
+	$(call QT_QMAKE_SET,QMAKE_LFLAGS,$(TARGET_LDFLAGS),+)
+	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/usr/bin/pkg-config)
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
 	(cd $(@D); \
-- 
1.7.9.1
