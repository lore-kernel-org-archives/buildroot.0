From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:13 +0200
Subject: [Buildroot] [PATCH 06/20 v3] package/systemd: remove prompt
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <c4ce15ced54fefa64156faf29fa26f0ec6c3becc.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package systemd depends on BR2_INIT_SYSTEMD, and is also selected
by BR2_INIT_SYSTEMD.

This means that:
  - systemd is not visible when BR2_INIT_SYSTEMD is not set
  - systemd is visible but forced when BR2_INIT_SYSTEMD is set

As a consequence, systemd is never user-selectable.

Since the user already made the decision to use systemd in the init
system choice, there is no point in showing the systemd package at
all in the menuconfig.

Just remove the prompt, and move systemd's sub-option to a sub-menu.

Although not strictly required, we anyway keep the dependencies expressed
in systemd, to explain where they come from (kmod, util-linux...), so it
is explicit their duplication in the init system choice entry comes from
systemd itself. So, update the comments there.

Re-order dependencies, so they are the same in the systemd package and
the init system choice. Add dependencies missing in the package.

Also, move the help text to the init system choice, so the user has a
chance to look at it! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/systemd/Config.in | 53 ++++++++++++++------------------------------
 system/Config.in          | 56 ++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 63 insertions(+), 46 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 58f76a5..7ff36cc 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -7,12 +7,22 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
 		BR2_aarch64 || BR2_m68k
 
+# Note: being prompt-less, and selected in the /dev management choice,
+# it is not needed to have dependencies on this symbol, since the
+# choice entry already have those dependencies.
+# However, it seems more logical to have the dependencies listed here,
+# so it is easier to uderstand why we have those, and duplicate them in
+# the choice entry.
+
 config BR2_PACKAGE_SYSTEMD
-	bool "systemd"
-	depends on BR2_INIT_SYSTEMD
+	bool
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
-	depends on BR2_INET_IPV6
 	depends on !BR2_PREFER_STATIC_LIB # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
@@ -24,42 +34,11 @@ config BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
-	help
-	  systemd is a system and service manager for Linux, compatible with
-	  SysV and LSB init scripts. systemd provides aggressive parallelization
-	  capabilities, uses socket and D-Bus activation for starting services,
-	  offers on-demand starting of daemons, keeps track of processes using
-	  Linux cgroups, supports snapshotting and restoring of the system
-	  state, maintains mount and automount points and implements an
-	  elaborate transactional dependency-based service control logic.
-	  It can work as a drop-in replacement for sysvinit.
-
-	  Systemd requires a Linux kernel >= 3.0 with the following options
-	  enabled:
-
-	  - CONFIG_CGROUPS
-	  - CONFIG_INOTIFY_USER
-	  - CONFIG_FHANDLE
-	  - CONFIG_AUTOFS4_FS
-	  - CONFIG_TMPFS_POSIX_ACL
-	  - CONFIG_TMPFS_XATTR
-
-	  These options will be automatically enabled by Buildroot if
-	  it is responsible for building the kernel. Otherwise, if you
-	  are building your kernel outside of Buildroot, make sure
-	  these options are enabled.
-
-	  Systemd also provides udev, the userspace device daemon.
-
-	  The selection of other packages will enable some features:
-
-	  - libglib2 package will add support for gudev.
-	  - acl package will add support for multi-seat.
-
-	  http://freedesktop.org/wiki/Software/systemd
 
 if BR2_PACKAGE_SYSTEMD
 
+menu "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
@@ -132,4 +111,6 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and manages
 	  security labels for sockets.
 
+endmenu # "systemd"
+
 endif
diff --git a/system/Config.in b/system/Config.in
index 89ae46e..e711d38 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -87,17 +87,53 @@ config BR2_INIT_SYSV
 
 config BR2_INIT_SYSTEMD
 	bool "systemd"
-	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_LARGEFILE
-	depends on BR2_USE_WCHAR
-	depends on BR2_INET_IPV6
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_USE_MMU
-	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS # systemd
+	depends on BR2_TOOLCHAIN_USES_GLIBC # systemd
+	depends on BR2_INET_IPV6 # systemd
+	depends on BR2_TOOLCHAIN_HAS_SSP # systemd
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 # systemd
+	depends on BR2_LARGEFILE # systemd (util-linux)
+	depends on BR2_USE_WCHAR # systemd (util-linux)
+	depends on !BR2_PREFER_STATIC_LIB # systemd (kmod)
+	depends on BR2_TOOLCHAIN_HAS_THREADS # systemd (dbus)
+	depends on BR2_USE_MMU # systemd (dbus)
 	select BR2_PACKAGE_SYSTEMD
+        help
+	  systemd is a system and service manager for Linux, compatible with
+	  SysV and LSB init scripts. systemd provides aggressive parallelization
+	  capabilities, uses socket and D-Bus activation for starting services,
+	  offers on-demand starting of daemons, keeps track of processes using
+	  Linux cgroups, supports snapshotting and restoring of the system
+	  state, maintains mount and automount points and implements an
+	  elaborate transactional dependency-based service control logic.
+	  It can work as a drop-in replacement for sysvinit.
+
+	  Systemd requires a Linux kernel >= 3.0 with the following options
+	  enabled:
+
+	  - CONFIG_CGROUPS
+	  - CONFIG_INOTIFY_USER
+	  - CONFIG_FHANDLE
+	  - CONFIG_AUTOFS4_FS
+	  - CONFIG_TMPFS_POSIX_ACL
+	  - CONFIG_TMPFS_XATTR
+
+	  These options will be automatically enabled by Buildroot if
+	  it is responsible for building the kernel. Otherwise, if you
+	  are building your kernel outside of Buildroot, make sure
+	  these options are enabled.
+
+	  Systemd also provides udev, the userspace device daemon.
+
+	  The selection of other packages will enable some features:
+
+	  - libglib2 package will add support for gudev.
+	  - acl package will add support for multi-seat.
+
+	  You can further configure systemd in:
+	    Target packages --> System tools --> systemd
+
+	  http://freedesktop.org/wiki/Software/systemd
 
 comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-- 
1.9.1
