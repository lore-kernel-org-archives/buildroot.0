Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D63EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7913C60BD8;
	Sun, 25 Jun 2023 13:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7913C60BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qu6lkpcCTo2O; Sun, 25 Jun 2023 13:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9202360BFE;
	Sun, 25 Jun 2023 13:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9202360BFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 204661BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06B8240102
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06B8240102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-jfcZ71v8wk for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:21:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABABC400BA
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABABC400BA
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:21:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f9bece8e19so37800245e9.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687699283; x=1690291283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pfk+1JfHNEJXoFGmsnxK/JYxA23C1H0DufQMraksCg0=;
 b=VH0nISY7TZSRE8n9y9q8emakv4LU3zfouYQuFBKJ5yWUFxciTrNv7ejbZYUtFmGW0q
 RZsasY/jRYROup8RtKXVB74OJq0xFndq8ttaXzQOwyyBawF3jHRSCyb17xqJSlQQETXT
 ESx1n3UaJ44ECUqOFaNrIvHJOYREh/DSrYUfjPp6dViGhLAgMIh5/TB9CSviU2b8nPWX
 iN7rqqb7WLLny4f0VgyWZqFDHTqGkLJB/AGqNVq9xFvEQDU/h0V1tptJYFuL2+KKH+I9
 tnHVSQ6EEfeCBc5pgytE+adFU60kptyEPFbv5penekkR1K/OhbR3Xm1W71Zpg6qtIOQo
 8pOQ==
X-Gm-Message-State: AC+VfDyblujtPU7Tez4zs/S9JCEB1p4tKrNYUeTxtW7lTxmQ3J2PkvEB
 w7IZ/GYwa+gHJydEBhY9lnOnXQ==
X-Google-Smtp-Source: ACHHUZ6Mp+c2htXG8np9qUpZm06DVHrXEmHg+VuKiKZhK+tsc7xY9EeWp1HC6EeSEFyakTvlByS5jA==
X-Received: by 2002:adf:ee0c:0:b0:313:eef1:7e0f with SMTP id
 y12-20020adfee0c000000b00313eef17e0fmr1367857wrn.55.1687699283551; 
 Sun, 25 Jun 2023 06:21:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b00307c8d6b4a0sm4571347wrm.26.2023.06.25.06.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:21:22 -0700 (PDT)
Message-ID: <3c0e66a6-4ce2-f4d4-92b6-7b112190051e@mind.be>
Date: Sun, 25 Jun 2023 15:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andreas Dannenberg <dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-2-dannenberg@ti.com> <20230624212331.GE24952@scaer>
In-Reply-To: <20230624212331.GE24952@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687699283; x=1690291283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pfk+1JfHNEJXoFGmsnxK/JYxA23C1H0DufQMraksCg0=;
 b=E6TZ/T1it4oLwsiyPNwFSfvsEUwLkiuig71KGKU1rigLA8nqkyQxywQFdv0kcWJIHV
 /LBCTzubzM4kZJL5F3tAYWM+F7F9S1Llt6nzFdx4sQdq2/DFwqjP6UVqir28BjGwfOoy
 ooeSMbo7Nj6ymRG9TAD4VlidsP5sUDd9zsBcnToz9jV8FFIH4jX4JhG3OTTUjlvrKjGs
 +ExQ2qq/8v6IuMnuCF7UWKzA7qQGjk3qDj8v0EhcBAW7YXLSh0b08uaC0jkr6gW35bVP
 nHYrdATDCt3pBAtK49eceBhFKq+qFRA4RO1ymtF9Co8kfSih1eTGbOfu389ASQlKxu20
 tARw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E6TZ/T1i
Subject: Re: [Buildroot] [PATCH v9 01/11] boot/ti-k3-r5-loader: allow for
 full build source customization
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/06/2023 23:23, Yann E. MORIN wrote:
> Andreas, All,
> 
> On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
>> The TI K3 R5 loader package essentially is a wrapper to build a special
>> version of U-boot SPL used as part of a multi-stage boot flow on TI K3
>> devices, and as such needs full flexibility as to specifying the U-Boot
>> sources used for the build. To accomodate this, add the same options as
>> already available in the regular U-Boot package. For most use cases, the
>> same source settings (repo URL, versions, etc.) should be used for both
>> ti-k3-r5-loader and uboot packages.
> 
> Currently, there is no dependency ("depends on" or "select") between
> uboot and ti-k3-r5-loader; yet, your phrasing seems to imply that it
> does not make sense to build ti-k3-r5-loader without building uboot.

  That's not what I read in that paragraph. I think it means that the same 
