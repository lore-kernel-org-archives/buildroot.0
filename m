Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C727D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66377614A9;
	Mon, 12 Jan 2026 07:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSni4ihaXtMk; Mon, 12 Jan 2026 07:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FD36149A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768204708;
	bh=9vgyc1DPuVdw+3Sgrazvk1v5Znl7hrurCuw17M+xpPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JCHNAcdDbyHAqMf9Xo4ZhrrK37WW3WvAI6LZfQXZLNXUBA9qANrhYnWiuL1j81kwZ
	 y1yeMKZRO9e6jJqkfLC8vkEpDqYfvZE10bFHc64t2hdynGNzuuaeJ/BV3HGZndm5qC
	 RuPvIBEbkoUgsaawZtU3/EwB9h4hncgGfNTT1NmZS5ZAkOxHHu2b0WPVstuIfOexBy
	 buTiIa2G7zPmuddum15gbPlRM5R2d0nlTAsp4aw+Cnd0/mLhZXxU9SR0n44WKV7dJC
	 DcsvQ0n+XtHR30PGiYH41FFF1dwTHP0Yyv9t29v56bJ4cX5SZqN4NU7j8XambPDpOK
	 QuwsTiIylk+RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10FD36149A;
	Mon, 12 Jan 2026 07:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00B9C12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB4EF843A6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9ji1Cd-kafn for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 07:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD28B84398
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD28B84398
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD28B84398
 for <buildroot@busybox.net>; Mon, 12 Jan 2026 07:58:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso27604045e9.1
 for <buildroot@busybox.net>; Sun, 11 Jan 2026 23:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768204702; x=1768809502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2hDlJTGow3OT9Lnl7PnaPSouIG0avpg7fn634V132Y=;
 b=ow5rdUBNiOJwpAaaBlw5Uk2TBPfEg9mCRE4fMhSAwMynTuNb6Ct/YmNT0kKZMxaJL8
 4wBaxSXVqhbuRNGzOiKrZHUkoDVuoDN7UmDdC+ErPKyMzhFOpcu4UoEFD9TnFl8f3LDg
 ncWuI24ijEBir+4sSSVz3bWFvyyeJu796yJAQWx1LV9qrpsFK1FszgI7rMnfyxRKJSkP
 xYs7sgnmfvW44rxPcgmTFjBHB0YkqhIWDQ5XxZZuZ6K/qYKTif4oBpptkfuMPLp81usL
 IK6QYBvQOhHiouLpLgjFLftbNGYJSH8J/BX70BO9AO1SRKunUhcmxre89RssyyZs27vm
 AUog==
X-Gm-Message-State: AOJu0YxZDxzs84raICbjwctC1DTeF35lb1s8bs6IlBJnrFnUipSbaaxf
 FE39fLvcwz9ork7Dei4bR2Sv4PUdzE6iMfluJeZ754asr8V9ACUjqpGCR1S63+DySOXfwQnk+UI
 gZ6yang==
X-Gm-Gg: AY/fxX4vuma/WSc/60owrBqcWJPmIctxStULkDjU4KgAUyi6qXGapuBBLEjvctnZI7o
 JezqKKtMZ7v8kSMumNQnv2Qo1Lz4bARFVMNZswJJmpGpuN16tcnSZWDypSVARk+ogJSf++dCNle
 rxOZetQhwnHzm0WECghO/E4yLT/XUgLtEPEmlLy4JidVm09lzudeMkhJqlnr/GQWtW/GPNtKUEP
 lnE8y6JCUszpH6VKHXLb1cQtjgwubOe9nHbgYuESfmcMAo5gUlo1FsFM01GizOpkDGkltx13URZ
 /6080h5aprO68o2eTAa1Aem6DNIwFX8lat/gPnUnqpwSYoAi/prbCof5RqXs+UDPWntMIQbyd44
 xEGVZy2I8S187th1ilmcO04sb8l5PIMK9uw45P8s5F3G0Qq1G19GXb5If+s2odjtWTrfREaZnJc
 6iK/gGmBOx0EXJm/3Dr2cp7J2fOFNhJm7kpLo=
X-Google-Smtp-Source: AGHT+IHKDNQl6ZlqBhSpxEAlzP/XxaDVEGQwFGyq0hsDJue2fMeMIF+WATp3TvEbU4iZ6our7OipLA==
X-Received: by 2002:a05:600c:4e13:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-47d84b32f30mr213489025e9.17.1768204702281; 
 Sun, 11 Jan 2026 23:58:22 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8661caffsm123217675e9.5.2026.01.11.23.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 23:58:21 -0800 (PST)
To: buildroot@busybox.net
Date: Mon, 12 Jan 2026 08:58:15 +0100
Message-ID: <20260112075816.710903-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768204702; x=1768809502; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h2hDlJTGow3OT9Lnl7PnaPSouIG0avpg7fn634V132Y=;
 b=JVfX1aZeQ5SRqHuEB6m5ozw9twwpNgXFpc6tL26+DGAdCrQpM3WnvyBiC7ExRQe3HV
 /z4paJn2fRlZzVPPe2I32D/VSv8ZfOduxLi1BN6zET+7Tu/EAqLfIsyM9BJAi2MVEXDc
 xCMTUTYsAoF76OLS4GctU5NPvg0MaO+tzI9yIFdjOJhE9uWFzVNrREE5t5YZVuzMiDFw
 pGZFKPmG8l8KfOhmdDeraTlH9Q1PnhSm6FBz2GLOZCFNggxIXIRw8REQoOkgqX/QkNlM
 e7V0dFbI1Y7B5/LnLCYyNFV31Y60KYXAphB42dGGt1R4EOeewaUuAaQ3JOkUnz7SH7Lf
 7o6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=JVfX1aZe
Subject: [Buildroot] [PATCH 1/2] package/perl-net-ssh2: bump to version 0.74
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssh2/perl-net-ssh2.hash | 8 ++++----
 package/perl-net-ssh2/perl-net-ssh2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.hash b/package/perl-net-ssh2/perl-net-ssh2.hash
index b2e8b2d48..0fa86f115 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.hash
+++ b/package/perl-net-ssh2/perl-net-ssh2.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  57aa0f6e2be4020f75888a7195ad5cba  Net-SSH2-0.72.tar.gz
-sha256  867d83070fac6436b9f0971918243002072fbf8d2724a87c254b34250dce0222  Net-SSH2-0.72.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  6ac3a6616dc673ae00ba101e33d637dd  Net-SSH2-0.74.tar.gz
+sha256  1c124699745eeb40ed636097fdcc3e722c94cfd7704ebc0acfb0f05541d2809c  Net-SSH2-0.74.tar.gz
 
 # computed by scancpan
-sha256  268afaee7aa88a41959c93cd91853e8124bdbe64a74480d36ff1130e01a1c0ca  README.pod
+sha256  5fdfc16a4c38c1a82d97f91bf3166806c03015ec42bc2b96aee330ffeebd9461  README.pod
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 20e45b628..f5ba67865 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_NET_SSH2_VERSION = 0.72
+PERL_NET_SSH2_VERSION = 0.74
 PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
-PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RK/RKITOVER
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README.pod
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
