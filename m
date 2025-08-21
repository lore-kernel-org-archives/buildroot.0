Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46916CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1529461C09;
	Thu, 21 Aug 2025 19:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuxA-WNnYb_q; Thu, 21 Aug 2025 19:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7854617BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7854617BA;
	Thu, 21 Aug 2025 19:21:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 363531C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDFFE40CF0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsUzEyUFTnGG for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B420840D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B420840D21
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B420840D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9a342e8ffso1048717f8f.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804053; x=1756408853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+cixiLTvwglS3jLzI3VDDdSwavd0yiHLLNrT2W7mU8=;
 b=FztDr1oz8+twgTTOwVi3KTZtB1msSvGTcXB2Z0X7QKm0y8WjKzT8le5oUilhXqMgLP
 RObqJUHQIQWJk3kEaGj5S5L8VVfiy+WSatyoTvvLjWcNpFvaRkoC/Bkn6QkwGMGIHN9E
 jC/26c0SFlMKM/3lAoj5UBif7L86EeoN3biLRSmpZK+n4XbDnnubIzi+jXNf8n1ENTW3
 jbAhodzjODguValexOjzBeEv9f0Qi+GaXVjoNpjOgAnfJ5K0RGtNbOa3i7GEke+TqHYv
 DiZfnQnTq/utDqsgKMDFW164te5jdTlkFHu2MSWzKyBIkHLmeDjlEozjwznfUKagXyHb
 bAow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFX77Bwe3Pt1/qkJbdFELB1eP0xwdYML/teC9m+cqWbP+8n+NnQeuI2meKJKgX2pycYanOiaqKmzg=@buildroot.org
X-Gm-Message-State: AOJu0Yx7L8V1ypNRYnZ48qOVeJaImzrIZW6BuFYoIYLuNgFb0WzZJFoF
 EzhNysd0EL/YoV2TLi9Zyz3c8cgA/AQLiubdWMByPZhZwK5toiA5yMBizWFW94T1OQB0SA0LMWv
 farNO3rU=
X-Gm-Gg: ASbGnctJ1s3itVwjYbFT0/JouMuer0P2lf79Tc8GVB23HOdKlEBl6dyM91Mg85vZpAo
 jFsuNUtof3fcHsNGDP6/ybK+a4zEwFLO78zqFMzy7QIVJMMrshK+r3/dRFfGbbpIoInpI1A14yH
 6RbqbnmHOyEnGGD7FSQhOHjRzuQIdgbmFiIj5FTCOhejqm6LBVTNWqZVyhDzwHSXik+VUpMX4gP
 pshsZHEP8RfBh+6aQGnS3PcgaDjszPa5Q/b0kNq5rSdSlN0v4qfHDBYcjQZbSXHiYMwIzUeF5G/
 Qc7VymVbaaQ/eH+9CgTILa2TJ1k6ut6SPBHxkzDIy78/l91wRTG2OsUJTlEOD2Oqx8eiKTmOqq9
 gR/ZZF/MRA+TdIQ==
X-Google-Smtp-Source: AGHT+IEfpkAik3xoRTy7cRjF5dJ5Cz9u8MDbmj9DHrskU0910EcxY/psNi/9v5YZmBXAsBC/Yd+39A==
X-Received: by 2002:a5d:5850:0:b0:3b7:95ac:6f55 with SMTP id
 ffacd0b85a97d-3c5d48fba9cmr161786f8f.20.1755804052626; 
 Thu, 21 Aug 2025 12:20:52 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c4d62907b3sm3163196f8f.36.2025.08.21.12.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:52 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:51 +0200
Message-ID: <20250821192051.23831-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812073645.2072147-1-peter@korsgaard.com>
References: <20250812073645.2072147-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804053; x=1756408853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+cixiLTvwglS3jLzI3VDDdSwavd0yiHLLNrT2W7mU8=;
 b=aCVpt331Mk5wkBNWmwZHovHw1WFQpqqIBSDLQBY0Vx11ApuJMa3f7ui+xtDq/LB1xb
 cg3EiF5M2QMEbJ+iFSED6295ODDupS/AL17wJHuTxkNAetkzAtHnjMTjCWXnfYWJgEvT
 IPBe8l53p+uh71NZEcuSX8EPobVAYJupJuhdjtsl9O4qqfAdQoB+CTtehhQKqDjAeiub
 4Y74G+daO42xWo4ZaQBZJfiKI9SLgOK8jhG8FtuyE9qKFDJF9tbZ8xCnERg1KFqj2hhY
 vIQVJMCQVuS7X+cwNinRahT4CvjBqzyHSfxOrKNGUvY0ic3g294d3rQLe4QbvAQgMaYC
 FhhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aCVpt331
Subject: Re: [Buildroot] [PATCH 1/3] Makefile: release: make manual build
 reproducible
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The manual contains build timestamps like:
> 
> Buildroot 2025.08-rc1 manual generated on 2025-08-12 06:43:37 UTC
> 
> Making it not reproducible.  Luckily asciidoc respects SOURCE_DATE_EPOCH, so
> use that to use the timestamp of the latest git commit instead.
> 
> Notice: The release and manual targets are marked as noconfig targets (and
> need to stay like that for make release), so we cannot use the
> BR2_REPRODUCIBLE logic.  Instead manually set SOURCE_DATE_EPOCH.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 203d90510d..33e8563e93 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1250,7 +1250,8 @@ release: OUT = buildroot-$(BR2_VERSION)
>  # documentation to the git output
>  release:
>  	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
> -	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
> +	SOURCE_DATE_EPOCH=$$(git log -1 --format=%at 2> /dev/null) \
> +		$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
>  	$(MAKE) O=$(OUT) distclean
>  	tar rf $(OUT).tar $(OUT)
>  	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
