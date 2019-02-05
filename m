From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 17:09:59 +0100
Subject: [Buildroot] [PATCH] xenomai: move arch restriction to Cobalt core,
 no restriction for Mercury
Message-ID: <20190205160959.25927-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Xenomai has two mutually exclusive cores:
- Cobalt: dual-kernel approach: patched kernel + userland
- Mercury: only userland

In the Cobalt core, not all architectures are supported. This is the source
of the existing ARCH_SUPPORTS variable.

In the Mercury core, there is no imposed architecture restriction.

Rename the XENOMAI_ARCH_SUPPORTS flag to XENOMAI_COBALT_ARCH_SUPPORTS and
move its check from the Xenomai package to the Cobalt core.

Nevertheless, even for Mercury, there are some restrictions:
- pthread_atfork is used, which requires an MMU
- sync functions like __sync_sub_and_fetch and __sync_add_and_fetch are
  expected.

As the corresponding 'linux extension' selects Xenomai, we add the
MMU and sync dependencies there too. They may or may not already be covered
by XENOMAI_COBALT_ARCH_SUPPORTS flag.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 linux/Config.ext.in       | 12 ++++++++----
 package/xenomai/Config.in | 11 +++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

v2:
- add MMU and SYNC_4 dependencies (tested with test-pkg on all toolchains)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index acc8a04742..32dacbdf06 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -4,9 +4,11 @@ menu "Linux Kernel Extensions"
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
 	bool "Adeos/Xenomai Real-time patch"
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # xenomai
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xenomai
+	depends on BR2_TOOLCHAIN_HAS_THREADS # xenomai
+	depends on !BR2_TOOLCHAIN_USES_MUSL # xenomai
 	select BR2_PACKAGE_XENOMAI
 	help
 	  Xenomai is split in two parts: a kernel part and a userspace
@@ -34,7 +36,9 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  and verify that your kernel version in buildroot matches.
 
 comment "xenomai needs a uClibc or glibc toolchain w/ threads"
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 
 #-------------------------------------------------------------------------------
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index f3d8ea4baf..83ba8ca162 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,16 +1,18 @@
-config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+config BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
 		BR2_powerpc
 
-comment "xenomai needs an glibc or uClibc toolchain w/ threads"
+comment "xenomai needs a glibc or uClibc toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 
 config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uses <error.h>, __WORDSIZE and bits/local_lim.h
 	depends on !BR2_TOOLCHAIN_USES_MUSL
@@ -67,6 +69,7 @@ config BR2_PACKAGE_XENOMAI_MERCURY
 
 config BR2_PACKAGE_XENOMAI_COBALT
 	bool "Cobalt"
+	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	help
 	  Select Cobalt core (dual kernel) for the Xenomai
 	  userspace. Use this if you use a Xenomai-patched
-- 
2.19.2
