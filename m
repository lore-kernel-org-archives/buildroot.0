From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 20:38:01 +0200
Subject: [Buildroot] [git commit] package/libcrossguid: new package
Message-ID: <20151003183951.5B96D8192C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c263cefe86c622ec4821ac72df63ef3a6bf6ac01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by Kodi 16.x-Jarvis:
https://github.com/xbmc/xbmc/commit/6f8171f53992fc2eaabf71f6fa47ebed1da0d43d

[Peter: needs GCC >= 4.7 for C+11, no need to install in target,
	Drop TARGET_CONFIGURE_OPTS, add TARGET_CXXFLAGS, wrap long lines]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/libcrossguid/Config.in       |   15 +++++++++++++++
 package/libcrossguid/libcrossguid.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2091d4e..a74669e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1090,6 +1090,7 @@ menu "Other"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
 	source "package/libcofi/Config.in"
+	source "package/libcrossguid/Config.in"
 	source "package/libdaemon/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libcrossguid/Config.in b/package/libcrossguid/Config.in
new file mode 100644
index 0000000..907ad2d
--- /dev/null
+++ b/package/libcrossguid/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBCROSSGUID
+	bool "libcrossguid"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Lightweight cross platform C++ GUID/UUID library
+
+	  https://github.com/graeme-hill/crossguid
+
+comment "libcrossguid needs a toolchain w/ C++, wchar, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \\
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
new file mode 100644
index 0000000..46d9a9d
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
+# only a static library
+LIBCROSSGUID_INSTALL_TARGET = NO
+LIBCROSSGUID_DEPENDENCIES = util-linux
+
+define LIBCROSSGUID_BUILD_CMDS
+	(cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -std=c++11 -DGUID_LIBUUID \
+		-c guid.cpp -o guid.o)
+	(cd $(@D); $(TARGET_AR) rvs libcrossguid.a guid.o)
+endef
+
+define LIBCROSSGUID_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a \
+		$(STAGING_DIR)/usr/lib/libcrossguid.a
+	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
+endef
+
+$(eval $(generic-package))
