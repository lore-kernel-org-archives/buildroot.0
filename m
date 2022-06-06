Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC12C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D494F4189D;
	Mon,  6 Jun 2022 10:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CXDNyLu99BI; Mon,  6 Jun 2022 10:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F684181E;
	Mon,  6 Jun 2022 10:27:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7AE41BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A21BA4016C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdOCE4bVNwtl for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:26:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93413400EF
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:26:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9B54486CB5; Mon,  6 Jun 2022 10:14:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:21:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3176d9febb1b0b47c7f7b8be0c9a4e6f8d88dbc9
X-Git-Newrev: fd839aeb7f40596e60bc53a96b7a65892924cc26
X-Patchwork-Hint: ignore
Message-Id: <20220606101443.9B54486CB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: introduce and use
 BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and BR2_PACKAGE_GLIBC_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd839aeb7f40596e60bc53a96b7a65892924cc26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As part of this, the dependency of the comment "glibc needs a
toolchain w/ dynamic library, kernel headers >= 3.2" is changed to use
BR2_PACKAGE_GLIBC_ARCH_SUPPORTS instead of just BR2_USE_MMU, so that
the comment only appears on architectures for which glibc is supported

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/Config.in                 | 38 +++++++++++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in | 20 ++---------------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 8e9ddac7d9..56f7299568 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -1,3 +1,41 @@
+config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc_power8
+	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_sh
+	default y if BR2_sparc64
+	default y if BR2_x86_64
+	default y if BR2_microblaze
+	default y if BR2_nios2
+	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
+	default y if BR2_csky
+	depends on !BR2_powerpc_SPE
+	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_GLIBC_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
+
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 comment "Glibc Options"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 559c254622..b68f5e3133 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -43,23 +43,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
-	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
-		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
-		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
-		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc_power8 || \
-		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
-		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
-		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
-		   BR2_csky 	   || BR2_or1k
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
-	depends on !BR2_powerpc_SPE
-	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	depends on BR2_PACKAGE_GLIBC_SUPPORTS
 	select BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This option selects glibc as the C library for the
@@ -68,7 +52,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	  http://www.gnu.org/software/libc/
 
 comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 # glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
