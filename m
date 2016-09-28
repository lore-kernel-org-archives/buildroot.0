From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 28 Sep 2016 10:00:56 +0200
Subject: [Buildroot] [PATCH v3] toolchain/wrapper: fix 'reinstall'
Message-ID: <1475049656-12452-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

toolchain-wrapper was not reinstalled. So rules toolchain-external-reinstall,
gcc-initial-reinstall, gcc-final-reinstall didn't work as expected.

In add, normalize variable name: s/TOOLCHAIN_BUILD_WRAPPER/TOOLCHAIN_WRAPPER_BUILD/

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
v2:
  - Fix missed occurences of TOOLCHAIN_BUILD_WRAPPER in package/
  - Do not write intermediate file with sources
  - Use 'install' instead of 'mkdir'
  - Fix indentation
v3:
  - Change patch subject since it is not specific to toolchain-external
  - Forgot to add TOOLCHAIN_WRAPPER_INSTALL to gcc POST_INSTALL_HOOKS
  - Fix TOOLCHAIN_WRAPPER_INSTALL

 package/gcc/gcc-final/gcc-final.mk                 |  3 ++-
 package/gcc/gcc-initial/gcc-initial.mk             |  3 ++-
 toolchain/toolchain-external/toolchain-external.mk |  3 ++-
 toolchain/toolchain-wrapper.mk                     | 11 +++++++----
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 36f185e..88da861 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -113,7 +113,8 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
 
 HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
-HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
+HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # Note: this must be done after CREATE_CC_SYMLINKS, otherwise the
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index aa88a68..7bb988b 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -61,7 +61,8 @@ HOST_GCC_INITIAL_INSTALL_OPTS += install-target-libgcc
 endif
 
 HOST_GCC_INITIAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
-HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
+HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
+HOST_GCC_INITIAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
 $(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 6fd2742..e9e6340 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -787,9 +787,10 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 	fi
 endef
 
-TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
+TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
+	$(TOOLCHAIN_WRAPPER_INSTALL)
 	$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index af39071..e7aa5fb 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -30,11 +30,14 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
 endif
 
-# For simplicity, build directly into the install location
-define TOOLCHAIN_BUILD_WRAPPER
-	$(Q)mkdir -p $(HOST_DIR)/usr/bin
+define TOOLCHAIN_WRAPPER_BUILD
 	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_WRAPPER_ARGS) \
 		-s -Wl,--hash-style=$(TOOLCHAIN_WRAPPER_HASH_STYLE) \
 		toolchain/toolchain-wrapper.c \
-		-o $(HOST_DIR)/usr/bin/toolchain-wrapper
+		-o $(@D)/toolchain-wrapper
+endef
+
+define TOOLCHAIN_WRAPPER_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/toolchain-wrapper \
+		$(HOST_DIR)/usr/bin/toolchain-wrapper
 endef
-- 
1.9.1
