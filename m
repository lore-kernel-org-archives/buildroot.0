Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872DCD25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 424DE843A0;
	Mon, 12 Jan 2026 07:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19t_ZUPOgFOT; Mon, 12 Jan 2026 07:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1D084397
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768204710;
	bh=8R7Vvkgm5IXY18vxk0+A5GyfUG7msjHbiq989WmgDCM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Y13xf0cco0KaxHx6fjzktEFz2MB0Z75gASLSOVUYZZXl3u+qEnJIoUyQGW0K6blZ7
	 fLOMPLk4yZ5OoncAAdAw1flmxyczHSkrFZJn+XoQMW9EiDu2z5UuTOLuUVWqfymdPf
	 nFzBFZLVAxEQTZy5qk+eYtYeltJx64wSIolLNDp+uwe94vgWFpPNQ5+ReZ5VVXrYu1
	 s8sKfzcnIxAtZ6QtJi/vjxO3GKZy1nETiIEErpgn6b+EuQtiAdSvpROeH9kxb9oCL4
	 Ku0E2kWCM6JKb4Vjpfevlwl1xIbO61AR2PJ73UsVi7fGOHj7mPLJjMxKBWryw3AkJh
	 egCazfEtHk8wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1D084397;
	Mon, 12 Jan 2026 07:58:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C31E12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9856F84398
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INUM-ZscHzJ6 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 07:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ADB7843A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ADB7843A0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ADB7843A0
 for <buildroot@busybox.net>; Mon, 12 Jan 2026 07:58:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so62511075e9.1
 for <buildroot@busybox.net>; Sun, 11 Jan 2026 23:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768204703; x=1768809503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YbXY1vk3kK5BeZqhkQW8VVyjuSi9SFAoSD3QPR1HQvg=;
 b=iQLVJM6rVUti/v/Yl//SqtEMZou8R6lRmgm6dz0NwYrkZEjvMMdj4YjFvdrawKtjte
 4jK4TBOjZqLtNvIrFUUxRVfo99wZ/tcNF4s5PHrqGWEfgcRhJLu7uKuGG/3v0ikELkEZ
 zeN/Ai7AG8FZWhAwB+wiLy+mBC2QOqP5/58vKeMkhejbrpHL5BHbK2SPtgVxAugcCNA5
 amUWjb3N4sFiqIemW/1foscTUcUV5eVUCaM+G+8qLhxOgDyyWS27mjMvqmTPYinSUSf5
 I10sPqhZcTlCqNp2J35wne0H3w1bISfmnJDhtUfctepJw7DB7VcEujUALQSUoHCg916H
 +yvw==
X-Gm-Message-State: AOJu0Yzn4ycoo2E4ECajkeo2ZT70Qo14Lw8ir98c7VmxML5biAeRleRJ
 RuWtRsnQTkGlO47F6+CAquOxMCJOft+lPBiBMT2MC01PrzN8zDAhf+dIUNmE9Y4Y+2V7opCFkdo
 WAtTDUA==
X-Gm-Gg: AY/fxX7ffhExhJyHYDxnXTbYcon00LghN37J6SP1tcLNcF+ZoBcd5XvSYeF8oYcPl4z
 GwOtPGfR+6CMwQkYT/4BhCCZN3qrm194TqoTQnWZVtM924rj1zB9vRfl0JbkDMitcJC93SR8m9r
 GEUjDiWWBlAIoWuMLt7Zl4fSvNHltaBSEwRwStFrQwV8CS7a7u7tqZDVWDAm+X9D87pUnfwzf8V
 S3elnj6GXTroptHkBO/f7ir+k3Ii9u7OBeKkru0VggC/ujyA6jnS9/sYAFW50lY8hAvIrncZaxb
 Mqs/Ak4nV/GvNlsqG3dMQ8+LDhMgp3t3FgfcJ4AeNyE/FpK35NopY6wPyGLdO/uG8ypU57Gaiu5
 fuFwVyZPoT54/Eu2b+7+IhZzhEKf2TyjuZSn09yXyC2hYKYqQBXGxyMRaTZgcEGqcQG3b4nwCEx
 jw/Sdytd70/iKsM4T7bPExdhMYhtS7+NJ/qJQ=
X-Google-Smtp-Source: AGHT+IHr61H1cAK9dbv5d6COYrcqFhty9YUtoIe/ZXt9oLMY9SGnMEnxe+n43vDqVo4m1VjhYjCotQ==
X-Received: by 2002:a05:600c:19cd:b0:477:a246:8398 with SMTP id
 5b1f17b1804b1-47d84b09166mr177349245e9.2.1768204703148; 
 Sun, 11 Jan 2026 23:58:23 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8661caffsm123217675e9.5.2026.01.11.23.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 23:58:22 -0800 (PST)
To: buildroot@busybox.net
Date: Mon, 12 Jan 2026 08:58:16 +0100
Message-ID: <20260112075816.710903-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112075816.710903-1-francois.perrad@gadz.org>
References: <20260112075816.710903-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768204703; x=1768809503; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YbXY1vk3kK5BeZqhkQW8VVyjuSi9SFAoSD3QPR1HQvg=;
 b=jHAPwZ6mDxFJXTWFPcg4xMQghwAScP+P6M3BE+cDR5vL4u2SFKb5XPmO3JI5FotfAU
 6iiYEa8FAe1mfdkF6Mb9jJotpzv2L0/Xyth/xg19PbeX/9x1DC+uYkDEqwU2A4SiIpCo
 jlamU8bIJo8Ia4NMUifoNsks2PWBGeKMIULvpKmSYxrhZtcxIL9/fFsWpP73m7fH6/56
 t6PKzdI2MFeJiWUy4dbNZT7YsIeqfUdZo4MHrBe+Aoh0XufSLN3c2N+PPSQ/ij9Xp734
 cVgVdveOYS/qP9wTjwc0NVss9l8M+bAhq4A0mu+Yu3De0V4Cd1sKqv+nEG3jr5/7EYB4
 qUAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=jHAPwZ6m
Subject: [Buildroot] [PATCH 2/2] package/perl-sub-quote: bump to version
 2.006009
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

diff LICENCE: update copyright years & minor cleanup & use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/HAARG/Sub-Quote-2.006009/diff/HAARG/Sub-Quote-2.006008#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-sub-quote/perl-sub-quote.hash | 6 +++---
 package/perl-sub-quote/perl-sub-quote.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index 8db560fd4..823c49ef1 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  f19c60039ba87f69f7f9357fc0a03e07  Sub-Quote-2.006008.tar.gz
-sha256  94bebd500af55762e83ea2f2bc594d87af828072370c7110c60c238a800d15b2  Sub-Quote-2.006008.tar.gz
+md5  8f4600b812f6106a1f907ee47a87bd1d  Sub-Quote-2.006009.tar.gz
+sha256  967282d54d2d51b198c67935594f93e4dea3e54d1e5bced158c94e29be868a4b  Sub-Quote-2.006009.tar.gz
 
 # computed by scancpan
-sha256  de7a14750e81d97e19e111df58a3b51e3f2c8ec2d2dd90f576f54243251972c6  LICENSE
+sha256  ca095549209becaf2d8f1d4623bccd8512045acbf74a41ea839007b1b47174d4  LICENSE
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index 3c2a25be5..da2bd7e2d 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_QUOTE_VERSION = 2.006008
+PERL_SUB_QUOTE_VERSION = 2.006009
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
