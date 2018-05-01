From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:57:24 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add missing elfutils
 dependency with R600 and RadeonSI driver
Message-ID: <20180501205730.3ED808B3A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95aa7ad1ef5e2b199ed4d50eff63f064f4e65d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "add dependency on elfutils for R600 with LLVM" [1] select
elfutils package at Kconfig level without adding it the make dependency.

Enabling r600 support lead to a build issue when building from
scratch with "make mesa3d".

Fixes:
checking for RADEON... yes
configure: error: r600 requires libelf when using llvm

elfutils dependency is needed by r600 with llvm support and radeonSI.

Fixes:
checking for RADEON... yes
checking for AMDGPU... yes
configure: error: radeonsi requires libelf when using llvm

Add a new BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS hidden Config.in boolean
selected by R600 and RadeonSI at Kconfig level.
When selected, BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS add elfutils dependency
at make level.

[1] 92fda8761aa8024be53a8edb8c102d1ba6401bce

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Micha?? Kalbarczyk <michal@gamecodehq.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 6 ++++++
 package/mesa3d/mesa3d.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d620c0ab52..8c1877fbc1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -25,6 +25,10 @@ menuconfig BR2_PACKAGE_MESA3D
 
 if BR2_PACKAGE_MESA3D
 
+# Some Gallium driver needs libelf when built with LLVM support
+config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
+	bool
+
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
@@ -104,6 +108,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
@@ -124,6 +129,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU
 	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c882a229be..fb9189741f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -43,6 +43,10 @@ else
 MESA3D_CONF_OPTS += --disable-llvm
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
+MESA3D_DEPENDENCIES += elfutils
+endif
+
 # The Sourcery MIPS toolchain has a special (non-upstream) feature to
 # have "compact exception handling", which unfortunately breaks with
 # mesa3d, so we disable it here by passing -mno-compact-eh.
