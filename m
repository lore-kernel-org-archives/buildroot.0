Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7741DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:16:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470B761208
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 470B761208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0EE607D7;
	Sat, 11 Sep 2021 14:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWuDkDSt059s; Sat, 11 Sep 2021 14:16:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D5460781;
	Sat, 11 Sep 2021 14:16:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3CD21BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A372960781
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rk9E0d0m7p5B for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:16:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D28FF60726
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:16:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id v24so721495eda.3
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B8Uyf1fO9D89BNcph1LUbTxMC8uyKEazl0QlGO2XNrM=;
 b=IcuYaNWluCNsVQPQ9+VVjUflaPFljY3bFiatwr4NNj0GxZ7PL/mflhHtLq/Cwxmu8F
 nbNuZ3vQb2YW/oZEWlkrPC4apeMCAja8EHuqkQXpukDfbvInTqWis4rV6lI/BQ/dS+H9
 OdWQxtMzvrPla/7DYCBgCh/1/3YNqHrZtjKbIfd790GTM4JJGdVAQoHQmVck5n6cZ8L8
 TcSr4oJJ4Qduiq2CzOQtcLUO00UmIR2W1MxQtqltXMItNnn5qpIxA4mSJ6kmMRNsU2Ky
 WNT1AxuAFwZXVXLPh3T8adZq7lK+1CwDQ9kvb0Bdf4GR03lDe6jqvnFtu8/05+9SF6E5
 TTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=B8Uyf1fO9D89BNcph1LUbTxMC8uyKEazl0QlGO2XNrM=;
 b=I3n9D/vEiAlo02stiOkCMjZwxz6FxHScBMNy4zM32jO2A1vImBHB5dtSrBvgsVzEVm
 DzXDVapn2Zua9m+Eg0RvdTtTMcGRCih98X6kW3IrFBLsc6BpJjvkFg7zTVkGqoMWoTCk
 BRSSTJeVkUOPv5z4L+AeFl9aT5PhiOjcDjPmbpT7qqW80QIwhO/lj8lbi2ze1vbOPl7H
 5vTvm7uHNflGaGZNZZRq/vtljgBIM2nnvJDkaL/1t+b7IAJI2GhUoQUlN6aqdnLsJ/7J
 Gviey7qi3y8wWRJRZWrQqTY7tBNCoYRyvBpXergbMpQVWm6NOPHO5ChhXJ8LSKcS695T
 jjaw==
X-Gm-Message-State: AOAM530b7gZJJtY4Ho7eHmx/XrFtYOQancoPrUPTe+aS1DqYLDfEnxQU
 +MhT9Wf5RGoFXtRASwA19QvfaQ==
X-Google-Smtp-Source: ABdhPJyhZl1HvCcUVB/0gTTDACp8IZWdNbKwPEFYNHonwfP3HUByXf0h/0hHkIbA+qL1TwTMDF335A==
X-Received: by 2002:a50:9e8b:: with SMTP id a11mr3426022edf.126.1631369784116; 
 Sat, 11 Sep 2021 07:16:24 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z18sm182006edq.29.2021.09.11.07.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:16:23 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210829215738.2160383-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6fdf027b-5288-e29a-32ed-b1c69b610056@mind.be>
Date: Sat, 11 Sep 2021 16:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210829215738.2160383-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libiio: drop unrecognized
 options
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 29/08/2021 23:57, Fabrice Fontaine wrote:
> MATLAB_BINDINGS and WITH_MATLAB_BINDINGS_API have been dropped since
> version 0.21 and
> https://github.com/analogdevicesinc/libiio/commit/b968f81375b8e3e03467e2765173434dc6e1922c

 Applied to master, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libiio/libiio.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> index aec251e9a1..b36ea3bafe 100644
> --- a/package/libiio/libiio.mk
> +++ b/package/libiio/libiio.mk
> @@ -13,8 +13,6 @@ LIBIIO_LICENSE_FILES = COPYING.txt
>  LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
>  	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
>  	-DWITH_NETWORK_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
> -	-DWITH_MATLAB_BINDINGS_API=OFF \
> -	-DMATLAB_BINDINGS=OFF \
>  	-DINSTALL_UDEV_RULE=$(if $(BR2_PACKAGE_HAS_UDEV),ON,OFF) \
>  	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
>  	-DWITH_DOC=OFF
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
