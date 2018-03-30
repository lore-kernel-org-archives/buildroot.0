From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 18:46:55 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/linux: drop
 useless intermediate DTS booleans
Message-ID: <20180330193200.DEB8381495@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe8c2831239eae57dc2fb9223fed6158c581979c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Just use whatever the user specified in the list. An empty list means no
DTS was specified.

No need to add legacy option, as the behaviour does not change.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Simon van der Veldt <simon.vanderveldt@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f142f23ecf9ee69326fd6a4387133443513afdd2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 28 ++++++----------------------
 linux/linux.mk  |  4 ----
 2 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bc6cd1b5f7..7aed6f8075 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -363,35 +363,19 @@ config BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 config BR2_LINUX_KERNEL_APPENDED_DTB
 	bool
 
-config BR2_LINUX_KERNEL_USE_INTREE_DTS
-	bool "Use a device tree present in the kernel"
-	help
-	  Use a device tree source distributed with
-	  the kernel sources. The dts files are located
-	  in the arch/<arch>/boot/dts folder.
-
 config BR2_LINUX_KERNEL_INTREE_DTS_NAME
-	string "Device Tree Source file names"
-	depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
+	string "In-tree Device Tree Source file names"
 	help
-	  Name of the device tree source file, without
+	  Name of in-tree device tree source file, without
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
-config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
-	bool "Use a custom device tree file"
-	help
-	  Use a custom device tree file, i.e, a device
-	  tree file that does not belong to the kernel
-	  source tree.
-
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
-	string "Device Tree Source file paths"
-	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
+	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Path to the device tree source files. You can
-	  provide a list of dts paths to copy and build,
-	  separated by spaces.
+	  Path to to out-of-tree device tree source files.
+	  You can provide a list of dts paths to copy and
+	  build, separated by spaces.
 
 endif
 
diff --git a/linux/linux.mk b/linux/linux.mk
index a14a07a485..f24255747f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -118,17 +118,13 @@ endif
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
-ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
-endif
 
-ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
 KERNEL_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
-endif
 
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
