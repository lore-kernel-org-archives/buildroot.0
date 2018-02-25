From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 25 Feb 2018 17:19:11 +0100
Subject: [Buildroot] [git commit] linux: allow both in-tree and custom dts
 files
Message-ID: <20180305200717.6540681EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=382fe9f9261812682eab2d35e47aa94dc554380e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some boards, for example the Raspberry Pi, it's necessary to build
in-tree dts files as well as custom/out of tree dts-files (dt-blob.bin).
The existing logic made these two options exclusive, this commit changes
that to allow both in-tree as well as custom sources for dts files.

Signed-off-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
[Arnout: re-wrap help, add extra empty line, change = into +=]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in | 19 +++++++------------
 linux/linux.mk  |  8 +++++---
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1bc8171291..80e85b9e8b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -363,10 +363,6 @@ config BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 config BR2_LINUX_KERNEL_APPENDED_DTB
 	bool
 
-choice
-	prompt "Device tree source"
-	default BR2_LINUX_KERNEL_USE_INTREE_DTS
-
 config BR2_LINUX_KERNEL_USE_INTREE_DTS
 	bool "Use a device tree present in the kernel"
 	help
@@ -374,14 +370,6 @@ config BR2_LINUX_KERNEL_USE_INTREE_DTS
 	  the kernel sources. The dts files are located
 	  in the arch/<arch>/boot/dts folder.
 
-config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
-	bool "Use a custom device tree file"
-	help
-	  Use a custom device tree file, i.e, a device
-	  tree file that does not belong to the kernel
-	  source tree.
-endchoice
-
 config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	string "Device Tree Source file names"
 	depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
@@ -390,6 +378,13 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
+config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	bool "Use a custom device tree file"
+	help
+	  Use a custom device tree file, i.e, a device
+	  tree file that does not belong to the kernel
+	  source tree.
+
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
diff --git a/linux/linux.mk b/linux/linux.mk
index 776304e730..ab940e7305 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -119,13 +119,15 @@ endif
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
-KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
-else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
+KERNEL_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+KERNEL_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 endif
 
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
