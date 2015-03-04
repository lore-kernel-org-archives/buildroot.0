From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:38:15 +0100
Subject: [Buildroot] [git commit] linux/linux.mk: custom dts path - build
	dtb only from *.dts files
Message-ID: <20150304223848.5BAEC817FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=541d9937d43a5954ba640c9523f6b1e60a4e9040
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building device tree blobs from custom *.dts files, buildroot
initializes KERNEL_DTS_NAME variable from all given file names.
This causes that user can't provide one *.dts file and some other
*.dtsi files as dependencies.

Problem is fixed by adding filter for initializing KERNEL_DTS_NAME
variable with *.dts files only. All user provided files are copied
into kernel source tree, but only file names suffixed with *.dts
are used for building appropriate *.dtb files.

[Thomas: add comment into the code to explain why we are filtering
.dts files only.]

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 78e589e..672ce48 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -68,7 +68,11 @@ LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
-KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
+# We keep only the .dts files, so that the user can specify both .dts
+# and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
+# copied to arch/<arch>/boot/dts, but only the .dts files will
+# actually be generated as .dtb.
+KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
