From: Michel Stempin <michel.stempin@wanadoo.fr>
Date: Fri, 16 Mar 2018 08:06:33 +0100
Subject: [Buildroot] [PATCH 1/1] rtl8723bs: Wi-Fi driver is now a Linux
 staging driver
Message-ID: <5ca20c21-0a7f-fb33-8a27-b22988f6b9c3@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rtl8723bs is now a Linux staging driver since kernel 4.12.

The old git commit is used for kernel < 4.12 with patches applied, but
for kernel >= 4.12, the newest commit featuring only binary firmwares
is fetched and only the firmwares are installed into the target
directory.

Getting the kernel version this early in the post-patch hook is only
possible from the configuration, as the kernel is not yet configured
and cannot be probed for the actual version.

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
---
?...3bs-add-debug-level-modparam.patch.conditional} |? 0
?package/rtl8723bs/rtl8723bs.mk???????????????????? | 22 ++++++++++++++++++++++
?2 files changed, 22 insertions(+)
?rename package/rtl8723bs/{0001-rtl8723bs-add-debug-level-modparam.patch => 0001-rtl8723bs-add-debug-level-modparam.patch.conditional} (100%)

diff --git a/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch b/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch.conditional
similarity index 100%
rename from package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch
rename to package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch.conditional
diff --git a/package/rtl8723bs/rtl8723bs.mk b/package/rtl8723bs/rtl8723bs.mk
index 4c6303c..4076968 100644
--- a/package/rtl8723bs/rtl8723bs.mk
+++ b/package/rtl8723bs/rtl8723bs.mk
@@ -4,7 +4,21 @@
?#
?################################################################################
?
+define check-version
+$(shell support/scripts/check-version $(1) $(2))
+endef
+
+#RTL8723BS_NEEDS_SOURCES=$(call check-version,$(BR2_LINUX_KERNEL_VERSION),4.12)
+RTL8723BS_NEEDS_SOURCES=$(shell read -r MAJ MIN \
+??? <<< $$(echo "$(BR2_LINUX_KERNEL_VERSION)" | \
+??? sed -nr 's/[^0-9]*([0-9]+)\.([0-9]+).*/\1 \2/p') && \
+??? [ "0$$MAJ" -lt 4 -o "0$$MAJ" -eq 4 -a "0$$MIN" -lt 12 ] && echo 1 ||echo 0)
+ifeq ($(RTL8723BS_NEEDS_SOURCES),1)
?RTL8723BS_VERSION = 11ab92d8ccd71c80f0102828366b14ef6b676fb2
+else
+RTL8723BS_VERSION = cc77e7b6092c54500058cd027b679421b9399905
+endif
+
?RTL8723BS_SITE = $(call github,hadess,rtl8723bs,$(RTL8723BS_VERSION))
?RTL8723BS_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
?
@@ -16,6 +30,14 @@ RTL8723BS_MODULE_MAKE_OPTS = \
?RTL8723BS_BINS = rtl8723bs_ap_wowlan.bin rtl8723bs_wowlan.bin \
???? rtl8723bs_bt.bin rtl8723bs_nic.bin
?
+define RTL8723BS_CONDITIONAL_PATCH
+??? if [ $(RTL8723BS_NEEDS_SOURCES) -eq 1 ]; then \
+??? ??? $(APPLY_PATCHES) $(@D) package/rtl8723bs 0001-rtl8723bs-add-debug-level-modparam.patch.conditional; \
+??? fi;
+endef
+
+RTL8723BS_POST_PATCH_HOOKS += RTL8723BS_CONDITIONAL_PATCH
+
?define RTL8723BS_INSTALL_FIRMWARE
???? $(foreach bin, $(RTL8723BS_BINS), \
???? ??? $(INSTALL) -D -m 644 $(@D)/$(bin) $(TARGET_DIR)/lib/firmware/rtlwifi/$(bin)
-- 
2.7.4
