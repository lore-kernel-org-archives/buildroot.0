From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:57:22 +0200
Subject: [Buildroot] [git commit] infra/pkg-kconfig: incorporate oldconfig
	call to avoid endless rebuilds
Message-ID: <20140806175859.B08EB9D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdc5ad15887b1f8fd2c604e3ff1d5b80995242af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure step of the busybox package performs 'make oldconfig', which
causes the .config file to be updated. Thus, the .config file is more recent
than our stamp file .stamp_kconfig_fixup_done. On a subsequent build, our
dependency rules would kick in, and run the config fixup again, thus
kicking in the package's configure, build and install steps yet once
more, that, ad infinitum.

One solution is to modify kconfig-package to introduce an explicit touch of
the .kconfig_fixup_config_done stamp file, as post-configure hook.

Another solution, implemented by this patch, is to move the oldconfig call
from the package's .mk file to the kconfig-package infrastructure and make
sure it is done as part of the fixup commands. This way, the stamp file will
only be touched once, after the full fixup (including oldconfig) and no
endless rebuilds will occur.

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    2 --
 package/pkg-kconfig.mk     |    2 ++
 package/uclibc/uclibc.mk   |    6 ------
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index db29636..c748732 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -205,8 +205,6 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
-	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
-		-C $(@D) oldconfig
 	$(BUSYBOX_NOCLOBBER_INSTALL)
 endef
 
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 8b777f1..cd08c1a 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -50,6 +50,8 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
 # The exact rules are specified by the package .mk file.
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 	$$($(2)_KCONFIG_FIXUP_CMDS)
+	@yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$($(2)_KCONFIG_OPT) oldconfig
 	$$(Q)touch $$@
 
 # Before running configure, the configuration file should be present and fixed
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c7203cc..c68dc56 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -431,12 +431,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
 	$(UCLIBC_STRIP_CONFIG)
-	yes "" | $(MAKE1) -C $(@D) \
-		$(UCLIBC_MAKE_FLAGS) \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(STAGING_DIR) \
-		oldconfig
 endef
 
 define UCLIBC_CONFIGURE_CMDS
