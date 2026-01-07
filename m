Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B524D0D16D
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38BC760B7C;
	Wed,  7 Jan 2026 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPKYGZ1dcUXi; Wed,  7 Jan 2026 20:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD12960B66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816034;
	bh=d10P0iZ8OuF/yzFR9R/UcqJJFBz1a3iTIxoaoSYm0CA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=lW0blTVQSzKJOy0k1EZGHNKX+PX4/RIkI35CEdubyb4fzdxlmSsXar91HSArhMrpA
	 sr97UtfK5uyDR0FfI3FwQVXte/bpwTyn+NDwn9JKTt7m0qaNvt4WJeftoa5nBmJdKF
	 bnVEDAyGZP/bUDg+d1bYRyxFHHeJrYeL5NVxiqa13TpieRWhKuDk7ou2ZewkaiVVpj
	 vsAm/3fDka8zAT5ophHjSFBk9vzlJzDmIW7SXZodIuc9T5tgumd5587YQxWEmrK9sp
	 hHKWpgqLkaXAWMli8HwL/d6ImT4K5WSp2WIm7KR7yDjEqw7hQ7RUvYSQq4fj3rUmQQ
	 SqPIm0QDeSjjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD12960B66;
	Wed,  7 Jan 2026 20:00:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D16025B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E44582328
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1psdUtDnpjVf for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF66582219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF66582219
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF66582219
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47d5e021a53so18365005e9.3
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816026; x=1768420826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O0PQFXpb7+avWmmGnC3sZS1RISMfZpvSrJQV/gDMCYE=;
 b=gneX7pnRXsvVzEpaG830nXJI29D7dDoYg+dqmKWfjaz9T8qH5ReUlTRoDA+bM0rgbS
 YWz6wtE3vT7RpN4FST4ZAYIEIM8/ctgMtaWeM8ms159RTN4uE7Ei+m61T95FBYqcIZ8v
 8/dWF0I9ib8pn6f6iijovvGL4FhYbmdB47jtAZpffg5eXHFRL4iRxhBqD0hCEZnHfxoW
 XcxCfPMRpeHKxRkqvFTYIK+n1Lb4l4yThlksv+R8NIvcW6ne7Cxva5mi6UNzGIof02js
 RyjE89vTtNmY1AuYgQlRZInn/7oKYgJF4dxtcAdyHTUZomfReLKW1UYeiQYNquGjVYz2
 5Ukg==
X-Gm-Message-State: AOJu0YyUKfZt07wbitsWwCGVJSTVxOHM+pKTlpC3WH5dunuAPm9+qhUR
 0ndNEZF+jATa+Xm2vBsZBEV37awi4/YzcxZQDPwFcEvSjnMAOPrAyGwe6ophnewLhfMru9oCGFS
 a7/bfog==
X-Gm-Gg: AY/fxX4JPXjR9NOsR7WzCIqXdR8aJz+xljvxTiMx/3MWdGiBTkLzqAvEclUn/egt6yt
 mDrcFekdjm4nsV2mReoDE+sn0AUVdSN77nu6qwQP8MF6Jviw24n+yUq0M66pMRPPklOCFU6kioc
 l1sii//ufnv0uKGUEA8N8UqcvKFI3F0nog1nv7kJsfP4NkmboW5KkmkiL8agYsT3FTdJv1saM/P
 RHbBSanQMVQdKylVsQ6z7N7UWnvlIoUGDE9T8J3M/aLghk/I3KzZ/6UyOLqzreEgJvShtgwLGmJ
 +RsI+PKggL9CAbqTBLz3ExMskeSq3mfFsnoJ90syocf7GAiS508/RcHZPe4lx3OPE8YQ1V4CYZV
 3oIZE0JaMrFX8lNs+ahS3yVJpOyzC8XjOtSPH+OlvDpklcT8Ded+kSbV9GO7SuDVDoQIGWQh9tZ
 +UbpwlIuLa1mvrpQVewLB80/Rru3AoJjriFcE=
X-Google-Smtp-Source: AGHT+IGvreftGqWO2Juy9jYUipCwl245gYwQkqEZEjvY0cNLpKuFuuBXSS9hLUtcoMBtJhZMRnUG2w==
X-Received: by 2002:a05:600c:3146:b0:477:b642:9dc9 with SMTP id
 5b1f17b1804b1-47d84b3b513mr43931175e9.28.1767816025531; 
 Wed, 07 Jan 2026 12:00:25 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:25 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:57 +0100
Message-ID: <20260107200004.665611-10-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816026; x=1768420826; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O0PQFXpb7+avWmmGnC3sZS1RISMfZpvSrJQV/gDMCYE=;
 b=F6b+y+wAA5pny+1qzufis8MNtM9iIKKvIO/f/PEsaGtGQ89abd48H4Upc2M/aOOasq
 CkUpLO/ICTwaMQxgv157JOIiIINV2egncpTVrKh2NS2vAFY40OLgVRpGFaAXTbtvy+NS
 1zCqAAScw2c1pAMcnxEp8HC3E6zDWhOwAGdvUczlbyK5IVOlU+9e8A99YL0QqQymdO0y
 kbEt+MBXNpVwSdh5PRfQi4dlrrK4F4sN/DLLuxQGM3ASn9WMahRALSmQq87gkCUaU2v6
 BMnRXuUG/xWdvGi/CkhrUceaDlZLk07Ais/4EmHqlIJJc6yBskHocVuSA89wFu636+91
 mrqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=F6b+y+wA
Subject: [Buildroot] [PATCH 10/16] package/perl-exporter-tiny: bump to
 version 1.006003
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

diff LICENSE: update copyright years & use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/TOBYINK/Exporter-Tiny-1.006003/diff/TOBYINK/Exporter-Tiny-1.006002#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 6 +++---
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index 0e16f92b1..5b0d50f64 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  0545ee8f4edcb9dc5a87b21ed25edd74  Exporter-Tiny-1.006002.tar.gz
-sha256  6f295e2cbffb1dbc15bdb9dadc341671c1e0cd2bdf2d312b17526273c322638d  Exporter-Tiny-1.006002.tar.gz
+md5  a70bdc039b12f90191e7c5669b2b55f9  Exporter-Tiny-1.006003.tar.gz
+sha256  6499f09a6432cf87b133fb9580a8a9a9a6c566821346b1fdee95f7b64c0317b1  Exporter-Tiny-1.006003.tar.gz
 
 # computed by scancpan
-sha256  1a2929dacaef239beca27a85f7f97b793628dfb22f07fdfb406cb6f3f0d22a6b  LICENSE
+sha256  8e7094312357a5a73b44c1b87d32fca39e6d2f6c5a5504bcbcd0f0cf34b7c9cc  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 715070623..68f3b9eeb 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.006002
+PERL_EXPORTER_TINY_VERSION = 1.006003
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
