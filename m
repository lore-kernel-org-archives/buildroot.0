From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Apr 2018 17:52:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: add missing elfutils
 dependency with R600 driver
Message-ID: <20180428155252.27526-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit "add dependency on elfutils for R600 with LLVM" [1] select
elfutils package at Kconfig level without adding it the make dependency.

Enabling r600 support lead to a build issue when building from
scratch with "make mesa3d":
checking for RADEON... yes
configure: error: r600 requires libelf when using llvm

elfutils dependency is needed by r600 with llvm support and radeonSI.

[1] 92fda8761aa8024be53a8edb8c102d1ba6401bce

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/mesa3d/mesa3d.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9857b597cf..2529c7d8e6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -38,6 +38,10 @@ MESA3D_CONF_OPTS += \
 	--with-llvm-prefix=$(STAGING_DIR)/usr \
 	--enable-llvm-shared-libs \
 	--enable-llvm
+# R600 needs libelf when Mesa3D is built with LLVM support
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600),)
+MESA3D_DEPENDENCIES += elfutils
+endif
 else
 # Avoid automatic search of llvm-config
 MESA3D_CONF_OPTS += --disable-llvm
-- 
2.14.3
