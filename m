Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ADFC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B35D6072F;
	Tue,  1 Jul 2025 19:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiX8dLmkKRBK; Tue,  1 Jul 2025 19:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84EC961185
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84EC961185;
	Tue,  1 Jul 2025 19:44:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26689128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 187B76072F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zFag0HDv4WU for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F97D61185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F97D61185
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F97D61185
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BFFB6B0053E;
 Tue,  1 Jul 2025 21:44:26 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  1 Jul 2025 21:44:10 +0200
Message-ID: <20250701194411.13153-2-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701194411.13153-1-ju.o@free.fr>
References: <20250701194411.13153-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751399072;
 bh=fqOlLHNxAoH/xIAdzgIsp5vgfBIhjzDemIkhUvgcqtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IB/b2vRG7hp+Z6QutoM6TKztHSkunwsJJBWsp4hZvzxM5ptm0jTThfTihvFgyh1Dz
 fx0fIn2lxTvTFN6wUaxPaOT5NmX4504suWc7tFYIPDwST85U+iZaiVBcN5QmMbKcW+
 D9gHVcryM+ULQPgS2upa7rIiXuL7UfdCy24cM3mkiZLoF6/UfGNgIKLHcOrMsO1iG/
 9PpHjv8FBeYRQI9gcu9NwMWFkxQmxkoCSimVp9Zm98/heZy9850MsdxiON0LbgZE+n
 dSzZIepczzvyXXREc0eSZxZBN9ERVN4+tds4AnZdmCY9S0MsOgmp1L1lBiMQ/DH5Vm
 8cOw9TrDVZWCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IB/b2vRG
Subject: [Buildroot] [PATCH v2 2/3] package/gcc: add logic to hide gcc 15
 for unsupported CPUs
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
Changes v1 -> v2
- None.
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
