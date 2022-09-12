Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FFDECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70B1142578;
	Mon, 12 Sep 2022 03:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B1142578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6F4E74KpocC; Mon, 12 Sep 2022 03:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE5C4256F;
	Mon, 12 Sep 2022 03:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE5C4256F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36A2D1BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C7384012
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65C7384012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FuuzWtkaSL1C for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165E284276
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 165E284276
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:37 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bj14so13250329wrb.12
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GQv6rXbqTHJ1z4ZnLdx2vNtTM3AqEabOd01PI/n02m8=;
 b=EHa0+GbPgMM2Zkr0VImOTYvBPKe12A/G2R/A/veGucQgPr8fKPzb1IPeN+usfLRGBd
 8B6WH8CArJzMNUIhngpLtkbhhRQclbGU+WJ0ovahozrcJbNcrXT4JprFtkrHK490eTts
 IwpG9x5CSPeOk7M/qloHzg295ALS0RKq++OSkdd63dPQmQoBGp1qg6knrsHH68Ld0Kcx
 DdqZCFL0AtqoBXM3q1feHMgsDwnCu2YVZCM0Ef8b3EulSb2/tDHxLc7lQEvFAOkGudZi
 Lmo8YY+GGDfi2P71nUUPwsfKdoDVSiRFcMunUPrP6RarMKhUyj43XyfB9pdQovCdNBIJ
 TkQQ==
X-Gm-Message-State: ACgBeo2Djs2IhSE5YbIs0juA/aLhkAVh2E5EzAftLAxyxZVbRQexNz6U
 K2r0gQVzN/Q7A9INXGD3bZ71hHLb7ho=
X-Google-Smtp-Source: AA6agR4CkKmcv8w5Bbt+AwCLWmQCoh1lIpzf8VMFZxfIcjihgeEU5mZlIpOVe9kEsjnKJBdVOwIA3A==
X-Received: by 2002:adf:fa10:0:b0:228:a0a4:844a with SMTP id
 m16-20020adffa10000000b00228a0a4844amr13126908wrr.127.1662953670896; 
 Sun, 11 Sep 2022 20:34:30 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:30 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:12 +0200
Message-Id: <20220912033418.2587016-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GQv6rXbqTHJ1z4ZnLdx2vNtTM3AqEabOd01PI/n02m8=;
 b=EYRXqZK/Goq1VLrp0x9MUDeiaKouxYi63+UKZH1iyLhXwpchcZ8qA24YbK0jBBEAle
 3WWir01ncQREcLuLP4hmxKV7S+Ghw6hq9l/0wKcd8uYalUoX1gH0x5BwgYnC2e9BRoLp
 VeI3q4oMo/vlBKZKg7/Cj4UUSegdZsPrCuCxZCrGskVOxKGH7k6TqivutRsurOoBS8Cv
 gfxulOg8h+pEB42gP9Kls+T4H754RCEuX95I2X8K/ufx+HIOaWOoO+C2Hst/78jzElBx
 nSEJ440zMwpSHRU9TCzJetDJAcuFIJppiztduBziIiVBKRKQzV1VRQ3z5iHpyiBJtgZO
 Oz5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EYRXqZK/
Subject: [Buildroot] [PATCH 3/9] package/perl-io-socket-ssl: bump to version
 2.075
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 4a1d71e34..8c6bb3052 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  53201b8e4dfaf25d4d661a54fdfda602  IO-Socket-SSL-2.074.tar.gz
-sha256  36486b6be49da4d029819cf7069a7b41ed48af0c87e23be0f8e6aba23d08a832  IO-Socket-SSL-2.074.tar.gz
+md5  8f0f6bff4db5e4be6e848aa49fd29380  IO-Socket-SSL-2.075.tar.gz
+sha256  c30ee2220b1e181a968ebbc81861d0cadf334b001377a44105ae5a8637ddae8c  IO-Socket-SSL-2.075.tar.gz
 
 # computed by scancpan
 sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 1ab70509b..daa46acf9 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.074
+PERL_IO_SOCKET_SSL_VERSION = 2.075
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
