From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 21 Jan 2019 20:50:04 +0100
Subject: [Buildroot] [PATCH] xenomai: move arch restriction to Cobalt core,
 no restriction for Mercury
Message-ID: <20190121195005.17768-1-patrickdepinguin@gmail.com>
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

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 linux/Config.ext.in       | 4 ++--
 package/xenomai/Config.in | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index acc8a04742..71d8e07c25 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -4,7 +4,7 @@ menu "Linux Kernel Extensions"
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
 	bool "Adeos/Xenomai Real-time patch"
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_XENOMAI
@@ -34,7 +34,7 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  and verify that your kernel version in buildroot matches.
 
 comment "xenomai needs a uClibc or glibc toolchain w/ threads"
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 
 #-------------------------------------------------------------------------------
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index f3d8ea4baf..a2bb1ab679 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+config BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
@@ -6,11 +6,9 @@ config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 
 comment "xenomai needs an glibc or uClibc toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 
 config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
-	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uses <error.h>, __WORDSIZE and bits/local_lim.h
 	depends on !BR2_TOOLCHAIN_USES_MUSL
@@ -67,6 +65,7 @@ config BR2_PACKAGE_XENOMAI_MERCURY
 
 config BR2_PACKAGE_XENOMAI_COBALT
 	bool "Cobalt"
+	depends on BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS
 	help
 	  Select Cobalt core (dual kernel) for the Xenomai
 	  userspace. Use this if you use a Xenomai-patched
-- 
2.19.2
