From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 19:53:18 +0100
Subject: [Buildroot] [PATCH 6/7] package/ti-gfx: require kernel modules from
	Kconfig
In-Reply-To: <cover.1449771844.git.yann.morin.1998@free.fr>
References: <cover.1449771844.git.yann.morin.1998@free.fr>
Message-ID: <80f6b1ef6a1b79adc8d1746ce23079ec95b56e61.1449771844.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And reorder 'depends' before 'select'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-gfx/Config.in | 3 ++-
 package/ti-gfx/ti-gfx.mk | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 4ee8622..de4e9cb 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
+	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
 	select BR2_PACKAGE_FBSET if !BR2_PACKAGE_BUSYBOX # Runtime dependency only
-	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
 	  Graphics libraries for TI boards.
 
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index d23985f..47eb474 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -22,12 +22,6 @@ TI_GFX_INSTALL_STAGING = YES
 
 TI_GFX_DEPENDENCIES = linux
 
-# We're building a kernel module without using the kernel-module infra,
-# so we need to tell we want module support in the kernel
-ifeq ($(BR2_PACKAGE_TI_GFX),y)
-LINUX_NEEDS_MODULES = y
-endif
-
 TI_GFX_PROVIDES = libegl libgles powervr
 
 ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
-- 
1.9.1
