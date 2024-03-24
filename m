Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00714C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACBE9403A2;
	Sun, 24 Mar 2024 16:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsx2E9-57866; Sun, 24 Mar 2024 16:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 908DA4026A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 908DA4026A;
	Sun, 24 Mar 2024 16:57:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 198E01BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 023284061F
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujUB-iXDwqoL for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA08A4026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA08A4026A
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA08A4026A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:57:11 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2a02c4dffd2so2392168a91.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299431; x=1711904231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a9eK+47uBUFy1iIQbrV4PgGehtUL6z984cxz35V+hf4=;
 b=ZusZfZjs0/XD2sKMoc9OEIJ9MY1sd01H6O0bC6EQ7iRb8yGlTFlO7R5OB4Cmz8IftG
 Vad7YiWeQo+kcR29RYdR2IfXK1hnX3jnIrWqqRnX1dnKa/2/DBFqM/ZL08/OpIVp14jC
 H030R4rlBl4LHq4OVclXgZQ4vxan+NY03hdTWIv1FGOfbD+r5Bks/Nov9ThajqjFUPK5
 ubSIGK3gjsmj4P+vVDpuMR+fr0t45ldFqoK0fElJuwAISOZZCdmLvRIWk9xb+KA41ve8
 +BTjtl5u1NLE7+FUf9/YofRGxY1VS7MR14x9PGVc92nIFwsES1NmUve/GQJTLEf9bW5j
 GhFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+zQEdEffz94c/xZGzb3qb8nbwfKfT1j+VAsrIXE9XeJkujWbtnmeP1e4sWdqZhfxJ2SmgFxcR0GW4jCNOb3m3IWdZdCZgA==
X-Gm-Message-State: AOJu0Yz6HUE6KMv2FSoC8RidYvP5PLodtqb4l20L/BsI8Bh8NUF6Bhfq
 XNOj9SG9XGih80MUbyKKLb2qWGJ8EkCL3knqBM+4ldvOK1UUAYviex6m354YDgM=
X-Google-Smtp-Source: AGHT+IFY2i+hrizpQAK1MQET38mtyXK8nWc8W4hXhKXdBetAyX4okhV1xgMylEdc/ZbsN9GqAjcd4g==
X-Received: by 2002:a17:90b:e16:b0:29b:9a08:6007 with SMTP id
 ge22-20020a17090b0e1600b0029b9a086007mr3541562pjb.46.1711299430955; 
 Sun, 24 Mar 2024 09:57:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ns21-20020a17090b251500b002a068485de6sm941835pjb.3.2024.03.24.09.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:57:10 -0700 (PDT)
Message-ID: <0420dfb2-951d-4cae-bc25-39065d5cc287@mind.be>
Date: Sun, 24 Mar 2024 17:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240312183836.411083-1-ju.o@free.fr>
In-Reply-To: <20240312183836.411083-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299431; x=1711904231; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a9eK+47uBUFy1iIQbrV4PgGehtUL6z984cxz35V+hf4=;
 b=dTJ2Kpaw+t/qISZPsTqd3ZHvjjBs6T5+Rq2gkQYleYXKeYKc5YAvcpgA04xNqrw58f
 TycyQtQy4solv4LCUXu7ADD12RCYGdyh5oWUXGAPH9O+6x+j8lsDvAGDHi7kGTqdHBC4
 Nao449GZVMdnpeYnjDAM+QMlo4g9AnIEVee9P28yeLeWEnIgf4PGvEXAyhQF21xDk00I
 y4KX1sBLdbqTuZ1Md2HrsZoYKVfNfK4sxZChVwZtKjJkRiREfIcR1l1Pob+cJCEt3FmV
 IcIhT55fTDPDb7emqIvwje1Gw+hG4hn5O/DcER6Osjq76r/TCnLFCGZa4a2BF4ICVA6M
 Zngw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dTJ2Kpaw
Subject: Re: [Buildroot] [PATCH 1/1] package/bitcoin: add the wallet support
 option
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
Cc: Fabio Urquiza <fabiorush@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/03/2024 19:38, Julien Olivain wrote:
> The bitcoin Buildroot package has always disabled the wallet support.
> 
> This commit adds a config option to enable this support. This allows the
> bitcoin-cli command to create wallets, generate addresses and send an
> amount to a given address.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Note: the wallet option can also be used to write a runtime test for the
> bitcoin package (doing a test transaction with the regression test
> network).
> ---
>   package/bitcoin/Config.in  | 10 ++++++++++
>   package/bitcoin/bitcoin.mk | 15 ++++++++++++++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
> index c4a2447fc95..060cae24f5f 100644
> --- a/package/bitcoin/Config.in
> +++ b/package/bitcoin/Config.in
> @@ -36,6 +36,16 @@ config BR2_PACKAGE_BITCOIN
>   
>   	  https://bitcoincore.org
>   
> +if BR2_PACKAGE_BITCOIN
> +
> +config BR2_PACKAGE_BITCOIN_WALLET
> +	bool "wallet support"
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Enable bitcoin wallet support.
> +
> +endif
> +
>   comment "bitcoin needs a toolchain w/ C++, threads, wchar, gcc >= 9"
>   	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index 493c569336a..2f8a1777a26 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -13,14 +13,27 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
>   BITCOIN_CPE_ID_PRODUCT = bitcoin_core
>   BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
>   BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
> +# Berkeley Database (bdb) support is always disabled. It is only
> +# needed for legacy wallet format. New wallets are using SQLite.
>   BITCOIN_CONF_OPTS = \
>   	--disable-bench \
> -	--disable-wallet \
>   	--disable-tests \
>   	--with-boost-libdir=$(STAGING_DIR)/usr/lib/ \
>   	--disable-hardening \
> +	--without-bdb \
>   	--without-gui
>   
> +ifeq ($(BR2_PACKAGE_BITCOIN_WALLET),y)
> +BITCOIN_DEPENDENCIES += sqlite
> +BITCOIN_CONF_OPTS += \
> +	--enable-wallet \
> +	--with-sqlite
> +else
> +BITCOIN_CONF_OPTS += \
> +	--disable-wallet \
> +	--without-sqlite
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
>   BITCOIN_DEPENDENCIES += libminiupnpc
>   BITCOIN_CONF_OPTS += --with-miniupnpc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
