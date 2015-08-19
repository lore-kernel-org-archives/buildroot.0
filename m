From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 19 Aug 2015 15:14:36 +0200
Subject: [Buildroot] [PATCH v1 2/2] xtables-addons: test CONFIG_MODULES=y in
	the kernel
In-Reply-To: <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
References: <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1439990076-10412-3-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package builds several loadable modules for the Linux
kernel. There are in-kernel defconfigs that does not enable
the CONFIG_MODULES by default. Thus, a build of xtables-addons
should fail for such incompatible kernel configuration.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/xtables-addons/xtables-addons.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 75e2a5a..9450ebb 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -22,6 +22,11 @@ define XTABLES_DISABLE_GEOIP_HELPERS
 endef
 XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_DISABLE_GEOIP_HELPERS
 
+define XTABLES_ASSERT_CONFIG_MODULES
+	$(call KCONFIG_ASSERT_OPT,CONFIG_MODULES,y,$(LINUX_DIR)/.config)
+endef
+XTABLES_ADDONS_PRE_CONFIGURE_HOOKS += XTABLES_ASSERT_CONFIG_MODULES
+
 define XTABLES_ADDONS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
 endef
-- 
2.5.0
