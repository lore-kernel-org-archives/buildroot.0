From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  1 Oct 2013 15:24:37 +0200
Subject: [Buildroot] [PATCH v6 5/5] Makefile: fix rules for top-level
	parallel make
In-Reply-To: <1380633877-10702-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380633877-10702-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380633877-10702-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must not depend in a rule
on the order of evaluation of the prerequisites, so instead of relyng on
the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

Add explicit rules to describe the following dependency chain:
$(TARGETS) -> target-finalize -> rootfs-* -> target-post-image

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile     | 14 +++++---------
 fs/common.mk |  4 ++--
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index c31995a..0ee2c62 100644
--- a/Makefile
+++ b/Makefile
@@ -337,8 +337,6 @@ include boot/common.mk
 include linux/linux.mk
 include system/system.mk
 
-TARGETS+=target-finalize
-
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
@@ -355,8 +353,6 @@ endif
 
 include fs/common.mk
 
-TARGETS+=target-post-image
-
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
@@ -394,11 +390,11 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 toolchain: prepare dirs dependencies $(BASE_TARGETS)
 
-world: $(TARGETS)
+world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	$(BASE_TARGETS) $(TARGETS) \
+	target-finalize target-post-image $(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
@@ -455,7 +451,7 @@ endif
 STRIP_FIND_CMD += -type f -perm /111
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
-target-finalize:
+target-finalize: $(TARGETS)
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
@@ -562,7 +558,7 @@ target-generatelocales: host-localedef
 	done
 endif
 
-target-post-image:
+target-post-image: $(TARGETS_ROOTFS)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
@@ -598,7 +594,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(TARGETS)
+	@echo $(TARGETS) $(TARGETS_ROOTFS)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
diff --git a/fs/common.mk b/fs/common.mk
index 4dab7ea..1056679 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -42,7 +42,7 @@ define ROOTFS_TARGET_INTERNAL
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)
 
-$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
+$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES) target-finalize
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
@@ -86,7 +86,7 @@ rootfs-$(1)-show-depends:
 rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
-TARGETS += rootfs-$(1)
+TARGETS_ROOTFS += rootfs-$(1)
 endif
 endef
 
-- 
1.8.4
