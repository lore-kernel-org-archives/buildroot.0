Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE3AE77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DB6A403A7;
	Sat, 30 Sep 2023 13:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DB6A403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjEI1k__qyaq; Sat, 30 Sep 2023 13:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CDB440B0E;
	Sat, 30 Sep 2023 13:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDB440B0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA5DE1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92CEA81FCE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92CEA81FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnNK9tf8fJVy for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:15:17 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BFD481FC1
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 13:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BFD481FC1
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso352877566b.1
 for <buildroot@busybox.net>; Sat, 30 Sep 2023 06:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696079715; x=1696684515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4REJchR47GiWbsbW/9hfid1HKlKJt7R6CAGBpgTf/3c=;
 b=PGVecOfq5AERPOzT5L7bziBzeGkPPR8hF1pJ6En1lXWWKkfFVm4rGQY9RcqsgjFVR5
 +5jz1Ti1gjSAAlJK/80uRKtqIDFW9Lzie4poXlVwRKjzmajhzgK/KZMooSpzJ5kDT3IA
 nBcfWqIY/+HbThvwAORfjLZhTs1M/wyAEqBiIP92Pgt0dxFzrWI/LQa2WsZivEM011xr
 2gjD7R7cFOL43O+VpbNXvv3KFYiN/mYuhZR6rdRR6awGgk0cpTtTXUuvARgY3VbOiRZd
 9LpAYHv5jJhvifB/Z5jktOfVwyYeib+wYMpkR8ZuMGIoxgdjGCUy+60rpb5KEsowEEMx
 yRyA==
X-Gm-Message-State: AOJu0YzsBL7J0FebR1ZB5sizV03nOaCJxFQ9hyQrvdyPdJazU1mC7Qy+
 kXNfBMyPzVz2/bOoVhAh9YNHBxbKg9I=
X-Google-Smtp-Source: AGHT+IEuA7CboLPSYkDpZr79Waeg/UiDUenO+RaOM9wIzwTsXI2njhAtIY1+oM+F1ze4JkRSb+j2Xw==
X-Received: by 2002:a17:906:74d6:b0:9ad:e41c:e9c9 with SMTP id
 z22-20020a17090674d600b009ade41ce9c9mr6805858ejl.3.1696079715167; 
 Sat, 30 Sep 2023 06:15:15 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170906278b00b00977eec7b7e8sm14084934ejc.68.2023.09.30.06.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:15:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Sep 2023 15:15:02 +0200
Message-Id: <20230930131506.3320394-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696079715; x=1696684515; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4REJchR47GiWbsbW/9hfid1HKlKJt7R6CAGBpgTf/3c=;
 b=UQhDS+v18FLjU4rE8OdICenLAuiu4OSjpF+ADdApiu4rQboT1OuYmJ36N+CwszUNOw
 kCm/CHCto7H9LNxi6mUe1fuvevt2pUkH0WSEz/eTY2c5UxLp9eSIks1itET8KmrDMTVT
 Iv3Xyh/iqej7zqe/GBngjfkdruWPUZg3efh/nCbrxH2OvkWH6SjnB968UbhSssLXN3RP
 2D85UHitgKuZ8EoPhVa80lqoceYfVVFioyOduLpQCk6748xHIj2ge+b4nwq34lm+oaM0
 s70gMFtlJ012QTrB7bLDzAH0MweISgkZEl/KH8t+ShBryY3QDYxc2LTRRZ7YA6ySan3b
 5kWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UQhDS+v1
Subject: [Buildroot] [PATCH 1/5] package/perl-convert-asn1: bump to version
 0.34
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

LICENSE: update copyright years & switch to Perl Artistic
see https://metacpan.org/release/TIMLEGGE/Convert-ASN1-0.34/diff/TIMLEGGE/Convert-ASN1-0.33#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-convert-asn1/perl-convert-asn1.hash | 8 ++++----
 package/perl-convert-asn1/perl-convert-asn1.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-convert-asn1/perl-convert-asn1.hash b/package/perl-convert-asn1/perl-convert-asn1.hash
index 644517af5..2d1b1faa3 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.hash
+++ b/package/perl-convert-asn1/perl-convert-asn1.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  80425835020da77c48c05a40e25bbf7e  Convert-ASN1-0.33.tar.gz
-sha256  1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076  Convert-ASN1-0.33.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  cca63088fdd5c3665a2119ee29133f6a  Convert-ASN1-0.34.tar.gz
+sha256  a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7  Convert-ASN1-0.34.tar.gz
 
 # computed by scancpan
-sha256  70884b19a3537bf179538c3b7d7896a56ade509dafe6b8d545c5999a9c05f8a9  LICENSE
+sha256  aa8ae28898a3e164ed5273c3e4fd4bd45b42f7958f282318df06773340e2c9d4  LICENSE
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
index affe775ac..07f9b1d1b 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.mk
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_CONVERT_ASN1_VERSION = 0.33
+PERL_CONVERT_ASN1_VERSION = 0.34
 PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
 PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMLEGGE
-PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
+PERL_CONVERT_ASN1_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_CONVERT_ASN1_LICENSE_FILES = LICENSE
 PERL_CONVERT_ASN1_DISTNAME = Convert-ASN1
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
