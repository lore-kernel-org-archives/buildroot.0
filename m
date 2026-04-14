Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC860F9D0D3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 972C86F488;
	Tue, 14 Apr 2026 15:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aEI2lQlN_VQ; Tue, 14 Apr 2026 15:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD946F48F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181453;
	bh=x2j2S3UHZKC4Dvd+UR1Zh5y+lf6xVbVoOiLbwD4vDUs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o+5ACszDeLyQTJmJ6n3rDtICqs55UvxN3jnfwmyYs+yNMsAHHOLEY8h73Y1x+VQlP
	 prgjBTnwx9mJl3KmMH3r+BpPcEZirsSMdvc7V6VmQHBrlcbwc5uJJzKiP7VoVh13xr
	 4hqdSxF052e1xKpvKW1QuPMwedQ83yAzUD5W8O71xWlDiKCYraovfaa0b+jRz75w49
	 k+4oRC5T8HUzpuNuuD5I3xKS6px/XBem2Ir43fDHPJTnyCM9szV7l7CzyluD3w3cPy
	 4FUB3ganjDStPuwYGe6sZGSaZi2PEfIOrJvCHWKtBFoY0wvGx0GYNQFU3iHd60Bdr2
	 mN+/dPr/+gBdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD946F48F;
	Tue, 14 Apr 2026 15:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B3E2237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D45284D43
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tP9kf_AsgPKo for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5170684D41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5170684D41
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5170684D41
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:10 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso94942855e9.0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181448; x=1776786248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ztX/i2zjrh7h4AQLotsB1ZNzQnQOYlnCrOLSil5DyQ=;
 b=lJuAiTs6BhjGhqpN91tWy/Zg+iD6K6QcVOECXyJljwBILv87aJqqNGaEnNtdKGygw4
 KhZsG7yO1bVXzp/1WNqh8njIhyR0Wp9trvrI4U57X/npL0xr9YbdA+rcbRawSOeJqyU/
 4Ksn8rrDT3r1S6dgZp3iBMotX95dRH2kCAyDS1TsWau9PLjvrUQY2UbobApE7pgQ9ZDD
 1MTF30QWVLYTo6ZZQeGF5Ppm6ZgQlflhKIr65BCvYgOlJ5fEyERG1qSJX9GuCLR0fgZy
 tV+a20N/jgjOO0tQtMit+sdRV65w8Mhi089PfLwhtWOInFFgsNZU3xm8XFCmD6j2iEdu
 ZeOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/P4QB5W2CgTcexIlESd4YEIVCVgPpSokzsJbaXkztevQGQWh1lPKNtbruh+XA4uLD/wbj+0gW1cT8=@buildroot.org
X-Gm-Message-State: AOJu0YzsWX2Mqlj1useWsZ8IF/6iwqIcKX8WK0e1YH89bN883zRxSrPp
 vDzYpe9gfOfiF2vhhYcZZtbe8TnZZRXKv37ztrDFRNmARwrVVtUgfGU6R/Dl4IXYyn3+WGa7lHQ
 xp3Qc
X-Gm-Gg: AeBDievNMw45LB/9SGw93VfrlArY9ahKNcSAZWIQSwCmfgkikStUvRBIINXLTtzIdvX
 4+75Fmyf6+IzVK6PE8PG5/oPV0Gw2Qd9MNyXuusdAzIxbcvpzAY3QHNrgC5ONvX+ZWBlb5AmKoV
 iMiXggidoWRrNdzLQ0d+dckyJCdmbECFnUsAd5xH90mxYN8bKq49IXxDeJvc07iJkMThj8w0pC8
 vVg68TLlLt3Oq/3C0ZdSjyd+EJ8JylXHfr1kRCUj5Fw6Op/tkih3AxtPmAph2+R+4XKOBjAaksI
 ZCEIhEWlPd8eEJFyhosSLsBWIBIKw8fiCq8q1lpX+u9DkqlS6PcpYDSUJBI07h2ST/uqQHLBJt9
 7p8xXGHlr/FU6f3rK4gkgH+LuEioj1kfIJ/NrfpVEc586J9o1eW7j+ClZl+3Lei1NAPjCJG+3o4
 NUXe1q1bhS/tYr1qH49CZkNRpCqSw=
X-Received: by 2002:a05:600c:3b29:b0:488:d07a:b178 with SMTP id
 5b1f17b1804b1-488d67c7029mr249078335e9.6.1776181448098; 
 Tue, 14 Apr 2026 08:44:08 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede2519dsm61056075e9.8.2026.04.14.08.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:44:07 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:44:07 +0200
Message-ID: <20260414154407.334265-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402180534.2780167-1-bernd@kuhls.net>
References: <20260402180534.2780167-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181448; x=1776786248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ztX/i2zjrh7h4AQLotsB1ZNzQnQOYlnCrOLSil5DyQ=;
 b=fl05lVnZrO59AVvyLaGjdiC3MnzRwKyWPT5QzM6fj/+GsbtyK3250+iMvBrwgI9AYe
 Z0FM4CQL/A498hQlfXRAnMGLe20lWY6LVvQ7K8WnZlLzV5XheWg+2ti0OOvk/xwdS4Y9
 fP03GCttSn1AqVYEDOj6WP08SqS/DI0oueHUbh6YBlqlBIrytj0xmZAsRdCs+yJVDXXx
 6Vl9/JyZj6GF5i7RiO2dkBdQbXYwLpwalNDd/qZir7uq8jN/mawbxUa7GuLxA/8/iQP1
 urXRIkUt0Ans1crjTUgy5dPFrNkyMIqCXzkvgYdaC04a/48NFrQ88gMuinUgj4JnnVpU
 Cf+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fl05lVnZ
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: security bump version to
 5.8.3
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
> https://github.com/tukaani-project/xz/releases/tag/v5.8.3
> 
> Fixes CVE-2026-34743.
> 
> Switched to sha256 tarball provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/xz/xz.hash | 6 ++----
>  package/xz/xz.mk   | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index 99daa5e9df..488a3d55dc 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,7 +1,5 @@
> -# Locally calculated after checking pgp signature
> -# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
> -# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
> -sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
> +# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
> +sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
>  
>  # Hash for license files
>  sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 8aa0716b18..91eedd7a83 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XZ_VERSION = 5.8.2
> +XZ_VERSION = 5.8.3
>  XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
>  XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
>  XZ_INSTALL_STAGING = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
