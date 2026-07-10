Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556BEC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D07A40BFC;
	Fri, 10 Jul 2026 13:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SG6gyrF-WNd; Fri, 10 Jul 2026 13:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32EA440C96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691513;
	bh=qBYwumIcRC9xBFx2T/MIGn5rjYluy2ar6ZhRUz1vems=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qMlTdLt3RsKENtLnIdmfM7KTZGczPwabviXEbshvrQsBqgpRNCtPnE1LNWf1cn9sY
	 gFFpYwsQe4XcvoXbn8JinFQMVPS1lz6/v79sLDbsKQYhSc9DFbIu4wt+zq4IRnILSn
	 UU2Vmvf0QwpYCbBfiqQTpfruTQ4SylwCE2DP4FsGYqgrsTZN0IeCpC120Vq3jYK7c9
	 JFOsaIGO3DLSdEZerkLKaigFw/ofLr1EPHUZGZUNnsfiXZHY6RMOZwiUul+6O0gMof
	 0SYDAAq5E1QQ7pscYiSBEVPWsTHvcIvLYYrIyJRpbIy0OnOs8WOlL2Ub8jAxKHykcG
	 iOT/PzX0g+EUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32EA440C96;
	Fri, 10 Jul 2026 13:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72E512FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 590A0606C6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inrLzMHGHb3T for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4333E606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4333E606B4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4333E606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493f60208a5so4485745e9.3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691508; x=1784296308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p/azf37a6gIQcNP+H1eQnjrn3o3oEUauIYXs4SL0VEA=;
 b=JM29luzdH3b6gxg8A8Dmh1mRFYFTX3uYrvc0kyGuacKLcUsqmRErt7ppJriR8oaHmp
 CjotPGa9x51CCirF3qgE0md7VE5anBrVKk2ilgJq/V9TeqNnYkevAFEbb62QGEIN3+5P
 TnwgQybl/BzB5lGJeNExyT4kPjjKnspNz6w+//L0SLtuc/h2A+AvrBQk/K2NyU4uq1Zd
 HCB5bXxNuCiwkuYB9ktGnyDYn+r0zoNy+Z791kM+q8+fquN4fyea1x5Tp5t4uu2B3jMB
 cgXSgp84r7fmZauwFOvFikBBhltolj2bDEeBAm8/3GEIGP1cV9J9JOIPmmb0GkUTFaWn
 jGLQ==
X-Gm-Message-State: AOJu0YzjVeyOzdujcngmyy3xhtxwzBGOn7FAWzold3Ni+0yc0OUj7OXs
 aZol2YJlVL9I4QiAuFG9GIOXyNuI2Mc9Qmgan9rVIjNzT97AlR2P1/YOp6hsqbZRDSHOpj1ceWb
 Zt/qf
X-Gm-Gg: AfdE7cm8n6a4NOMFzKDdZyWDfeRbEXQy6HiI1YbOPkeVZURXuIRs+sIFqcQgbQoo808
 6KAMyyvPH5AAPdPiMwEbjnJsJEv0Ie+B+smL4vMjlUETCEP9f1mDUKtfYkhHNOXU9RdAQp+Z9Wn
 ygjn5tsEvkmZoGxqGGDJpYbXt4RWZupdGZGdx3uE1nsLuZyaIkx3eH6tyMNUGTIV6rqNMOt+cL4
 HgkSg58YCiB1UfozAH0gZkfjLcaxfjOsxWmtMhI1FVqjAaUSxP73ItMBi6iX3XLNE/DXGAQ8Q96
 TF2bhMQBNMFHh6pPqJqXlk9CKQIFnfjX+TB5jw8MG6rgaUKncUkuV/JzGBCJgz5wE9znQECFuDG
 /GKT2mme4eFLHNYq0bBLzqFj/cLrXlzw8P65fLaAWhOjSdcsGCRN4YduXvZ4x8nqSKCbVobztWS
 6COfZVfA==
X-Received: by 2002:a05:600c:5309:b0:493:f262:b8 with SMTP id
 5b1f17b1804b1-493f26200ecmr42442675e9.1.1783691508109; 
 Fri, 10 Jul 2026 06:51:48 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2c8de2asm59291215e9.1.2026.07.10.06.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:47 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:47 +0200
Message-ID: <20260710135147.759396-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260626203415.303763-1-thomas.perale@mind.be>
References: <20260626203415.303763-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691508; x=1784296308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p/azf37a6gIQcNP+H1eQnjrn3o3oEUauIYXs4SL0VEA=;
 b=RJ90pNGM+hbAGibyvFtP318gnUb0ntMYBE4RHtwfHJGhKgkTjYmbR1wOKGHNxpxRXL
 6D1CF/K2ZXNmA/TkQD6x20J80sSs1+cL3aBt1Kooh3/KOge+IcWKHepfJJleUEfn8xpl
 Z/1AQjFJxAI3EJtKtaMyoKhktTrihzhAq8TXl0XC0kWUfcGdPxfG2HVlknn9YnN5DuCZ
 C53f39cYzr8+T41YKwdHE7pGfCa12wy6cXmGvRghOwcr2T21t8h88jpZd2BRgFDWpKDZ
 OJIEkI41jmUBUeYSZIGi4cykpkyo+FB3nPCbOTF5dI3xwn4ocMuS1Us06caDYB6LoObv
 2fwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RJ90pNGM
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-26
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
> See the changelog:
> 
> - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-24---2026-05-26
> - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-25---2026-06-04
> - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-25...7.1.2-26
> 
> The bump to the v7.1.2-25 fixes the following vulnerabilities:
> 
> - CVE-2026-53465
> - CVE-2026-53464
> - CVE-2026-53463
> - CVE-2026-53462
> - CVE-2026-53461
> - CVE-2026-53460
> 
> The bump to the v7.1.2-24 fixes the following vulnerabilities:
> 
> - CVE-2026-49219
> - CVE-2026-49218
> - CVE-2026-48994
> - CVE-2026-48734
> - CVE-2026-48733
> - CVE-2026-48724
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index fa46fc7cde..2330507566 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
> +sha256  d63594e334e1c410f600fb9370d78d49e4dc6f315722ca4ba083e864e5c354cb  imagemagick-7.1.2-26.tar.gz
>  sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index e08f0a803c..1cae5c83fa 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.2-23
> +IMAGEMAGICK_VERSION = 7.1.2-26
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
