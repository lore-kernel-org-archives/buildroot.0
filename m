Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CE8E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3546540725;
	Sun, 28 Dec 2025 07:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CblvA7SCi17u; Sun, 28 Dec 2025 07:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 614F04062D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908390;
	bh=cdk3uyR2tN09eHNwm5Rjl3np1xeRHzRNyTR1wAmWovo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLdh515EFCnMzaN1xj2B3W6CgrjlsM2wROJ0a685fgAoJsf79N/LsQnUPyux2cV29
	 etCHzO6AN32fcoGT2B8ycCOOvky8bJkyw7FybDa+FJ3LH844LZG08/6T/rivkZAEFI
	 rzxlGn36867IXxARQC7F6v9CwnC/bv7tr1NZewJfhL9+hPt+rowl5QqcSQ8LEF872j
	 h3n42QVpC3TKe9zXFbgZ6F/qaQhjpW/WtmVogqWVQ1rQdavZS56cHueo31pKH7io5b
	 +SJ7cLpvgCP/pnI2JlW+r6iPWB0PNYUB4FXi06wUyrHfCRQsfDe0NfFtpUErXnN9Ng
	 /HmmNtR17LKqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614F04062D;
	Sun, 28 Dec 2025 07:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9714E1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EBCA4062D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppDLXYiOqNk2 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DF7040625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF7040625
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DF7040625
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0391EA4C2321;
 Sun, 28 Dec 2025 08:48:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVr-000000004ex-2lCp;
 Sun, 28 Dec 2025 07:48:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:48:18 +0100
Message-ID: <20251228074822.3370464-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908119;
 bh=7Aag5+7VYWixr8uut6I5+10hYWlRm5sJRYNWQLveGuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=h92JDqzLLtQsfL3SVRN7a9sLtqvzD1XGAg2en5qpIkEQEA7Cp/8zjTieh6hxBm6JJ
 CFn/jMP4/9F40cb2DMTRyU2/IhCIZMTtOdxa6FZml0aaKeYg4MVRsqFn3ZkUFIppcb
 g5Lqdn3pcHT6MyUJOx9jR8W+jZb5ieycquNxVExX4XLdphl9nqYg3NjxKpHBg6DClp
 W5Wfp3a9ovyw1U1uK9rHx5a7KQuPsPeGBeMESHD3wJ0KkQXYXtQNScqDDnoPcKTQl7
 tp+YKxRmlWs1ba14v06BoSyaLLN02lFAxlOpjmXdxFHpibVY/qNUhoQTE5BSB90o0g
 a0bnmgVsWW2Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=h92JDqzL
Subject: [Buildroot] [PATCH v6 23/26] package/gtkiostream: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gtkiostream/gtkiostream.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index c748c7a000..250e47a0a4 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -47,10 +47,6 @@ ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 GTKIOSTREAM_DEPENDENCIES += libwebsockets
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-GTKIOSTREAM_DEPENDENCIES += opencv3
-endif
-
 ifeq ($(BR2_PACKAGE_SOX),y)
 GTKIOSTREAM_DEPENDENCIES += sox
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
