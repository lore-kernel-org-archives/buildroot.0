From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Oct 2015 10:49:14 -0500
Subject: [Buildroot] [PATCH 1/1] [arm64 uboot] Resolved compilation issue
	for arm64 uboot
Message-ID: <1444664954-64180-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ronak Desai <ronak.desai@rockwellcollins.com>

This patch has been added to resolve the compilation issue
of arm64 uboot.

For aarch64 architecture, kernel uses arm64 terminology and thus from
top-level Makefile KERNEL_ARCH is modified to arm64 for aarch64 which
then passed to uboot compilation. But, it causes compilation issue
while including architecture specific Makefile under
arch/$(ARCH)/Makefile as uboot uses top-level system architecture as
arm only.

Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 boot/uboot/uboot.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fd29cea..21314c1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -71,7 +71,16 @@ UBOOT_BIN = u-boot.bin
 UBOOT_BIN_IFT = $(UBOOT_BIN).ift
 endif
 
+# For aarch64 architecture, kernel uses arm64 terminology and thus from
+# # top-level Makefile KERNEL_ARCH is modified to arm64 for aarch64 which
+# # then passed to uboot compilation. But, it causes compilation issue
+# # while including architecture specific Makefile under arch/$(ARCH)/Makefile
+# # as uboot uses top-level system architecture as arm only.
+ifeq ($(KERNEL_ARCH),arm64)
+UBOOT_ARCH = arm
+else
 UBOOT_ARCH = $(KERNEL_ARCH)
+endif
 
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-- 
1.9.1
