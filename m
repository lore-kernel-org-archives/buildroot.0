From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 15:29:04 +0100
Subject: [Buildroot] [git commit branch/next] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
Message-ID: <20191129143539.7145682938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41ea76711356cd715d27820578510e9e0815e5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The pkg-kconfig infrastructure hijacks the regular chain of build
steps to insert its own step to prepare the configuration of kconfig
packages. This additional step may have dependencies of its own, such
as host-flex, host-bison or toolchain.

In the context of per-package directory support, those dependencies
must be copied to the per-package directory of the current package
prior to doing the config preparation. This commit implements this
logic by adding a call to prepare-per-package-directory at the right
spot.

Reported-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 86d7c14fdb..e435b95bcf 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -143,6 +143,7 @@ $(2)_KCONFIG_RULES = \
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
 $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+	$$(call prepare-per-package-directory,$$($(2)_KCONFIG_DEPENDENCIES))
 	$$(call kconfig-package-merge-config,$(2),$$(@D)/$$($(2)_KCONFIG_DOTCONFIG),\
 		$$($(2)_KCONFIG_FRAGMENT_FILES))
 	$$(Q)touch $$(@D)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)
