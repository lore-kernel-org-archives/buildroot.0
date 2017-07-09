From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun,  9 Jul 2017 05:22:01 -0700
Subject: [Buildroot] [PATCH v2 7/7] uboot: apply xtensa overlay
In-Reply-To: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1499602921-25097-8-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xtensa core configuration must be added to U-Boot before it can be
built for that xtensa CPU variant. Extract configuration files from the
xtensa overlay as is done for other packages that need to be configured
for a specific xtensa core.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- replace ARCH_XTENSA_CORE_NAME with ARCH_XTENSA_OVERLAY_FILE in overlay
  application conditions in package makefile;
- add ARCH_XTENSA_OVERLAY_URL to EXTRA_DOWNLOADS in package makefile.

 arch/arch.mk.xtensa | 3 ++-
 boot/uboot/uboot.mk | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 8841b4f9d363..c529902517ea 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -23,7 +23,8 @@ endif
 # arch-xtensa-overlay-extract -- extract an extensa overlay
 #
 # argument 1 is the path in which to extract
-# argument 2 is the component to extract, one of: gcc, binutils, gdb, linux
+# argument 2 is the component to extract, one of: gcc, binutils, gdb, linux,
+#            u-boot
 #
 # Example:
 #   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 605859c90c56..73d72630b23a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -153,6 +153,14 @@ endef
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
+ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
+define UBOOT_XTENSA_OVERLAY_EXTRACT
+	$(call arch-xtensa-overlay-extract,$(@D),u-boot)
+endef
+UBOOT_POST_EXTRACT_HOOKS += UBOOT_XTENSA_OVERLAY_EXTRACT
+UBOOT_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
+endif
+
 # Analogous code exists in linux/linux.mk. Basically, the generic
 # package infrastructure handles downloading and applying remote
 # patches. Local patches are handled depending on whether they are
-- 
2.1.4
