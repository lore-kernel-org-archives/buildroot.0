From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Sep 2015 21:27:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcrossguid: new package
Message-ID: <1443468421-24604-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by Kodi 16.x-Jarvis:
https://github.com/xbmc/xbmc/commit/6f8171f53992fc2eaabf71f6fa47ebed1da0d43d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                    |  1 +
 package/libcrossguid/Config.in       | 13 +++++++++++++
 package/libcrossguid/libcrossguid.mk | 28 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/libcrossguid/Config.in
 create mode 100644 package/libcrossguid/libcrossguid.mk

diff --git a/package/Config.in b/package/Config.in
index 72b55c9..42a25be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1091,6 +1091,7 @@ menu "Other"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
 	source "package/libcofi/Config.in"
+	source "package/libcrossguid/Config.in"
 	source "package/libdaemon/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libcrossguid/Config.in b/package/libcrossguid/Config.in
new file mode 100644
index 0000000..fb74c36
--- /dev/null
+++ b/package/libcrossguid/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBCROSSGUID
+	bool "libcrossguid"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Lightweight cross platform C++ GUID/UUID library
+
+	  https://github.com/graeme-hill/crossguid
+
+comment "libcrossguid needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
new file mode 100644
index 0000000..e63ca40
--- /dev/null
+++ b/package/libcrossguid/libcrossguid.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libcrossguid
+#
+################################################################################
+
+LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
+LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
+LIBCROSSGUID_LICENSE = MIT
+LIBCROSSGUID_LICENSE_FILES = LICENSE
+LIBCROSSGUID_INSTALL_STAGING = YES
+LIBCROSSGUID_DEPENDENCIES = util-linux
+
+define LIBCROSSGUID_BUILD_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(TARGET_CXX) -c guid.cpp -o guid.o -Wall -std=c++11 -DGUID_LIBUUID)
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(TARGET_AR) rvs libcrossguid.a guid.o)
+endef
+
+define LIBCROSSGUID_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a $(STAGING_DIR)/usr/lib/libcrossguid.a
+	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
+endef
+
+define LIBCROSSGUID_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a $(TARGET_DIR)/usr/lib/libcrossguid.a
+endef
+
+$(eval $(generic-package))
-- 
2.5.3
