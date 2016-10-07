From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 7 Oct 2016 15:45:04 -0700
Subject: [Buildroot] [PATCH] boot-wrapper-aarch64: Allow users to select the
	PSCI SMP boot method
In-Reply-To: <1475880304-21773-1-git-send-email-hollis_blanchard@mentor.com>
References: <1475880304-21773-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <1475880304-21773-3-git-send-email-hollis_blanchard@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 boot/boot-wrapper-aarch64/Config.in               |    7 +++++++
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk |    4 ++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
index 2563f58..7469727 100644
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -40,4 +40,11 @@ config BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK
 	  linux,initrd-start and linux,initrd-end properties in the /chosen device
 	  tree node.
 
+config BR2_TARGET_BOOT_WRAPPER_AARCH64_PSCI
+	bool "Boot secondary SMP cores using PSCI"
+	default n
+	help
+	  Boot secondary SMP cores using PSCI firmware calls. If n, use the spin-table
+	  method instead.
+
 endif
diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 28b2061..0df0859 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -34,6 +34,10 @@ ifneq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK),)
 	BOOT_WRAPPER_AARCH64_CONF_OPTS += --with-initrd=$(BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK)
 endif
 
+ifeq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_PSCI),y)
+	BOOT_WRAPPER_AARCH64_CONF_OPTS += --enable-psci
+endif
+
 # We need to convince the configure script that the Linux kernel tree
 # exists, as well as the DTB and the kernel Image. Even though those
 # are available on the build machine, the configure script uses
-- 
1.7.1
