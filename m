From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Aug 2014 19:20:14 +0200
Subject: [Buildroot] [PATCH 1/2] infra/pkg-kconfig: join comments to the
	related code-block
In-Reply-To: <cover.1407172590.git.yann.morin.1998@free.fr>
References: <cover.1407172590.git.yann.morin.1998@free.fr>
Message-ID: <8707d68b95f8b6792e5aac8870307f2fa99036fd.1407172590.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some one-line comment apply to equally-onel-line code blocks, and thus
the current layout is a bit hard to handle visually.

Remove empty lines between the comments and their respective related
code blocks.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 5220fdf..8b777f1 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -32,36 +32,30 @@ define inner-kconfig-package
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 # Default values
-
 $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPT ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
 # FOO_KCONFIG_FILE is required
-
 ifndef $(2)_KCONFIG_FILE
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
 # The .config file is obtained by copying it from the specified source
 # configuration file, after the package has been patched.
-
 $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
 	$$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
 
 # In order to get a usable, consistent configuration, some fixup may be needed.
 # The exact rules are specified by the package .mk file.
-
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	$$(Q)touch $$@
 
 # Before running configure, the configuration file should be present and fixed
-
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 
 # Configuration editors (menuconfig, ...)
-
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
@@ -69,7 +63,6 @@ $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_
 	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
 
 # Target to copy back the configuration to the source configuration file
-
 $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
 
-- 
1.9.1
