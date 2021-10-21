Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06671C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 11:59:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E9FC610CB
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 11:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E9FC610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F08E4024E;
	Thu, 21 Oct 2021 11:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS_3NPnKDfPJ; Thu, 21 Oct 2021 11:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2636540253;
	Thu, 21 Oct 2021 11:59:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5CEC1BF279
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 11:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5A2581B69
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 11:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZirrsaxqVhS for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 11:59:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E4348188A
 for <buildroot@busybox.net>; Thu, 21 Oct 2021 11:59:27 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5517FC4589;
 Thu, 21 Oct 2021 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1634817566; bh=6Nb3ozQ8HQs0tSIjo4zwmjrXnAem6bRImGGdTioe53A=;
 h=From:To:Cc:Subject:Date:From;
 b=Z9sgpsL16atWvNgHOKxKmr2Nj/EGy9NuTinpf3ERI6J5qPwyd3YYDY2oXbx4ZIGrB
 hJFYjYyPyjM4v0cFdZ1sHBTa2Du3YXPw2SyeynZT4KMImTg8x4ZvOMmdWumDETPVQy
 dZBDlFiRoc0dRHuaZUWbqfOyyLWZAHVslC84RVDmOJypaP5ByxIAhKQex1B6qQMrU+
 04UsY56dWxcgiZ71cp3EySQGCBUCD/t7Fa/ARoeVOWkXkyagTfzolF/ZoFVoT+9Bfy
 jpu6HpBG68EapIf1UA4NE8L3+odf0RZfsqvawCPpHn6Ejst8s8aSUVk3BwXHnLzRbS
 ScQxeBV+sffJw==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com
 (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 94214A0071;
 Thu, 21 Oct 2021 11:59:25 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@busybox.net
Date: Thu, 21 Oct 2021 04:59:15 -0700
Message-Id: <20211021115915.32447-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Subject: [Buildroot] [PATCH,
 RE-SEND] openjdk: Add ARC HS3x/4x support via "Zero Assembly
 Project"
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This allows building and running a full-scale JVM in purely
interpretive mode on ARCv2 processors.

Once JIT'ed version is available for ARC we'll obviously switch
to it to gain a faster execution.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---

Erroneously sent to buildroot@lists.buildroot.org initially,
now sending to buildroot@busybox.net.

Sorry for the noise!

---

 ...-Add-ARCv2-ISA-processors-support-to-Zero.patch | 109 +++++++++++++++++++++
 package/openjdk/Config.in                          |   2 +
 2 files changed, 111 insertions(+)
 create mode 100644 package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch

diff --git a/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
new file mode 100644
index 0000000000..1ef523a419
--- /dev/null
+++ b/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
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
index f2b7f5ffd7..c09d1c0162 100644
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
@@ -121,6 +122,7 @@ choice
 	prompt "openjdk variant"
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
 	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
+	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_arc
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
 	bool "client"
-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
