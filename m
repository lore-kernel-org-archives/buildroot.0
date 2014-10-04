From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 18:54:54 +0200
Subject: [Buildroot] [git commit] packages: rename FOO_KCONFIG_OPT into
	FOO_KCONFIG_OPTS
Message-ID: <20141004170454.2932F9D584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=146f7dc4959589cbd64b92da4a6f24972f271978
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_KCONFIG_OPT.

Sed command used:
   find * -type f | xargs sed -i 's#_KCONFIG_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-kconfig.txt |    2 +-
 package/busybox/busybox.mk              |    2 +-
 package/pkg-kconfig.mk                  |    6 +++---
 package/uclibc/uclibc.mk                |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index 979a2b5..e87d393 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -46,7 +46,7 @@ be set to suit the needs of the package under consideration:
 * +FOO_KCONFIG_EDITORS+: a space-separated list of kconfig editors to
   support, for example 'menuconfig xconfig'. By default, 'menuconfig'.
 
-* +FOO_KCONFIG_OPT+: extra options to pass when calling the kconfig
+* +FOO_KCONFIG_OPTS+: extra options to pass when calling the kconfig
   editors. This may need to include '$(FOO_MAKE_OPTS)', for example. By
   default, empty.
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c748732..73a99fb 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -47,7 +47,7 @@ endif
 
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
-BUSYBOX_KCONFIG_OPT = $(BUSYBOX_MAKE_OPTS)
+BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
 define BUSYBOX_PERMISSIONS
 /bin/busybox			 f 4755	0 0 - - - - -
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index cd08c1a..071153a 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -33,7 +33,7 @@ $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 # Default values
 $(2)_KCONFIG_EDITORS ?= menuconfig
-$(2)_KCONFIG_OPT ?=
+$(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
 # FOO_KCONFIG_FILE is required
@@ -51,7 +51,7 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPT) oldconfig
+		$$($(2)_KCONFIG_OPTS) oldconfig
 	$$(Q)touch $$@
 
 # Before running configure, the configuration file should be present and fixed
@@ -60,7 +60,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 # Configuration editors (menuconfig, ...)
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
+		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 5933973..1469f8d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -39,7 +39,7 @@ endif
 
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 
-UCLIBC_KCONFIG_OPT = \
+UCLIBC_KCONFIG_OPTS = \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
