Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E264FEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A4F86125C;
	Sun, 25 Jun 2023 19:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A4F86125C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTKajRa9j-fL; Sun, 25 Jun 2023 19:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815C9612A7;
	Sun, 25 Jun 2023 19:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815C9612A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3461BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 167A1413A3
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 167A1413A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7nlupGl_N26 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:37:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 098E7411C6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 098E7411C6
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:37:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98e1c6a687fso74353366b.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687721827; x=1690313827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pSEKAsYbH6i4GKXRHUaufshH/NvK8EIRdzbNz5fTAZU=;
 b=dVJS57L4/KbNzW/jDP1vuAobVl/IpM6AqWzvc+qKUcMQLO1cQvoCCQawsKh7sOCSgc
 yumf/kyxD7Hnfn4BL5yPMOM9AJ99oE3zfeGLjaJXqi6Ixyby08cvrfKT9C05IHKSt7ah
 x87mdwZHMfA78WgmqiLp5YEJyo/CLcdo3HtWtRl416iG7chiG9yNuY9yejtkFpdHYOC8
 JI5Y9+JeQaB+tv6e6UhTdr9PPhdvi42mas4heVtxJ3FzyeDsVJJNvPp91Ef4juSZaxhg
 yggFXuxvqnl+kzmz2wks0Bc/aURcv10HZQuKGDPfSM9lyfVflvswHmvMgbet/rqOKDVZ
 P+/Q==
X-Gm-Message-State: AC+VfDyHUyi0Vq97saxbPTUfrQfS0336ZKEvedgJraV6FKGbiCI4KFjH
 yiqFHWrrSkiACoIZhoeOABjIQw==
X-Google-Smtp-Source: ACHHUZ4APZQfeaUeo/YGZXri25/X6YHsmxhWCiGOfvmNTwihNEvje7alU3QcxGjsA5oHTp+h20a9MA==
X-Received: by 2002:a17:907:2d11:b0:988:8a02:4560 with SMTP id
 gs17-20020a1709072d1100b009888a024560mr15777917ejc.44.1687721827005; 
 Sun, 25 Jun 2023 12:37:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a17090633ca00b00988b57d5146sm2375802eja.5.2023.06.25.12.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:37:06 -0700 (PDT)
Message-ID: <80a331c8-4bf1-5c27-558d-f98bb28f601e@mind.be>
Date: Sun, 25 Jun 2023 21:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20230625124848.1423168-2-ovlevin@sberdevices.ru>
 <20230625165121.2112986-1-ovlevin@sberdevices.ru>
In-Reply-To: <20230625165121.2112986-1-ovlevin@sberdevices.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687721827; x=1690313827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pSEKAsYbH6i4GKXRHUaufshH/NvK8EIRdzbNz5fTAZU=;
 b=TUigBP82kQA2DpHGw74UUoU6afPIfMJzHAxC/M0y1GwxcYFW1ZT4yRIJyhfoKbvwqc
 qzaKVZAEwkKgkQyu7SqfSTFjwTvU/r1z5BHGuqhhPeCP0+veWZlMG8MGIauGwxhJ6Wm7
 u1q9W/gTDwVG46keiVSh783cC56j54jIfJvhVfHf5vWdTuxeEddE8UynQUh8+f7/4HXt
 Zb28CZ9imfY5/m1PCWSX71Qck9v/JJ/r9VSUHESc7CPOT2qfwYmOUcOJQA2Vo6pp5t21
 NzrpFP79xJ5RtjWfrLleXwN+I22cWkqpmC+BbAKFBlD/nLhJUiNlE7X/XqvsDxf8NiGD
 /Flw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TUigBP82
Subject: Re: [Buildroot] [PATCH v2] package/libcgroup: allow to build with
 musl
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
Cc: olegartys@gmail.com, sdfw_system_team@sberdevices.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 18:51, Oleg Lyovin via buildroot wrote:
> libcgroup depends on fts API which is missing in musl libc
> and provided by musl-fts package.
> 
> This patch makes libcgroup dependent on musl-fts for
> non-glibc configurations.
> 
> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>

  Applied to master, thanks. The subject line now should be "allow to build with 
musl and uClibc", so I changed that :-)

  Regards,
  Arnout

> 
> ---
> Changes v1 -> v2:
>    - remove glibc dependency: checked that libcgroup can be built in all
>      the configurations: glibc, musl, uClibc, but requires musl-fts
>      for the last two.
>      (suggested by Arnout)
>    - remove LDFLAGS modification: it seems that autoconf
>      automatically searches for a library that provides 'fts_open'.
>      (suggested by Yann)
>    - changed commit-msg (suggsted by Arnout)
>      and rebased onto 'master' branch
> 
> glibc, musl and uClibc builds are approved by 'test-pkg' script:
>        bootlin-armv5-uclibc [1/3]: OK
>        bootlin-armv7-glibc [2/3]: OK
>        bootlin-x86-64-musl [3/3]: OK
> 
> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
> ---
>   package/libcgroup/Config.in    | 7 +++----
>   package/libcgroup/libcgroup.mk | 4 ++++
>   2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
> index 03efa71e6b..546b5f3560 100644
> --- a/package/libcgroup/Config.in
> +++ b/package/libcgroup/Config.in
> @@ -1,8 +1,7 @@
>   config BR2_PACKAGE_LIBCGROUP
>   	bool "libcgroup"
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	# libcgroup uses <fts.h> which is not included by default in uClibc
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
>   	help
>   	  libcgroup is a library that abstracts the control
>   	  group file system in Linux.
> @@ -18,5 +17,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
>   
>   endif
>   
> -comment "libcgroup needs a glibc toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
> +comment "libcgroup needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> \ No newline at end of file
> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> index fb0b646c51..e3de48c561 100644
> --- a/package/libcgroup/libcgroup.mk
> +++ b/package/libcgroup/libcgroup.mk
> @@ -36,4 +36,8 @@ else
>   LIBCGROUP_CONF_OPTS += --disable-pam
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> +LIBCGROUP_DEPENDENCIES += musl-fts
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
