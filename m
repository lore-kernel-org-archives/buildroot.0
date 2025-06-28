Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79772C7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 22:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21C81404D4;
	Sat, 28 Jun 2025 22:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4oFNTjCjK5C; Sat, 28 Jun 2025 22:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA1E4048E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA1E4048E;
	Sat, 28 Jun 2025 22:55:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85032154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 22:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7724640472
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 22:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6G7XiR1QryE for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 22:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB82C4016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB82C4016B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB82C4016B
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 22:55:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 256A6B0054E;
 Sun, 29 Jun 2025 00:55:05 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 29 Jun 2025 00:54:45 +0200
Message-ID: <20250628225445.827543-2-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250628225445.827543-1-ju.o@free.fr>
References: <20250628225445.827543-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751151310;
 bh=udsW+KW9nRDrGRumdLKyFJ/lBu43VhdVn+nAGhKTrD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KdmqR/+yopF72hYebV1ZFq5g1BWpg6WZsQxvLvA3FHmOOZ+A1I+gkQ3xTwXuWyJLg
 ecipSAwhhAYtZWR1dP11GIKhHyvQWAe1i4rqPyIS+m/FRqvNcs8SYyLrrbLpTMwjEb
 NCymAra6wDy8NvapVMA88M5dTwFTrts97fIcNKEiqlsk0Bhav2Id8yRcEdRYRYtALU
 BPHLlyaR7divz0sZvLO4AWAL3KTSUAxa8jqzwMsDlVwbG47FaIuFNYWqdCsmDSV15X
 U1cSgSrJ0ZKBWxvsBXenbRXLB+9x3QzrJVG1PrNiS7VW5u/+/R4g6Mm15R0ZI5wvRC
 2syPOaOhZh1pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KdmqR/+y
Subject: [Buildroot] [PATCH 2/2] package/gcc: add logic to hide gcc 15 for
 unsupported CPUs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This logic is to prepare for future gcc versions and their new
supported CPUs. As of today, gcc 15 is the latest gcc version
and all architectures and CPUs in Buildroot are supported by
this version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8640280fdf..23fcaa9825 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -43,6 +43,7 @@ config BR2_GCC_VERSION_14_X
 
 config BR2_GCC_VERSION_15_X
 	bool "gcc 15.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
