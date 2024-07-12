Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FB7C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9968184505;
	Fri, 12 Jul 2024 19:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOFaLFwtqdv3; Fri, 12 Jul 2024 19:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C01184507
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C01184507;
	Fri, 12 Jul 2024 19:56:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 991EC1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859224011D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ay6990wvlPod for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09AFB4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09AFB4000B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09AFB4000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:56:34 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42660b8dd27so15537395e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720814192; x=1721418992;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dNc70PyIDDwXiU6e9bVJEb5HTeySAL85iFN0e4b7DPM=;
 b=VegZjm/8xg+lv4KrDLYdqDw4No+MgJy3WPD3Q1FOscvXN2+oywu47yBzYv6SoR4AnM
 shGi9lo3I6qJmkhll/jaqjOqxcHAnuay8MvCEYIo7OnxnO3m1uUG7/6wMzPaDj8OHwZZ
 sxOmRmkbb8pYVcQgpftAs8ntlUD+58i9zjDNTITyZpVDilsYhYSFuqKXdY5bmFoNmetB
 twkApR3KzYObTukVbBpO98BT8GCA/MzP6iTTnHIBsMAvWNUpMsWpZIO5oYClyWIWwwHk
 mRHT3ndfiW4Y/YZ1QSoCJIg1xGQyXjdSEW0iBqMdnsotDVvBeHDZZFBQI8kdArgPiYxU
 IfDA==
X-Gm-Message-State: AOJu0YxfSN+K2LKBKhZz4b3hKMaNQ3xUNtS0nWNRhWOqnLqHhQBWOIID
 87ExUdzZzq61ss8icf5/WfphbdRrCV6Nsw1huloXTqY1FzpvUDMurp84/EapVFg=
X-Google-Smtp-Source: AGHT+IHsloG39kAW8MXmWmfkNUa8WGbWkLMl9MceDIOnsLo3YWuzp/caaWIRcvtVXFwCf47x49brkg==
X-Received: by 2002:a05:600c:41c4:b0:426:5ee5:3129 with SMTP id
 5b1f17b1804b1-426707ce948mr89074005e9.2.1720814192512; 
 Fri, 12 Jul 2024 12:56:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc244sm31953665e9.37.2024.07.12.12.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:56:32 -0700 (PDT)
Message-ID: <18e34573-ea10-458d-9632-ee74d9590bb4@mind.be>
Date: Fri, 12 Jul 2024 21:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-2-heiko.thiery@gmail.com>
 <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
 <CAEyMn7anNnq2aH9EViFjY+ihnmwCXaWXMs9sJAYFBpH=q_WT+Q@mail.gmail.com>
 <CAEyMn7Ze=uM6Tf4TRe4-jzai-T7DD8MvT4t_YLjyQzzOzbYfKQ@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAEyMn7Ze=uM6Tf4TRe4-jzai-T7DD8MvT4t_YLjyQzzOzbYfKQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720814192; x=1721418992; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dNc70PyIDDwXiU6e9bVJEb5HTeySAL85iFN0e4b7DPM=;
 b=WNwoiszZOa6UE8CUYtfYnHpjM8XtYiDmf5dYe4yjh9gYTEjaAF1PvxNcLlxzthM/vj
 eiHU/MYBzdvPdunM+ZkF5I6uGeGd02FJR0OIRMCIz8EuXhepf3XJ7qQMbzRMavUuHs1d
 a+2meCTZ//xRMr867/+HNxY5HugrpbSqc4GLgnFNy/5ml3GCrIz35z8oOvt/Cjg00q4V
 vNuS6K4X+FW2mS/X6H9jA2hMeszGqRpQZVVej63fSZC0g9AA59au1700c0XmVOaqH8YM
 9e7NFOAdKnOxyU+777P7R1L11GtukOI2sXwOrYJfMyU9wskndHV4Y+ScLUsBorr1Qewx
 l5Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WNwoiszZ
