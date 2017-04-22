From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:07 -0400
Subject: [Buildroot] [PATCH v2 21/25] fix ordering on configs starting with
	'u'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-21-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter u in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter u.
  
 package/ubus/Config.in                |  4 ++--
 package/uclibc/Config.in              | 20 ++++++++++----------
 package/udev/Config.in                |  2 +-
 package/udisks/Config.in              |  2 +-
 package/unionfs/Config.in             |  2 +-
 package/usb_modeswitch_data/Config.in |  2 +-
 package/ushare/Config.in              |  4 ++--
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index c14f6a8..3d34121 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -4,10 +4,10 @@ comment "ubus needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_UBUS
 	bool "ubus"
-	select BR2_PACKAGE_LIBUBOX
-	select BR2_PACKAGE_JSON_C
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on !BR2_STATIC_LIBS # libubox
+	select BR2_PACKAGE_LIBUBOX
+	select BR2_PACKAGE_JSON_C
 	help
 	  IPC/RPC bus that allows communication between processes.
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index bfce45c..b0b0b01 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -47,15 +47,15 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 	depends on !BR2_m68k && !BR2_microblaze && !BR2_or1k
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PTHREADS
 	bool "linuxthreads"
-	select BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
+	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
 	bool "none"
@@ -109,45 +109,44 @@ config BR2_UCLIBC_TARGET_ARCH
 
 config BR2_UCLIBC_ARC_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
 	default "ARC_CPU_700"	if BR2_arc750d
 	default "ARC_CPU_700"	if BR2_arc770d
 	default "ARC_CPU_HS"	if BR2_archs38
+	depends on BR2_UCLIBC_TARGET_ARCH = "arc"
 
 config BR2_UCLIBC_MIPS_ABI
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 	default "O32" if BR2_MIPS_OABI32
 	default "N32" if BR2_MIPS_NABI32
 	default "N64" if BR2_MIPS_NABI64
+	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 
 config BR2_UCLIBC_MIPS_NAN
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 	default "LEGACY" if BR2_MIPS_CPU_MIPS32 || BR2_MIPS_CPU_MIPS64
 	default "2008" if BR2_MIPS_CPU_MIPS32R6 || BR2_MIPS_CPU_MIPS64R6
+	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
 
 config BR2_UCLIBC_SH_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 	default "SH2A" if BR2_sh2a
 	default "SH4"  if BR2_sh4 || BR2_sh4eb
+	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 
 config BR2_UCLIBC_SPARC_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
 	default "V7"	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
 	default "V8"	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
 
 config BR2_UCLIBC_POWERPC_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "powerpc"
 	default "CLASSIC" if !BR2_powerpc_8540 && !BR2_powerpc_8548
 	default "E500"    if BR2_powerpc_8540 || BR2_powerpc_8548
+	depends on BR2_UCLIBC_TARGET_ARCH = "powerpc"
 
 config BR2_UCLIBC_X86_TYPE
 	string
-	depends on BR2_UCLIBC_TARGET_ARCH = "i386"
 	default "486"        if BR2_x86_i486
 	default "586"        if BR2_x86_i586
 	default "586MMX"     if BR2_x86_pentium_mmx
@@ -156,5 +155,6 @@ config BR2_UCLIBC_X86_TYPE
 	default "PENTIUMIII" if BR2_x86_pentium3
 	default "PENTIUM4"   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
 	                        BR2_x86_nocona || BR2_x86_core2 || BR2_x86_corei7
+	depends on BR2_UCLIBC_TARGET_ARCH = "i386"
 
 endif # BR2_TOOLCHAIN_BUILDROOT_UCLIBC
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 941a515..814a625 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_UDEV
 	bool
 
 config BR2_PACKAGE_PROVIDES_UDEV
-	depends on BR2_PACKAGE_HAS_UDEV
 	string
+	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 475f498..a506813 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -6,9 +6,9 @@ config BR2_PACKAGE_UDISKS
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lvm2
+	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	select BR2_PACKAGE_SG3_UTILS
 	select BR2_PACKAGE_POLKIT
 	select BR2_PACKAGE_PARTED
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index ece83a5..fe03b95 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
-	select BR2_PACKAGE_LIBFUSE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
 	depends on !BR2_STATIC_LIBS # libfuse
+	select BR2_PACKAGE_LIBFUSE
 	help
 	  A userspace unionfs implementation.
 
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index ad96726..95b2a07 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
-	select BR2_PACKAGE_USB_MODESWITCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS # usb_modeswitch -> libusb
+	select BR2_PACKAGE_USB_MODESWITCH
 	help
 	  USB mode switch data
 	  Contains udev rules and events to allow usb_modeswitch to
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index eba7acf..70bf24a 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_USHARE
 	bool "ushare"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
-	select BR2_PACKAGE_LIBUPNP
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	# ushare has a completely custom configure script that does
 	# broken things with library ordering, which breaks static
 	# linking.
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  uShare is a UPnP (TM) A/V & DLNA Media Server.
 	  It implements the server component that provides UPnP media devices
-- 
2.9.3
