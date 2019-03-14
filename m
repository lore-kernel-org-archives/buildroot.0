From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:20 +0100
Subject: [Buildroot] [PATCH v2 09/13] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-10-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

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
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/pkg-kconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ce11e14824..5a29490473 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -117,6 +117,7 @@ endef
 # Since the file could be a defconfig file it needs to be expanded to a
 # full .config first.
 $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
+	$$(call prepare-per-package-directory,$$($(2)_KCONFIG_DEPENDENCIES))
 	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
 		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
 		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
-- 
2.21.0