source should be used as U-Boot. It's just a separate package because, AFAIU, it 
may use a different .config.

  If that is true, and I'm not missing anything else, then the situation 
actually looks quite similar to barebox-aux. With the difference that for Falcon 
boot you want to have only "u-boot-aux" and not the full u-boot. So, if what I'm 
saying is true, then perhaps it's better to approach it the same way as in barebox?

  At the very minimum, I think there should be a "same version as U-Boot" 
option, which is the default (if U-Boot is enabled). There's a bit the 
unfortunate aspect that this package becomes before U-Boot in the menu, but 
let's assume people typically start from a defconfig.

  Regards,
  Arnout

> 
> Then, in the comment below, you add a note about "Falcon boot (which
> would skip the uboot package completely)".
> 
> So, I'm a bit curious here: what should the user do when uboot is not
> enabled, if we instruct it to use the same version?
> 
>> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> ---
>>   boot/ti-k3-r5-loader/Config.in          | 65 +++++++++++++++++++++++--
>>   boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 32 +++++++++++-
>>   2 files changed, 93 insertions(+), 4 deletions(-)
>>
>> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
>> index 10602c8df3..2419babe70 100644
>> --- a/boot/ti-k3-r5-loader/Config.in
>> +++ b/boot/ti-k3-r5-loader/Config.in
>> @@ -1,14 +1,73 @@
>>   config BR2_TARGET_TI_K3_R5_LOADER
>> -	bool "ti-k3-r5-loader"
>> +	bool "TI K3 R5 Loader"
> 
> Our prompts always match the package name in Buildroot, i.e. the
> directory name. In this case, ti-k3-r5-loader is exactly that and we
> want to keep that.
> 
>>   	depends on BR2_aarch64
>>   	help
>> -	  Separate U-Boot build for R5 cores on TI's k3 boards.
>> +	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
>>   	  Usually used to build tiboot3.bin with k3-image-gen.
>>   
>>   if BR2_TARGET_TI_K3_R5_LOADER
>>   
>>   choice
>> -	prompt "Configuration"
>> +	prompt "U-Boot Version"
> 
> It is a bit confusing tho see "U-Boot version" in the "ti-k3-r5-loader"
> package. I know it is really just a uboot being compiled, but still this
> is confusing. I'd keep ti-k3-r5-loader in the prompts. I could be
> convinced for the middle ground "ti-k3-r5-loader U-Boot version" if you
> really want to have U-Boot there.
> 
> Since you want the defaults to be the same as uboot, you can do that:
> 
>      choice
>          bool "U-Boot version"
>          default BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION if BR2_TARGET_UBOOT_LATEST_VERSION
>          default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION if BR2_TARGET_UBOOT_CUSTOM_VERSION
>          default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL if BR2_TARGET_UBOOT_CUSTOM_TARBALL
>          default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT if BR2_TARGET_UBOOT_CUSTOM_GIT
>          default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG if BR2_TARGET_UBOOT_CUSTOM_HG
>          default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN if BR2_TARGET_UBOOT_CUSTOM_SVN
>          default BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION  # Fallback if uboot not enabled
> 
>      ...
>      endchoice
> 
>      config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE
>          string "U-Boot version"
>          default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
>          depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
> 
>      config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION
>          string "URL of custom U-Boot tarball"
>          default BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
>          depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
> 
> ... and so on, you get the gist.
> 
> [--SNIP--]
>> +	prompt "U-Boot Configuration"
> 
> Same comment as for the version prompt.
> 
> [--SNIP--]
>> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
>> index afa309aa98..341888623e 100644
>> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
>> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
>> @@ -2,11 +2,41 @@
>>   #
>>   # ti-k3-r5-loader
>>   #
>> +# The ti-k3-r5 loader package should really be built from the same U-Boot
>> +# sources as the uboot package itself, so for most users so all LOADER_SITE /
>> +# LOADER_SOURCE type definitions should be set the same for both packages.
>> +# However it still makes sense to keep the ti-k3-r5-loader package somewhat
>> +# separated and independent from the uboot package to allow for special use
>> +# cases such as Falcon boot (which would skip the uboot package completely).
> 
> Do you mean that uboot would not be built at all, or that the uboot
> binary would not be loaded at runtime?
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
