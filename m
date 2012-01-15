From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Jan 2012 20:59:37 +0100
Subject: [Buildroot] [git commit] gcc-uclibc-4.x.mk: get rid of
	BR2_DEPENDS_DIR
Message-ID: <20120116093410.7B5B090357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0880f70fa9c0cfa398dbb06011b4d3eb48bd263
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have dropped the make-write-deps patch.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                        |    6 ++----
 toolchain/gcc/gcc-uclibc-4.x.mk |   13 -------------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 242265f..912012f 100644
--- a/Makefile
+++ b/Makefile
@@ -278,8 +278,6 @@ TARGET_DIR:=$(BASE_DIR)/target
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
-BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
-
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
 CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
@@ -360,7 +358,7 @@ HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
@@ -391,7 +389,7 @@ $(O)/toolchainfile.cmake:
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 #############################################################
 #
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 3074799..5eb7505 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -79,19 +79,6 @@ ifeq ($(BR2_GCC_CROSS_OBJC),y)
 GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),objc
 endif
 
-GCC_COMMON_PREREQ=$(wildcard $(BR2_DEPENDS_DIR)/br2/install/libstdcpp*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/install/objc*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/install/fortran*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/prefer/ima*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/toolchain/sysroot*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/use/sjlj/exceptions*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/gcc/shared/libgcc*)
-GCC_TARGET_PREREQ+=$(GCC_COMMON_PREREQ) \
-$(wildcard $(BR2_DEPENDS_DIR)/br2/extra/target/gcc/config/options*)
-GCC_STAGING_PREREQ+=$(GCC_COMMON_PREREQ) \
-$(wildcard $(BR2_DEPENDS_DIR)/br2/extra/gcc/config/options*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/gcc/cross/*)
-
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
 endif
