From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Jul 2010 10:02:23 +0200
Subject: [Buildroot] [git commit master 1/1] gcc: move <tuple>/lib* symlink
	handling up to gcc-intermediate
Message-ID: <20100730081549.BE2A28367D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=18abd4aa94cd59240b90257c95877c0ea2fd1796
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The <tuple>/lib* symlinking added by 3c77bab2eeace needs to
be moved up to the gcc-intermediate step now the NPTL stuff is merged,
otherwise 64bit builds fails (lib64 already created).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 0b7fd48..f17b73f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -259,6 +259,11 @@ GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
 
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR2)
+	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
+	mkdir -p $(STAGING_DIR)/lib
+	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
+	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
+	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_DIR)/configure $(QUIET) \
@@ -334,13 +339,6 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	# Important! Required for limits.h to be fixed.
 	ln -snf ../include/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
-	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	mkdir -p $(STAGING_DIR)/lib
-	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
-	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
-	#-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	#ln -snf ../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
-- 
1.7.1
