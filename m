From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jun 2015 13:54:26 +0200
Subject: [Buildroot] [PATCH 4/4] core/pkg-kconfig: allow saving config to a
	non-existing custom config file
In-Reply-To: <cover.1433591404.git.yann.morin.1998@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
Message-ID: <a195692f03dab1f3074825feab277c905379dfa2.1433591404.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A very interesting use-case for a kconfig-based package is to create a
custom (def)config file based on one bundled with the package itself,
like described in PR-8156:

    make menuconfig
     -> enable kernel, use an in-tree defconfig, save and exit
    make linux-menuconfig
     -> enable/disable whatever option, save and exit
    make menuconfig
     -> change to use a custom defconfig file, set a path, save and exit
    make linux-update-config
     -> should save to the new custom defconfig file

However, that is currently not possible, because the dependency chain
when saving the configuration goes back up to the (newly-set!) custom
(def)config file, which does not exist.

So, we break the dependency chain so that saving the configuration does
not depend on that file. Instead, we use a terminal rule that checks
that the configuration has indeed been done, and fails if not.

Closes #8156.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-kconfig.mk | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 6bb2559..453a59d 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -90,9 +90,10 @@ endif
 
 # Configuration editors (menuconfig, ...)
 #
-# Apply the kconfig fixups right after exiting the configurators, so
-# that the user always sees a .config file that is clean wrt. our
-# requirements.
+# We need to apply the configuration fixups right after a configuration
+# editor exits, so that it is possible to save the configuration right
+# after exiting an editor, and so the user always sees a .config file
+# that is clean wrt. our requirements.
 #
 # Because commands in $(1)_FIXUP_KCONFIG are probably using $(@D), we
 # fake it for the configurators (otherwise it is set to just '.', i.e.
@@ -108,14 +109,35 @@ $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
 	$$(call $(1)_FIXUP_KCONFIG)
 
-$(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+# Saving back the configuration
+#
+# Ideally, that should directly depend on $$($(2)_DIR)/.stamp_kconfig_fixup_done,
+# but that breaks the use-case in PR-8156 (from a clean tree):
+#   make menuconfig           <- enable kernel, use an in-tree defconfig, save and exit
+#   make linux-menuconfig     <- enable/disable whatever option, save and exit
+#   make menuconfig           <- change to use a custom defconfig file, set a path, save and exit
+#   make linux-update-config  <- should save to the new custom defconfig file
+#
+# Because of that use-case, saving the configuration can not directly depend
+# on the stamp file, because it itself depends on the .config, which in turn
+# depends on the (newly-set) custom defconfig file.
+#
+# Instead, we use an intermediate rule that will catch that situation.
+#
+$(1)-check-configuration-done:
+	@if [ ! -f $$($(2)_DIR)/.stamp_kconfig_fixup_done ]; then \
+		echo "$(1) is not yet configured"; \
+		exit 1; \
+	fi
+
+$(1)-savedefconfig: $(1)-check-configuration-done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) savedefconfig
 
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
 # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
-$(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+$(1)-update-config: $(1)-check-configuration-done
 	@$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
 		echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)
 	cp -f $$($(2)_DIR)/.config $$($(2)_KCONFIG_FILE)
@@ -137,6 +159,7 @@ endif # package enabled
 	$(1)-update-config \
 	$(1)-update-defconfig \
 	$(1)-savedefconfig \
+	$(1)-check-configuration-done \
 	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
 
 endef # inner-kconfig-package
-- 
1.9.1
