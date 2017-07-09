From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 17:03:45 +0200
Subject: [Buildroot] [git commit] uboot: apply xtensa overlay
Message-ID: <20170709151527.139B6820EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a0a020a2e50ab8e0eabc2575754108fba5e0876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xtensa core configuration must be added to U-Boot before it can be
built for that xtensa CPU variant. Extract configuration files from the
xtensa overlay as is done for other packages that need to be configured
for a specific xtensa core.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 3 ++-
 boot/uboot/uboot.mk | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 7eb6715..2b6cd26 100644
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
index 605859c..73d7263 100644
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
