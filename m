Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C7DCD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 18:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E86441C50;
	Thu, 30 Apr 2026 18:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoCYqkeD1jK6; Thu, 30 Apr 2026 18:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24F4241C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777574156;
	bh=qQUXv9DtiOJTsCrr4/44GSPmzD+w+1jIYUOaRtUrQqQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I7xe10IVyAhESUgxUGUEep9u1M/pTY83ZVOmOFezvSmmf/YZ7ildBrfrOt6rIxmPe
	 12461ublAPAQthiGOAjAEzj0+AB3tarXdY5H1taxaWgckV+i4PmrSqlwMEHkCfnu0U
	 hQGu/G3p5a9ib9TUev476iW7yJaG3EYknngAbL0fp0RzkOI8QLrDKpiiu+M3Wq9bJR
	 TuOw3c2NiiGwkPUAAEWP0H3KMMLjznZSIJ1y/7jn/QoUmXiPDQd1RfWapU/TjgvlHw
	 T6lu9ThQ60FI2JWxqbwhCr/DOKMfdL22f6MJq1hGP6GecvftP++dYmqTyJRq+DkdVL
	 tsNzqt62BjIyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24F4241C51;
	Thu, 30 Apr 2026 18:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5405A18E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749816F4A9
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzvmNmP2dOL9 for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 18:35:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F1FD61237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F1FD61237
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F1FD61237
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:35:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ABF94A4C19CA;
 Thu, 30 Apr 2026 20:35:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWEi-0000000036J-3R4n;
 Thu, 30 Apr 2026 18:35:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 30 Apr 2026 20:35:43 +0200
Message-ID: <20260430183544.2362642-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777574144;
 bh=yOvm5CV6YqGNhREGR7anGEohS/hQbQpoo64vp/+Tiro=;
 h=From:To:Cc:Subject:Date:From;
 b=ZMSZkRDD+EvJNwTZDMoLGm2Mwae83RKgV8a8zVOX6c+dAdWQjK6rgaoUXiAiZPBlH
 3nHklQekiHO5Wtf3/l51dgf6npF8EKQEZ3YpffFqYglbhXu8YJzHqEQ224icl55SRQ
 x53TJlWTcdent+stNlU5KqG7YownSVTRgTH+nDCVs1h20oF5WptwlqOhNeEIICJT+B
 lv/4u195vCOrvmMi/yl7HcCxMOc3fl07j6Dq+G+blTG5gF+xSq6xwUwsN1l2rcGBrH
 ePKU4+Q7HCQPHByYnGvZkDUvyBGymto9XXujdFjb9fPaIse9rdMmwgjF0hxqDWSBtT
 aReROQ43A6H8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ZMSZkRDD
Subject: [Buildroot] [PATCH 1/2] package/libpjsip: enable parallel builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Parallel builds were disabled in 2016 by buildroot commit
781ce19d746efb6a5408b4d50b30626784eff324.

In 2020 upstream added two commits which fix parallel builds
https://github.com/pjsip/pjproject/commit/ddf48e2045fa155ef5242d9d7dcec27f8c5ed873
https://github.com/pjsip/pjproject/commit/78683646c8bc670ec730a42494e075f671a08e28
to version 2.11 which was added to buildroot with commit
2c7ad667ec4a25226848baba809e492ca0ff06da.

Tested with -j100.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpjsip/libpjsip.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 8cea8e3abc..38adeff626 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -13,7 +13,6 @@ LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_CPE_ID_VENDOR = teluu
 LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
-LIBPJSIP_MAKE = $(MAKE1)
 
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
