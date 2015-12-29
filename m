From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:52:39 +0100
Subject: [Buildroot] [git commit] package/ti-gfx: require kernel modules
	from Kconfig
Message-ID: <20151229225703.59CB8826DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44bf3e1a9e2ad5fc03470c9661ef065e1bb3690f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And reorder 'depends' before 'select'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
