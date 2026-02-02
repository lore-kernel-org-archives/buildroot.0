Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBD2E7DEF0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8217982B9F;
	Mon,  2 Feb 2026 15:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oSOxAgg0frf; Mon,  2 Feb 2026 15:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39C482AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770044533;
	bh=v0vpWEiMiYmI1cF/KutwpLqcSGOEK0TwkSfaxJbE5OQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=W0bLylRG67KkxFlkapu0TjOJ65xqHLAc0MNS5qAHmGw5C5B4+7pI931NZWa9Brrga
	 iwio34FPO130I8vMmRGrpO/odkvak9/No3RQ+6TeNkOg1xYca5wD6j5L7D+qY0oHaj
	 NnwO5kKI2Vp+Lj94Lk/sxeQLgrALppBmD/Yp+qeuNG8dGOg41gFGal1Z7xboZhC1qJ
	 teRBV9APFshrfHenU/qOLnd20lQDmdY9seaU3nGLBSFbANq9Bip/sP3dtQd4LPn+IY
	 ibGc85uCLM3GEid+jngYyvl5bJXmVYyhac+SssnM6aKwzsCGMNgEAhSvESL6mUBfNl
	 6DCyrhKF17Drw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F39C482AEF;
	Mon,  2 Feb 2026 15:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE5623E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FB6382AEF
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMF3Q_0RSX26 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16362829BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16362829BB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16362829BB
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:02:09 +0000 (UTC)
Received: from framework-OT (host-109-89-232-55.dynamic.voo.be [109.89.232.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 00D642C80CBA;
 Mon, 02 Feb 2026 16:02:07 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  2 Feb 2026 16:02:19 +0100
Message-ID: <20260202150220.3996455-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770044528; bh=eJLxJtBJVjWPe+XC1/snbs003oLqdOv0favIDRYI7ug=;
 h=From:To:Cc:Subject:Date;
 b=aVJxzkhYizsYw81R8aVHMBGkfiAWhOHUrA74ah5FfkCGI9kxFnD+W910yW954/Bpt
 IUUwiCAAVxdMLGFn36Qlu6gQfFs9ZwEJB5NyC0OOz9BdLJh9VKPa3ii/CPuGGPZ2DC
 Ewr2Fwm7tyUxtDzVcETU7h6xwf/GV3czQ9jeuHx6Jx1QOcE/hzrsDlk/t8cmku3oAF
 FGGnP9akp7xzJkyxdpjR235wsjEbJzWOJw9F+CIYV1Ofxs5kHayZaWIHLbinkOIpT3
 HVq4jz90SWwnmxuRueF4Qqk3h4NBk62T8nb8B7mokdQcTXHQVo5UH0VvL3En4OH8Qu
 MHqQrruFKc5+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=aVJxzkhY
Subject: [Buildroot] [PATCH] package/python-charset-normalizer: update
 package url
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old url redirects here.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-charset-normalizer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-charset-normalizer/Config.in b/package/python-charset-normalizer/Config.in
index 63e04a7a33..3b01357167 100644
--- a/package/python-charset-normalizer/Config.in
+++ b/package/python-charset-normalizer/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER
 	  The Real First Universal Charset Detector. Open, modern and
 	  actively maintained alternative to Chardet.
 
-	  https://github.com/ousret/charset_normalizer
+	  https://github.com/jawah/charset_normalizer
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
