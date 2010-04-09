From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/common: do not use IMAGE
Message-ID: <20100409142131.F3D9420E6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d2b07919ac2ffe94053ac6eef6bf4367b86dc139
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/common.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/common.mk b/target/common.mk
index c7eff74..cebe8c3 100644
--- a/target/common.mk
+++ b/target/common.mk
@@ -31,8 +31,8 @@ FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 
 define ROOTFS_TARGET_INTERNAL
 
-$(IMAGE).$(1): $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
-	@$(call MESSAGE,"Generating root filesystem image $(IMAGE).$(1)")
+$(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
+	@$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
 	rm -f $(FAKEROOT_SCRIPT)
 	touch $(BUILD_DIR)/.fakeroot.00000
@@ -56,7 +56,7 @@ ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
 	$(LZMA) -9 -c $$@ > $$@.lzma
 endif
 
-$(1)-root: $(IMAGE).$(1)
+$(1)-root: $(BINARIES_DIR)/rootfs.$(1)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS += $(1)-root
@@ -65,4 +65,4 @@ endef
 
 define ROOTFS_TARGET
 $(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
-endef
\ No newline at end of file
+endef
-- 
1.6.3.3
