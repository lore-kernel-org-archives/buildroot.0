From: Karoly Kasza <kaszak@gmail.com>
Date: Wed, 29 Apr 2015 14:05:42 +0200
Subject: [Buildroot] [PATCH] package/ccache: add universal wrapper script
Message-ID: <1430309142-36242-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a wrapper script to call ccache, which will differentiate
if the HOST or either internal or external TARGET compiler is called.

Ccache needs to know what compiler we use, but can be simply fooled to fetch
invalid objects. To circumvent this, it uses different algorythms to
distiguish the compilers. This needs to be tuned for Buildroot's usage,
as the internal toolchains' characteristics change with every recompilation,
while ccache can not directly access the external toolchains (symlinks).

This patch does the following:
- Reenable using mtime (hash of binary size and modification date) as the
  default compiler_check algorythm. This will be used for the host compiler.
- Renames the ccache binary, so the wrapper script can be installed on it's
  place.
- Creates a wrapper script with hardcoded values for performance, which will
  disable the mtime compiler check and add an extra file to hash if it is called
  for a target compiler (either internal or external). It is basically all the
  same if we are using internal or external toolchains, ccache only sees a path.
- Creates a checksum file for the above method from the extract of the current
  Buildroot config, which should not change when configuring packages or
  recompiling the whole project. However it will change if the compiler options
  change, thus safely pointing to cached objects.

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
index 52b5c67..ee9085d 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -26,16 +26,14 @@ HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 #    is already used by autotargets for the ccache package.
 #    BR_CACHE_DIR is exported by Makefile based on config option
 #    BR2_CCACHE_DIR.
-#  - ccache shouldn't use the compiler binary mtime to detect a change in
-#    the compiler, because in the context of Buildroot, that completely
-#    defeats the purpose of ccache. Of course, that leaves the user
-#    responsible for purging its cache when the compiler changes.
 #  - Change hard-coded last-ditch default to match path in .config, to avoid
 #    the need to specify BR_CACHE_DIR when invoking ccache directly.
+#  - Rename ccache binary to ccache.bin, so later the wrapper can be safely
+#    named ccache, as referred everywhere
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,conf->compiler_check = x_strdup("mtime"),conf->compiler_check = x_strdup("none"),' $(@D)/conf.c
 	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/conf.c
+	sed -i 's,#define MYNAME "ccache",#define MYNAME "ccache.bin",' $(@D)/ccache.h
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
@@ -58,6 +56,23 @@ endef
 HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
 endif
 
+# Install a wrapper script, which, when using the TARGET_ toolchain, will make
+# ccache use the hash of the toolchain options instead of the compiler's mtime
+define HOST_CCACHE_INSTALL_WRAPPER
+	mv $(CCACHE) $(CCACHE).bin
+	echo "#!/bin/sh" > $(CCACHE)
+	echo "if [ \"$$"'1'"\" = \"$(TARGET_CC_NOCCACHE)\" ] || \\" >> $(CCACHE)
+	echo "   [ \"$$"'1'"\" = \"$(TARGET_CXX_NOCCACHE)\" ]; then" >> $(CCACHE)
+	echo "	export CCACHE_COMPILERCHECK=none CCACHE_EXTRAFILES=$(HOST_DIR)/ccache_toolchain.config.hash" >> $(CCACHE)
+	echo "fi" >> $(CCACHE)
+	echo "$(CCACHE).bin \"$$"'@'"\"" >> $(CCACHE)
+	grep "BR2_ARCH\|BR2_TOOLCHAIN\|BR2_GCC\|BR2_BINUTILS\|BR2_UCLIBC\|BR2_GLIBC\|BR2_EGLIBC" $(BR2_CONFIG) | \
+	grep -v "#" | md5sum > $(HOST_DIR)/ccache_toolchain.config.hash
+	chmod 755 $(CCACHE)
+endef
+
+HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_INSTALL_WRAPPER
+
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_CCACHE),y)
-- 
1.7.10.4
