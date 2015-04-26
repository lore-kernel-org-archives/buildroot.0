From: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 26 Apr 2015 11:21:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/ccache: add wrapper for internal
	toolchain
In-Reply-To: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
Message-ID: <1430040062-46308-2-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will make ccache to use mtime for compiler checks except for
BR's internal toolchain, where using mtime would make ccache useless,
because of the recompilations of the binaries. In this case we use
a wrapper script and an md5 hash file with the BR .config options as
suggested previously by Arnout.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 Config.in                |    7 -------
 package/ccache/ccache.mk |   25 ++++++++++++++++++++-----
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index 2b39d6a..6e7f722 100644
--- a/Config.in
+++ b/Config.in
@@ -257,13 +257,6 @@ config BR2_CCACHE
 	  up future builds. By default, the cache is stored in
 	  $HOME/.buildroot-ccache.
 
-	  Note that Buildroot does not try to invalidate the cache
-	  contents when the compiler changes in an incompatible
-	  way. Therefore, if you make a change to the compiler version
-	  and/or configuration, you are responsible for purging the
-	  ccache cache by removing the $HOME/.buildroot-ccache
-	  directory.
-
 if BR2_CCACHE
 
 config BR2_CCACHE_DIR
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 52b5c67..585e809 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -26,15 +26,10 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 #    is already used by autotargets for the ccache package.
 #    BR_CACHE_DIR is exported by Makefile based on config option
 #    BR2_CCACHE_DIR.
-#  - ccache shouldn't use the compiler binary mtime to detect a change in
-#    the compiler, because in the context of Buildroot, that completely
-#    defeats the purpose of ccache. Of course, that leaves the user
-#    responsible for purging its cache when the compiler changes.
 #  - Change hard-coded last-ditch default to match path in .config, to avoid
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,conf->compiler_check = x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
 	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
 endef
 
@@ -58,6 +53,26 @@ endef
 HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
 endif
 
+# When using an internal toolchain, disable mtime and use the hash of the toolchain options instead
+define HOST_CCACHE_INSTALL_WRAPPER
+	mkdir -p $(HOST_DIR)/usr/bin/ccache.bin
+	mv $(HOST_DIR)/usr/bin/ccache $(HOST_DIR)/usr/bin/ccache.bin/ccache
+	echo "#!/bin/sh" > $(HOST_DIR)/usr/bin/ccache
+	echo "if [ \"$$"'1'"\" = \"$(TARGET_CC_NOCCACHE)\" ] || \\" >> $(HOST_DIR)/usr/bin/ccache
+	echo "   [ \"$$"'1'"\" = \"$(TARGET_CXX_NOCCACHE)\" ]; then" >> $(HOST_DIR)/usr/bin/ccache
+	echo "	export CCACHE_COMPILERCHECK=none CCACHE_EXTRAFILES=$(HOST_DIR)/ccache_toolchain.hash" >> $(HOST_DIR)/usr/bin/ccache
+	echo "fi" >> $(HOST_DIR)/usr/bin/ccache
+	echo "$(HOST_DIR)/usr/bin/ccache.bin/ccache \"$$"'@'"\"" >> $(HOST_DIR)/usr/bin/ccache
+	grep "BR2_ARCH\|BR2_TOOLCHAIN\|BR2_GCC\|BR2_BINUTILS\|BR2_UCLIBC\|BR2_GLIBC\|BR2_EGLIBC" $(BR2_CONFIG) | \
+	grep -v "#" | md5sum > $(HOST_DIR)/ccache_toolchain.hash
+	chmod 755 $(HOST_DIR)/usr/bin/ccache
+endef
+
+# Install wrapper script only if internal toolchain is used
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_INSTALL_WRAPPER
+endif
+
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_CCACHE),y)
-- 
1.7.10.4
