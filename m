From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 08:18:27 -0600
Subject: [Buildroot] [PATCH v3 14/27] busybox: added linux-pam support
In-Reply-To: <1420813120-50848-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420813120-50848-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420813120-50848-15-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <Matthew.Weber@rockwellcollins.com>

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/busybox/busybox.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7232996..8947593 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -193,10 +193,19 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define BUSYBOX_LINUX_PAM
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
+endef
+BUSYBOX_DEPENDENCIES += linux-pam
+endif
+
 ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
 BUSYBOX_DEPENDENCIES += host-pkgconf libselinux libsepol
 define BUSYBOX_SET_SELINUX
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SELINUX,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SELINUXENABLED,$(BUSYBOX_BUILD_CONFIG))
+
 endef
 endif
 
@@ -234,6 +243,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_CRYPT_SHA)
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
+	$(BUSYBOX_LINUX_PAM)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
-- 
1.9.1
