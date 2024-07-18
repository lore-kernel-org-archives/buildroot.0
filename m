Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C38C3DA60
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 07:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A62402D9;
	Thu, 18 Jul 2024 07:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpfrsdVDH9ji; Thu, 18 Jul 2024 07:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C9540321
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C9540321;
	Thu, 18 Jul 2024 07:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5A631BF388
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 07:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92F67402E6
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 07:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fn5u4wkGJhh for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 07:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A986640108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A986640108
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A986640108
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 07:12:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso3829495e9.2
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 00:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721286737; x=1721891537;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FLUNo7wgpWLCUP43Y2nYsLBUa4ZW5WvyYfKGBLRg9ns=;
 b=CZJb48mB8/ozdUSwg/1E03dmO01sb32qRWYAuKXxQxsxax1N8NM9rb+2eaMWpYg+7m
 LazDr10DJe94flqmFdzYeEs7nKogwVdeQ6LnZ1bjlq6razGOosYK/fJfw5FhsHJ68wyQ
 xVtjYuYsKd1HZRDxPCFDd/3a6/YHkQlSjZbrDBH/B45gSs5wBUABOF6hm0LvWZytAgQu
 mDJvlpSu6BQXFnhvaG6FuZ488YvwIu8jSg0V/C6FS/9gCyWs4a5N6e/GMWEMqxw9kIC7
 JHkLR4tRrLNFvQuZFTYbj7u7P/U7dCeXNAXvrivbxSOq2I4DtV1kaulsrAK50HeJvmLG
 0QAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU668trHpzfuvJ7Ky1hAAalj88a2Xkopq3pcxliNFQAhudDswj3tAT46dpoo4cJkWPBz609eanCksS26zii5XHBy0cfqoy9wA==
X-Gm-Message-State: AOJu0YytYQjhT1ljR3VHYlXM9On8GPkN557NpmArtJCWLvO+W7PBijS6
 EtZbG6Nap4h1xvgmE3POs94Yytj8TlOBZ+E/QeCaTqEfbCSPEUij3iSfS4eGhsE=
X-Google-Smtp-Source: AGHT+IHRp3UAeOpTK/yOSfXYtQKM9f5iZQiAtrFR5KZIGLJ1ZuWSurpon6370eIa9KQACdh1gBJd8Q==
X-Received: by 2002:a05:600c:138b:b0:426:5c9b:dedf with SMTP id
 5b1f17b1804b1-427c2cb6112mr27924105e9.12.1721286737257; 
 Thu, 18 Jul 2024 00:12:17 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c77e52c7sm23985975e9.24.2024.07.18.00.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 00:12:16 -0700 (PDT)
Message-ID: <2cde1b62-8da4-45a6-a039-7c69d779c9b5@mind.be>
Date: Thu, 18 Jul 2024 09:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20240711092728.3083087-1-kory.maincent@bootlin.com>
 <fc07c4f5-ef09-4018-b927-df092311889c@mind.be>
 <14297ba1cacf4a65ac06e155e2162a2e@foss.st.com>
Content-Language: en-GB
In-Reply-To: <14297ba1cacf4a65ac06e155e2162a2e@foss.st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721286737; x=1721891537; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FLUNo7wgpWLCUP43Y2nYsLBUa4ZW5WvyYfKGBLRg9ns=;
 b=D4E21MxeErrQ14l/GZYUNdyZgajmHbJaozZ8jJB6NL4Qo50i9BsSH7nV18+kJoklOE
 KODNccBbxFtf1t/KSSj4KPtkgRsh/TjvaRUbfuuTY6eFZm1A6NNMxGPkNq8RUIBmPkwf
 iCI1D/PweAjiQiDnYWNnLJBfxiva+dh//dVwi3CevGqhuVNAe0kKc+BUo0liKnhy20kE
 3aDTDcgP4cN5LR4PrUCTs3f5p87iMcI7KM0wqIVe//qnMG29mvE7rJ/yOR0z77f+yApV
 bhRn9H/YsCmYXuext6dO/b4l3mwUrN7qXuU6ssuBcMx3Dwl/vcmuxdMntnQPRnVWdV/X
 yPzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=D4E21Mxe
