Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA084C43217
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 12:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E8D760C0C;
	Thu, 24 Nov 2022 12:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E8D760C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llaI-k5MEX49; Thu, 24 Nov 2022 12:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E4DD60BE0;
	Thu, 24 Nov 2022 12:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E4DD60BE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1481BF287
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37E35404F1
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37E35404F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gF74ghZgyO0N for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 12:45:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 226034041C
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 226034041C
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 12:45:25 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n21so3894856ejb.9
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 04:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GQ2N2RVunVOb478lTIb3IAGnAh2bB0eyzE88RqMvFoQ=;
 b=Dg6WTGB/HfjqL3dnqLCtvl0gmouUZXGW9ujEBtAQNuJm4jfKusZFKVWN2704pBOvav
 KMqdOborGsmLhZAndOwnO+CpvRj8r9xKNHQ1tOu/TCTxjbNkaNTp1wqANPmUNJGRtJs6
 SkQDHFHFDN4fqItokz+kPy94lVlPXm4KdSlLFuqberw/BL4whNoga1S4fooGZ5coxK/P
 9PfKzNDLr3G6/3LfivWYcgoQqUeLg63hCGQJHBs1K4OkC41Yora1JfUFfXkl7Pv5ULNx
 Hw0N8PTp7p168ElHC5GHVsEScvO8GHQy9VrtTieYKv7N2E8KB691mNKnyKpOHdHzircE
 9Y6A==
X-Gm-Message-State: ANoB5pk2ivsRnw5wNcGAAQZB4jbNqhrxgXRSUCWrghglQWW7FF5eoS6/
 +Xl/ZolEUpd8E7CO2FUMAQ/3HA==
X-Google-Smtp-Source: AA0mqf7gMXLRmtQ3UejnwYACXwiYED+eajZA+pP46+pc7uafol2narG0FR2QjppUwUn5PhM7fXCUlw==
X-Received: by 2002:a17:906:298c:b0:7ad:eb7f:d082 with SMTP id
 x12-20020a170906298c00b007adeb7fd082mr27057898eje.356.1669293923349; 
 Thu, 24 Nov 2022 04:45:23 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 lv22-20020a170906bc9600b0078d4e39d87esm376986ejb.225.2022.11.24.04.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 04:45:22 -0800 (PST)
Message-ID: <3e7aa0ee-17e7-3eb5-8c47-b257aec8da1a@mind.be>
Date: Thu, 24 Nov 2022 13:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20221105165524.747494-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221105165524.747494-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GQ2N2RVunVOb478lTIb3IAGnAh2bB0eyzE88RqMvFoQ=;
 b=cxXaq6XCXcZVLJF6YgG1kz2q/URHQuRG6kCPgM8skbaDpb1e2tcPbjtLirNVAGxzW1
 BamFcQ7S6hbArLRI5C0rL78m5GPmYE0GE7Rm3OvtKuX4n4EpmN4RMr0tfWSzNMYGku5R
 vhDa8iI/aGoOMO9RJhVSHs8IoQXOXBaOpcybj++xv7x1e4FHsv1PqfmCHN4go2sROSNU
 yadF4k2a4yF5EF2GxvtNuSHVdJ+UZJEa+V1dAfJF+ZHfwRMuRjOymiCAiwmmsXrW2xy3
 2BIWJdVMc76Am+mV4+J/L/7uZyMRZSnrycmw2hFK3tmOFuVUfW/uzEsiTp9j7K3E9mFh
 bKUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cxXaq6XC
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenssl: drop useles option
 for rc5
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
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>, "Weber,
 Matthew L Collins" <Matthew.Weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2022 17:55, Yann E. MORIN wrote:
> Commit a83d41867c8d (package/libopenssl: add option to enable some
> features) added an option to enabled rc5. However, since commit
> 1fff94121936 (Fixup non-x86 openssl build), dated 2002-12-30, rc5
> has always been forcibly disabled in Buildrrot.
> 
> Given that it was unconditionally disabled all those times
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
> Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>

  Both applied to master, after fixing up the commit messages, thanks.

  Note that I chose master even though it is not a regression, but it is in a 
way a bug, and the risk is very low.

  Regards,
  Arnout

> ---
>   Config.in.legacy                 | 7 +++++++
>   package/libopenssl/Config.in     | 4 ----
>   package/libopenssl/libopenssl.mk | 1 -
>   3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0e63d59a98..8efc7ea976 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2022.11"
>   
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
> +	bool "libopenssl rc5 was never enabled"
> +	select BR2_LEGACY
> +	help
> +	  The libopenssl option for rc5 never actually enabled rc5,
> +	  which had always been disabled in Buildroot.
> +
>   config BR2_KERNEL_HEADERS_5_17
>   	bool "kernel headers version 5.17.x are no longer supported"
>   	select BR2_LEGACY
> diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> index fcead4c11a..00339238fb 100644
> --- a/package/libopenssl/Config.in
> +++ b/package/libopenssl/Config.in
> @@ -44,10 +44,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
>   	bool "enable CHACHA"
>   	default y
>   
> -config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
> -	bool "enable RC5"
> -	default y
> -
>   config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
>   	bool "enable RC2"
>   	default y
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 50d41a6533..3542b89727 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -85,7 +85,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
>   			no-fuzz-afl \
>   			no-afalgeng \
>   			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
> -			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5),,no-rc5) \
>   			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
>   			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
>   			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
