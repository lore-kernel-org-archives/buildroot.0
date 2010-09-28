From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 00:15:10 +0200
Subject: [Buildroot] [PATCH 1/2] linux: restrict output image formats to the
	appropriate arches
In-Reply-To: <cover.1285712084.git.thomas.petazzoni@free-electrons.com>
References: <cover.1285712084.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b626dc0791002d61f47c53b619fcba048c40171d.1285712084.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some Linux kernel output image formats are available on some archs,
some not. For example 'uImage' is not supported on MIPS, so let's
prevent the user from making this selection.

Issue initially reported by Choi, David <David.Choi@Micrel.Com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |   10 ++++++----
 linux/linux.mk  |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a7109a5..1e015b7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -111,20 +111,22 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 
 choice
 	prompt "Kernel binary format"
-	default BR2_LINUX_KERNEL_UIMAGE if !BR2_i386 && !BR2_x86_64
-	default BR2_LINUX_KERNEL_BZIMAGE if BR2_i386 || BR2_x86_64
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
+	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
+	depends on BR2_i386 || BR2_x86_64
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
+	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || BR2_sh || BR2_sh64 || BR2_xtensa
 
-config BR2_LINUX_KERNEL_VMLINUX
-	bool "vmlinux"
+config BR2_LINUX_KERNEL_VMLINUX_BIN
+	bool "vmlinux.bin"
+	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
 
 endchoice
 
diff --git a/linux/linux.mk b/linux/linux.mk
index aabecc1..4490023 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -38,7 +38,7 @@ else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX26_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX26_IMAGE_NAME=zImage
-else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX26_IMAGE_NAME=vmlinux.bin
 endif
 
-- 
1.7.0.4
