Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79AFC7EE24
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB8983D39;
	Sat,  3 Jun 2023 20:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CB8983D39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmBTH4mD94E3; Sat,  3 Jun 2023 20:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD8983D0F;
	Sat,  3 Jun 2023 20:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD8983D0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E302D1BF3DF
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 20:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC8CA83D0F
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 20:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC8CA83D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1x7-OojTmC1q for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 20:41:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755C683CE1
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 755C683CE1
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 20:41:30 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5148f299105so7132198a12.1
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 13:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685824888; x=1688416888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FH3TIBp0hwATbHV/xbh7kkou6zrVc1NK1mx6QUWPyDI=;
 b=CCj8RURH8YyjLEoU3PjvMlAk0fIhavjh8Yv08f6l209kmMiQSu5fgIG6NquA7X+vam
 7r84QhrsVtJ/YR5ME+M0x1Lg81RWGn7JocVycJKlJkPyEZNIv+g8vzfnna22KS8Zm2rM
 YIaHzLW9pf5b9sjDK0dalRTh28GTkP4TQt/JEPjmbmtEySxwSwHDmCA3WDmY1mg3WGlS
 6+PD91eWBj4NDF+Fbb8vzmiKD8zGrkz2E5WBzPZe7rNAr/t+nh5LC+/2WCc8gIelnZxJ
 5DCKVqmdW7axVDvrKovBn3jNwydegD57PFnOUQUUgNPkSca8Ej/cHqmHnjYpqxe5Tdia
 Q2Ug==
X-Gm-Message-State: AC+VfDxhO/gcC+ObSltUntpfNaUn7hRB79nucHvyaKNjDNegFkUFfV10
 PFgVSFyiMFoFaFVgIz4BXrZy2w==
X-Google-Smtp-Source: ACHHUZ6/xE9svUwyl0StDy2Z0l9npNaUSTr9xqHUDxY6nQu2oOT0hKQuMf7RenwslC4QaZw63bKc9Q==
X-Received: by 2002:aa7:c616:0:b0:50c:161b:9154 with SMTP id
 h22-20020aa7c616000000b0050c161b9154mr6692999edq.11.1685824888470; 
 Sat, 03 Jun 2023 13:41:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05640212c600b005149c7b1f49sm2073247edx.64.2023.06.03.13.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 13:41:27 -0700 (PDT)
Message-ID: <57ffa030-89c0-cb57-b7b2-cc8ffa452d01@mind.be>
Date: Sat, 3 Jun 2023 22:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230510202434.13975-1-ps.report@gmx.net>
In-Reply-To: <20230510202434.13975-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685824888; x=1688416888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FH3TIBp0hwATbHV/xbh7kkou6zrVc1NK1mx6QUWPyDI=;
 b=PWciMFb3oO3ARIEfH1CyytPtlSuhibOQYXr/1OANNWAbp0AzHfNKWX2V6lP5sDE6g6
 4/JSp6K5+UTDk9dMa1ABeF6/2B4yL6YIWhcLRhpOsla+axai9S437Zh2BTTT9jH46sLn
 gRnB40lPqjcf6S6ldEHpYqlbE4Ek7o3d9HvNo7A/xp/UhNtU0ClxD3UvOAXpl/88PVxC
 L9//PcCPSh4DNGWD1MlqtKrkriAgVSKXyrKCzHzIw0BkuySFfrroQYcSJYIrTprvj6UJ
 QO/gjFADGQ5zZNFAzcrlpkPkWnsHhYj/E42PEAuz1Fj6FN0AwlZYqb7CmS2hXk1CgItn
 Uc+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PWciMFb3
