Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235BFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E992402D0;
	Thu, 30 Dec 2021 20:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMe3iFvQ6WrD; Thu, 30 Dec 2021 20:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 283AA405C1;
	Thu, 30 Dec 2021 20:09:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEC291BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4D69405C1
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LxDeQ0_lNJB for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:09:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA91A402D0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:09:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 38B4982DD7; Thu, 30 Dec 2021 20:03:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:07:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3c66481e1f1503fcbf193d0c780271e880ad500
X-Git-Newrev: a5d2c379ebf552cd7f60b5e2bde10c34b993834c
X-Patchwork-Hint: ignore
Message-Id: <20211230200343.38B4982DD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: add ARC HS3x/4x support
 via "Zero Assembly Project"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5d2c379ebf552cd7f60b5e2bde10c34b993834c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows building and running a full-scale JVM in purely
interpretive mode on ARCv2 processors.

Once JIT'ed version is available for ARC we'll obviously switch to it
to gain a faster execution.

This is only supported for OpenJDK17, so we make OpenJDK11 unavailable
on ARC. However, there was a dependency difference between OpenJDK17
and OpenJDK11 (on host gcc >= 4.9). To avoid any potential
complexities if a package ever needs to "select BR2_PACKAGE_OPENJDK",
this commit moves this host gcc >= 4.9 dependency to
BR2_PACKAGE_OPENJDK itself.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Add-ARCv2-ISA-processors-support-to-Zero.patch | 109 +++++++++++++++++++++
 package/openjdk/Config.in                          |  17 ++--
 2 files changed, 120 insertions(+), 6 deletions(-)

