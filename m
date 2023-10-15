Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE26CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35B09402BC;
	Sun, 15 Oct 2023 19:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35B09402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hzs2Gg_gyaQY; Sun, 15 Oct 2023 19:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 235344149E;
	Sun, 15 Oct 2023 19:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 235344149E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D01E11BF5A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B43B44149E
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B43B44149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzwsHIhzTtWH for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:08:01 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3331402BC
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3331402BC
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99de884ad25so615143366b.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697396880; x=1698001680;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQ+61e9zQLek8MugbTlAiMDThOQuT6D2nQ19dRLKvl0=;
 b=iUgwH8D+qouiSxETe2fdxzG8jXpnssp2R09VtIqq7x8WDLOlpcRxM3QpEE8+TFn4SU
 Fewn6BluxJulZk7cQTrJiK8mKNg1oYBObYEwTMc990znLYUlV7sPo64xm1HFCOo7bhwR
 CgzmwaMjw74HpImKXrq+KRyemoe2LKIlNrGOV/8kN6PkiJvHzc6WxVm4GHyvcGm0ZBzE
 5IzZ48pUONTe35IXeJe2AfrWAk0IIzqLao1gaJlybqU2N61RIeicsGH3OCid68DdPGgg
 7aSC3mFAsXJBMOR3iKyIe71zAQDEn3QGraKNBmWnWpKhBtQQx7nxcMPjeEfRN3dE/tSH
 Dkww==
X-Gm-Message-State: AOJu0YxzXWkrle/i2ppp8vCElF+hf26v0VLgYcN9hJs17diyi6BZEAta
 zkcRjx0I+3tIw7bOty0Dp5/Iqg==
X-Google-Smtp-Source: AGHT+IEnla56qnNtsMur6XSycbxXgfRdVfpLX7zH+jcF4HOpBs6j9R1hqpaFpbGuQH8E3Y50aU+phg==
X-Received: by 2002:a17:907:774e:b0:9a5:d972:af43 with SMTP id
 kx14-20020a170907774e00b009a5d972af43mr26818637ejc.65.1697396879684; 
 Sun, 15 Oct 2023 12:07:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906670b00b009ae3d711fd9sm2624666ejp.69.2023.10.15.12.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 12:07:58 -0700 (PDT)
Message-ID: <fc4568f7-ab43-354a-4618-5a4dc69f6107@mind.be>
Date: Sun, 15 Oct 2023 21:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Stefan Agner <stefan@agner.ch>, buildroot@buildroot.org
References: <330af443072a1a0716c5890eb87216a6bfbe99e7.1669645942.git.stefan@agner.ch>
In-Reply-To: <330af443072a1a0716c5890eb87216a6bfbe99e7.1669645942.git.stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697396880; x=1698001680; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQ+61e9zQLek8MugbTlAiMDThOQuT6D2nQ19dRLKvl0=;
 b=WcQg5vrgPx2C5+GghZ1HQZWT4K7rxiQG0JXeEbJY5kHgDF9JPjDh1KMDLFUmjx+Mom
 pIiLqSgkji7zvrVt2c8Zm18soABjSg/5TuFLuu1RujKlQ1FB2qOhwKop5d9zAEcieUAm
 XOpa07PPtKMHbOhlrjF00WxiMcVQwGTYmCwgYIeYdE8gsH2LLx8XKFlxa+vCAk51/V0F
 knGbWKKyBdqBgWryYRTVZMFSY0g67ysLxFbT0SG6TZdy+5mycAZ1d3h0tt4t7rSmNvqB
 UlDGmXKgeyRPddBy9+sIQU2wuPfcLBlep4M2ZRsyLGvls0sDS1ax3iZIHxcSDJO+k7GT
 wbMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WcQg5vrg
Subject: Re: [Buildroot] [PATCH] package/iptables: add option to use
 iptables with nf_tables backend
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



On 28/11/2022 15:33, Stefan Agner wrote:
> Add a configuration option to let the iptables and ip6tables symlinks
> point to the nf_tables variant.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>   package/iptables/Config.in   | 5 +++++
>   package/iptables/iptables.mk | 9 +++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/package/iptables/Config.in b/package/iptables/Config.in
> index e6b12603e0..ec7fbb7eea 100644
> --- a/package/iptables/Config.in
> +++ b/package/iptables/Config.in
> @@ -24,6 +24,11 @@ config BR2_PACKAGE_IPTABLES_NFTABLES
>   	help
>   	  Build nftables compat utilities.
>   
> +config BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT
> +	bool "nftables compat as default"

  Shouldn't this depend on BR2_PACKAGE_IPTABLES_NFTABLES ?

> +	help
> +	  Use nftables compat utilities by default for iptables/ip6tables.
> +
>   comment "nftables compat needs a toolchain w/ wchar, dynamic library, headers >= 3.12"
>   	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
>   		!BR2_USE_WCHAR || BR2_STATIC_LIBS
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index a6143677d1..b53ae928af 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -49,6 +49,15 @@ else
>   IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
>   endif
>   
> +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
> +define IPTABLES_INSTALL_SYMLINK
> +	ln -fs xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables
> +	ln -fs xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables

  This only changes the default for those two, not for a bunch of others e.g. 
iptables-save.

  To do this properly, I think it's better to send a patch upstream that adds a 
configure option and changes the Makefile.am to install those symlinks.

  Regards,
  Arnout


> +endef
> +
> +IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_INSTALL_SYMLINK
> +endif
> +
>   define IPTABLES_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
