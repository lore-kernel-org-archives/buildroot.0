Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAB1CD37BF
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F80409EF;
	Sat, 16 Sep 2023 15:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F80409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1EW0wGTqbgtR; Sat, 16 Sep 2023 15:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 750834119B;
	Sat, 16 Sep 2023 15:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 750834119B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBB7A1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAE1D81CE3
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE1D81CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQdOXNzp5ejS for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:44:19 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB0AD81CAD
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 15:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0AD81CAD
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40479f8325fso20891245e9.1
 for <buildroot@busybox.net>; Sat, 16 Sep 2023 08:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879057; x=1695483857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9Ft3o9IRuFhGITKTHt3Ys9fn2eVKLwXiJ88rE7V2os=;
 b=awDS6GsmByCbirBWq+9ZW0Irx0MnOhLrpblNiTa03l0IkYvylP+0YWKaUkF1A7e2u3
 cabHP3AoynZFovIOJJkmQp8dIZHWKL8+kKmwpGw+PkItUKrdBGVJ48FglL64NpKV03sQ
 W21ISxMO1vVYgk5TrVz4g5CtlDfqLiv2ubi3jhC3KaBk+9ost0kPhVMfRfYGcCxoGcjY
 inH0ff3CR9bPPa+pyiaIJUkG+zHUosHUv8EaAfO4FfXbdCfQxU3JycSvboCgenbbRaNB
 qxW8/QeCv7B9nQ/9DZsCc28fpAibvgem3qIinwsMVXF19P4eKhF+K6jRWF4woTqhi4TH
 JcfA==
X-Gm-Message-State: AOJu0YwRLgtoFBdCYrvlwViirkaH8t7jKRcOI40TbYe0pRnjHjnz+P8X
 cvFgcYnOgDXtSXTVFXh74LoUT4jS2Z8=
X-Google-Smtp-Source: AGHT+IFvCj/mPhpH7ocWk4QN9m3bFGPe0gKt94HslA6h+yI3RgqraeX1TzXeDTIu1SiW9ThcLRnA0w==
X-Received: by 2002:adf:f651:0:b0:31f:e32f:a503 with SMTP id
 x17-20020adff651000000b0031fe32fa503mr3398818wrp.20.1694879056790; 
 Sat, 16 Sep 2023 08:44:16 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q8-20020a5d5748000000b0031de43fe9bfsm7522010wrw.0.2023.09.16.08.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:44:16 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Sep 2023 17:43:47 +0200
Message-Id: <20230916154351.2747233-12-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879057; x=1695483857; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9Ft3o9IRuFhGITKTHt3Ys9fn2eVKLwXiJ88rE7V2os=;
 b=nDaGOxWA2mrx9452k5V+17OI58NYGGPdsVTBkiBjDLxLX17+xKENN2uQaQzAKo/j/X
 2YOQ3BVyUph3dSbG2YrNXYqLlZqxWUnwsnKQTOxPm/DQAuwboFSe25TTh5lgyDNHdNcs
 9eNRVrxdt/KQlvd3X3Ppn47nsLw9KY8q1LYr8nZFvWil2Is/3OReJMqXW5LKkT16AyRV
 Ori1ZCVdD3F5lrKfhUc+aX97QMNIIFU88sUjoEVfTzJgbowXRnIIkk8mH2s7jlUD7Gl2
 9fZkdxAMfU8kk7NKeXXNevaAnpauC+zzBs7vkjvv68M4Z5eyptdFtyaIvztFtCoaWClR
 hQKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nDaGOxWA
Subject: [Buildroot] [PATCH 12/16] package/perl-plack: bump to version 1.0050
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

LICENSE: remove  trailing spaces
see https://metacpan.org/release/MIYAGAWA/Plack-1.0048/diff/MIYAGAWA/Plack-1.0050#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-plack/perl-plack.hash | 8 ++++----
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index c763d2c17..84d65ec52 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  36282b473b4521219c44a9db437b650f  Plack-1.0048.tar.gz
-sha256  30f5f25e19b437859156a2526f61ca9ab708d50d5730c279189403aabfe542a6  Plack-1.0048.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0856a900a981769e3d79f0a10ccc3e65  Plack-1.0050.tar.gz
+sha256  d2651ade82ebbff7abe0a3a189fc932dadc4779186ce89468e56d0189eaa6ed4  Plack-1.0050.tar.gz
 
 # computed by scancpan
-sha256  fb67655b5d1adedef83aed2c79bf4f89c68d8595a7060815520173f663a3631d  LICENSE
+sha256  8a0c0ad4682691b5bc138e553636adfc8bb38f8885c4c44fd421ec8cc69c9a8f  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index b95f204d2..c39c3d8fd 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0048
+PERL_PLACK_VERSION = 1.0050
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
