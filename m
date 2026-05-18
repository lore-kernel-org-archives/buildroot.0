Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F94CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 22:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9CB440A0E;
	Mon, 18 May 2026 22:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjPVnpoOGxhb; Mon, 18 May 2026 22:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF8BA40A01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779141762;
	bh=qCApZuv3drm2bBQYyUy/nF1RMsSqUPga4F0NQDiRFhw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ESwR9p0xFsnKombHVxWdxVAMQ97iAyAJB6sPNPxzm2GIiHBn21u8eZMEol/3VuNjT
	 vf6jlo6S0i2jILmy2fupjXjxWwjhMpMM2R+wQMZaCrJNw6tphgkEHWH7sRBk/DUZZ3
	 rTTVwNbl43P/gSX/6u/t3AxMAfAcjF7J2Ot2tT5bhV8nOOdMconJLvncf3DPdx2unn
	 qRAJafuJJYrfnh7UTZ4xjy/6uzqiAEWX8b4GYAE7YxvgUyiuJGf8RuznDPAu5FuJGq
	 wMUi1rxpWGcvM/00gKV6TW6wFh7BgS50HctZklOozth4/nZ5liBC9EcJUPlrOOaGmW
	 88J1hvyZz/EYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF8BA40A01;
	Mon, 18 May 2026 22:02:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5DE265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 22:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51654607EF
 for <buildroot@buildroot.org>; Mon, 18 May 2026 22:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDiDlPTHqvlc for <buildroot@buildroot.org>;
 Mon, 18 May 2026 22:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27860607ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27860607ED
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27860607ED
 for <buildroot@buildroot.org>; Mon, 18 May 2026 22:02:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmjw-1wmqDW17YQ-00NTHf; Tue, 19
 May 2026 00:02:36 +0200
To: buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon, 18 May 2026 22:02:29 +0000
Message-ID: <20260518220229.17936-2-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518220229.17936-1-and@gmx.li>
References: <20260518220229.17936-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6NmTVnFGZS2xyOlhj1gaz82EfrScUM6dw2HZpbFvShPb++4fTOp
 9y3ckymFEN698myGhE+9Hq+y1lOd6GD2QAJehk/XoqwE/kAguQ46Uw8NI+AV0WoHUEuMW7W
 KO5aIOtVnZgbkRkqnV0L23uSkd3xQlMfzp5uIFtG9cB9Hn1QufdUyOxyHg5FmIZ+Uwe1JAb
 X4/ALbj/Fs0MCGwXsrN/Q==
UI-OutboundReport: notjunk:1;M01:P0:rX/8InszE4g=;HzliXtKBxuTejl93rAFfGOcatge
 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
 sd269jhbPkcv0fhihX2PTkXqreo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779141756; x=1779746556; i=and@gmx.li;
 bh=tTNpGMiqbHkJuVjaUWFCOVRAfkLAukoPLFUUELGDdhg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=l/NtlgiQrkhbXKKpFswU1Ow5CEgg7hTr6CsuMUY0DmFz/yxGazHa3AIjWipKroB7
 ZbKKGiwOZJE7c5dACsSb/1oETMktJFh0nhYm1a1NRW6ZASh8REv5kG0mIfFrz4BrT
 iCYA7qcEG5fiYrSnwQVvMbY1eJaRnEaQb19RuGpASHj/ha0WN3Q2i8zha7BBRVTrj
 bMNpxLHPJFqbO396M1llPQh+UZrr6MMeU12clZO8k0jSITlNKHar/MIbACqv+67rf
 ssE4XTLC7o3eQelA6BeYCmv14O3tiwXO34eFsvgAdxcE3pd5OvhkOm4DWFs0p6oBN
 nCgz16NDVJkGtUrKrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=l/NtlgiQ
Subject: [Buildroot] [PATCH v4 2/2] package/libargon2: fix pkgconfig version
 string
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current build generated pkgconfig/libargon2.pc has wrong version string.
    Version: ZERO

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/libargon2/libargon2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index 8ca0071a..e968aa08 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -11,6 +11,7 @@ LIBARGON2_LICENSE_FILES = LICENSE
 LIBARGON2_INSTALL_STAGING = YES
 
 LIBARGON2_OPTS = LIBRARY_REL=lib
+LIBARGON2_OPTS += ARGON2_VERSION=$(LIBARGON2_VERSION)
 
 # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
 # only uses it to detect if some x86 optimizations can be used, and
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
