From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 11:39:49 +0100
Subject: [Buildroot] [PATCH] linux: add support for Image.gz kernel format
Message-ID: <20210122103949.8867-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

arm64 / riscv supports building a gzip compressed 'Image' format kernel,
which is sometimes useful. From arch/arm64/Makefile:

all:	Image.gz

Image: vmlinux
	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@

Image.%: Image
	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@

(and similar logic for riscv)

Future architectures may or may not copy this logic, so for robustness add
an explicit Image.gz format rather than copying both Image and Image.gz when
the Image format is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++++
 linux/linux.mk  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 4010a9def8..7cef0f3655 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -263,6 +263,10 @@ config BR2_LINUX_KERNEL_IMAGE
 	bool "Image"
 	depends on BR2_aarch64 || BR2_riscv
 
+config BR2_LINUX_KERNEL_IMAGEGZ
+	bool "Image.gz"
+	depends on BR2_aarch64 || BR2_riscv
+
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"
 	depends on BR2_microblaze
diff --git a/linux/linux.mk b/linux/linux.mk
index c2ea0008d7..a212f42c28 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -204,6 +204,8 @@ else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
 LINUX_IMAGE_NAME = simpleImage.$(firstword $(LINUX_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_IMAGE),y)
 LINUX_IMAGE_NAME = Image
+else ifeq ($(BR2_LINUX_KERNEL_IMAGEGZ),y)
+LINUX_IMAGE_NAME = Image.gz
 else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
 LINUX_IMAGE_NAME = linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
-- 
2.20.1
