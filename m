Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73898CE7A8C
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DEEC41AA0;
	Sat, 23 Sep 2023 07:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DEEC41AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7N8-j9dzPzpI; Sat, 23 Sep 2023 07:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E5F7404AB;
	Sat, 23 Sep 2023 07:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E5F7404AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A39E1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D3782143
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D3782143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRcEbIiUSa4K for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:55 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED7AB82140
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED7AB82140
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3226cc3e324so2334033f8f.3
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453713; x=1696058513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ffTUnCh2UJTIxaA4kWsL96kqw98G3Y7hLB8kMEuvO0=;
 b=rc8zuwRuGI9sBE1kEFJbNCshdMiBVJRlMYBjvRuzL7lPDtkhlwUvcCdaqXlmuttTfK
 keLGMbc/elvjjTfhAhnBxwM8073mfKPqPxOimB394yyifOCg4qu1Ig/AfWYadsQrdgq5
 1iTxwef11tth6cK09RP1mT+zNw+fF9RdzXux56SDA/J/v6dBNeBKlM6/49s4FRlY5vSJ
 BTM0G/c8I9h0kJhx8nPmvMhJojWIyJFm1Hk2J6vcWWXqGqbCJJYg0siEcDPc2UFGZJux
 lfUZh3glfHiy6JhiwA6/u1z2wdxfNpkB72vjgXJxeKHirJWCnsWEagscxcA6WOJk3IY7
 P3ew==
X-Gm-Message-State: AOJu0YyRUv4+WCeA1I0rsHNxBzGP/usWplPRpHlOEaxO8ylqLgaZtdIa
 T4ahuC3sG9OTui10w3dRORSIFkvpucs=
X-Google-Smtp-Source: AGHT+IH07tZzpjT81IQCrIaDYQeTbUVdJaGxygxC8KeBF14grKThugLDypeY5Cko4FL+dU1VOW9KTg==
X-Received: by 2002:a05:6000:1948:b0:317:e1fb:d57b with SMTP id
 e8-20020a056000194800b00317e1fbd57bmr1301188wry.56.1695453713060; 
 Sat, 23 Sep 2023 00:21:53 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:52 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:28 +0200
Message-Id: <20230923072133.3122644-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923072133.3122644-1-francois.perrad@gadz.org>
References: <20230923072133.3122644-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453713; x=1696058513; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ffTUnCh2UJTIxaA4kWsL96kqw98G3Y7hLB8kMEuvO0=;
 b=AsbPKPT8Z0xHNR2HSK+DvAlljDw1BGnUXHzE03ehpQUTkzui4P61EfQuF9m+xu8Piw
 FVmeeGDNOvi7tR4zmppybn+pejLTCTIx1OgShNU5FihV1qel2Az0gSKDMmIH49AAm3Y0
 P2V+JfZS9NO2F6VK+1fpPIMi3IORKX0fe8P5+o+gjk4cSHBcLte3QOfkSisy+e3Qi3kX
 YOdLRvKnbgtRoI2aqY0sQmrLIxYmeVLMfwp1yN22/4tQvQXsISxHNx2xmE9C4W2YLDHY
 qWLb2TTZTo+7pn0ybzFRpZqIr3WonqStOH1w9jGgV5PQxchLHfx6c69IxIUfI2RGmZV0
 ZQ5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AsbPKPT8
Subject: [Buildroot] [PATCH v2 07/12] package/perl-moo: bump to version
 2.005005
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

LICENSE: update copyright dates & remove trailing spaces
see https://metacpan.org/release/HAARG/Moo-2.005005/diff/HAARG/Moo-2.005004#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-moo/perl-moo.hash | 8 ++++----
 package/perl-moo/perl-moo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
index 9b67e7a65..f70646dec 100644
--- a/package/perl-moo/perl-moo.hash
+++ b/package/perl-moo/perl-moo.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  49ecf491b49b9b200e8a5dfd1a42b480  Moo-2.005004.tar.gz
-sha256  e3030b80bd554a66f6b3c27fd53b1b5909d12af05c4c11ece9a58f8d1e478928  Moo-2.005004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  259530e5ea37a1bf968f6cf18a25db86  Moo-2.005005.tar.gz
+sha256  fb5a2952649faed07373f220b78004a9c6aba387739133740c1770e9b1f4b108  Moo-2.005005.tar.gz
 
 # computed by scancpan
-sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
+sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index 6c484ba9e..18e32688e 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOO_VERSION = 2.005004
+PERL_MOO_VERSION = 2.005005
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
