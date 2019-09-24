From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 24 Sep 2019 14:20:06 +0300
Subject: [Buildroot] [PATCH 1/1] linux: add config option to install custom
 dts in in-tree subdir
Message-ID: <20190924112006.22823-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It allows to install custom dts in specified in-tree subdir relative
to arch/{ARCH}/boot/dts. It might be helpful in case custom dts file
uses includes located in vendor's dts folder.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 9 +++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0e3cabf107..f48efbc3fb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -400,6 +400,14 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  You can provide a list of dts paths to copy and
 	  build, separated by spaces.
 
+config BR2_LINUX_KERNEL_CUSTOM_DTS_INTREE_SUBDIR
+	string "Out-of-tree Device Tree Source file in-tree install path"
+	help
+	  Relative path to arch/${ARCH}/boot/dts where install
+	  out-of-tree device tree source files. Some custom Device Tree
+	  source file might need to be located in vendor's subfolder
+	  (arch/arm64/boot/dts/xxx) to include its *.dtsi files.
+
 config BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
 	bool "Build Device Tree with overlay support"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 95bde1aba5..cfbfb7c0b4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -158,11 +158,16 @@ LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-d
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 
+CUSTOM_DTS_INTREE_SUBDIR = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_INTREE_SUBDIR))
+CUSTOM_DTS_INTREE_SUBDIR_PATH = $(if $(CUSTOM_DTS_INTREE_SUBDIR),$(CUSTOM_DTS_INTREE_SUBDIR)/)
+
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_CUSTOM_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+
+LINUX_DTS_NAME += $(addprefix $(CUSTOM_DTS_INTREE_SUBDIR_PATH),$(LINUX_CUSTOM_DTS_NAME))
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
 
@@ -451,7 +456,7 @@ endif
 # issues.
 define LINUX_BUILD_CMDS
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
-		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/$(CUSTOM_DTS_INTREE_SUBDIR_PATH)
 	)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-- 
2.17.1
