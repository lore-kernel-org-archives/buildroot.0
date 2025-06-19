Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA02DC7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C138408FE;
	Thu, 19 Jun 2025 13:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlYOvspAzVGc; Thu, 19 Jun 2025 13:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B711240869
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B711240869;
	Thu, 19 Jun 2025 13:52:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E234D16B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D42AF60A78
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id px8DSr-aeRBZ for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1DCD608A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1DCD608A6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1DCD608A6
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:52:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso531224f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 06:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341161; x=1750945961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3XZgYjsRxOnd8VhhLRu/hxY6WWXYjSlushXSnRfhuHA=;
 b=M1p9XSCcwVNt6KZDb1yxrghdy3JHG+gxsfuGRpmbiV0bus8ZPHGQcPDvq2ML8Mypul
 d9BmVc8XwHwmZz4f59taKmdHijWAUCxXpRPywH4nPqZNOOPbkS6LwUaQ9VkkfbsaYWHs
 xw5IBjrpouOomJd6MuI4Uh75IKno/SiXaSWaU+iOCLGMRHixkqhceDtgxOFwaQzKRKF9
 RwReEUym5V6aXgi/RAIi7kIuJpCPmGfdON8AP/sSWIFkOeKl71nyEvYQWJO/RnnBJf4a
 3oKOwNi1CpqJEk0yEWLcFoanoQi5V6a7doEl0+Z+oKn7t8BeiSfaJmJELW5i70CPMGCj
 q4EA==
X-Gm-Message-State: AOJu0YwkQaF6wbFogSQT3JgSVKAHTltz5VvUZz8JyWFFfi7V/AfvGBdT
 /ukSgcaxvj8sw7XTMV0b0jPuzEUYC0FaQZFmpUXYDvt04xxubejI5uFwaSd4ADkpimTRX5aOSo0
 1H4OZ
X-Gm-Gg: ASbGncsUQuaHQxCdagKSDhB7HxNyEAxAZZXRz7Kyljg01pyGJzClkqpkLhQq89fjPpf
 zJBQ2jQ0lXs16VSwWOdJ88z4i9vECJFGGQJuzm4DljtZlOtqF0e5b+C4eV2hF6Vnku6w50SMbix
 3fAnAL7WYeZIoq5aTNYsyHlFjvTCfaUpE7esfe2k1n+9PFQ4kjBeRRIy4aCNYgKvGcCsJmVACaf
 ByDX1sh/99Qiq6hF3gbpeCLKHAOaZKGh1pDiEuS7bZaHbCu1Xx+wAWyd/xVQLlW5TP+qCJCCYiZ
 0hf0hDK9hz6461u9aTUwAzjm9SexIxdAJthQZx2GCL/uc9Sx6u9dFLwjYs06U/1+VaVNHrSTZGE
 f
X-Google-Smtp-Source: AGHT+IFEB8SCxVfsv8UT2N0alxJ2c5gU3qRRRnCehCX8NlRYpxJ+BRFkceDXzYwwAdUqxNBYqmyD3g==
X-Received: by 2002:a05:6000:2284:b0:3a4:dd8e:e16b with SMTP id
 ffacd0b85a97d-3a572371cdcmr19671996f8f.20.1750341160837; 
 Thu, 19 Jun 2025 06:52:40 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a6ee12sm19590700f8f.31.2025.06.19.06.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 06:52:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 19 Jun 2025 15:52:31 +0200
Message-ID: <20250619135231.405662-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750341161; x=1750945961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3XZgYjsRxOnd8VhhLRu/hxY6WWXYjSlushXSnRfhuHA=;
 b=ig1bzGQyXXRopfDvnI2aL1GwGHIG3NSnKCQxYxSZGQZ390YBZc9YULCsVCgWGI3Cwq
 vlAcURixo5YWOyY+SDZDVS+9IpIuxol7lpdxA512m9plSEgIoDl6nMbgJWOa7SBRAgPc
 Sy1A9Tni46GtAQ/CjhH1O+idHO9CJ/LeOzR7wCv64p0vqo3bgPJeFoaHdNrQvrZZvb6+
 729PP1e6Rs7BNCf8FI/Jpsi6lmqYe7NaxFnszWDaGx/olB5EetZxCTFgnvln1N9ECKMo
 1/hdvv65tt9q7rf93ZH0YEIb/u2AMAhqqkHAr2EnfPOX1MyQ51mdNeXCCXVjyOLPb1YG
 T/Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ig1bzGQy
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.22
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
> Changelog: https://www.php.net/ChangeLog-8.php#8.3.22
> 
> Release notes:
> https://news-web.php.net/php.announce/460
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 8e3be2dbe1..4260c1e5f4 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  4dfb329f209a552c3716394fc123bb62e80a468b55ce27fc8cb0fd5f30b9dcd6  php-8.3.21.tar.xz
> +sha256  66c86889059bd27ccf460590ca48fcaf3261349cc9bdba2023ac6a265beabf36  php-8.3.22.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index ad42e57d72..01166bae64 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.21
> +PHP_VERSION = 8.3.22
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
