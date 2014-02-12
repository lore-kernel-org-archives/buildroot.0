From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 12 Feb 2014 10:19:08 +0100
Subject: [Buildroot] [PATCH v12 4/7] Makefile: add support for top-level
	parallel make
In-Reply-To: <1392196751-23485-1-git-send-email-fabio.porcedda@gmail.com>
References: <1392196751-23485-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1392196751-23485-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relyng on
the left to right ordering of evaluation of the prerequisites add an
explicit rule to describe the dependencies.

Add explicit rules to describe the following dependency chain:
$(TARGETS) -> target-finalize -> rootfs-* -> target-post-image

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile     | 21 ++++++++++++---------
 fs/common.mk |  4 ++--
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 8e65bc7..c89107a 100644
--- a/Makefile
+++ b/Makefile
@@ -377,8 +377,6 @@ include system/system.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
-TARGETS+=target-finalize
-
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
@@ -395,8 +393,6 @@ endif
 
 include fs/common.mk
 
-TARGETS+=target-post-image
-
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
@@ -429,11 +425,16 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: $(TARGETS)
+# Add base dependencies to all targets even on those not based on the
+# package framework.
+$(TARGETS): dirs prepare dependencies
+
+world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	$(BASE_TARGETS) $(TARGETS) \
+	target-finalize target-post-image \
+	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
@@ -493,7 +494,7 @@ endif
 STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
-target-finalize:
+target-finalize: $(TARGETS)
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
@@ -520,6 +521,8 @@ endif
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(KSTRIPCMD); fi
 
+$(TARGETS_ROOTFS): target-finalize
+
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
 # besides the one in which crash occurred; or SIGTRAP kills my program when
 # I set a breakpoint"
@@ -598,7 +601,7 @@ target-generatelocales: host-localedef
 	done
 endif
 
-target-post-image:
+target-post-image: $(TARGETS_ROOTFS)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
@@ -635,7 +638,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(TARGETS)
+	@echo $(TARGETS) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
diff --git a/fs/common.mk b/fs/common.mk
index 30e7524..d95c26b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -64,7 +64,7 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = $$(XZ) -9 -C crc32 -c
 endif
 
-$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
+$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
@@ -95,7 +95,7 @@ rootfs-$(1)-show-depends:
 rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
-TARGETS += rootfs-$(1)
+TARGETS_ROOTFS += rootfs-$(1)
 endif
 endef
 
-- 
1.8.5.4
