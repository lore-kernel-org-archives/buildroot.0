From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Oct 2015 13:53:16 -0500
Subject: [Buildroot] [PATCH v2] uboot: arm64 arch build support
Message-ID: <1444675996-17536-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ronak Desai <ronak.desai@rockwellcollins.com>

For a 64bit arm architecture, Buildroot uses arm64 terminology
and from the top-level Makefile KERNEL_ARCH is set to
arm64 which is then passed to the uboot build.
This causes a compilation issue as uboot uses the top-level
system architecture as it's $(ARCH).  So arch/$(ARCH)/Makefile
doesn't work with arm64 unless we adjust the arch.

Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 boot/uboot/uboot.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index eee0dba..d5cfd60 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -71,7 +71,17 @@ UBOOT_BIN = u-boot.bin
 UBOOT_BIN_IFT = $(UBOOT_BIN).ift
 endif
 
+# For a 64bit arm architecture, Buildroot uses arm64 terminology
+# and from the top-level Makefile KERNEL_ARCH is set to
+# arm64 which is then passed to the uboot build.
+# This causes a compilation issue as uboot uses the top-level
+# system architecture as it's $(ARCH).  So arch/$(ARCH)/Makefile
+# doesn't work with arm64 unless we adjust the arch.
+ifeq ($(KERNEL_ARCH),arm64)
+UBOOT_ARCH = arm
+else
 UBOOT_ARCH = $(KERNEL_ARCH)
+endif
 
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-- 
1.9.1
