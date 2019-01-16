From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 23:36:54 +0100
Subject: [Buildroot] [git commit] package/pkg-kconfig: pass HOSTCC during
 kconfig steps
Message-ID: <20190116224025.DF8C48DF1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28aa05dd9501cfcbd21d42c5f7c5840c7d998bca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kconfig build logic uses the HOSTCC variable to find the host
compiler. It makes sense to explicitly pass a value to this variable,
pointing to the host compiler used by Buildroot.

During the kconfig step, host-ccache is not ready (host-ccache is only
a dependency to the configure step of packages), so we use
$(HOSTCC_NOCCACHE).

Packages currently using the kconfig-package fell into two categories:

 - Those not passing any HOSTCC value. For such packages, it was the
   default host compiler detected by the kconfig build logic that was
   used. ccache was therefore never used. With this commit, those
   packages will now be using the host compiler detected by
   Buildroot. Packages in this situation: at91bootstrap3, barebox,
   busybox, swupdate, uclibc, xvisor.

 - Those passing a HOSTCC value. Such packages were passing $(HOSTCC),
   which doesn't work as host-ccache will not be ready. This commit
   does not fix them, as they still override HOSTCC. It will be fixed
   in followup commits. Packages in this situation: uboot and
   linux. Note that linux was a bit special, because it has a
   KCONFIG_DEPENDENCIES on the toolchain package, so in fact
   host-ccache was ready.

So practically speaking, this commit does not fix anything, as the two
only problematic packages that use $(HOSTCC) are not fixed. However,
it makes things more correct by explicitly telling kconfig which
compiler to use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kconfig.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index d6c95b897e..ce11e14824 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -27,6 +27,9 @@ define kconfig-package-update-config
 	$(Q)touch --reference $($(PKG)_DIR)/$($(PKG)_KCONFIG_DOTCONFIG) $($(PKG)_KCONFIG_FILE)
 endef
 
+PKG_KCONFIG_COMMON_OPTS = \
+	HOSTCC=$(HOSTCC_NOCCACHE)
+
 ################################################################################
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
@@ -79,7 +82,8 @@ $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch
 	done
 
 $(2)_KCONFIG_MAKE = \
-	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) $$($(2)_KCONFIG_OPTS)
+	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
 # $(2)_KCONFIG_MAKE may already rely on shell expansion. As the $() syntax
 # of the shell conflicts with Make's own syntax, this means that backticks
@@ -195,7 +199,7 @@ $(2)_CONFIGURATOR_MAKE_ENV = \
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
 $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	$$($(2)_CONFIGURATOR_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPTS) $$(*)
+		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS) $$(*)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
 	$$($(2)_FIXUP_DOT_CONFIG)
@@ -224,7 +228,7 @@ $(1)-check-configuration-done:
 
 $(1)-savedefconfig: $(1)-check-configuration-done
 	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
-		$$($(2)_KCONFIG_OPTS) savedefconfig
+		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS) savedefconfig
 
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