Subject: Re: [Buildroot] [PATCH] boot/optee-os: Add support to build with
 host-cmake
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/07/2024 09:04, Etienne CARRIERE - foss wrote:
> Hello Arnout,
> 
> On Monday, July 15, 2024, Arnout Vandecappelle wrote:
>>
>>    Etienne, since Kory is on holidays, perhaps you can answer the question below?
>>
>> On 11/07/2024 11:27, Kory Maincent via buildroot wrote:
>>> Some specific versions of OP-TEE need cmake on the host to build the scmi
>>> firmware, like the newly release STMicroelectronics 3.19.0-stm32mp-r2
>>> version.
>>>
>>> To allow building such OP-TEE OS versions, this commit adds the option
>>> BR2_TARGET_OPTEE_OS_NEEDS_CMAKE which when enabled ensures that host-cmake
>>> is built before OP-TEE OS.
>>>
>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>>> ---
>>>    boot/optee-os/Config.in   | 6 ++++++
>>>    boot/optee-os/optee-os.mk | 4 ++++
>>>    2 files changed, 10 insertions(+)
>>>
>>> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
>>> index 34ea993136..7870629732 100644
>>> --- a/boot/optee-os/Config.in
>>> +++ b/boot/optee-os/Config.in
>>> @@ -91,6 +91,12 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
>>>          python-cryptography. Select this option if optee-os needs
>>>          python-cryptography to be built.
>>>
>>> +config BR2_TARGET_OPTEE_OS_NEEDS_CMAKE
>>> +     bool "OP-TEE OS needs cmake"
>>> +     help
>>> +       Select this option if your OP-TEE OS platform configuration
>>> +       requires the cmake build system to be available.
>>> +
>>>    config BR2_TARGET_OPTEE_OS_CORE
>>>        bool "Build core"
>>>        default y
>>> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
>>> index 33b4e2e1ab..8fa5c824da 100644
>>> --- a/boot/optee-os/optee-os.mk
>>> +++ b/boot/optee-os/optee-os.mk
>>> @@ -30,6 +30,10 @@ endif
>>>
>>>    OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
>>>
>>> +ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_CMAKE),y)
>>> +OPTEE_OS_DEPENDENCIES += host-cmake
>>
>>    This should be $(BR2_CMAKE_HOST_DEPENDENCY). I fixed that.
> 
> Thanks.
> 
>>
>>    You should also check what the minimum CMake version is, and if it's higher
>> than 3.18, select the corresponding BR2_HOST_CMAKE_AT_LEAST_X_Y. Etienne?
>>
> 
> OP-TEE OS needs at least CMake 3.18.3 to build the SCP-firmware part.
> https://gitlab.arm.com/firmware/SCP-firmware/-/blame/v2.14.0/CMakeLists.txt#L10
> 
> Since BR seems to start from BR2_HOST_CMAKE_AT_LEAST_3_19, I guess this one already applies.

  Yes, 3.18 is the minimum for Buildroot as a whole. One of the options that we 
set in pkg-cmake was added in that version.

  The docker container used in testing has CMake 3.18, so normally we detect 
this automatically in the autobuilders. But in this case, it's never tested in 
the autobuilders...

> Maybe this will really need to be fixed when a more recent CMake is required.

  Exactly. I just wanted to double-check if no more recent version is required. 
Usually a project declares its minimal version in the CMakeLists.txt itself so 
it's quite easy to be sure.

  Whoever updates optee-os should also remember to check that, but probably 
won't. Oh well...

  Regards,
  Arnout

> 
> BR,
> Etienne
> 
> 
>>
>>    Applied to master, thanks.
>>
>>    Regards,
>>    Arnout
>>
>>
>>> +endif
>>> +
>>>    ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
>>>    OPTEE_OS_DEPENDENCIES += host-python-cryptography
>>>    else
>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
