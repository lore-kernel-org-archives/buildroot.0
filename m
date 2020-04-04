From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:14 +0200
Subject: [Buildroot] [PATCH 02/22] core/pkg-utils: kconfig mangling defaults
 to current package's .config
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <14c3b30890f0dbccd6954e9e6c88de483b321b65.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kconfig mangling macros currently operate on the caller-supplied
.config file, on the assumption that the caller will always know what
file to mangle.

This was correct so far, as packages would indeed only mangle their own
.config files.

However, the linux kernel does its mangling based on whether some
packages are enabled or not. That list of conditional mangling is
getting bigger and bigger with each new package that needs such
mangling, culminating with the pending firewalld one [0]. Furthermore,
this mangling is not accessible to packages in br2-external trees. So
we'll want to have packages provide the mangling commands.

So we'll want the mangling to be done on the linux' .config file,,i.e.
and the expanding package context, not in the package calling the
macros.

But packages do not, and should not have knowledge about where the
.config file is, nor how it is named.

So we make the parameter to specify the .config file to mangle optional.
If it is set, this is what the macros will mangle; if it is not set, the
expanding packge's .config file will be used.

This has the added benefit that we do not have to repeat in the
exp[anding package context the knowledge of how the .config file is
named:

    FOO_KCONFIG_DOTCONFIG = .config
    define FOO_KCONFIG_FIXUPS_CMDS
        $(call KCONFIG_ENABLE_OPT,BLA,$(@D)/.config)
    endef

[0] http://lists.busybox.net/pipermail/buildroot/2020-March/278683.html

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kconfig.mk |  2 ++
 package/pkg-utils.mk   | 19 +++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index e2d52ee8ed..9d65b21ec5 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -166,6 +166,7 @@ define $(2)_FIXUP_DOT_CONFIG
 	$$(Q)touch $$($(2)_DIR)/.stamp_kconfig_fixup_done
 endef
 
+$$($(2)_DIR)/.stamp_kconfig_fixup_done: PKG=$(2)
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
 	$$($(2)_FIXUP_DOT_CONFIG)
 
@@ -223,6 +224,7 @@ $(2)_CONFIGURATOR_MAKE_ENV = \
 # end up having a valid @D.
 #
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
+$$($(2)_DIR)/.kconfig_editor_%: PKG=$(2)
 $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_CONFIGURATOR_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS) $$(*)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 91a492588e..6b254235ec 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -11,17 +11,24 @@
 # package, and more.
 #
 
-# KCONFIG_MUNGE_DOT_CONFIG (option, newline, file)
+# KCONFIG_DOT_CONFIG ([file])
+KCONFIG_DOT_CONFIG = $(strip \
+	$(if $(strip $(1)), $(1), \
+		$($(PKG)_BUILDDIR)/$($(PKG)_KCONFIG_DOTCONFIG) \
+	) \
+)
+
+# KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
 define KCONFIG_MUNGE_DOT_CONFIG
-	$(SED) "/\\<$(strip $(1))\\>/d" $(strip $(3))
-	echo '$(strip $(2))' >> $(strip $(3))
+	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
+	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
 endef
 
-# KCONFIG_ENABLE_OPT (option, file)
+# KCONFIG_ENABLE_OPT (option [, file])
 KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
-# KCONFIG_SET_OPT (option, value, file)
+# KCONFIG_SET_OPT (option, value [, file])
 KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
-# KCONFIG_DISABLE_OPT  (option, file)
+# KCONFIG_DISABLE_OPT  (option [, file])
 KCONFIG_DISABLE_OPT = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
 
 # Helper functions to determine the name of a package and its
-- 
2.20.1
