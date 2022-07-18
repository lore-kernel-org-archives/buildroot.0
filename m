Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42D5C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 23:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3244840B51;
	Mon, 18 Jul 2022 23:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3244840B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EkFyJ_k7e3J; Mon, 18 Jul 2022 23:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2050B4058D;
	Mon, 18 Jul 2022 23:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2050B4058D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98CCF1BF37A
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 23:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B5CA83E6F
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 23:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B5CA83E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDNaZYx2_wzN for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 23:05:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8752A83E63
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8752A83E63
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 23:05:09 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id bh13so11951278pgb.4
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 16:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7GjjVniihTejbSH7pFTYgVhlKtgl+KwngR/Bj8Dae08=;
 b=fo8Fam/wV0145Unw7zzVye1/pUe1UlMGl6Nvmvs0rIdTvOY4tguKm8x8sGRYf3sZ4p
 5mMDYZESmazO+txxtsRDRQfvUsuC8RE0+k0xWMUhtTjY4BrWFq3UUuoQsG2gXQF/JVnY
 umAJWuI0u+Y0WvcKyt55eQ5ipinxpJ4VQHXIgRmdO/1iiWhTtzl6//gUtqXsZQsQ/tAa
 niy/V2o/8Hsftj9BVu5M440AmJOvkj3XLs/0Ubl9+7SlyZ1l6aHDdAf1GO+fHVtxP/lf
 tPg3PL3oDYC6TFZQ/o6pivYrzqe0kYPbhfYnLYp1hVAt3AWPre8AWFWZ5FTZEmcIQ+qR
 IFwA==
X-Gm-Message-State: AJIora8HE79WhZ6lho6RZ5fkKvJD/FVbLaOmXGG/IzYqmrDldoIZnMli
 Fwpg8l11OmGv0rJuMmkfjN8=
X-Google-Smtp-Source: AGRyM1u5boAZW200KY964GJuUeV2C45BmOI3otrSwlrPlE1dlbPnsLQ3DY68YFAhwgmglBxtTnDFGA==
X-Received: by 2002:a05:6a00:23d4:b0:52a:e5c1:caa7 with SMTP id
 g20-20020a056a0023d400b0052ae5c1caa7mr30449177pfc.62.1658185508785; 
 Mon, 18 Jul 2022 16:05:08 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 d9-20020aa797a9000000b0052add461d2esm9766716pfq.103.2022.07.18.16.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 16:05:08 -0700 (PDT)
Message-ID: <0da32d38-4d49-3c07-b35b-ac7641516b43@gmail.com>
Date: Mon, 18 Jul 2022 16:05:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220706210621.284257-1-f.fainelli@gmail.com>
 <20220718150145.4867a519@windsurf> <20220718202103.GD2249625@scaer>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220718202103.GD2249625@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7GjjVniihTejbSH7pFTYgVhlKtgl+KwngR/Bj8Dae08=;
 b=Ddus6EqWxb2OJtgBQQeA5IItASouXCZPCydwPLLXnw7Qr2fUCimhcZcxPIRiBBMSTS
 +OJ5TuvV/LJRCwhcmQ4fA6ok7UsU7mBH29Gj66aQyo3rYyR0l0HNi+yiff9K33CtLjDD
 zupaafe3HTpc4QmiP8AncGjxnHALt2/9cNc644XTk/afyRPaKHjaV2dBS0XlCa5kyOYt
 xWQheG3Y+C8RJ3FaIaEUuqMkl1WjV0/buUw9oWgcmZbMd2ojDigpd9tvv3QQf82o347Z
 0Y/P4TmPLsuue3dfw30clqMM4hUvMr44637AUci71EClCq3PtWGy0BGMF6wyOWlQfgBm
 UIpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ddus6EqW
Subject: Re: [Buildroot] [RFC] linux: Make CONFIG_LOCALVERSION_AUTO work
 with OVERRIDE_SRCDIR
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
Cc: mmayer@broadcom.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/18/22 13:21, Yann E. MORIN wrote:
> Florian, Thomas, All,
> 
> On 2022-07-18 15:01 +0200, Thomas Petazzoni via buildroot spake thusly:
>> On Wed,  6 Jul 2022 14:06:21 -0700
>> Florian Fainelli <f.fainelli@gmail.com> wrote:
>>> Linux is able to generate an automic version based upon the git tree
>>> that is being used which is very useful for making sure that the kernel
>>> being used is truly the one that we intend to be using.
>>>
>>> When using LINUX_OVERRIDE_SRCDIR however, since we do not rsync the .git
>>> folder, all of the necessary information for scripts/setlocalversion to
>>> compute the exact version and git commit id is lost.
>>>
>>> Add a post rsync hook that copies it over in order to allow 'git
>>> rev-parse' to work and produce an usable version.
>>>
>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>
>> Thanks for your patch. What bothers me is that it is a Linux-specific
>> solution for a problem that isn't Linux-specific. Many other packages
>> also use Git commands to generate a version string that they embed in
>> their binaries. So this problem really is global and I'm not sure we
>> want a Linux-specific fixup for it.
> 
> Indeed.
> 
>> To me the long term solution is to enable out of tree build of
>> packages. This way, instead of rsync'ing the code, we would directly
>> build it from its original location. Some initial work was done in this
>> area, but it's obviously a much larger endeavor than the fixup you are
>> proposing. A more immediate alternative would be to also rsync the .git
>> folder instead of excluding it, but do that globally for all packages
>> that use override-srcdir. The .git directory was explicitly excluded to
>> reduce the amount of data to rsync.
> 
> And in any case, it is still possible to hack this for now:
> 
>   - set LINUX_OVERRIDE_SRC_DIR in your local.mk
>   - define the post-rsync hook there as well
> 
> Note: it is usualy possible to add the hook in local.mk, but it is
> fragile: if the package itself uses post-rsync hooks, but its first
> assignment is not an append-assignment +=, then your hook in local.mk is
> ignored. In practice, we have no package [*] that uses post-rsync hooks,
> so it shoiuld be safe to do define one in local.mk.

I suppose that works for now.

What I am really after anyway are out of tree build support for Linux, which ought to be taking care of two birds with the same stone here. Thanks!

> 
> [*] of course, there is one exception: uboot, and I wonder if we should
> not have a better solution nowadays.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
