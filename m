From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Tue, 09 Nov 2010 07:50:05 -0800
Subject: [Buildroot] Buildroot Patches I Use [2] - Build In Stages
Message-ID: <1289317805.30565.114.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is handy if you want to build in two stages.  The first stage
is to build up to before generating the rootfs.  Then you could run
other programs, scripts etc to generate stuff externally and add them to
your target area.  Then the second stage generates the rootfs images.

This is handy for cases where you want to use an external set of scripts
to drive the build process but have buildroot do some of the work so
that you don't have to reinvent as many wheels.

I am not sure if this would be appropriate for 2010.11 (already in
release candidate phase), but here it is for any who may find it useful.


Signed-off by: Darcy Watkins <dwatkins@tranzeo.com>


Index: buildroot-2010.11_powerpc/Makefile
===================================================================
--- buildroot-2010.11_powerpc.orig/Makefile
+++ buildroot-2010.11_powerpc/Makefile
@@ -319,10 +319,12 @@ include fs/common.mk
 
 TARGETS+=erase-fakeroots
 
-TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
-TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
-TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
+TARGETS_ROOTFS_CLEAN:=$(patsubst %,%-clean,$(ROOTFS_TARGETS))
+TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS) $(ROOTFS_TARGETS))
+TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(ROOTFS_TARGETS) $(BASE_TARGETS))
+TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS) $(ROOTFS_TARGETS))
+TARGETS_ALL_BUT_ROOTFS:=$(patsubst %,__real_tgt_%,$(TARGETS))
+TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS) $(ROOTFS_TARGETS))
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
@@ -336,11 +338,12 @@ $(BUILD_DIR)/buildroot-config/auto.conf:
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
+all_but_rootfs: prepare dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS_ALL_BUT_ROOTFS)
 
+world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 
 .PHONY: all world dirs clean distclean source outputmakefile \
-	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
+	$(BASE_TARGETS) $(TARGETS) $(ROOTFS_TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
@@ -573,7 +576,14 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+rootfsclean: $(TARGETS_ROOTFS_CLEAN)
+	rm -rf $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root
+
 clean:
+	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR)
+
+dirclean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR)
 
Index: buildroot-2010.11_powerpc/fs/common.mk
===================================================================
--- buildroot-2010.11_powerpc.orig/fs/common.mk
+++ buildroot-2010.11_powerpc/fs/common.mk
@@ -67,7 +67,7 @@ $(1)-root-show-depends:
 $(1)-root: $(BINARIES_DIR)/rootfs.$(1) $(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
-TARGETS += $(1)-root
+ROOTFS_TARGETS += $(1)-root
 endif
 endef
 