Subject: Re: [Buildroot] [PATCH v3 1/3] package/blake3: add new host package
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/07/2024 21:23, Heiko Thiery wrote:
> Hi Arnout,
> 
> Am Fr., 12. Juli 2024 um 21:08 Uhr schrieb Heiko Thiery
> <heiko.thiery@gmail.com>:
>>
>> Hi Arnout,
>>
>> Am Fr., 12. Juli 2024 um 10:38 Uhr schrieb Arnout Vandecappelle
>> <arnout@mind.be>:
>>>
>>>    Hi Heiko,
>>>
>>> On 04/07/2024 14:34, Heiko Thiery wrote:
>>>> This package is used and required for ccache update.
>>>>
>>>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>>>> ---
>>>>
>>>> v2:
>>>>       - on change
>>>>
>>>> v3:
>>>>       - fix BLAKE3_LICENSE_FILES and corresponding hash values
>>>>
>>>>
>>>>    DEVELOPERS                 |  1 +
>>>>    package/blake3/blake3.hash |  3 +++
>>>>    package/blake3/blake3.mk   | 20 ++++++++++++++++++++
>>>>    3 files changed, 24 insertions(+)
>>>>    create mode 100644 package/blake3/blake3.hash
>>>>    create mode 100644 package/blake3/blake3.mk
>>>>
>>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>>> index 90d1a111ab..46fe3cd2e1 100644
>>>> --- a/DEVELOPERS
>>>> +++ b/DEVELOPERS
>>>> @@ -1359,6 +1359,7 @@ F:      configs/kontron_bl_imx8mm_defconfig
>>>>    F:  configs/kontron_smarc_sal28_defconfig
>>>>    F:  configs/kontron_pitx_imx8m_defconfig
>>>>    F:  package/altera-stapl/
>>>> +F:   package/blake3/
>>>>    F:  package/ipmitool/
>>>>    F:  package/libnetconf2/
>>>>    F:  package/libyang/
>>>> diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
>>>> new file mode 100644
>>>> index 0000000000..2a00d19b02
>>>> --- /dev/null
>>>> +++ b/package/blake3/blake3.hash
>>>> @@ -0,0 +1,3 @@
>>>> +# sha256 computed locally
>>>> +sha256  822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37  blake3-1.5.1.tar.gz
>>>> +sha256  6a94bedb8b707ed97f6e310d0d015ab14e0683ffa0a612b02958581b9cc9fc0e  LICENSE
>>>> diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
>>>> new file mode 100644
>>>> index 0000000000..76e4e32e7a
>>>> --- /dev/null
>>>> +++ b/package/blake3/blake3.mk
>>>> @@ -0,0 +1,20 @@
>>>> +################################################################################
>>>> +#
>>>> +# blake3
>>>> +#
>>>> +################################################################################
>>>> +
>>>> +BLAKE3_VERSION = 1.5.1
>>>> +BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,refs/tags/$(BLAKE3_VERSION))
>>>
>>>    Why do you put the refs/tags here? It was necessary in one or two packages
>>> because of a conflict with a branch name, but I don't think that's the case
>>> here. I admit that there's a certain elegance to making it explicit that we want
>>> a tag, but then we really should be doing that everywhere...
>>
>> You are right. I changed it to:
>> BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
>>
>> I think this is what you expect.
>>
>>>
>>>> +BLAKE3_SUBDIR = c
>>>> +BLAKE3_LICENSE = Apache-2.0, CC0-1.0
>>>> +BLAKE3_LICENSE_FILES = LICENSE
>>>> +
>>>> +# We may be a ccache dependency, so we can't use ccache; reset the
>>>> +# options set by the cmake infra.
>>>> +HOST_BLAKE3_CONF_OPTS += \
>>>> +     -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
>>>
>>>    Why is this needed? And is it even a good idea? In pkg-cmake, this is defined
>>> as -DCMAKE_ASM_COMPILER="$$(HOSTAS)", and HOSTAS is simply "as" without any
>>> ccache. In fact, this changes it from "as" to "gcc" which I expect is not
>>> correct at all...
>>
>> When not defining that I got the errror:
>>
>> [ 25%] Building C object CMakeFiles/blake3.dir/blake3_portable.c.o
>> [ 37%] Building ASM object CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o
>> [ 50%] Building C object CMakeFiles/blake3.dir/blake3_dispatch.c.o
>> Assembler messages:
>> Fatal error: bad defsym; format is --defsym name=value
>> make[3]: *** [CMakeFiles/blake3.dir/build.make:117:
>> CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o] Error 1
>> make[3]: *** Waiting for unfinished jobs....
>> [ 62%] Building ASM object CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o
>> Assembler messages:
>> Fatal error: bad defsym; format is --defsym name=value
>> make[3]: *** [CMakeFiles/blake3.dir/build.make:130:
>> CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o] Error 1
>> make[3]: Leaving directory
>> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
>> make[2]: *** [CMakeFiles/Makefile2:83: CMakeFiles/blake3.dir/all] Error 2
>> make[2]: Leaving directory
>> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
>> make[1]: *** [Makefile:136: all] Error 2
>> make[1]: Leaving directory
>> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
>> make: *** [package/pkg-generic.mk:283:
>> /home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/.stamp_built]
>> Error 2
>>
>> So when changing to use gcc instead of as it works.
>>
>> I tried to build on my host and see that cmake sets the var
>> "CMAKE_ASM_COMPILER=/usr/bin/cc". When overwriting it with as it also
>> does not build.
> 
> But unsetting -UCMAKE_C_COMPILER_LAUNCHER and
> -UCMAKE_CXX_COMPILER_LAUNCHE is not required. So would remove these
> two lines.

  Huh? Those two are still needed because blake3 is a dependency of ccache so 
you can't build it with ccache as the launcher...

  Regards,
  Arnout

> 
>>
>> --
>> Heiko
>>
>>>
>>>    Since you said you could respin this weekend, I will mark as Changes
>>> Requested, but it's possible that your respin only has some commit message
>>> changes of course.
>>>
>>>    Regards,
>>>    Arnout
>>>
>>>> +     -UCMAKE_C_COMPILER_LAUNCHER \
>>>> +     -UCMAKE_CXX_COMPILER_LAUNCHER
>>>> +
>>>> +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
