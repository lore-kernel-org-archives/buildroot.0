Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09D4C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A106B40608;
	Tue,  7 Jun 2022 20:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hT5240TiDhLD; Tue,  7 Jun 2022 20:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C6840598;
	Tue,  7 Jun 2022 20:38:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4853B1BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 451AE40569
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOBGeHIVUfec for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED06C40123
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A9569240006;
 Tue,  7 Jun 2022 20:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IoXwd1JzpNiBmF4JUJHHeHiqCPrdFCwGztfGzQGXOSc=;
 b=BDG2L5QBMdyuN7W6XL9SMj22R84i+l08z4sdb/s5qfeSpPr+h2GExvyY3Vrn7qHgZVs8Oi
 cY2R6cJuyU5pplGM27SCrVJZ28FWdfxWxNU6sarw1fsDZoKTp8IMv2gXGiXKMg6SW/hZhS
 //lFjU20fiLZigWRZZPFdBIXg0A9pPxkZ8utx9ap9DdJKdVP239YcZrblzXobxvHskFt5R
 4AlpZAWxXpubAZUZLfUYzK5tj3zPlbKz4hStuahSqAvkYepookCfcLLxHyOLkcqSy9hEiJ
 mGjyk2pZ/yz2XOGqgwpILgZ4xJrMQEAEOMp8BkEpW8I28uCh3vnjaT+GwRoV9A==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:50 +0200
Message-Id: <20220607203553.3307479-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/11]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate with
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

  http://autobuild.buildroot.net/results/6315ef7b66ee4ae8f870c92186bc674d65f62f2c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-bootlin/Config.in.options | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 6e98a1dfda..7ee61d3c36 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -1029,6 +1029,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1052,6 +1053,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1074,6 +1076,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
 	bool "microblazebe musl bleeding-edge 2021.11-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1096,6 +1099,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 	bool "microblazebe musl stable 2021.11-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1117,6 +1121,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
 	bool "microblazebe uclibc bleeding-edge 2021.11-1"
 	depends on BR2_microblazebe
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -1140,6 +1145,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 	bool "microblazebe uclibc stable 2021.11-1"
 	depends on BR2_microblazebe
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
@@ -1165,6 +1171,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1188,6 +1195,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1210,6 +1218,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
 	bool "microblazeel musl bleeding-edge 2021.11-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1232,6 +1241,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 	bool "microblazeel musl stable 2021.11-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1253,6 +1263,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
 	bool "microblazeel uclibc bleeding-edge 2021.11-1"
 	depends on BR2_microblazeel
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -1276,6 +1287,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	bool "microblazeel uclibc stable 2021.11-1"
 	depends on BR2_microblazeel
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
@@ -2428,6 +2440,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	bool "openrisc musl bleeding-edge 2021.11-5"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2451,6 +2464,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	bool "openrisc musl stable 2021.11-5"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2472,6 +2486,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	bool "openrisc uclibc bleeding-edge 2021.11-5"
 	depends on BR2_or1k
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -2495,6 +2510,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	bool "openrisc uclibc stable 2021.11-5"
 	depends on BR2_or1k
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
