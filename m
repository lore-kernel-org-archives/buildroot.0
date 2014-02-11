From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 14:59:16 +0100
Subject: [Buildroot] [git commit] busybox: ensure SHA passwords are
	supported if used
Message-ID: <20140211140120.95D389C987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a37930a5badda86a2ca6be3bac88811a796b5e7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on IRC, our default busybox configuration doesn't support SHA
encoded passwords, breaking login if enabled under system configuration.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 948f3e4..2a8e616 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -75,6 +75,13 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+# sha passwords need USE_BB_CRYPT_SHA
+ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256)$(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
+define BUSYBOX_SET_CRYPT_SHA
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_CRYPT_SHA,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 ifeq ($(BR2_USE_MMU),y)
 define BUSYBOX_SET_MMU
 	$(call KCONFIG_DISABLE_OPT,CONFIG_NOMMU,$(BUSYBOX_BUILD_CONFIG))
@@ -182,6 +189,7 @@ define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_IPV6)
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
+	$(BUSYBOX_SET_CRYPT_SHA)
 	$(BUSYBOX_NETKITBASE)
 	$(BUSYBOX_NETKITTELNET)
 	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
