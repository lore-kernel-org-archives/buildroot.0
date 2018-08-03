From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri,  3 Aug 2018 18:27:54 +0200
Subject: [Buildroot] [PATCH 1/1] linux: build default dtbs if no specific
 source files given
Message-ID: <1533313674-722-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently if one wants to build dtbs, one has to specify which
dts source files to build exactly.
This is inconvenient, and some platforms use non-standard file
names that are currently not supported by buildroot.
(e.g. the overlay files in downstream Raspberry Pi kernel)

Fix this by allowing the DTS source to be left empty,
in which case the standard list of dtbs for the kernel
configuration will be build ("make dtbs") and installed
("make dtbs_install")

Only corner case in which specifying file names is still
required is when appending dtb to kernel.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 linux/Config.in |  4 ++++
 linux/linux.mk  | 14 ++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d30489e..40d337d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -377,6 +377,10 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
+	  If both this option and out-of-tree path is left empty
+	  the default set of dtbs for the kernel configuration
+	  is build.
+
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 7527b11..a00029f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -341,6 +341,15 @@ endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
+ifeq ($(strip $(LINUX_DTS_NAME)),)
+define LINUX_BUILD_DTB
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) dtbs
+endef
+define LINUX_INSTALL_DTB
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
+		INSTALL_DTBS_PATH=$(1) dtbs_install
+endef
+else # LINUX_DTS_NAME
 define LINUX_BUILD_DTB
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
 endef
@@ -353,6 +362,7 @@ define LINUX_INSTALL_DTB
 		$(1)
 endef
 endif # BR2_LINUX_KERNEL_APPENDED_DTB
+endif # LINUX_DTS_NAME
 endif # BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 endif # BR2_LINUX_KERNEL_DTS_SUPPORT
 
@@ -501,8 +511,8 @@ $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUST
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT):$(strip $(LINUX_DTS_NAME)),y:)
-$(error No kernel device tree source specified, check your \
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB):$(strip $(LINUX_DTS_NAME)),y:)
+$(error If appending dtb to kernel, device tree source needs to be specified, check your \
 	BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings)
 endif
 
-- 
2.7.4
