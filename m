Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66329C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:35:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B08460F90
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B08460F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0BE34011F;
	Tue, 26 Oct 2021 19:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hIhvG2cAwjH; Tue, 26 Oct 2021 19:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C018F40130;
	Tue, 26 Oct 2021 19:35:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A340E1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F48B4050B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeugGeO87L5w for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:35:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2426404CA
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:35:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r12so882568edt.6
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mWonf4ADVNqOk3S1dLZ6vbhf9csrLGnv3AEOXsTvSzQ=;
 b=T+iXBO5R37TiFqRuGtnSMjraHKJmAHWbKO+H/hC3+np8NnTogipynhsZ4392qsXT2+
 L+89mk12ohPk9FqjvQcFDSKceeE1y2NpOrugm/MWZGNtWgRKGNu31phhJYUFexEBGbq3
 vGEE+r7aodBTmj7L7BjDCE0dWH1aLzSfSfeQSJGC8Lye4t50AsbfT02BraCIuNSq/eCp
 PUYwPeKVdp++P0ltxRuHejQ29cevs3cLVAsmNdEwMDP7v+uCsYMOq7weXBcpamDrC1A2
 dTY9tzZldVghJTDty25qylj16lCnKWbixkOXHwu6tTc6vvPOufSn3cJPJR+0O1fm5UWE
 AJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mWonf4ADVNqOk3S1dLZ6vbhf9csrLGnv3AEOXsTvSzQ=;
 b=LH06Y7EEubYuB25nfvfZ6F6ksPqLi9lQRpWY0By1X44fjCKW+hIJuf0BRrcleLqQ6N
 79l7DU1W6j3YWOn2oThcrGurbX6UszX+a9mW7F//kcFKX0MVO/WUnDL6hJIeGIaZGaM2
 OXc/HNBNSa3RbuTGKb+eSE/ENOwjVKicyg4bxFF7alf/ntxMup4ZRrdageZCWUbJ6V8r
 LWvfayFq10Nz200zly4+YWeH0waMTJ23ru6cUsETqfekBFvtwd6RB9uAwaOwL+bwZybn
 naKmjuR1jVmAgpzzZwQwfSgGgjbQdQnULLg4NugdkkgFeStQT7NHHVLLPht6/2K3Yswl
 fu8g==
X-Gm-Message-State: AOAM530Jk1oxWGjCxxQatuep4O02V0XaxiXax6AzGUegEOpA2w1f266B
 N2Y7LT9rOTIRoLgbV8QSVoFv8A==
X-Google-Smtp-Source: ABdhPJyX2nZ5Ermu/qlhfMFfJsUpv00jAyrQ3+OPevdXaaDGfZHhF6J+P8To5CEVg7FtUBsfP7LFcw==
X-Received: by 2002:a05:6402:2787:: with SMTP id
 b7mr27764773ede.230.1635276936917; 
 Tue, 26 Oct 2021 12:35:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ca4sm9666925ejb.1.2021.10.26.12.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:35:36 -0700 (PDT)
Message-ID: <81d387df-bbfa-d7b6-0b23-bcfaf584a9ac@mind.be>
Date: Tue, 26 Oct 2021 21:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211024220145.3558550-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024220145.3558550-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: add botan optional
 dependency
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 00:01, Fabrice Fontaine wrote:
> botan is an optional dependency since version 5.7.0 and
> https://github.com/strongswan/strongswan/commit/af26cc4d8542fb6aaea9bfc5aaae1b139faee94a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/strongswan/Config.in     | 17 +++++++++++++++++
>   package/strongswan/strongswan.mk |  2 ++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 23334470fd..430625a102 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -31,6 +31,23 @@ choice
>   	prompt "Cryptographic backend"
>   	default BR2_PACKAGE_STRONGSWAN_GMP
>   
> +config BR2_PACKAGE_STRONGSWAN_BOTAN
> +	bool "botan"
> +	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +	select BR2_PACKAGE_BOTAN
> +
> +comment "botan backend needs a toolchain w/ C++, gcc >= 4.8"
> +	depends on !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
> +
> +comment "botan backend needs a toolchain not affected by GCC bug 64735"
> +	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +
>   config BR2_PACKAGE_STRONGSWAN_OPENSSL
>   	bool "OpenSSL"
>   	select BR2_PACKAGE_OPENSSL
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 850bb7326e..2891e5aa5e 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -18,6 +18,7 @@ STRONGSWAN_CONF_OPTS += \
>   	--enable-pkcs11=yes \
>   	--enable-kernel-netlink=yes \
>   	--enable-socket-default=yes \
> +	--enable-botan=$(if $(BR2_PACKAGE_STRONGSWAN_BOTAN),yes,no) \
>   	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no) \
>   	--enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no) \
>   	--enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no) \
> @@ -66,6 +67,7 @@ STRONGSWAN_CONF_ENV += LIBS='-latomic'
>   endif
>   
>   STRONGSWAN_DEPENDENCIES += \
> +	$(if $(BR2_PACKAGE_STRONGSWAN_BOTAN),botan) \
>   	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
>   	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
>   	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
