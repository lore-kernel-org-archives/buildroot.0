Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859BDEB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 411AD61178;
	Fri,  6 Feb 2026 08:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdcgDjeokEnv; Fri,  6 Feb 2026 08:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 867596116F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365464;
	bh=mAmAgRRXDnUC/RKP0C7xmh/k2CHQq1ozkuhX3MnXfHs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E/KWvj9ze7A+KfAaA2adcM7lurMm8U7UijS4yaSBK22wOu8YbjQtu6sC4v1yv9WGB
	 p56YS32Ju6CIMCfSpG1YNT1M23dvjXuSPrcqfOhOOrWieGCyV0peBZwwOlsrYC/LeZ
	 f52x6LQbgDGj3RfGy0jEb4ngzx7Sp+GiL9p0zjdGBppUjyvcIjcAavbIgzlL16whRv
	 iGlziscOVzQ9pQH4d9uJsUALd3ycs+R2wo3hbsrtlhf5F8KIut2RTGO49awr6tDzSm
	 z35uD1uVmViKgYjn4wCfZtsD+KMw6t1/Z8Xy1qQ1wLyv7A8IbP6ySiSfPId2wywBJB
	 LveLni9NyPI2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 867596116F;
	Fri,  6 Feb 2026 08:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68429219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46488832C6
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2q327WiYCGLP for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 174C383211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 174C383211
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 174C383211
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:10:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so3676065e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365458; x=1770970258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X6TI7N/AZHTcoFnDSE76heU7xB3S5P7WbPCHDidC+1E=;
 b=BlXNM0xRJtxT04eQ/xMptZusTd8mb34eAESbYZF9W7QOGOD5l8J1542JrGnIN2CZsG
 nVo3tfrZ+ef/GUYSNfVC1gE44kJ4ErAB5EoljpQVBl3koaM63eIsuO4ColB5Wq0IGq6D
 zncMKvQnyQjavJ+jp/5PwhTV15fQ+8RpCTr52PzrdRd8aWjSGXef8BaqJ5auA374GxHq
 hplv7pOckR2Bf2ZL/krg6wmDvhNlr741EGS83GuZ2PtKJZiU0ZiPv/BrADYGDBBj4//Q
 lfZ/ZLRHEdWYq94/6IHEta/VWhd3SKLn8S9pr+k0hnzDA0jJL+kBjks+XPyoqV3UPwry
 aR2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4KSjgMTLC061khhEQIcJUZzw4l0zLOs3O2ORUSZtarcDwYVNC3Yoa48qkF8gE2X2FF5Df/PDtAjk=@buildroot.org
X-Gm-Message-State: AOJu0YyVggE6tTDyJvC2O/1VjJFDY4bLde8xxBV3m0PIdie280ohifRC
 J1QvYBcwBZCmF0yaO2dXsdi7aS/sz7txIe4NpwhdSPSl904Q92KyCSFZkGnKdE+58Nk=
X-Gm-Gg: AZuq6aJif5A2FK1AOgAd58Dq3vA93DEjaycrkyQpdV2I0o6fi9xxLUayk6owPOruF1d
 Agc+saMhTejNQ3vSuqh9v6/ty9U7nPR1A8A5JsVE7vgzAPUezPhgDvSjSiYn6QerLmgvsy5yWHk
 hi10k5LI32npGVHRcMuED6r86prAegDOUwN3rvOQN5a3UqEczUdjYpJApLD0WEzZwJOW8yMsjVy
 iXlugBsGUDpm+RFemJEgMiD/aZA780rttlzOqsHG+DB/PFXFW9OF+6eXv7amQRZruM1Ddx1GiF1
 r2tMz4wCHklA8v7+QCP0MJ+ep+DhU+px69QrQP33TTQlFv7m+1HUp3FfKeu7WQirbo7nZetHoWe
 8kkLoKlveXvWo9yqDkmYzPWt9yNaK+Dvy0EkVnhkC0vSxbx3lMYfootJ9Dljcyv4OsX7Lm3d0gz
 4cvKR9ptrHlKQBUg==
X-Received: by 2002:a05:600c:8116:b0:475:dd9a:f791 with SMTP id
 5b1f17b1804b1-4832021cb5emr25404045e9.28.1770365457876; 
 Fri, 06 Feb 2026 00:10:57 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2d43sm3973019f8f.8.2026.02.06.00.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:10:57 -0800 (PST)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:10:57 +0100
Message-ID: <20260206081057.31218-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202110338.383494-1-titouan.christophe@mind.be>
References: <20260202110338.383494-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365458; x=1770970258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6TI7N/AZHTcoFnDSE76heU7xB3S5P7WbPCHDidC+1E=;
 b=Ei8j8OCF5izpm+uwNiR2OTroTy3S9QPa4kA4ys7H/ntcCTZxE5K+SV8h18clrb967s
 M+41U3t+lawRDfpWthTfti8MNehm1/hkgfL7c0Q2z8Mfu96GslXoY+60N5M0M2LBEWVj
 mNO/jJba6c9h3EsX5bQHqq7Sd8mw3UwnT0ZjfSICWgRva7IV9AABmGgflvI2t3Eaflfk
 YYqbsBJjNuroZr7tltqw3NS8E2BS3X/xRgIYkQb2VIIGwR6eEknMwF7fwsnHgCAh1T4q
 nFPiqn9H++djQU/qHKBJVtYsVr24cjb+5diJccKYO0jaCnW727aRIkPfCkdlEBnOh38D
 xcDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ei8j8OCF
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/php: bump to v8.3.30
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
> This is a bugfix release for the 8.3 branch, backporting some fixes from the
> 8.5.2 release, mainly memory safety related.
> 
> See the release notes: https://www.php.net/ChangeLog-8.php#8.3.30
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 02ebf1b0f6..dc5f0e7a3c 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  f7950ca034b15a78f5de9f1b22f4d9bad1dd497114d175cb1672a4ca78077af5  php-8.3.29.tar.xz
> +sha256  67f084d36852daab6809561a7c8023d130ca07fc6af8fb040684dd1414934d48  php-8.3.30.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 37dabdcd1a..d184186cee 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.29
> +PHP_VERSION = 8.3.30
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
