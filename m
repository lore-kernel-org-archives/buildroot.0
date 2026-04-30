Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CBECD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D8642B52;
	Thu, 30 Apr 2026 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiE_nPQZxFle; Thu, 30 Apr 2026 16:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D99342B1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777566177;
	bh=AdLv01MtExyvmxSBjsJ3UVmpw0EzZiJ1L1Jn/khSvjQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QJoJhf3hRRQVAxR9bM0B+e7cr5ho5kcYNJqIxhY+P0BlLShs04hftYLa7iqQ80GSz
	 0jj5O5lAd3Zti8fPubmIRj8cCTLMa+41jhNXlikCC5jiCPFRat7Dql4NlgEXoXDtYK
	 oPEO0Xgk1owaQXHtCTS49hEBfUdHBfF/64PLnyJ66P3DpIzng/FhJptR91Bi3zdq/V
	 v/c5TwV4dk1E/yJMzGucwfZxoO1Q8lrcDuQKi4UUDJFG4ZuUQi4HcrRChTNuexMhme
	 IkUxbe+zelFH7ObqSPx6dFYA7ncSUiDK+aGUQ96Xvsr1vBxD1F+7y+dhix+L6y0psq
	 70ar/jkWZMR6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D99342B1C;
	Thu, 30 Apr 2026 16:22:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 749CC18E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66C7F42B1C
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1C5nabSpqtm for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 16:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 512CC42A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 512CC42A92
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 512CC42A92
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:22:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A04F8A4C2CE2;
 Thu, 30 Apr 2026 18:22:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIU9F-000000004jw-2jYR;
 Thu, 30 Apr 2026 16:21:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 18:21:50 +0200
Message-ID: <20260430162156.3456640-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430162156.3456640-1-bernd@kuhls.net>
References: <20260430162156.3456640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777566122;
 bh=bWNhI1r3yyLPULUxeRm76DoW0v6JWSGkuWwUGWbp3u8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=X4RmhSWJi3FOS9ihTfmDM9RCMMcKAOs3nR1rA4GNWIu4UWWqCYSDFyItCUa9Qc4l4
 eTbBccEniDw+00Yyo5O2QFvKi9T3y6TDE+0IKLZ+hTxw39WQzcdQcLPM5ZGnsSYWGC
 flAL0uMIXFCRzuVVBI5ifDbtRs5d8AE/874xFUnABGo+2l4Eau54LQ4cpw04pdCpA6
 SkA7+9OjplTKWEK9qDJkH8XpP3lGEK0iBOXzlmkegi+L4IdeoMTdClccAl3eXK8e0R
 NYP51MorFQgUaeDM0c0CJkBnDzhpz+MOYWLmqN28EuTUXT11M1wkWi5qIb2zQwMtGX
 3BG3HTRtYuzCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=X4RmhSWJ
Subject: [Buildroot] [PATCH 08/14] toolchain/Config.in: add
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
