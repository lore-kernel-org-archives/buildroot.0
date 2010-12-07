From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Tue,  7 Dec 2010 18:48:14 +0300
Subject: [Buildroot] [PATCH] The external toolchain can be used statically.
Message-ID: <1291736894-3692-1-git-send-email-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried to build minimal busybox-only project for using as initramfs. I use
external buildroot toolchain. The buildroot copy the .so libraries from
external toolchain to the target dir unconditionally. But I build busybox
statically and don't need shared libraries (the size of resulted image is too
big with unneeded libraries).

The patch use BR2_PREFER_STATIC_LIB to find out if the project prefer
static linking and if the static linking is preferred don't copy shared
libraries to the target dir.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
---
 toolchain/toolchain-external/ext-tool.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 7e4645d..895ef5f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -99,6 +99,7 @@ else
 	$(Q)$(call check_glibc,$(SYSROOT_DIR))
 endif
 	mkdir -p $(TARGET_DIR)/lib
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
 	@echo "Copy external toolchain libraries to target..."
 	$(Q)for libs in $(LIB_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
@@ -106,6 +107,7 @@ endif
 	$(Q)for libs in $(USR_LIB_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/usr/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
+endif
 	@echo "Copy external toolchain sysroot to staging..."
 	$(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR),$(ARCH_SYSROOT_DIR),$(ARCH_SUBDIR))
 	# Create lib64 symbolic links if needed
-- 
1.7.3.3
