Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F17C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FBF481451;
	Sat, 31 Dec 2022 17:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FBF481451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3-chaovtw2L; Sat, 31 Dec 2022 17:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F8B8144C;
	Sat, 31 Dec 2022 17:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92F8B8144C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 569A71BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 325A36068F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 325A36068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id paj_Z8_Lv2jY for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:31:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60AF16066D
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AF16066D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DC67826D0; Sat, 31 Dec 2022 17:31:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 18:31:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bca2c28fc9ed2ebca91e6f1347d947389997a4c7
X-Git-Newrev: 415c7af0796e1f2212170bcad5a13e9cd16d5d7f
X-Patchwork-Hint: ignore
Message-Id: <20221231173156.4DC67826D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/z3: introduce _ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=415c7af0796e1f2212170bcad5a13e9cd16d5d7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

z3 package was initially added with a depends on !BR2_nios2. This was
detected by testing with "./utils/test-pkg -a -p z3". It turned out that
few other architectures are also not supported. The actual z3
requirement is to have a libc that provides <fenv.h> AND also provides
all the four macros: FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO,
FE_UPWARD.

Quoting glibc manual, or "man fenv":
https://www.gnu.org/software/libc/manual/html_node/Rounding.html

"fenv.h defines constants which you can use to refer to the various
rounding modes. Each one will be defined if and only if the FPU
supports the corresponding rounding mode."

This patch introduces _ARCH_SUPPORTS to limit only to the architectures
with a FPU that has those rounding modes.

Fixes:
- http://autobuild.buildroot.net/results/2809dd1ae2f3ada8ee7b3f3e388341c7cfb633fb

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/z3/Config.in | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/z3/Config.in b/package/z3/Config.in
index 55b0e8bb3b..8cd3128687 100644
--- a/package/z3/Config.in
+++ b/package/z3/Config.in
@@ -1,11 +1,33 @@
+# z3 supports arch for which libc fenv.h provides all four macros:
+# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
+# See for example in glibc https://sourceware.org/git/glibc.git
+# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
+config BR2_PACKAGE_Z3_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	# BR2_microblaze has only FE_TONEAREST
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# BR2_nios2 has only FE_TONEAREST
+	default y if BR2_or1k
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_x86_64
+	# BR2_xtensa supports only uclibc which does not have fenv.h
+
 config BR2_PACKAGE_Z3
 	bool "z3"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # c++17
 	# z3 needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_Z3_ARCH_SUPPORTS
 	help
 	  Z3, also known as the Z3 Theorem Prover, is a cross-platform
 	  satisfiability modulo theories (SMT) solver.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
