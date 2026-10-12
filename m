Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA22CA9EC5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 203644068F;
	Mon, 12 Oct 2026 06:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyITVDHXAgyx; Mon, 12 Oct 2026 06:25:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E40DC4066A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786357;
	b=dd3NVAe6QxtVnhiY4ly1ydTh0PxgjRgbHQMNbZOIZUUIboiBRPoezHOR+Sx1xjzGkUT/
	 hAyaYgO0BU6LoZUQ6cFkg8XwMMpW+EkcfMcJU9SwioFAWT8slOs1K/hTt+Y86NJIaEWpy
	 hxt1+LOQCMs8hd8gmYPpiWY3pI7tY5NaiNdCrijpWlk7RSLM2PeYme3aGvW6LbWyq+Fu/
	 xpjAQlqBlr91tNM2UlvOaRiMNkEfj0ah+nUazMeB9F9qFo7hW/Y1bbN6fWsnpjbMx1MUM
	 OO7kiS/G7+jd02NCz/hAIJkLh1fffpaOO4PFqDBYIl3PUs7vRpUChzkOySdIPnuwlsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZBzG7dn+mOo9GmytvleWM3Q15yA0k3VxO7klit6MIVI=;
	b=YtvXik4kbZF1vDWQ09r5lYzVfrRS2bPxsDbESNSsT7Jp45gj523GY840WqjHYOHuXcyc
	 hnmGgkXyn4O9zYM+tiFT3BHAMvxAfVfMTJ+5nhYBdVlcixRvDNpmKR7gV6nMFHG25PDBs
	 LLlfOFWHupJ5iY7hsJA+EWJS0bWEYtqz73z/dbtTyKBPCqlnfTKc4n0Xw/tXMWdcfppZU
	 VzjjnQqyBv2CNsJWo4dcjOl0Y4KYbQaZKIkisk83hFP6gBlyoj5yenOSMrW7EH7aLR3/9
	 9hCfkcmbD+BsVp6P8sB3IrgXuBT6V8Qc6WrVjRiAI1vlqGfTMEa/loHf2hG2Kn7r60w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786357;
	bh=ZBzG7dn+mOo9GmytvleWM3Q15yA0k3VxO7klit6MIVI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJTS/6yhKZJFwEtJfD+wJulc5/Fdx4TqFBRUNLdLWkDRlHuXObEFOP4ulsbZUP/o8
	 uiidnuw2u89lqPlAn3VWtiujPMspIdeq/ztle7wWOMd9ZxLbyX/4OFIVeGktXkGIFJ
	 6PwWAaDIE0PWcIuj9qHY3buQD0ZdK5IKO0qNW2Pw46Z4Dz60FaKNYrobZkBaUxncA3
	 qZf7r2USPEro7swtrxhPbFsFmc6jERP+tKhNgLyLVe37f0zuqDOtOS0WcHVANsOL+c
	 Q8ji2sQpDiFZLeAAZgyX8+2E6kVmc7IxctWxeW5nHKDSztXyFVmilk0TMVSjS7DF4a
	 JkVhUIbwT7bHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E40DC4066A;
	Mon, 12 Oct 2026 06:25:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDA97380
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF82A80CF8
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1CPZjm9Gkk0 for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D07880CEE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786349;
 b=H/FyVATrl2uIrYYiGxhlBPtS5okW/vFTA7MwCtvYXLxu6RNXO7xSvKG7mv4ie2rKOXjm
 V54v1D7zjavaXpA2ds0FnOvmHpk34meGx+xbry93zpMkDQaFf6EcR0SXHGU/1nulxzFFf
 vXD/SZ1lxtcFCYrbb2NyeUVEneYHOI6WsLML61jloYfoKktcOj5gMAlitSsemvI+4iPsQ
 mUw9y1BOmqqLVyBxHsNKWT9zErMXPlSklabp9GU10LKcHedeSLx+xMV73ULwhlIh4Llaz
 oSZr5KeS+y0bvAPgRNKAP6zS+3Np5r9NL9J8m0vmX5MEfhj/R7h7RtJl7y81qIVHfZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786349;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=lqrNs5gza9PKFCEMSrtm/AAinEIAmk8/LFnTZaRE0pc=;
 b=DYDAXn3yxOH8oOdE05sSPKu/Qrwr/fjSXt6OSq/8I/kCeOdkYZVwpaOlo2pzvzVXIeD6
 Na13BNftygNO4W0PpaTALU7eMxkjlVzvCUBxpUTSu/StzLiIP6ePBxRRVwcBv+1YE/0WB
 XhRWp8AcHFs9vdQzaNMZWhfhnRZkZoQFHN4uxiPySb3jCTgC441dnMDpZhPt7Fd3BdtOr
 l/6EZD3XdTwt5b9z2j85zU594gGM/U7s8l5bXXew15ZvuevsdLePIH60u4/jLFPn4TNrG
 wbsQGtTyq6Qb3YBEmtrRzKF0dD7LugSjFUqfX/BtTxusQgKkS1U6aYtH8JFU5fxFlWQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pBesLs23; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pBesLs23
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D07880CEE
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48b0d19cf7eso2388804f8f.1
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786346; x=1792391146; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lqrNs5gza9PKFCEMSrtm/AAinEIAmk8/LFnTZaRE0pc=;
 b=pBesLs23QRs8NeWkSy8qhh57jIP070lcsbMOUoh+abgQ7awxkuHpEjtyxiUx37H5JV
 Cs8vXBOLPdQHeJCId49djOgfrle/hMFMN+DFUyPN7U4jgRIwjekQET1kQ8vDICiS4PiD
 PrXfi5L6T5NgfLxHj66Hyoocju4IdcNE6CChhKjcw5ypGL21Z6zZ+gaLcfbMrOVcNP4j
 o2jFPR2YMIwV+1ei1IdMX5QhUI9x9WRvrVGu0XJ+chAtqkHHntxHrwAD5CEA5S0od7QF
 oWarV72EjkJtz0KoPPizWug3l2bgtZFY56bFUisg70DeZ7G37txs9A54Ga70909kjYXG
 b5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786346; x=1792391146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lqrNs5gza9PKFCEMSrtm/AAinEIAmk8/LFnTZaRE0pc=;
 b=hZ6dSmqvotcLaXixd25+keqh2TZsn4gpEgryMRCCRuCBO0GYnXW3sNv6dfXe74Pvzr
 88Urr2ZZYbYxlOFa2StzzLL+BQ86jjf5iz4e23lPNnSfDBf8hb8rSD1YNTXpAr+6MUIm
 bOek9FQXUE28tJGpty05HVpiTwg7SxpXMkSp55IzsMwvpEN+Fo6xpIOJRSPRwC/UX+wv
 dHoKKA77VXvq/QMh/8cq4vqOyjjulmHlbOCl4vraru4GjXGXOJqjac3Z228a4TJOJqNI
 rCaSG7BG8tg99dwKXJhV/odiFs0CfNOgyg5zlnyIHcToIDP1BJyRmvl44+nrf0oCdoDn
 dLDw==
