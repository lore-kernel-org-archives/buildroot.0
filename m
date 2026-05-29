Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39B3CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 12:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C3A480CF8;
	Fri, 29 May 2026 12:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srYyVnMyOUf6; Fri, 29 May 2026 12:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 860BE8297F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780056423;
	bh=4tVZyzlbE2mLzcHpmBik+8xMCOHoroJGZG8iWY7m3mE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FOdXfhig35oe+vDpvM5KW5UG37PWXe1d2bRFYsFWTnw7jNE1QgyZuJb3ENZvaUzPR
	 iFBouOCqT2Bp9LbwVRxY0o3w/bN7hAE2Lbq2396A79q+b3TrFY645BEUzplBHILf2a
	 kTNicKBAjT65ETsNNakank7G0FNVSrUoCoKNaUkhiz1/Q78bu4PvlNR8X97lM98Q1N
	 18gnJmfrZWKqRYp8F5OWUZ9BnFJuYiTUEFxOfc/qwAfO02pmcXk7pL3EQLUt/KX41W
	 EI09qoGwoyKm3XBej/LlsIHf1i+Xm7kPHXBI2fqSLWcXNJ17PWwkxafF+JRGINInKT
	 uVoeDBuMdO1dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 860BE8297F;
	Fri, 29 May 2026 12:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D2DDF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 12:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E6924073C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 12:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjNDsmc2t-RB for <buildroot@buildroot.org>;
 Fri, 29 May 2026 12:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1898C40399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1898C40399
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1898C40399
 for <buildroot@buildroot.org>; Fri, 29 May 2026 12:07:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09fc.dip0.t-ipconnect.de [91.58.9.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0F6CA4C0357;
 Fri, 29 May 2026 14:06:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51646)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSvzM-0000000015f-2Kqs;
 Fri, 29 May 2026 12:06:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2026 14:06:56 +0200
Message-ID: <20260529120656.1259760-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780056417;
 bh=2cUcYL6wh8zdeQVdxKHw345ZEnPmr/bxySY0l42kIvU=;
 h=From:To:Cc:Subject:Date:From;
 b=fnk/R45s8sSdTTAX7AmHyigAwYaDz1/MViOT6Qv4ZQeYwdWcjqZfpWXGesLawHGsE
 CZ9AufpDowADRXTbshAJA4NXIC3xYxcyLvM7jRXcwJfQmHONryT/jm9eaqa4V4q0T3
 PjB9KRjYEaj2Jm+CDlyH86WBYz4yd62GoZZCenJYiAv7g9yG/Eow9WLsl0SoGNxXPS
 uTnC93seePnXCaUIfmf708rPPTCWXgndo+Oa+HcvCIN9qzgccWH84+79KJHTwz9VwS
 4wP4I9XDVum1iOiqGGA7I+IU442aYZICa65izW3ROkJQiU1r5J/RpXW0NvIyJW55EV
 izudk8KU+AV4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fnk/R45s
Subject: [Buildroot] [PATCH 1/1] package/Config.in: remove zeek
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

Buildroot commit 948f819d955cce4917c12a4d65ccc55c29f5e501 removed the
zeek package but forgot to remove its package/Config.in entry.

Fixes error:

  package/Config.in:2675: can't open file "package/zeek/Config.in"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index f32fcd8723..b2305ca019 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2672,7 +2672,6 @@ endif
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
 	source "package/zabbix/Config.in"
-	source "package/zeek/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
