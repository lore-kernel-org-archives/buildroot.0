From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:24 -0500
Subject: [Buildroot] [PATCH v5 11/24] busybox: added linux-pam support
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-12-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <Matthew.Weber@rockwellcollins.com>

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
Changes v4 -> v5:
  - No changes

Changes v1 -> v4:
  - Did not exist
---
 package/busybox/busybox.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f60e3f2..4ef099a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -171,6 +171,13 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
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
@@ -211,6 +218,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_SET_CRYPT_SHA)
+	$(BUSYBOX_LINUX_PAM)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
-- 
1.9.1