diff --git a/package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
new file mode 100644
index 0000000000..1ef523a419
--- /dev/null
+++ b/package/openjdk/17.0.1+12/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
@@ -0,0 +1,109 @@
+From 9a3c2a0714420186ae8d5159d5416c6fa2009ad9 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 18 Oct 2021 05:20:05 -0700
+Subject: [PATCH] Add ARCv2 ISA processors support to Zero
+
+This adds ARCv2 processors support in OpenJDK via
+"Zero Assembly Project" (see https://openjdk.java.net/projects/zero).
+
+That' a purely interpretive mode, so likely not that fast
+as JIT'ed version, but for starters it's much better than nothing.
+
+Once all the logistical problems are solved hopefully this
+change will be accepted upstream.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ make/autoconf/libraries.m4        | 8 ++++++++
+ make/autoconf/platform.m4         | 8 ++++++++
+ src/hotspot/os/linux/os_linux.cpp | 8 +++++++-
+ 3 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
+index 5120918aed2..f7a99955874 100644
+--- a/make/autoconf/libraries.m4
++++ b/make/autoconf/libraries.m4
+@@ -122,6 +122,14 @@ AC_DEFUN_ONCE([LIB_SETUP_LIBRARIES],
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lpthread"
+   fi
+ 
++  # Libatomic library
++  # 32-bit ARC needs fallback library for 8-byte atomic ops
++  # Inspired by a fix for MIPS, see https://github.com/openjdk/jdk/commit/1b3aa3af
++  if test "x$OPENJDK_TARGET_OS" = xlinux &&
++      (test "x$OPENJDK_TARGET_CPU" = xarc); then
++    BASIC_JVM_LIBS="$BASIC_JVM_LIBS -latomic"
++  fi
++
+   # perfstat lib
+   if test "x$OPENJDK_TARGET_OS" = xaix; then
+     BASIC_JVM_LIBS="$BASIC_JVM_LIBS -lperfstat"
+diff --git a/make/autoconf/platform.m4 b/make/autoconf/platform.m4
+index c0f2446dbd7..dc416ece885 100644
+--- a/make/autoconf/platform.m4
++++ b/make/autoconf/platform.m4
+@@ -54,6 +54,12 @@ AC_DEFUN([PLATFORM_EXTRACT_VARS_FROM_CPU],
+       VAR_CPU_BITS=64
+       VAR_CPU_ENDIAN=little
+       ;;
++    arc)
++      VAR_CPU=arc
++      VAR_CPU_ARCH=arc
++      VAR_CPU_BITS=32
++      VAR_CPU_ENDIAN=little
++      ;;
+     arm*)
+       VAR_CPU=arm
+       VAR_CPU_ARCH=arm
+@@ -478,6 +484,8 @@ AC_DEFUN([PLATFORM_SETUP_LEGACY_VARS_HELPER],
+     HOTSPOT_$1_CPU_DEFINE=PPC64
+ 
+   # The cpu defines below are for zero, we don't support them directly.
++  elif test "x$OPENJDK_$1_CPU" = xarc; then
++    HOTSPOT_$1_CPU_DEFINE=ARC
+   elif test "x$OPENJDK_$1_CPU" = xsparc; then
+     HOTSPOT_$1_CPU_DEFINE=SPARC
+   elif test "x$OPENJDK_$1_CPU" = xppc; then
+diff --git a/src/hotspot/os/linux/os_linux.cpp b/src/hotspot/os/linux/os_linux.cpp
+index b08caf4d5d3..2bf084895ba 100644
+--- a/src/hotspot/os/linux/os_linux.cpp
++++ b/src/hotspot/os/linux/os_linux.cpp
+@@ -1858,6 +1858,9 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+ #ifndef EM_AARCH64
+   #define EM_AARCH64    183               /* ARM AARCH64 */
+ #endif
++#ifndef EM_ARC_COMPACT2
++  #define EM_ARC_COMPACT2 195             /* ARC ARCv2 ISA */
++#endif
+ #ifndef EM_RISCV
+   #define EM_RISCV      243               /* RISC-V */
+ #endif
+@@ -1879,6 +1882,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+     {EM_SH,          EM_SH,      ELFCLASS32, ELFDATA2MSB, (char*)"SuperH BE"},
+ #endif
+     {EM_ARM,         EM_ARM,     ELFCLASS32, ELFDATA2LSB, (char*)"ARM"},
++    {EM_ARC_COMPACT2, EM_ARC_COMPACT2, ELFCLASS32, ELFDATA2LSB, (char*)"ARC"},
+     // we only support 64 bit z architecture
+     {EM_S390,        EM_S390,    ELFCLASS64, ELFDATA2MSB, (char*)"IBM System/390"},
+     {EM_ALPHA,       EM_ALPHA,   ELFCLASS64, ELFDATA2LSB, (char*)"Alpha"},
+@@ -1906,6 +1910,8 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_PPC;
+ #elif  (defined AARCH64)
+   static  Elf32_Half running_arch_code=EM_AARCH64;
++#elif  (defined ARC)
++  static  Elf32_Half running_arch_code=EM_ARC_COMPACT2;
+ #elif  (defined ARM)
+   static  Elf32_Half running_arch_code=EM_ARM;
+ #elif  (defined S390)
+@@ -1926,7 +1932,7 @@ void * os::dll_load(const char *filename, char *ebuf, int ebuflen) {
+   static  Elf32_Half running_arch_code=EM_RISCV;
+ #else
+     #error Method os::dll_load requires that one of following is defined:\
+-        AARCH64, ALPHA, ARM, AMD64, IA32, IA64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
++        AARCH64, ALPHA, ARC, ARM, AMD64, IA32, IA64, M68K, MIPS, MIPSEL, PARISC, __powerpc__, __powerpc64__, RISCV, S390, SH, __sparc
+ #endif
+ 
+   // Identify compatibility class for VM's architecture and library's architecture
+-- 
+2.16.2
+
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 2aad1dcea3..b6eb2d7818 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
+	default y if BR2_arc && !(BR2_arc750d || BR2_arc770d)
 	default y if BR2_arm
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_m68k
@@ -21,6 +22,10 @@ config BR2_PACKAGE_OPENJDK
 	depends on BR2_INSTALL_LIBSTDCPP # cups
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, C++14 for OpenJDK17
+	# Strictly needed only for OpenJDK17, but to keep dependencies
+	# simple with ARC supported only with OpenJDK17, we make this
+	# dependency apply to OpenJDK as a whole.
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # cups
 	depends on BR2_PACKAGE_XORG7
@@ -57,13 +62,11 @@ choice
 
 config BR2_PACKAGE_OPENJDK_VERSION_11
 	bool "OpenJDK 11"
+	# The ARC-specific OpenJDK patch only applies to OpenJDK 17.
+	depends on !BR2_arc
 
 config BR2_PACKAGE_OPENJDK_VERSION_17
 	bool "OpenJDK 17"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
-
-comment "OpenJDK 17 needs a host gcc >= 4.9"
-	depends on !BR2_HOST_GCC_AT_LEAST_4_9 # C++14
 
 endchoice
 
@@ -125,6 +128,7 @@ choice
 	prompt "openjdk variant"
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
+	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_arc
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
 	bool "client"
@@ -156,14 +160,15 @@ comment "openjdk needs X.Org"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_XORG7
 
-comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9"
+comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 
 comment "openjdk does not support soft float configurations"
 	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
