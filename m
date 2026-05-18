Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CA5CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A3A60749;
	Mon, 18 May 2026 18:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6swVnVlmUIEz; Mon, 18 May 2026 18:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA58960714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779130406;
	bh=TwUKhEqS6Za3djA/HyujR2mawfe3ic56rmsBip/iSsE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KLHyPxgiRbUoiszB+navAw/cZ4IbBX6NELzxeidpTLR3BNRaTl3l5e9uvHG32kGzh
	 kaDB6wWFp380l64TnI8oAa4aI3dA3emIt1Tmq6lJu2XZSiJHIuEbUjUTkPDeyORJMg
	 9oBoFZxMG4ZcR8eX+5q3ZmFOFDAFiGdCAVbStE5lzFhZ9GKcwZNZeEpzEAnm0GRWkm
	 Li57PYpvKMP9q9oahsCgZeBeEg+leZA3nIVXq9HKVIfNKDPF9WpltFAx0dPuoyQdDi
	 1D0Z3kew10wCbotHX7XkcAXKeqDblQiq7juxVG4eCeR+Eqgje7y7sjxxo1PG1wyRR3
	 u4v2qxSKkOihQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA58960714;
	Mon, 18 May 2026 18:53:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A43D282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0049C80DB9
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seb8adjJbZ5o for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:53:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 968B780DA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 968B780DA5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 968B780DA5
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:53:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 21A295FF95;
 Mon, 18 May 2026 20:53:17 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Chen Pei <cp0613@linux.alibaba.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 18 May 2026 20:52:48 +0200
Message-ID: <20260518185248.237609-2-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518185248.237609-1-ju.o@free.fr>
References: <20260518185248.237609-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779130401;
 bh=xzCtNWWzblOUGr8TFeEZtU3gqLxxixtODS64eh0GdXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n58I//SlZqF3/gszLWNuiRtCZuzZ9OeP2z2YIjRmd8ew3Kbd2ra4UmTvT+YM8pUIw
 XUdCNT6YxvFZ/P3EcgjAO17Jt34e3F3RIfXG0Qdd8i5TsODH3Sdc0WsAVzQZTQHeiA
 SKy0OIMj9MgFiZGgqbwe8Vd1FqdbAT6yKfRHrKsrKtoYDv4DGsBpXEs0WQfpqIzgrx
 TH0+oFxjH3Hk/VpWcdxXrk37N/7z6vSdt2J2diSOJbnV6u9Oj4PFeckZwxKaOT5lGv
 /za5uuZl/E5G+F/iI96tSdzjIs+L/9duqpfeIDLbwfeVduu1bhEK6A87LCtp5OE/cF
 7qFE6gFM6GlJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n58I//Sl
Subject: [Buildroot] [PATCH 2/2] package/ndctl: propagate json-c dependencies
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

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_JSON_C
  Depends on [n]: BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
  Selected by [y]:
  - BR2_PACKAGE_NDCTL [=y] && BR2_PACKAGE_HAS_UDEV [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y]

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ndctl/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 9f7f5f1c9b..9d3972bd2f 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NDCTL
 	bool "ndctl"
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # __struct_group()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_INIPARSER
@@ -20,6 +21,7 @@ config BR2_PACKAGE_NDCTL
 
 comment "ndctl needs udev /dev management, a toolchain headers >= 5.10"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
