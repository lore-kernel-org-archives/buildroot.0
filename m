Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFEEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589F76128F;
	Sun,  5 Jun 2022 19:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snCp79T1zDtq; Sun,  5 Jun 2022 19:43:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7495561283;
	Sun,  5 Jun 2022 19:43:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9431BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F1BF8407F
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dVwAZcRTJ3P for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 409628406A
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 5FD5E240002;
 Sun,  5 Jun 2022 19:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrLr3O1NuTzkxLpIGcxPzBX7ew9ZOf5fvY7W+UZhIWE=;
 b=Erlvrc5YioLMzGzlGxuWZTrS2Q/miA3yDE/yVTX4Z10TLsZh5sxFW+oCGPHn1FtMrGKP/0
 uGGR/CYuUmbXpF1r5Ls9A8GwZRLmn6XeLyv+J81B4YOIeSIlyN9VXysvRFSYUkA11U5Thm
 KBCe6ypOS8+9l51z4CkfDrFkGtZCKUTJ070MvaxuRZNwtfEABre9dfyCmCEGdZHW6l6aNa
 yDwwunu1LM3jIeHpkgHWb9M7OO3FCDY1RbZ7BMzF0P5aiardfaU4drUMOMrjGA4pjItnv5
 VHCesxik5kJf/c/znokaM34d4Hv8W4G0XlxkCoHmxbBI27HlwoU063SPok2x9g==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:54 +0200
Message-Id: <20220605194259.2928568-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/7] package/glibc: introduce and use
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

As part of this, the dependency of the comment "glibc needs a
toolchain w/ dynamic library, kernel headers >= 3.2" is changed to use
BR2_PACKAGE_GLIBC_ARCH_SUPPORTS instead of just BR2_USE_MMU, so that
the comment only appears on architectures for which glibc is supported

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in                 | 38 +++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in | 20 ++-----------
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
index 31f2be8b25..7ce2998cf7 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -37,23 +37,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
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
@@ -62,7 +46,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	  http://www.gnu.org/software/libc/
 
 comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 # glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
