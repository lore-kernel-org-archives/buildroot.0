From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 27 Sep 2014 21:32:47 +0200
Subject: [Buildroot] [PATCH 10 of 15] packages: rename FOO_KCONFIG_OPT into
 FOO_KCONFIG_OPTS
In-Reply-To: <patchbomb.1411846357@localhost>
References: <patchbomb.1411846357@localhost>
Message-ID: <171cca88259c1ad05eb0.1411846367@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_KCONFIG_OPT.

Sed command used:
   find * -type f | xargs sed -i 's#_KCONFIG_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch

 docs/manual/adding-packages-kconfig.txt |  2 +-
 package/busybox/busybox.mk              |  2 +-
 package/pkg-kconfig.mk                  |  6 +++---
 package/uclibc/uclibc.mk                |  2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -46,7 +46,7 @@
 * +FOO_KCONFIG_EDITORS+: a space-separated list of kconfig editors to
   support, for example 'menuconfig xconfig'. By default, 'menuconfig'.
 
-* +FOO_KCONFIG_OPT+: extra options to pass when calling the kconfig
+* +FOO_KCONFIG_OPTS+: extra options to pass when calling the kconfig
   editors. This may need to include '$(FOO_MAKE_OPTS)', for example. By
   default, empty.
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -47,7 +47,7 @@
 
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
-BUSYBOX_KCONFIG_OPT = $(BUSYBOX_MAKE_OPTS)
+BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
 define BUSYBOX_PERMISSIONS
 /bin/busybox			 f 4755	0 0 - - - - -
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -33,7 +33,7 @@
 
 # Default values
 $(2)_KCONFIG_EDITORS ?= menuconfig
-$(2)_KCONFIG_OPT ?=
+$(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
 # FOO_KCONFIG_FILE is required
@@ -51,7 +51,7 @@
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 	$$($(2)_KCONFIG_FIXUP_CMDS)
 	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPT) oldconfig
+		$$($(2)_KCONFIG_OPTS) oldconfig
 	$$(Q)touch $$@
 
 # Before running configure, the configuration file should be present and fixed
@@ -60,7 +60,7 @@
 # Configuration editors (menuconfig, ...)
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPT) $$(subst $(1)-,,$$@)
+		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -39,7 +39,7 @@
 
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 
-UCLIBC_KCONFIG_OPT = \
+UCLIBC_KCONFIG_OPTS = \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
