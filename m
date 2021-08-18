Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D80CC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A4B610A3
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A4B610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9454E80C13;
	Wed, 18 Aug 2021 11:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKafQoJjNr16; Wed, 18 Aug 2021 11:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A7680CF0;
	Wed, 18 Aug 2021 11:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7E11BF3CD
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A2F760674
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMAtPrDmNQQ9 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 11:35:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EAA96066D
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 11:35:20 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cn28so2639460edb.6
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tPPVBt6hMqm35jGfyL46uO+UjttnL8+M2HWYSS29JsY=;
 b=JYkdgidriHbaLbkG+M/LUgrTB5ylakTXltWd6zLf6T4SOkAztKlsNsCCJ00hpHarCb
 36iAKrw+soCcmYT1P2IlZYCtALkuO2FJx9e270Or5o4COSP4g8St/MdKGRRO0kKVfOVM
 myowCT8ndlVDX+uJsHtIg7s3EphJc/WWSbJ5k/ApVlYbVgP7P/AWRRUwfO3OKcI+lSjv
 NLvOYM63B4lo81x794yCqTG6Ih93v5j4K8Y2l5YEN7+vllPKydcmWBymmHhGvtDkGTOs
 q+KGj4T3RetH+cSHLaABdenAn1cvQ99vzsHgd2QUPn40tOVUMe3ALNRy8HBt4lk9kR2U
 Etjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tPPVBt6hMqm35jGfyL46uO+UjttnL8+M2HWYSS29JsY=;
 b=QtbT1mAkytyWlFEKhsdC4NB+jMt7S3YVWS3xDxqjMpiC5TOCqyHNWXxvKAPZdIQQJK
 fSGKxfD+4vmFz9lLDXAy5Pek05L393pA9pkyZLkOCptTy+cWij/rhJdO9fKbDVMEJnaZ
 fW1JKyfKyKxOSsPIfYekQtBUSBslDmdXhWeo1hJvnqLEAM+oCSPvtsb0InOhU1bpJWz1
 sy7ayThixh07Dx6RPkmuKrZk6t8Ql4uyaHX2QOAh7Q9kmfcY+H0h7JcCtw1KsQ5xhS6M
 BxUU1r2QzcnOuhhco1LTPbps5z5osEZHwWOCzrWNSzuLGElIA/O7mu92/BCk8fkGWfHF
 tNEQ==
X-Gm-Message-State: AOAM530Z8iWgm0MiNEohJZ83kopKXoUOTY59y6npxdNvud/hxivMXaJ2
 ykxd5+SDezdlCzPc8UFKnyGffg==
X-Google-Smtp-Source: ABdhPJzd/Y7MEqgnvTMB4gxH8t7GXET/cVjSA7hwFyrJkCaUWQiwWhgEmu5i+G2CmUfkdfrB95rKow==
X-Received: by 2002:a05:6402:34c7:: with SMTP id
 w7mr10082158edc.175.1629286519120; 
 Wed, 18 Aug 2021 04:35:19 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ee29sm2533330edb.63.2021.08.18.04.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 04:35:18 -0700 (PDT)
To: Ludovic.Desroches@microchip.com, buildroot@buildroot.org
References: <20210816120418.427-1-ludovic.desroches@microchip.com>
 <20210816120418.427-3-ludovic.desroches@microchip.com>
 <aeca7e19-f3f0-c66b-8033-f6bb1da29ab2@mind.be>
 <b19518d7-4b48-e3fc-6d4c-f84238f1186d@microchip.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <82221d44-3dbc-8cc8-1b81-70c4011f0e92@mind.be>
Date: Wed, 18 Aug 2021 13:35:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b19518d7-4b48-e3fc-6d4c-f84238f1186d@microchip.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/3] configs/acmesystems_*: bump
 at91bootstrap3 version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, Eugen.Hristev@microchip.com,
 biagio.hkr@gmail.com, bonet@grenoble.cnrs.fr, Nicolas.Ferre@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 18/08/2021 13:20, Ludovic.Desroches@microchip.com wrote:
>>
>> On 16/08/2021 14:04, Ludovic Desroches via buildroot wrote:
>>> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
>>> ---
>>>   configs/acmesystems_acqua_a5_256mb_defconfig    | 2 +-
>>>   configs/acmesystems_acqua_a5_512mb_defconfig    | 2 +-
>>>   configs/acmesystems_aria_g25_128mb_defconfig    | 2 +-
>>>   configs/acmesystems_aria_g25_256mb_defconfig    | 2 +-
>>>   configs/acmesystems_arietta_g25_128mb_defconfig | 2 +-
>>>   configs/acmesystems_arietta_g25_256mb_defconfig | 2 +-
>>>   6 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
>>> index 00b99c0ad8..f8129f3780 100644
>>> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
>>> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
>>> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>
>>   The point of having a fixed version is so that we are sure that it's only
>> updated after actually testin on a board. If you make such a wholesale change, I
>> assume you haven't actually tested it on all those boards... So you could just
>> as well have set BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X...
> 
> Right I didn't test it on old boards. I discussed with Eugen, the 
> maintainer of at91bootstrap, the need to release a 3.8.x and a 3.9.x or 
> not. 3.9 and 3.10 are about support for new boards so there is no 
> compatibility problem. Nevertheless, it's true that unless it it has 
> been tested we are not 100% sure...
> 
> If we set BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X, the risk is 
> higher as it becomes a continuous risk versus a one-shot risk.

 That's right.

> I have no strong opinion, so if there is a preference to set 
> BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X, I'll update the patches.

 That's not what I meant - what I meant is that mass changes like this are just
as bad as simply setting a non-fixed version. But as you say: it's a one-shot
case due to the build-time fix that is needed, so in that sense it's better than
setting it to latest version.

 Regards,
 Arnout


> 
> Regards,
> Ludovic
> 
> 
> 
>>
>>   That said, we really have to do this because all the defconfigs are broken at
>> the moment, so applied the series to master, thanks.
>>
>>   Regards,
>>   Arnout
>>
>>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
>>>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>>   BR2_PACKAGE_HOST_GENIMAGE=y
>>> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
>>> index f4af2501b8..e399d4a9ff 100644
>>> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
>>> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
>>> @@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="5232adb1c42636e1e9cf495a6abd1a8d66475f83"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
>>>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>>   BR2_PACKAGE_HOST_GENIMAGE=y
>>> diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
>>> index cf62b5b72e..8bc8c4dcef 100644
>>> --- a/configs/acmesystems_aria_g25_128mb_defconfig
>>> +++ b/configs/acmesystems_aria_g25_128mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
>>>
>>>   # Tools to build sdcard.img
>>> diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
>>> index 496ccd6853..d161b118ae 100644
>>> --- a/configs/acmesystems_aria_g25_256mb_defconfig
>>> +++ b/configs/acmesystems_aria_g25_256mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
>>>
>>>   # Tools to build sdcard.img
>>> diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
>>> index 17ef7e757c..62bcbd44cb 100644
>>> --- a/configs/acmesystems_arietta_g25_128mb_defconfig
>>> +++ b/configs/acmesystems_arietta_g25_128mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
>>>
>>>   # Tools to build sdcard.img
>>> diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
>>> index aa0236bbb3..94258444a2 100644
>>> --- a/configs/acmesystems_arietta_g25_256mb_defconfig
>>> +++ b/configs/acmesystems_arietta_g25_256mb_defconfig
>>> @@ -29,7 +29,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>>>   BR2_TARGET_AT91BOOTSTRAP3=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
>>>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
>>> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
>>> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
>>>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
>>>
>>>   # Tools to build sdcard.img
>>>
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
