From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 13 Oct 2020 14:41:48 -0500
Subject: [Buildroot] [PATCH 1/2] system: Move skeleton-init-* selection to
 init
Message-ID: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for supporting br2-external inits, move the 'select' for
the BR2_PACKAGE_SKELETON_INIT_* to their respective init systems. This
will allow a br2-external init to 'select' which skeleton it needs.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 system/Config.in | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index b8b7c16529..ec61fac781 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,21 +1,17 @@
 menu "System configuration"
 
-# Note: usually, it is not possible to select a provider of a virtual
-# package. But here we have an exception: there are only four providers
-# and they only get selected by separate entries in this choice and
-# under different, exclusive conditions. So this is a safe situation.
+# Note on package/skeleton: usually, it is not safe to 'select' a
+# provider of a virtual package. But below we have an exception: each
+# init system may select one of the virtual skeleton-init-* packages. As
+# only one init system may be enabled, only one skeleton-init-* may be
+# selected. So this is a safe situation.
 choice
 	prompt "Root FS skeleton"
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
-	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_SYSV
-	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_INIT_BUSYBOX
-	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_INIT_OPENRC
-	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_INIT_SYSTEMD
-	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_INIT_NONE
 	help
-	  Use default target skeleton
+	  Use default target skeleton for selected init system.
 
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
@@ -91,6 +87,7 @@ config BR2_INIT_BUSYBOX
 	bool "BusyBox"
 	select BR2_PACKAGE_BUSYBOX
 	select BR2_PACKAGE_INITSCRIPTS
+	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_INIT_SYSV
 	bool "systemV"
@@ -98,12 +95,14 @@ config BR2_INIT_SYSV
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
 	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
+	select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_INIT_OPENRC
 	bool "OpenRC"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENRC
+	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_ROOTFS_SKELETON_DEFAULT
 
 comment "openrc needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
@@ -126,6 +125,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
 comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and target gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
@@ -138,6 +138,7 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and targe
 
 config BR2_INIT_NONE
 	bool "None"
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
 	help
 	  Buildroot will not install any init system. You will
 	  have to provide your own, either with a new package
-- 
2.28.0
