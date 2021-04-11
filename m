From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Apr 2021 21:46:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix /etc/resolv.conf link
 on per-package build
Message-ID: <20210411194602.994785-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13271

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 41332f207a..74c561e67e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -523,8 +523,7 @@ endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
-	SYSTEMD_INSTALL_MACHINEID_HOOK \
-	SYSTEMD_INSTALL_RESOLVCONF_HOOK
+	SYSTEMD_INSTALL_MACHINEID_HOOK
 
 define SYSTEMD_INSTALL_IMAGES_CMDS
 	$(SYSTEMD_INSTALL_BOOT_FILES)
@@ -556,7 +555,9 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
-SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_INSTALL_NSSCONFIG_HOOK
+SYSTEMD_TARGET_FINALIZE_HOOKS += \
+	SYSTEMD_INSTALL_NSSCONFIG_HOOK \
+	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd provides multiple units to autospawn getty as neede
-- 
2.30.2
