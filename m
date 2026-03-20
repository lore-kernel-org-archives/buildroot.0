Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EFD10987A2
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C9041E99;
	Fri, 20 Mar 2026 15:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F16EQkEMSW2; Fri, 20 Mar 2026 15:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F4941E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022095;
	bh=C6C26iUZ6kwJenG9bIKr8fO9M6TOXG+ww0JvLL6xYkA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JzG/mG1xhtCf7gz9yMbmDcN3YJeDbfrYFEa62YTGNZETziJhbuuSKQMo2B5JDA0qZ
	 o3zNtYOydSHIeI6NcF5rb61v77lsoJYeAwa6lyslBKj5hGCJI2HrD25xDKF/EoYuI1
	 lU0dvInrcoyQCztS5yrxTbBF6czbWUOppAT7sVvmMtFotsvnYkWZOTZOQ0r9q4NY9K
	 QMUNJxwGhSDW/dbQ6Clz6yR3Uc3v65FRyaTSbcpkcdBojyzRWkYelKOCqfQ7IDmYNx
	 YdnMyKy33Xl7eM6Y1Th/J0LVTj3OksTt0/4RhIWDGyF8DG6KB75xz0+/6qcEHrKmKw
	 IuCg7hZRCcX5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F4941E8C;
	Fri, 20 Mar 2026 15:54:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0CCB1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96C008487A
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3L2cvDpEA0Mi for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 795258486F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795258486F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 795258486F
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so7334125e9.3
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022088; x=1774626888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tjxcsEzPQQDkebQLcfWkTyjKbaFDmXWxQYT1rGw+NNE=;
 b=ColYOUVlcxJnZTCIL/USEDHjcfcXwTdUKLsGT6c1cpAD1cqYxDc/i62Iw8B1yV/hMa
 tFLlgJ2eB+6adTxep3kL9KyfVob707ousehxHmP0BEsNtC/FdYbjYxy6xc3XTSMNnP0Q
 IYPt4aLRDl8Y7noEpjXqZ0KO0EYTfqXyyi2xOMe4BLHXU8ll8lKuXmVn5NOxuH9m3pe9
 NNKH0gUf9brvHpnEV3ezueGiraoHOhCRHPc8KgtpOr6NnThuUX8OXD4uGFRgN4kd9D09
 sja/FOhYDeaCzhRGMACSTh7d6PrLmj97IXMdWN/ZI8PSn4+fa16cbUYfdkTygOFTycic
 fskQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaTI0QvQaQfqYjhfKaAzu2u1/AJgeqsjTdJX24G7lVzju1bay0muKp3VcbgvrCJO15u20RcBkhN8A=@buildroot.org
X-Gm-Message-State: AOJu0YxroRhBR/c7t6AZSa8Q5dY3zu4VwPVnj6EtgUn3CjOqDPXZJYde
 lkrWR5C/DwWDTyc9z1qtorjazDhh8WWkafcT7W0km+mK2nZj6GLCkYicn/Vpm8yf1o0=
X-Gm-Gg: ATEYQzxWGO4znTuABthKl0BP66wtUynh92wyWd1g3DimaXZxx8TjtDIXA/yGGA/jnnR
 Nge2e99W8lddn0HyRiZBGVNHVZL4GjaADLuoHpINzgmwdDn5bBF4pyhsbLEzuFfRsS6Qr7hIJIK
 LugxIw+25NCEzfpG276+2aJkvhfxrb+JCelcgSUOEbQ5wQL/p0dRvIpx8y9nB+PgbNm96VDztDQ
 mPcNOjqAXUxKPdVePK498Rwb2QTUCm+3SOlf8R+q7PEOklQfo2kdkq/2QANwm9PLdUcIXaVWZ6W
 cyhIL7OFmjZCuP+duNGn2OCyo5lf3QciZW2YiYJRIDDElmupK4WeumRIfX56B4iKMhnLsvy45EQ
 MShiKwP3yBJhiwzmhE+FQNcXzJIM4841oWvJVHKHOEqgdhc7KCw+Negbh5cl2YaM6oFkQ8JP67H
 Iy/r4yGHckNrNzbHZSkG4wCFCLWuU=
X-Received: by 2002:a05:600c:8119:b0:485:54cc:2e7c with SMTP id
 5b1f17b1804b1-486ff034137mr46508355e9.24.1774022088282; 
 Fri, 20 Mar 2026 08:54:48 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe032a55sm132698945e9.7.2026.03.20.08.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:54:47 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:54:47 +0100
Message-ID: <20260320155447.176095-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313063639.1700676-1-bernd@kuhls.net>
References: <20260313063639.1700676-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022088; x=1774626888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjxcsEzPQQDkebQLcfWkTyjKbaFDmXWxQYT1rGw+NNE=;
 b=IBXAfg8lUvnTrE70MDUWKJ8UKUb3NCPVAPRdXZE3PdM3ZRaTeCOxHacTC2FWm+qDWc
 fbLw1OMpjfX1zkURnI4v4urhLaAdUI+ouuuxUKTpUuPyOYQyaZKtYVJFniH2vMKFYhOB
 4hYz68fhdmHOsirBm8o1QCukvGyzPoEvN5FBV78dg+Zdp6BuPwtmbN5Bb1u1rE5MxfTA
 zGu5AxCxghgiCahFycOBRogPJzJtZznQvAxHn4CnCUY94wYebqshbHLqDiH9U/Epr2bQ
 dDqguRVk63Xo6hsTcAX/7Cvuiq902pP/53juM+w+bDINaxuvlDIdrvHcPy7g6XhG9Bs6
 FwJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IBXAfg8l
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.4
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
> https://www.php.net/ChangeLog-8.php#8.5.4
> https://news-web.php.net/php.announce/486
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 5747e153f2..7fdb76b01a 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  ce65725b8af07356b69a6046d21487040b11f2acfde786de38b2bfb712c36eb9  php-8.5.3.tar.xz
> +sha256  c1569f1f543f6b025c583cdc0e730e5c5833c603618613f1aa8e75d1524b8c91  php-8.5.4.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 4cba87a06e..220fb8c5c0 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.5.3
> +PHP_VERSION = 8.5.4
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