Subject: Re: [Buildroot] [RFC v1] package/coreutils: needs toolchain headers
 >= 5.6 (32-bit system with 64-bit time_t)
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
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2023 22:24, Peter Seiderer wrote:
> Add coreutils dependency on toolchain headers >= 5.6 for 32-bit system to
> gain access to 64-bit time_t.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/a5bac0aaadea43fcedf3a51b070e605e3906c237
> 
>    checking for .../host/bin/arm-none-linux-gnueabi-gcc -std=gnu11 option to enable timestamps after Jan 2038... support not detected
>    configure: error: in '.../build/coreutils-9.3':
>    configure: error: support for timestamps after Jan 2038 is required
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>    - Config.in comment section for package/glslsandbox-player and
>      package/opkg-utils missing
>    - Not sure if this is sufficient (e.g. possible libc system and/or
>      version dependency), other possible solution would be something
>      like introducing BR2_TOOLCHAIN_HAS_64_BIT_TIME_T

  The current situation of 64-bit time_t is:

	depends on BR2_ARCH_IS_64 || \
		BR2_TOOLCHAIN_USES_MUSL || \
		(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6)
i.e.:
  - 64-bit platforms always have 64-bit time.
  - musl AFAIK always has 64-bit time in the headers (not sure what happens in 
the actual syscalls).
  - uClibc never has 64-bit time.
  - glibc has 64-bit time with sufficiently recent headers.

  It's actually a bit more complicated still, because on some architectures 
(riscv for example), there's always 64-bit time even if it's a 32-bit 
architecture. So on those, even uClibc has 64-bit time.

  Because of all this complexity, I think it's better to introduce something 
like BR2_TOOLCHAIN_HAS_TIME_T_64 that encodes those conditions. It would be a 
blind symbol that defaults y for 64-bit architectures and is selected by the 
respective arch or toolchain symbols. It's a bit complicated that way, but gives 
us most flexibility to get all the conditions right. For instance, in external 
toolchains it would only be selected if glibc is sufficiently recent.

  Therefore, I've marked this patch as Changes Requested. But I also added the 
other matinainters in Cc because they may have different opinions.

  Regards,
  Arnout

> ---
>   package/coreutils/Config.in          | 6 ++++--
>   package/glslsandbox-player/Config.in | 1 +
>   package/opkg-utils/Config.in         | 2 ++
>   3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
> index 705013bae0..968c7a97cd 100644
> --- a/package/coreutils/Config.in
> +++ b/package/coreutils/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_COREUTILS
>   	bool "coreutils"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 || BR2_ARCH_IS_64
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_USE_MMU # fork()
>   	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> @@ -33,7 +34,8 @@ comment "coreutils individual binaries need a toolchain w/ dynamic library"
>   
>   endif
>   
> -comment "coreutils needs a toolchain w/ wchar"
> +comment "coreutils needs a toolchain w/ headers >= 5.6 (32-bit only), wchar"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 && !BR2_ARCH_IS_64 || \
> +		!BR2_USE_WCHAR
>   	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
> index 530c158fc3..78d6dd9a6f 100644
> --- a/package/glslsandbox-player/Config.in
> +++ b/package/glslsandbox-player/Config.in
> @@ -32,6 +32,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
>   	bool "Install scripts"
>   	depends on !BR2_STATIC_LIBS # python3
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 || BR2_ARCH_IS_64 # coreutls
>   	depends on BR2_USE_MMU # bash, python3
>   	depends on BR2_USE_WCHAR # python3
>   	select BR2_PACKAGE_BASH # runtime
> diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
> index 2973055baf..cdefa193b7 100644
> --- a/package/opkg-utils/Config.in
> +++ b/package/opkg-utils/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_OPKG_UTILS
>   	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX # binutils
>   	depends on BR2_USE_MMU # bash, python3
>   	depends on BR2_USE_WCHAR # python3
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 || BR2_ARCH_IS_64 || \
> +		BR2_PACKAGE_BUSYBOX # coreutils
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # python3 <- libffi
>   	depends on !BR2_STATIC_LIBS # python3
>   	select BR2_PACKAGE_BINUTILS if !BR2_PACKAGE_BUSYBOX # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