X-Gm-Message-State: AFq9FYKjc6g/4jTdb1VRy7QhneqY8dghYOJ5NeZbzBd0G1lSgbM9hEql
 eW6NopyrdORJMMzxqkfJ/YzKYhE0jpMlQxk+RVfwPDoMKuLwn/BThBeIDVvIkA==
X-Gm-Gg: AYBFou0yX3L9hy8RjL+uHzIBTIWddZcK7HrBzNqZ7Va3EKadZoS6w4thxqZvelP2kJ7
 QI0Icw1WGAml/qQlr0KWRjNeGv0032TLK0WlRqAy6q+Tz75HUBoDZ3LPbaJhgRrz3coMV8IOELt
 tobw+5PYPlItcr3QbfvbiheJVAZHwpYdSG+t7RoCrur03YzPJPVmZnBfqzAEHDRl1rSigpktWR/
 04uzMGNlB9vY/l4jm0DJGp6ZR5hmI2tMK/aOiihX99LyH+zNfWFZpjSmFtZlxt6HGFP3292ayZ1
 KquVPw3qIQqEpb9IdBhuchU9h2t0pLd5fwuYVZd19/FQ5p30FjTCBTJLS4nF368UxpMxx1rVEbi
 Jg3SiWFPMCHMrmXjEflQ/DP7dNO3QSfMGRo73ZPQGp1DQftJXdM4DS3Tjh3fXmdL426lhxd1nr+
 MKeGvrOv2qEO2FeEM+Hq45aKfFjjhDZX0zg/N6o9FfuTreSQtQJRW+yEF74a7NcZO1yx4xNhH1G
 Fw7r121QSu2gWTupUq8n01tnUHMlJK4X5rBti/7
X-Received: by 2002:a05:600d:4443:10b0:4a1:9c71:9f17 with SMTP id
 5b1f17b1804b1-4a19c71a176mr34250815e9.9.1791786346291; 
 Sun, 11 Oct 2026 23:25:46 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:46 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:30 +0200
Message-ID: <20261012062536.78874-5-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/10] package/perl-mime-tools: bump to version
 5.519
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-mime-tools/perl-mime-tools.hash | 4 ++--
 package/perl-mime-tools/perl-mime-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mime-tools/perl-mime-tools.hash b/package/perl-mime-tools/perl-mime-tools.hash
index 0b3ce379f..f2ff461f1 100644
--- a/package/perl-mime-tools/perl-mime-tools.hash
+++ b/package/perl-mime-tools/perl-mime-tools.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  dbc3c9f982498c35d8a103af17c5b5c9  MIME-tools-5.515.tar.gz
-sha256  c1ba1dd9f0b2cd82a0e75caedec51e48233f9f01dc29a0971bdff1cb53be9013  MIME-tools-5.515.tar.gz
+md5  1d8ee049452cac8ff313a7cb4096238e  MIME-tools-5.519.tar.gz
+sha256  2e465205482a4c5938ee3537f215ba22ac96b22c7a42b4f7d32d0f77fa1a49cf  MIME-tools-5.519.tar.gz
 
 # computed by scancpan
 sha256  151cd94e37eb05239c5a678c7d1c4d9d5241a7c9c138760b85152bc1947e2b93  COPYING
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
index 1b526be91..50c85d2fe 100644
--- a/package/perl-mime-tools/perl-mime-tools.mk
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MIME_TOOLS_VERSION = 5.515
+PERL_MIME_TOOLS_VERSION = 5.519
 PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
 PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
 PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
