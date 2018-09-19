From: philip.a.molloy at gmail.com <philip.a.molloy@gmail.com>
Date: Wed, 19 Sep 2018 07:49:24 -0400
Subject: [Buildroot] [PATCH 1/1] system/Config.in: specify root shell
Message-ID: <20180919114924.8456-1-philip.a.molloy@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Philip Molloy <philip.a.molloy@gmail.com>

Signed-off-by: Philip Molloy <philip.a.molloy@gmail.com>
---
 package/skeleton-init-common/skeleton-init-common.mk |  6 ++++++
 system/Config.in                                     | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index e8a0522052..bddb614127 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -38,6 +38,7 @@ SKELETON_INIT_COMMON_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 SKELETON_INIT_COMMON_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 SKELETON_INIT_COMMON_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
 SKELETON_INIT_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
+SKELETON_INIT_COMMON_ROOT_SHELL = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_SHELL))
 SKELETON_INIT_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
 
 ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),)
@@ -74,6 +75,11 @@ define SKELETON_INIT_COMMON_SET_ROOT_PASSWD
 endef
 SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_ROOT_PASSWD
 
+define SKELETON_INIT_COMMON_SET_ROOT_SHELL
+$(SED) 's,^\(root:.*:\).*,\1$(SKELETON_INIT_COMMON_ROOT_SHELL),' $(TARGET_DIR)/etc/passwd
+endef
+SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_ROOT_SHELL
+
 ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
 define SKELETON_INIT_COMMON_SET_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
diff --git a/system/Config.in b/system/Config.in
index f63f27b126..ec8fbe0251 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -407,6 +407,16 @@ config BR2_SYSTEM_DHCP
 comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd"
 	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD)
 
+config BR2_TARGET_GENERIC_ROOT_SHELL
+	string "Root shell"
+	default "/bin/sh"
+	help
+	  Set the root login shell.
+
+	  Explicitly defining the root login shell in /etc/passwd may be required
+	  when symlinking /bin/sh to bash because invocating bash as sh causes bash
+	  to mimic sh (see INVOCATION in bash(1)).
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ENABLE_LOCALE_PURGE
-- 
2.17.1
