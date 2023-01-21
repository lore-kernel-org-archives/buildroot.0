Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75F5C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 16:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5945E40936;
	Sat, 21 Jan 2023 16:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5945E40936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmGVRxqwwmJ9; Sat, 21 Jan 2023 16:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 938D0408D1;
	Sat, 21 Jan 2023 16:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 938D0408D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9D701BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 856A182400
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 856A182400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rleOhbFkym9L for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 16:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75C0C81836
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75C0C81836
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 16:35:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k16so6162111wms.2
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 08:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNQfTgBJYm13jssN8Ck1egcZJZ5Y7pGzmkwZWH1GzxM=;
 b=ftpxVxUqInBXi0PtxPIarKvUsJQddL/wZOPmSOvng2z0xdu4CGFbnrDHYY9vxvNZ4g
 Lf9/mE9DwMBOJg1Ps0i6fJLTPjb8De2ddp0voKrvKNY4ss1IcrAiBu1WunWhSggWAOow
 Sk5mCR1C5jU2uazogBBgPZoN8EW1AcvIDdhoePwOnq27sBrMEfIsVomL2fIpym+Hdxxa
 gaggsaBw5nEAOsl5muEu95lqFE5nRwuyHpGoQURrLr85T3bOCNowkOm2dCVy5WDBiVZY
 UFV+wsf2V8d3EwH4pi+Of+kRg1XVWP//elPXU/8F3L2+egY7baL7AgnAprfKl5A919Va
 j0hA==
X-Gm-Message-State: AFqh2ko2OXWkWJYIO8Rn31Ii30sOefdk5C5UEUbrdFjWn2ld1fSvEMHY
 PdLWoCYVSnrgNCXTXkmmE36EPN1MlBc=
X-Google-Smtp-Source: AMrXdXsUct0v1Hs6as+L3CU994pTE+K5NsaHEtBZxaFYSf+zA4n9EdByDnsBvBO8pbTACqy5ic+WaA==
X-Received: by 2002:a05:600c:3488:b0:3cf:68f8:790b with SMTP id
 a8-20020a05600c348800b003cf68f8790bmr14823707wmq.11.1674318957649; 
 Sat, 21 Jan 2023 08:35:57 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003daf89e01d3sm5648794wmb.11.2023.01.21.08.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:35:57 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Jan 2023 17:35:32 +0100
Message-Id: <20230121163537.147981-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121163537.147981-1-francois.perrad@gadz.org>
References: <20230121163537.147981-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNQfTgBJYm13jssN8Ck1egcZJZ5Y7pGzmkwZWH1GzxM=;
 b=TwbCqCcsi4iVuUGnEvcIKQ5fPwEg1RqC/Tj2lfmx/REdmMdACpEXeCjxKH7VM2KrZN
 EO3P+OQxx76lI2vm0yc6YhoRPUEZeExJc+h4RgZmLg6ErqpsCln6eGe8TL9e3EqnU3/A
 GX8bil+3rhMwnnlrcY9bsZWZjjZ+u4fHl882cbCYKUv7oNrMEFE8vz4VqRbMgBfyBk2r
 G7ShGrIw/vzeU1DFPfzmQa19cI9+1EIboW51/XHIWx+gVfhGECCcX2VXKUM09EGS9CW/
 vEbED5MBJQVOnwiLmNx7C7qERuiPZmxD0yT3++YGt+azCbJ96JBJcbApYVZIbQNpxXgn
 DX6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TwbCqCcs
Subject: [Buildroot] [PATCH 2/7] package/perl-exporter-tiny: bump to version
 1.006000
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

diff LICENSE:
-This software is copyright (c) 2020 by Toby Inkster.
+This software is copyright (c) 2022 by Toby Inkster.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 7 +++----
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index c714ef902..0ecdf7848 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,7 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  485897322a2514b4d6ca90b2daacb7cd  Exporter-Tiny-1.002002.tar.gz
-sha256  00f0b95716b18157132c6c118ded8ba31392563d19e490433e9a65382e707101  Exporter-Tiny-1.002002.tar.gz
+md5  2d555e289eac6450052e8683c292cbf7  Exporter-Tiny-1.006000.tar.gz
+sha256  d95479ff085699d6422f7fc8306db085e34b626438deb82ec82d41df2295f400  Exporter-Tiny-1.006000.tar.gz
 
 # computed by scancpan
-sha256  f4cb223c8ac37d6ccd0e78b2892ca54a48a6adbe6a271c3c17c0226646297e66  COPYRIGHT
-sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
+sha256  a4f85c6f4d6e8bdd37b7ab08013e3e3bee1fe8e910e20f8f54d5025ffe40f384  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index c7abfbae2..489ee54e1 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.002002
+PERL_EXPORTER_TINY_VERSION = 1.006000
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
-PERL_EXPORTER_TINY_LICENSE_FILES = COPYRIGHT LICENSE
+PERL_EXPORTER_TINY_LICENSE_FILES = LICENSE
 PERL_EXPORTER_TINY_DISTNAME = Exporter-Tiny
 
 $(eval $(perl-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
