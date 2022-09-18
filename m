Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55766C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B63841AA;
	Sun, 18 Sep 2022 10:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B63841AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41PX79reRo-O; Sun, 18 Sep 2022 10:42:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391CC83F33;
	Sun, 18 Sep 2022 10:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 391CC83F33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75F2E1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5116360E3A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5116360E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xyee6mLCO9LZ for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:42:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F83C60E36
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F83C60E36
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:42:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bq9so42834573wrb.4
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3rK9dN5u3s8VJ9ZOyG2IElSQQH0+CxZSyz+mPKd3Yys=;
 b=o1vc+Fqw/4Ldnbr6PmHr5pWsIlpyADhLXRZ5Blv67hMTTVfzWQ/4shbPpl89lYrHgo
 6Hge1JSu0ew4e6ebvOCL4kRFO8xe0Meg0fRN5K+alCSXs/P827Vh0YLeNiimhbRh4vW4
 27v86xC7v/0hlqVl7NxAkHnb2W9/DwV2WuIt8SNmOizSL/FFyv6eTjGrXK6cPzNaeUJK
 VdQnrXmOqhtM0ij9m+PaBkVimtHIld3/Az6K8yDyQCsyAaW/nfBWocLtBaPaEhAA5E7o
 IKQvwIkIV1UwBiZ8b5veTPbtnD3+ZVJyBIHR9qmjcBj6La/Ug+frPqDyDoh+ppx6V0fv
 m92A==
X-Gm-Message-State: ACrzQf05dNfS7grGcuZ6QrXp7IaNqrSRZDmh4+wgfuIluKg5Yq01WmTV
 byukJXb6EbWIny7VRuE52lRRfg==
X-Google-Smtp-Source: AMsMyM6NoCB0vjb09A+09o5Ty7wvBFoUVmqcfSr6HHAidj8FhIP42lJNB+dMufp8vAb0uSELmV2PHw==
X-Received: by 2002:a5d:4a41:0:b0:228:48c6:7386 with SMTP id
 v1-20020a5d4a41000000b0022848c67386mr7777795wrs.649.1663497749681; 
 Sun, 18 Sep 2022 03:42:29 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 ci10-20020a5d5d8a000000b0021e6c52c921sm12617854wrb.54.2022.09.18.03.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 03:42:29 -0700 (PDT)
Message-ID: <9a3a69ff-f633-d0b1-fa14-3e051bea3c75@mind.be>
Date: Sun, 18 Sep 2022 12:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-5-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220729000904.1295295-5-joel@jms.id.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3rK9dN5u3s8VJ9ZOyG2IElSQQH0+CxZSyz+mPKd3Yys=;
 b=EzaMQTzrA2uAXxPj5XN4Jwjyt+2dH530c6PvfL8ZcePpC4ZENX+Y+cz1JIMB9hVBCp
 5F24jL/KAM+0dkZXf1M6suJnb8USoWT433LvkTa49xsU4P3nvDJB1/h8T223xPrvjL/a
 pL2MHRXgglMM4cX8xjXydzZ7uTubZU27KtPakbj0r5gD6rkB98Q5zdn855u4YC2kriSy
 EWB1MG/+gvEK5Xiy1cPETqepGq3zUTTWn2g1rMIUi/2qEMG0zWzYvSJ6jKskHH9I1PiS
 kFpZb+R4OEmlEiiFMdvHWW2tb27QVoG3woOlLm0A67TVnf4s2Hp8Hw+p3jpyiSzDLtTQ
 t1vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EzaMQTzr
Subject: Re: [Buildroot] [PATCH 4/9] package/glibc: Use powerpc64le instead
 of power8
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 02:08, Joel Stanley wrote:
> With "arch/powerpc: Enable powerpc64le only on CPUs that support it"
> we can use this symbol to indicate the CPU is supported by glibc.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

  Applied to master, after extending commit log as indicated by Yann, thanks.

  Regards,
  Arnout

> ---
>   package/glibc/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 23cbfcd9aa4f..e0ce46968278 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
>   	default y if BR2_or1k
>   	default y if BR2_powerpc
>   	default y if BR2_powerpc64
> -	default y if BR2_powerpc_power8
> +	default y if BR2_powerpc64le
>   	default y if BR2_riscv
>   	default y if BR2_s390x
>   	default y if BR2_sh
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
