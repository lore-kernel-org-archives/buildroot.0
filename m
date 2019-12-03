From: Jan Kotas <jank@cadence.com>
Date: Tue, 3 Dec 2019 04:18:14 -0500
Subject: [Buildroot] [PATCH v2 2/3] boot/boot-wrapper-aarch64: improve dtb
 handling
In-Reply-To: <20191203091815.22668-1-jank@cadence.com>
References: <20191203091815.22668-1-jank@cadence.com>
Message-ID: <20191203091815.22668-3-jank@cadence.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch improves the DTB handling, using a parameter
in more recent versions of the bootwrapper.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 3383cb58a..b0bba7a4d 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -15,19 +15,11 @@ BOOT_WRAPPER_AARCH64_INSTALL_IMAGES = YES
 # Makefile.
 BOOT_WRAPPER_AARCH64_AUTORECONF = YES
 
-BOOT_WRAPPER_AARCH64_DTB = /arch/arm64/boot/dts/$(basename $(call qstrip,$(BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS))).dtb
-
-# Fixup the path to the DTB in configure.ac. In the future, this
-# should hopefully be made more configurable by the
-# boot-wrapper-aarch64 developers.
-define BOOT_WRAPPER_AARCH64_FIX_DTB_NAME
-	$(SED) 's%^KERN_DTB=.*%KERN_DTB=$(BOOT_WRAPPER_AARCH64_DTB)%' $(@D)/configure.ac
-endef
-
-BOOT_WRAPPER_AARCH64_PRE_PATCH_HOOKS += BOOT_WRAPPER_AARCH64_FIX_DTB_NAME
+BOOT_WRAPPER_AARCH64_DTB = $(LINUX_DIR)/arch/arm64/boot/dts/$(basename $(call qstrip,$(BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS))).dtb
 
 BOOT_WRAPPER_AARCH64_CONF_OPTS = \
 	--with-kernel-dir=$(LINUX_DIR) \
+	--with-dtb=$(BOOT_WRAPPER_AARCH64_DTB) \
 	--with-cmdline=$(BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS)
 
 ifeq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_PSCI),y)
-- 
2.18.0
