From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:21 -0000
Subject: [Buildroot] [git commit] kconfig infra: add support for defconfig
	files
Message-ID: <20150302222717.B1CD2807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39867f3c8cba642cb2dc98b165992a6cc2fa1cb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds support for using a defconfig file instead of a full
.config. This is a precondition to migrate packages like linux and
barebox to the kconfig infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: "Yann E. Morin" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ef724e5..db56b7a 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -47,8 +47,13 @@ $$($(2)_KCONFIG_FILE): | $(1)-patch
 
 # The .config file is obtained by copying it from the specified source
 # configuration file, after the package has been patched.
+# Since the file could be a defconfig file it needs to be expanded to a
+# full .config first. We use 'make oldconfig' because this can be safely
+# done even when the package does not support defconfigs.
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE)
 	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
+	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$($(2)_KCONFIG_OPTS) oldconfig
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
@@ -68,10 +73,22 @@ $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
 
+$(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$($(2)_KCONFIG_OPTS) savedefconfig
+
 # Target to copy back the configuration to the source configuration file
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	cp --preserve=timestamps -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
+# Note: make sure the timestamp of the stored configuration is not newer than
+# the .config to avoid a useless rebuild. Note that, contrary to
+# $(1)-update-config, the reference for 'touch' is _not_ the file from which
+# we copy.
+$(1)-update-defconfig: $(1)-savedefconfig
+	cp -f $$($(2)_DIR)/defconfig $$($(2)_KCONFIG_FILE)
+	touch --reference $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
+
 endef # inner-kconfig-package
 
 ################################################################################
