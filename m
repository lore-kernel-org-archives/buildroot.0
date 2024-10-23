Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0250CFA449
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A619440619;
	Wed, 23 Oct 2024 16:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BQbIXO_HP4N; Wed, 23 Oct 2024 16:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42FC2406E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42FC2406E1;
	Wed, 23 Oct 2024 16:00:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E28342072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0BE2810EE
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbX6NAq91Kfs for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD7DB810EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD7DB810EA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD7DB810EA
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 16:00:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso70972835e9.0
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 09:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729699229; x=1730304029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+nyxm9XYsFW/qRCwzhpRqdfK/HXYEjcAF30bUoKzR8=;
 b=n+Pn5akpyFkvbqP0wVcXxlT4LWabuMhdriy6KyYxmouwYNClR30v/3Y3MDa48l+wNq
 hKYkfGsnaNyWb8gpYfT7KBHVv2zEEnomH/56VSfTBsfoYv4mrheiIstM/3Z0oBNk/32G
 ry54hWascOyBv+f+tJXkt9NEwLz8wmwl8egXs2nQrfChg9hciOgmE2eJObIoAlGcoHD1
 vYjLBBUfXFc+KX/qsMLqRq/WQzB5ui9E9T6UxQ/XkE3K9MfddixAYxpRnV9rs2iU/amC
 0nJ2TOmFlAYq15jimDcDtBLkuBjLYRfKTRga0tMn/ZMW8FZzoWTG7CQuKnebWICs0hW+
 xYeg==
X-Gm-Message-State: AOJu0Yw7JcowWvSyH+ro9K7nCg6PNNUFcPYuMBmY/zpsewAiEi3B6oWD
 j1UAFkj4bR320PCO9XBwCfChfY6auE7cVa0WZw/a3/kZP5N4luv/B72hz4k1dMPIxnbal3prWLY
 vug==
X-Google-Smtp-Source: AGHT+IHle/mGhu/96VEmhxigXJbBJhfiy50g4lJs/Fl/eTi+LYGJKHM5OrOwo8OfA+sVmmJdPL1E6A==
X-Received: by 2002:a05:6000:acb:b0:37d:5113:cdef with SMTP id
 ffacd0b85a97d-37efcf84390mr2067060f8f.43.1729699228528; 
 Wed, 23 Oct 2024 09:00:28 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm9214111f8f.67.2024.10.23.09.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:00:28 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Oct 2024 18:00:14 +0200
Message-ID: <20241023160014.568872-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023160014.568872-1-francois.perrad@gadz.org>
References: <20241023160014.568872-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729699229; x=1730304029; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+nyxm9XYsFW/qRCwzhpRqdfK/HXYEjcAF30bUoKzR8=;
 b=iGmJG2Uhka37p1Bl3Z4mDH9Tfhk1FQw2NiVZgJBCHKHteeZnIuxCdCkKlAd6nMkZwV
 W9GxeW71/sz1qGbuLvNhq6nvJdK75wcnw3/70b2N7YM+/KJWbX3hjRktdo9JX7RtAFin
 3WVmbA3WaqlM+FDCWIPwRxepzbLuG1OwOXAdhJOdK3eCGAchc4VxTDs3geTFz9YOaSLS
 nPhAx/5qnHwe4W+ablGkEE5RqPE1PwrYIdFp60NBX08y6XyK9EFEaxa0q6/5VfSmUbjy
 bMsOR22O2Y9FxCwEo9gqjVQvMrta/zBqRzTk3acie8FN+j5dfVO1ygsdV1l0JXi6kumV
 9YVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=iGmJG2Uh
Subject: [Buildroot] [PATCH 7/7] package/perl-type-tiny: bump to version
 2.006000
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

diff LICENSE: use "The Perl Artistic License 1.0" and update millesime
    see https://metacpan.org/release/TOBYINK/Type-Tiny-2.006000/diff/TOBYINK/Type-Tiny-2.004000#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 6 +++---
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index bca5153a0..5c97fbf96 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  08bb43feabaab97dac7a3e59b5c77ff3  Type-Tiny-2.004000.tar.gz
-sha256  697e7f775edfc85f4cf07792d04fd19b09c25285f98f5938e8efc4f74507a128  Type-Tiny-2.004000.tar.gz
+md5  afc902c6b56ab6320492cd09c689a940  Type-Tiny-2.006000.tar.gz
+sha256  4c685ebbba5145dc02944c305e8e82759811032a55e6da270a751b63b76500ea  Type-Tiny-2.006000.tar.gz
 
 # computed by scancpan
-sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
+sha256  80067f577fa565f34f833e302cac68ea1435f3863885540f94071ccd6d5e900d  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 31c84a263..a4c9cd267 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 2.004000
+PERL_TYPE_TINY_VERSION = 2.006000
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
