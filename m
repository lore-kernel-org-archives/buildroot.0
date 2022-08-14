Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BA1C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 21:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F4CC60BC6;
	Sun, 14 Aug 2022 21:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4CC60BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58CIWpy4z6nL; Sun, 14 Aug 2022 21:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4788660B67;
	Sun, 14 Aug 2022 21:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4788660B67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66EEF1BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F436409F3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F436409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BABspDhd5_ov for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 21:55:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE27A409EC
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE27A409EC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 21:55:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t5so7523574edc.11
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 14:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=VlndL7rgSx5c7aG3IiWE2X1sAJJW/l4QjK/iU2PYoxU=;
 b=sdwU53jJkQszCsyGYCE9rcnPMC9iWABZgBxzT7db31omk15Nx+YhQHE3ucQTn6vmez
 gGlgXaeJ0c5f8fD062W1acDFuWmLsbq3ByU/81GvDOvp1F8IlcyTIqOHxg4Te593fImN
 2NEuVl6tZyoiue/ewEattyAJY9yKCGHiEQ/UAqnhCK0kyn0DH4BIRGUe6xSe8I7A3pZZ
 FF/loffoz1pl6FWXJnh0BqG8vhhAQ1oEgg4bCLQPhUBHAbtaq2TdwyXQZKSA16m1zRTK
 2I5hWr51l/7fdj7CRMkWuF784hWZH062+GQLMl1qCWmJhKly4UJD4eTi5iWJ2jwECws1
 0z7A==
X-Gm-Message-State: ACgBeo3BdKWii5LI+hEy8R6ST1FT8tGBoZkPcMMZnOQEDnUXjACX1RTv
 AFYvE8mawCgvbtFF9NXAkY6/Bw==
X-Google-Smtp-Source: AA6agR4qA2i4HLqvzVB7Ti3vMdx/BqzPZMR238mmFiB5A8fXs7TY+b5r3hXu0m7OYi6Tmtaed+TpPw==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr12303845eda.134.1660514139936; 
 Sun, 14 Aug 2022 14:55:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ec8-20020a0564020d4800b0043e67f9028esm5356262edb.20.2022.08.14.14.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 14:55:39 -0700 (PDT)
Message-ID: <7d0fcbf1-144e-b6d3-7b38-6caa3348703d@mind.be>
Date: Sun, 14 Aug 2022 23:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>
References: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
 <b71a7617-3e26-14ef-6fe6-45e766924270@arm.com> <YvV2kelJpRw6erhZ@hefring>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <YvV2kelJpRw6erhZ@hefring>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=VlndL7rgSx5c7aG3IiWE2X1sAJJW/l4QjK/iU2PYoxU=;
 b=BCEaJZsag8RCniAI1aJKDZRl5Uo29S/xJZ692e+HhEndPWmcj1cnbGA3Usg7tNQ5/o
 ggGpgKixXaTYZh0Cumh9cq05QhbtzD7ZuPtT065YeWPRywqsW893nvXogdKTFOxPP0Ce
 FEuRSKokTKYv2XdG0RDPQOmi7YvIgGFLA5vOHqeBS4IZFtMRRcY4ILKPN6aSZ+kSfqZc
 kcvXDLoDz0hh/J4m09LUyzhy0GFaoO7g7Em1vJx12sn3QyMI45xePQnynuGLtO1YgIJ2
 szL2AYMdQlA093qThsXjmI4V8xbqTOQU3G9fFtHADMA0Gw3pAT04ziienqhHq4Ah4Zu5
 WCJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BCEaJZsa
Subject: Re: [Buildroot] [PATCH 0/2] Add support for FDPIC binaries on ARM
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/08/2022 23:37, Ben Wolsieffer wrote:
> On Tue, Aug 09, 2022 at 12:26:14PM +0100, Vladimir Murzin wrote:
>>
>> You might also want to allow uClibc to use NPTL thread library instead
>> of old(-sh) LinuxThreads with something like
>>
>> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
>> index ba8b5885ec..30a154531a 100644
>> --- a/package/uclibc/Config.in
>> +++ b/package/uclibc/Config.in
>> @@ -76,7 +76,7 @@ choice
>>   
>>   config BR2_PTHREADS_NATIVE
>>          bool "Native POSIX Threading (NPTL)"
>> -       depends on BR2_USE_MMU
>> +       depends on BR2_USE_MMU || BR2_BINFMT_FDPIC
>>          select BR2_TOOLCHAIN_HAS_THREADS
>>          select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>   
> 
> You mean I could have just used NPTL and not wasted hours fighting
> LinuxThreads...
> 
> I'm not sure how I missed this before, since I immediately found the
> relevant patches when I searched for them now.
> 
> I've been playing around with NPTL and FDPIC and it doesn't quite work
> perfectly out of the box. Static libraries (linked into a dynamic
> executable) crash when attempting to use TLS. In addition, the reason
> static libraries are even being used is because libtool doesn't recognize
> the target name and therefore thinks it can't build shared libaries.
> 
> There was a patch [1] submitted a few years ago to add the target to
> libtool, but it looks like it was ignored. Unfortunately, we can't just
> apply it in Buildroot, unless we want to run autoreconf on every
> package. I'm working around this locally with a hacky hook to patch
> configure scripts, but I'm not sure it is appropriate to upstream.

  This problem exists for a number of architectures. For that reason, we have a 
workaround: the LIBTOOL_PATCH_HOOK [1]. For any autotools package, we search for 
ltmain.sh files in the source, parse out the libtool version from it, and apply 
the appropriate patch from support/libtool/

  In other words, the solution is to extend the patches in support/libtool/ with 
the missing architecture.


  Regards,
  Arnout

[1] 
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-autotools.mk#L60


> 
> Although the situation is not ideal, things basically work with
> LinuxThreads and the libtool issue, so I'd prefer to get this patch set
> finished without expanding the scope.
> 
> Thanks, Ben
> 
> [1] https://lists.gnu.org/archive/html/libtool-patches/2018-05/msg00000.html
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
