From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:21 -0000
Subject: [Buildroot] [git commit] kconfig infra: only provide foo-*config
	targets when the package is enabled
Message-ID: <20150302222717.CC785807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f94bf403416ef3d3a9cc40dfbd8063db8f3348
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
