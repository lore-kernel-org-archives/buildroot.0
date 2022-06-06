Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB284C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3749A41C04;
	Mon,  6 Jun 2022 18:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0j5OboI82wf; Mon,  6 Jun 2022 18:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28A041C01;
	Mon,  6 Jun 2022 18:19:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACB01BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8949160B61
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBkIKAPneYaZ for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:19:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C3C560A6A
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:19:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b8so3253203edj.11
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=4Fw8BBBvOHBpV8APRUubG7XTLtcy61uuQmrGnuplFGo=;
 b=RQHd4a443z9n4UBeIMLUoqFyQ9pM4chK1jGHmUa5yXCGztvzQIxqqP8U8cCFtzTWjh
 WeegsNlsTBwzbxH0Qb2TXWkS+m5UTAHAzJhZDCbnftCqIViesmpfLQ1Ur8nVQxBAy5UG
 U5UdLmD/KCPHKWilt8g6ugUikTKpiVydhljLbHAC/9ri/h0EnmKuSfJSS+ugrdIKCJBz
 3qFTIUxn4U89u0bWDUbsUkG8iDNBiBPRtbQdRan4DCykzIh8qBex/966biayVzDRzTBN
 PvutD6EgnJMpsFfvVHH0QzglrkFUd65uXhz1h1bhqsqYOwPqjNQrH8saWjKqVni3V/RK
 W/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4Fw8BBBvOHBpV8APRUubG7XTLtcy61uuQmrGnuplFGo=;
 b=Nv68e0HC6EeJxnQfUMtt7kBsfIl9hDSXy1pq1wS6ogyqBHHu47HLJrPx5S+xlMOGTO
 vVoE7pOT6uvWM7OUlx9X6ZQpijK3arWSfNjNx2rHW9wVwhOn96gbo5ynIndvspvKGX7o
 m4SVPcmgstzuTQF60nhVzjR4BZY7PPBit1eeU3JdBKzKAmlFvDgxH+7AX6qQX+PwqUbz
 79Ac+xirPFzyFz8ZyssR7tSNN+p5HFPvwanFAMc4RAGkAZ3tvZs2YVEF7abt6TuTGKHO
 5gIpAMK+KnvuNgE+/HOC5xZd/cvfUyNR6rpS8ycBSfzNe/7yPMx+kNGWSj3jurkvF9+n
 L1/Q==
X-Gm-Message-State: AOAM532Fm0OltsMe0xMQYnL/h8hZSx/50Rqek0gcxbSDCq8/iD5cFFN8
 tNFv7xla4q2RATi01Dt+OmtE2+yF47jLaQ==
X-Google-Smtp-Source: ABdhPJwPQcHHc7LAzavk21O0ljNvh1gMZUuiYutNdvadjM53TUq4Q2Fj9GeKXv3puDGx54wWF47/kA==
X-Received: by 2002:a05:6402:60d:b0:42f:ac38:af75 with SMTP id
 n13-20020a056402060d00b0042fac38af75mr18258500edv.203.1654539582313; 
 Mon, 06 Jun 2022 11:19:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 re16-20020a170906d8d000b007081282cbd8sm6325404ejb.76.2022.06.06.11.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 11:19:41 -0700 (PDT)
Message-ID: <db2283d3-fb5e-5878-9dfd-fc70a950686a@mind.be>
Date: Mon, 6 Jun 2022 20:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220606085108.1628288-1-joel@jms.id.au>
 <20220606085108.1628288-2-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606085108.1628288-2-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH 1/2] package/librtas: Bump to v2.0.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2022 10:51, Joel Stanley wrote:
> Includes build fixes for musl, so remove the glibc restriction.

  And what about uClibc (only in the BR2_powerpc case of course, because uClibc 
doesn't support PPC64)?

  Regards,
  Arnout

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   package/librtas/Config.in    | 5 -----
>   package/librtas/librtas.hash | 2 +-
>   package/librtas/librtas.mk   | 2 +-
>   3 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/package/librtas/Config.in b/package/librtas/Config.in
> index 11660eb2817a..2f8219ee98ee 100644
> --- a/package/librtas/Config.in
> +++ b/package/librtas/Config.in
> @@ -1,7 +1,6 @@
>   config BR2_PACKAGE_LIBRTAS
>   	bool "librtas"
>   	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	help
>   	  The librtas package provides an interface for Run-Time
>   	  Abstraction Services (RTAS) calls on PAPR platforms.
> @@ -9,7 +8,3 @@ config BR2_PACKAGE_LIBRTAS
>   	  and parse RTAS events.
>   
>   	  http://librtas.sourceforge.net/
> -
> -comment "librtas needs a glibc toolchain"
> -	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
> index de0c0a476cac..8d4c4e191235 100644
> --- a/package/librtas/librtas.hash
> +++ b/package/librtas/librtas.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b47b2a6f140347ac265e2c66ddf68293f6cdcc7c0c9a78c6e21ff52846465415  librtas-2.0.2.tar.gz
> +sha256  1b951422ec9553fa9d5e5e158fd8e298f867f561189fff6817a9540d5661f145  librtas-2.0.3.tar.gz
>   sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LESSER
> diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
> index c92a9e2fa494..458d7a0e478e 100644
> --- a/package/librtas/librtas.mk
> +++ b/package/librtas/librtas.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBRTAS_VERSION = 2.0.2
> +LIBRTAS_VERSION = 2.0.3
>   LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,v$(LIBRTAS_VERSION))
>   LIBRTAS_LICENSE = LGPL-2.1+
>   LIBRTAS_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
