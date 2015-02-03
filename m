From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2015 15:21:45 +0100
Subject: [Buildroot] [PATCH 05/10] kconfig infra: only provide foo-*config
	targets when the package is enabled
In-Reply-To: <cover.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <01470716444a12b459620b45c8d89ee7a2ef7c28.1422972638.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. Morin" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/pkg-kconfig.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8e68315..04ac37d 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -66,6 +66,12 @@ $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 # Before running configure, the configuration file should be present and fixed
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 
+# Only enable the foo-*config targets when the package is actually enabled.
+# Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig
+# infrastructure, but defined by pkg-generic.mk. The generic infrastructure is
+# already called above, so we can effectively use this variable.
+ifeq ($$($$($(2)_KCONFIG_VAR)),y)
+
 # Configuration editors (menuconfig, ...)
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
@@ -92,6 +98,8 @@ $(1)-update-defconfig: $(1)-savedefconfig
 	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
 	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
+endif # package enabled
+
 endef # inner-kconfig-package
 
 ################################################################################
-- 
1.9.1
