Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE86FC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B70380510;
	Sun, 30 Jun 2024 14:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8By5_ffqndX; Sun, 30 Jun 2024 14:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF5280B89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF5280B89;
	Sun, 30 Jun 2024 14:49:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA2411BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B75AC40324
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZxWrrHe0spL for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:49:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6E49402FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E49402FF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6E49402FF
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:49:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-364cdfdaf91so1281535f8f.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758971; x=1720363771;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R/yrF6ExODLXh/WfkxHKSbtMy3jdzJKm4GQrtNBNmU0=;
 b=cik+XAjDV91f2ZPEOmOyWQpb35oRamP8JwE1aRfs2BklaOZf0t144sAhydl6Qo6F5p
 qDfwYEpEzoonHl/lVZy9MBbazxjYtAkZkw5gnuAwKdA4nXam9soSQoUjFGBk/SnVqLWe
 CXHJjhw75v0fg1KosemNjOywUD8gal/Bh5jfHUfLPYiwA87MoFE7S8s0frYteZBzrgzg
 A0Z1au8X84W6mKVH557YH6Dp46j+CKF7IQu0Dqtn4j9YB1h1QB55AwMFVl1Z6CVdWwD6
 kmbvbjXb0PTZMI8CQP6kZz9bv6kECK5O5sWrZP5AnsUD8VdI4UG3F6lVgXiZe7mPMzS4
 hznQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnIxN0Ey3qA6ofhpqu7JyVP26rd1c7XFHhOh3G4p6yQLcQqSJLWJpM4L7GW4koj1en6Y+OO2dTMt/f87e/nBV4SVEnZ/I8nA==
X-Gm-Message-State: AOJu0YxzIwUMvPVBZMJMogHvxKdhrQqlzKgQuHwYgQoH2VtK9SUsHxej
 zVJCAGWFeX8K+gSLM6M/MJYaW7cy/XC7O8UmoyJslrcVwkDi6r4PBN9HRKi7qis=
X-Google-Smtp-Source: AGHT+IFFC6Xe2dKxfDOoifGSGfShu6VccU6fGfL6ghdk+14FgYE9ZpzlKhFW/7y9IDzf3odJzG9NPg==
X-Received: by 2002:a05:6000:1fab:b0:367:4e05:bb7b with SMTP id
 ffacd0b85a97d-36775721674mr2498580f8f.53.1719758970895; 
 Sun, 30 Jun 2024 07:49:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d8cb4sm7586441f8f.25.2024.06.30.07.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:49:30 -0700 (PDT)
Message-ID: <325bea35-443a-4afc-b3c6-d6826ddd6d88@mind.be>
Date: Sun, 30 Jun 2024 16:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240629095718.2899158-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240629095718.2899158-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758971; x=1720363771; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R/yrF6ExODLXh/WfkxHKSbtMy3jdzJKm4GQrtNBNmU0=;
 b=E0uzDt0GthfrrDD5wRGrSYtFtm/ueLfzw25S838HTbVJ55sWYPxizc6mcwp9Dm3kb7
 eeae6BceiAg8l0ocXUyMMkBId6kYIKun5oFVid5xYL5h7N2m3UJQQ6vL3srO0I84I2X1
 hNM2w4jOPrMu+8mUAFj9khrbPJe9INLfjj1AVLLepEsAlbLA0v34znHJQ3stE3BOr/p6
 AWXecw4A2Gj9l4w8x5Q0hjUbMnHy59ALoyOUolv4rfXPGYpksOuxwI7t5CVOORQ0Sm3L
 WRlzm7dnhP8raYuRX6eFQYd0Z8iN61FLBOYzx0zP2X3Bz5EVpEsvGDWZ4WxWpqSviBj3
 sqnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E0uzDt0G
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/06/2024 11:57, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tvheadend/tvheadend.hash | 2 +-
>   package/tvheadend/tvheadend.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
> index 972db9300e..225123a5f0 100644
> --- a/package/tvheadend/tvheadend.hash
> +++ b/package/tvheadend/tvheadend.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e3f05da73596097757fb4c0f9306e415b1772f26a52b5b86c50d63811e7e65af  tvheadend-c63115464d8f6556fb4cac93ce8740afea1b00d5.tar.gz
> +sha256  8454c696e9987ae77d1bc6e1fe45536bd9ef69192b6e568840fe8994ca2a5c2b  tvheadend-d2e41b553e7cc6eb06fd21b42bbed4b3a1f28bc0.tar.gz
>   sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 8f2e37b122..0453e08f4b 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TVHEADEND_VERSION = c63115464d8f6556fb4cac93ce8740afea1b00d5
> +TVHEADEND_VERSION = d2e41b553e7cc6eb06fd21b42bbed4b3a1f28bc0
>   TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>   TVHEADEND_LICENSE = GPL-3.0+
>   TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
