Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DFEC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7FE683B90;
	Thu,  7 Sep 2023 15:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7FE683B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snzS03siPYsC; Thu,  7 Sep 2023 15:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4C1F83C4A;
	Thu,  7 Sep 2023 15:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C1F83C4A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22EF01BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9AD441D96
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AD441D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdaVub5nfLcn for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 763BD41D95
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763BD41D95
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 704F6869E0; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:22:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bc8e72bafed28c0a3ddc18ffdf9eec7d324e984
X-Git-Newrev: ebe2a113aba9f15e19c36c0c204e50980ba7e7ae
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.704F6869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/powerpc: drop ABI selection
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebe2a113aba9f15e19c36c0c204e50980ba7e7ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since it was introduced in 5a6087d62e5c (toolchain: add powerpc SPE ABI
support), the CLASSIC vs. SPE choice for the ABI was never really a
choice: CPU without SPE could only use the CLASSIC ABI, while CPUs with
SPE could only use the SPE ABI.

Commit b4c824562bb1 (powerpc: add BR2_POWERPC_CPU_HAS_SPE to replace
adhoc deps/checks) added a blind option that CPUs with SPE would select
rather than duplicate the ad-hoc dependencies in both CLASSIC and SPE
ABI options. Since then, it was even more obvious that the ABI choice
was really not a choice, as the two options have mutually exclusive
conditions.

Drop the useless choice, and directly use the blind option as selected
by the specific CPUs.

We don't need legacy handling, because the situation fixes itself.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.powerpc     | 15 ---------------
 package/Makefile.in        |  2 +-
 package/gcc/Config.in.host | 10 +++++-----
 package/gcc/gcc.mk         |  2 +-
 package/glibc/Config.in    |  2 +-
 package/musl/Config.in     |  2 +-
 6 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index d4e204a463..3f4d348d5f 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -146,21 +146,6 @@ config BR2_powerpc_power9
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 endchoice
 
-choice
-	prompt "Target ABI"
-	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
-	default BR2_powerpc_CLASSIC
-	help
-	  Application Binary Interface to use
-
-config BR2_powerpc_CLASSIC
-	bool "Classic"
-	depends on !BR2_POWERPC_CPU_HAS_SPE
-config BR2_powerpc_SPE
-	bool "SPE"
-	depends on BR2_POWERPC_CPU_HAS_SPE
-endchoice
-
 config BR2_POWERPC_SOFT_FLOAT
 	bool "Use soft-float"
 	select BR2_SOFT_FLOAT
diff --git a/package/Makefile.in b/package/Makefile.in
index d70aded82b..4953d2d418 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -76,7 +76,7 @@ endif
 endif
 
 # For FSL PowerPC there's SPE
-ifeq ($(BR2_powerpc_SPE),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 ABI = spe
 # MPC8540s are e500v1 with single precision FP
 ifeq ($(BR2_powerpc_8540),y)
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4f2e47b9ea..fd721088ec 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
-	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
+	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_GCC_VERSION_12_X
 	help
 	  Select the version of gcc you wish to use.
@@ -19,7 +19,7 @@ config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on BR2_powerpc_SPE
+	depends on BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_GCC_VERSION_11_X
@@ -27,7 +27,7 @@ config BR2_GCC_VERSION_11_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -37,7 +37,7 @@ config BR2_GCC_VERSION_12_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -46,7 +46,7 @@ config BR2_GCC_VERSION_13_X
 	bool "gcc 13.x"
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 25cb4ce8e2..30403d5a31 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -234,7 +234,7 @@ HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
 
 # Enable proper double/long double for SPE ABI
-ifeq ($(BR2_powerpc_SPE),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
 	--enable-obsolete \
 	--enable-e500_double \
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 71c50504ac..d894507b89 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_microblaze
 	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
-	depends on !BR2_powerpc_SPE
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
 
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 5495ed3371..89f41d2ff1 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_RISCV_64
 	default y if BR2_sh
 	default y if BR2_x86_64
-	depends on !BR2_powerpc_SPE # not supported, build breaks
+	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks
 	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
