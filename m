Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A97CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4666141C7D;
	Thu, 30 Apr 2026 19:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IpXbT_goLNq; Thu, 30 Apr 2026 19:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66ABE41C7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576074;
	bh=AdLv01MtExyvmxSBjsJ3UVmpw0EzZiJ1L1Jn/khSvjQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N0r8hP1SPPUWb89AhzO1pvcoR2+f1fv5ylpeYJviWZGp59VZ+2Kw0WY37hCfhqMir
	 NsOlAEC6cE1kXMHT+hsoE+QoJ46Ne1SpvcGS5bZMVTPobmUO8IS1P+8iVXxySbURRt
	 4UaFBz5/MH47LJwNZ2c/5Y/RsOlQ/ckEwD/6N/Luld6qBxlh5B7yqwCjWDNhSdhK92
	 uNO0xy30Fh2HQtbJnfc1Ttnpp8twsHPPH4wAQfTgmTBNAq2LVd5i7fUw/ymQUCB9tP
	 8kyFYA9JbEOL1gNkwoXpvaCopiZ0kZIWQEvsg8sJGJ7wdzw3lXeswWIho9HWpz+V+O
	 TQ0zBX+8zDZSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66ABE41C7A;
	Thu, 30 Apr 2026 19:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F9518E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BAB784FB3
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xp0jzKum9C4B for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:07:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A293582479
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A293582479
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A293582479
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:07:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89572A4C2D52;
 Thu, 30 Apr 2026 21:07:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWim-000000000Pg-16tR;
 Thu, 30 Apr 2026 19:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:41 +0200
Message-ID: <20260430190647.3212159-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430190647.3212159-1-bernd@kuhls.net>
References: <20260430190647.3212159-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576020;
 bh=bWNhI1r3yyLPULUxeRm76DoW0v6JWSGkuWwUGWbp3u8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sXpHmHQTOPoWbG5L25w6FcYZtJS+L3a6YfLAXRbaTArMpiPOckix8G/XMY7NYF0gz
 m2yAKuy115PMBhmiu23GT+CIPxRsz0aHVJtmANifsyE/K3mSekcoKVFE5XDansECZv
 F1ZMWFy6TGNTmyYGGJpMxYFdSYeE4fThF1HPmsQrX4FShqFyOc5/yyM3QgSfVaiPgx
 MP9YPDfxNClKoKvTeW2E6FK+krR+1Pce07TIJGI3GP24ED77jPaWMQTRf6NX+wC4fx
 2/eNSXfHTTCaRrCIxVyxwtN3zUBgJWhhsi35Yvg38y1MtGC8MvZEJqsUYqhkyX1sBE
 YFnUfSvsS8wPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=sXpHmHQT
Subject: [Buildroot] [PATCH v2 08/14] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_16 blind option
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to add gcc 16 support in follow-up commits, introduce
BR2_TOOLCHAIN_GCC_AT_LEAST_16 symbol.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 910cd103dc..5aa6cf8f6d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -848,10 +848,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "16"	if BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	default "15"	if BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	default "14"	if BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
