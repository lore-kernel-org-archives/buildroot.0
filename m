From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  5 Nov 2019 17:46:43 +0100
Subject: [Buildroot] [PATCH next v8 4/6] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
In-Reply-To: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191105164646.23820-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.21.0
