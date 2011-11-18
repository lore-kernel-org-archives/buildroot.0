From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Nov 2011 12:08:02 +0100
Subject: [Buildroot] [git commit] qt: ensure cross pkg-config is used
Message-ID: <20111118121915.0611E8F5D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a028c31ed07681d31ae6aba873fd60ad9b2f656d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4297

Tweak qmake.conf to ensure our cross pkg-config is used, instead of
whatever is first in the path. In order to do this, tweak the
QT_QMAKE_SET to be able to handle variables which aren't prefixed with
QMAKE_.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    3 ++-
 package/qt/qt.mk |   31 ++++++++++++++++---------------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5021bd3..b728084 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,12 +8,13 @@
 	crosstool-ng as well, bump crosstool-ng version, gdb fixes.
 
 	Updated/fixed packages: distcc, file, gst-plugins-bad, libxcb,
-	mplayer, rpm, rrdtool, tar, tftpd
+	mplayer, qt, rpm, rrdtool, tar, tftpd
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#3355: mplayer fails to build
 	#4021: uClibc: undefined reference to `__GI___errno_location'
+	#4297: Qt's qmake uses wrong pkg-config
 
 2011.11-rc1, Released November 11th, 2011:
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index cc035bf..28a477a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -434,11 +434,11 @@ endif
 QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 
 ################################################################################
-# QT_QMAKE_SET -- helper macro to set QMAKE_<variable> = <value> in
+# QT_QMAKE_SET -- helper macro to set <variable> = <value> in
 # the qmake.conf file. Will remove existing variable declaration if
 # available.
 #
-# Argument 1 is the variable name (without QMAKE_)
+# Argument 1 is the variable name
 # Argument 2 is the value to set variable to
 # Argument 3 is the base source directory of Qt
 #
@@ -446,8 +446,8 @@ QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 # $(call QT_QMAKE_SET,variable,value,directory)
 ################################################################################
 define QT_QMAKE_SET
-	$(SED) '/QMAKE_$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
 endef
 
 ifneq ($(BR2_INET_IPV6),y)
@@ -468,17 +468,18 @@ define QT_CONFIGURE_CMDS
 	$(QT_CONFIGURE_IPV6)
 	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
-	$(call QT_QMAKE_SET,CC,$(TARGET_CC),$(@D))
-	$(call QT_QMAKE_SET,CXX,$(TARGET_CXX),$(@D))
-	$(call QT_QMAKE_SET,LINK,$(TARGET_CXX),$(@D))
-	$(call QT_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX),$(@D))
-	$(call QT_QMAKE_SET,AR,$(TARGET_AR) cqs,$(@D))
-	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY),$(@D))
-	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB),$(@D))
-	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP),$(@D))
-	$(call QT_QMAKE_SET,CFLAGS,$(QT_CFLAGS),$(@D))
-	$(call QT_QMAKE_SET,CXXFLAGS,$(QT_CXXFLAGS),$(@D))
-	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_CC,$(TARGET_CC),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_CXX,$(TARGET_CXX),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_LINK,$(TARGET_CXX),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_LINK_SHLIB,$(TARGET_CXX),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_AR,$(TARGET_AR) cqs,$(@D))
+	$(call QT_QMAKE_SET,QMAKE_OBJCOPY,$(TARGET_OBJCOPY),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_RANLIB,$(TARGET_RANLIB),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_STRIP,$(TARGET_STRIP),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_LFLAGS,$(TARGET_LDFLAGS),$(@D))
+	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/usr/bin/pkg-config,$(@D))
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
 	(cd $(@D); \
