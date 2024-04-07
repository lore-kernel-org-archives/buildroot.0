Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B2CCD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 545E440523;
	Sun,  7 Apr 2024 19:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2aaOBpOWTrB; Sun,  7 Apr 2024 19:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CAB440AE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CAB440AE4;
	Sun,  7 Apr 2024 19:49:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 291D51BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B3EA60A57
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSA6emVqg0eQ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:49:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CAE060873
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAE060873
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CAE060873
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:49:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41673509e8eso1565565e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519346; x=1713124146;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5oMLj+tTZhZmuFsgBSzdiqlZuPPAp+9HSX5z5OhanPM=;
 b=FPyn11npxULIjnaTG859NgtDIzkh6xrWE7NhznlLZXEkJgw8MRjfJQGGPoFWiENA5D
 A5M4noNOQXmyYNr/zQeauZ5msuKAw+VCKSSkcFtefW5fajXJzPYmvC4k9qetBpOao5s3
 eDeavNUxjoVUF85HVSU8v06OQenlDP+x6/28a7B4+MGsh5Hb4EnyZmkJrJbKiD9hK0xz
 JOXe3QzFT7cuhE21ycoxZxXtxaKygLWVKd2Q++OkTTzbWKPAdO1nNBT/c6if6EcLgXc/
 S7P+KKEqwgzVvQg4pS+0HC/CkYRHveayUHfVyDdxZAy47XkHtBkIYYSGWKIGR6TXqHHL
 JeEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyLTZD/8hBIh8QpB3vCyE6ZLQObWasbuAm2mXSrVzR+ZvQmbzJVfFJgr02sn/MbZz1polB/3PULrVwJyoc/NVI6EVFlHg0fA==
X-Gm-Message-State: AOJu0Ywnz54dOxu4qcg6VPpZgiWSDOU/Tn35tmn5YuickcNyrSpiz9H9
 oLCZI/lZ1UDnF6h4AvOm1olD13RJ5IZBAc4fjlRuNUw2l3ax5QmJlZMQ6pXx7qg=
X-Google-Smtp-Source: AGHT+IGvLXSY9+wBXKVNKMlY66oCZL0dl2jUUMXfEQ1NTwakC35GBob65wGdj+nwVtql6MX279+jGw==
X-Received: by 2002:a05:600c:5253:b0:416:4de7:62c8 with SMTP id
 fc19-20020a05600c525300b004164de762c8mr2420346wmb.12.1712519346328; 
 Sun, 07 Apr 2024 12:49:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j11-20020adff54b000000b003433bf6651dsm6474266wrp.75.2024.04.07.12.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:49:05 -0700 (PDT)
Message-ID: <bebaa7ac-9c7e-4204-9288-33d4943fd7b3@mind.be>
Date: Sun, 7 Apr 2024 21:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407192944.3335886-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407192944.3335886-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519346; x=1713124146; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5oMLj+tTZhZmuFsgBSzdiqlZuPPAp+9HSX5z5OhanPM=;
 b=DQUoJyYcJq/M2tOXn4z14u6iC6u6XA2AB6UTQ30TtAFY+Cn46J1XmyuDeA+M0q9qaF
 YKip6dqfOJG74Yvo/+x5UC7LEbxj9yWgL9YKkg7xiDJFHMKKKEO7lfGhx2YlVoUe9nZc
 755QBoNgXnZ7gseZAwU9k9tcHAIeU2szyVvYnbyO1R6Ip/vdlqwFa+g5A2v2/9Zz7cSD
 sFM1UZALPB+IZDrAwQVZjjcK71Zd+Yiqpd1A5opOTE3sVpHnzcXbDlu5QRL76AHdUdeZ
 KZIGQuYyOlEkyk2EHG7zAO8CDD94ctu7iZvxzo4Cqzo7W3shp3rqeQwtwn/2CFfb2tCK
 qvuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DQUoJyYc
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: openssl is optional,
 not mandatory
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 21:29, Fabrice Fontaine wrote:
> openssl is optional, not mandatory since the addition of the package in
> commit 8aaa7ecbce1d10cbcd880c3da5e429988f96176a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opensc/Config.in | 1 -
>   package/opensc/opensc.mk | 9 ++++++++-
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opensc/Config.in b/package/opensc/Config.in
> index 8c6a95a41d..13b085f389 100644
> --- a/package/opensc/Config.in
> +++ b/package/opensc/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_OPENSC
>   	depends on BR2_USE_MMU # fork()
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
>   	select BR2_PACKAGE_PCSC_LITE
> -	select BR2_PACKAGE_OPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>   	help
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index aa82bd18da..f4dc2206ea 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -9,8 +9,15 @@ OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSIO
>   OPENSC_LICENSE = LGPL-2.1+
>   OPENSC_LICENSE_FILES = COPYING
>   OPENSC_CPE_ID_VALID = YES
> -OPENSC_DEPENDENCIES = openssl pcsc-lite
> +OPENSC_DEPENDENCIES = pcsc-lite
>   OPENSC_INSTALL_STAGING = YES
>   OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
>   
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +OPENSC_DEPENDENCIES += openssl
> +OPENSC_CONF_OPTS += --enable-openssl
> +else
> +OPENSC_CONF_OPTS += --disable-openssl
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
