Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECA4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:39:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5691F6113E
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5691F6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF1DE600CA;
	Sat, 11 Sep 2021 19:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfsK_WZRvkhl; Sat, 11 Sep 2021 19:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D096059D;
	Sat, 11 Sep 2021 19:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 009631BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E310940294
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKkUT3Ppbjwe for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:39:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4FA240264
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:39:47 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id x11so11607089ejv.0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QpRyCG9ksEj9pvoEJDItR7V3cypW5SB5UAeQ5beIYwU=;
 b=FBe6ARvf9T/ZYrGbFbYFhxtDTW4kbg53IVq2x1wXxbVPXeA2wpp6LiQ6/4MS/7iAm7
 nLizmod/2f464MER3qWBeExtssA247q98JqAhX+w5ncev1242++GvyTUMIVEAzmQmWzQ
 49ZQI3Apk1CQomrLRA+fBT1la17TGKRbOHgB9bQLEvBVaAeT0tBN0Nm4UppdQ3+DP1VZ
 qYc92dcNCAT8ynpfiWyACljIXXXlQkwQrlVssw7/xpxSyuwSQyEp/OnVWHlGyw/gmlDa
 5+0Pvy+LywSrfUG1Se/Pda2SE+jVJce3kgOvcoOHM0B8YGTx3GSX7xqPh1NDBXUWx4Z2
 vR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QpRyCG9ksEj9pvoEJDItR7V3cypW5SB5UAeQ5beIYwU=;
 b=3BObkYjou96GLiFcIaed8uqq4Z3AbubrP9TnlQHMfpEjIUS1GT4ReGaTKCQMH2wSKR
 NBFzwvLTfC+g1cZ59m9DtscmWh//Opo4FDVsh/DNP45sbKUkQ+2MVxiyvhDyIsVKXuYO
 mi7uks2jRTFR2VnV90DoGKsQrx12FRxaV2JL/AVJE//fd8StqaJbLT2f/u2WNXleH9Mg
 hNPp8KIhsvjSkcNrygsTnkPISveFn6pRQaeG23SZPhfweE7YhKJarAMNNkQCodVtpVRf
 GMSQ49YTE7M0k8x4l43DazJGBAhA/o3vaefhVutd6Bx7/dYX12IQain8h+HpbcRheCJV
 jZjA==
X-Gm-Message-State: AOAM5323sWWlN47x3xg04jyZqOWL0ul5IO+XKPAxS0gAI2tKRSCoz4k/
 LSR839+kqxjE7BJsxOsBZm+7+Ovu5arZww==
X-Google-Smtp-Source: ABdhPJy8mzEAoPEhobrbUVAmwA2j6PPpKWdL/sx6j2lujjpQvRNNsBQFQcV1jfy6Z0ukQtVcRaAtrw==
X-Received: by 2002:a17:906:f24f:: with SMTP id
 gy15mr2200319ejb.226.1631389185887; 
 Sat, 11 Sep 2021 12:39:45 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r16sm1341811edt.15.2021.09.11.12.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 12:39:45 -0700 (PDT)
To: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-7-aduskett@gmail.com>
 <20210904003709.7254b102@windsurf>
 <CAFSsvmq-GsfYVVpy=1FmXhb5NNwS3OT1dFY+ekPxRfo2K=Yx3Q@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <506c0aca-265d-7edb-d06b-d28eaf78621a@mind.be>
Date: Sat, 11 Sep 2021 21:39:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFSsvmq-GsfYVVpy=1FmXhb5NNwS3OT1dFY+ekPxRfo2K=Yx3Q@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/master 6/7] package/qemu: add
 BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 19:42, Adam Duskett wrote:
> Hey Thomas;
> 
> As briefly discussed on IRC, this is mostly due to x86 discrepancies,
> however, as I do not have access to * every * CPU
> that buildroot + GOI supports, it's better to commit these changes
> now, and if others find issues with their CPU/GOI
> builds, they can submit a patch far easier thanks to this patch series!

 I still think Thomas is right: we should have a mapping for each architecture
option to the Qemu emulation option that corresponds to it.

 In an ideal world, we would have BR2_ARCH_QEMU_CPU that is set in
arch/Config.in.* for all (sub)architectures.

 However, I doubt that anyone is going to take the time to do that (and test it,
without even knowing how to test it because *most* code will run just fine when
the wrong -cpu option is used).

 So, the pragmatic approach is to use this patch.

 Therefore, applied to master, thanks.

 Regards,
 Arnout

> 
> Adam
> 
> On Fri, Sep 3, 2021 at 3:37 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello Adam,
>>
>> On Fri,  3 Sep 2021 09:20:26 -0700
>> Adam Duskett <aduskett@gmail.com> wrote:
>>
>>> For specific architectures, running qemu in user mode without any additional
>>> options may fail if the host processor does not have the necessary instructions
>>> to properly run qemu in user mode, which results in the following error:
>>> "qemu: uncaught target signal 4 (Illegal instruction) - core dumped"
>>>
>>> CoreI7 is one such architecture that has had consistent auto-build failures.
>>>
>>> Add a new string in qemu/Config.in.host: BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS.
>>> The default for the Corei7 architecture is directly from the OpenEmbedded
>>> project found in meta/conf/machine/include/x86/tune-corei7.inc:
>>> "-cpu Nehalem,check=false." Other architectures may be added to this string at
>>> a later date if other failures occure.
>>>
>>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>>
>> So on the principle, I'm obviously OK as this is something I have
>> suggested. However, what bothers me here is that we are handling only
>> the Core i7 case, because it caused some issue in the autobuilder.
>>
>> What is qemu doing when no -cpu is provided? Does it emulate the host
>> CPU in this case? If so, then it is going to be wrong in a lot of other
>> cases than Core i7, no?
>>
>> Or put differently, shouldn't we essentially have a value for
>> BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS for pretty much all CPU
>> architectures that we want to support for this use-case ?
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
