Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA137C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 08:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F1E40992;
	Tue,  7 Dec 2021 08:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpRIKz7QYz9X; Tue,  7 Dec 2021 08:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA7541C12;
	Tue,  7 Dec 2021 08:04:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3D21BF352
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 08:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 783928302F
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 08:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1xztJe7tZev for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 08:04:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13ECE82B3E
 for <buildroot@busybox.net>; Tue,  7 Dec 2021 08:04:28 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g14so52990669edb.8
 for <buildroot@busybox.net>; Tue, 07 Dec 2021 00:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ALVMMSi/zBeqEvcbTdhvRO4cW++dP57mPir+AeV5hqw=;
 b=gHSmKE7rklm061DISE5YD4qDDWYc2EoqmBG+4vcILWZaelRHXm0x3KcMhaQ2mpI6UX
 HV2nFjAnlFOFdr3Nkq7pqBjDXn+CrEE+O0/UxwUbmkqWA0/dV0qvWjA2bI0WYwPE4Vxo
 uaweibYOO494/t/6cR9yfD2zL54ddSxQpdvLGBFRtylywjnkPaqJkHqcrXOwjY+/mwiy
 T7CTFb0oy2C5Cfn3oBqjq838dQ/WgOWwoxbT/+U+PeUzdPS8KmCtKs0PTtlfNRsxLssG
 i+l/Z9LHByXALvc+jLHphawEuXapUe4VOI5tYjYpjYNQ/OKt9uQXvjNOjTQtaf4rr8o2
 8unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ALVMMSi/zBeqEvcbTdhvRO4cW++dP57mPir+AeV5hqw=;
 b=59zW03Ycq6UYBitFb6ENR7YMpD0PjPrp1LXpr7Ukb5B8pcstojtPDKwxzie4ZgeglN
 bTNOQkOvu2jtjyO4zfuTMnUzxj7R7HttJc9qhi/u8v8gJK2WRSeK5P28GWN102h4WpoO
 e3Lgxo3VUmgGuPi7/+4euod2QoiVkoU8bX2Z1hJGDmYDdeDY+iO9tXBVb1+0WPCzr96t
 GD9pGkr8j3AX+eaJYPS6NG/jsM39R0Uv27EAafxIUU/wzM70d96Sin7UKGWVmmVXmNqk
 ku/6cvZyh2v7tkZa+LlCQtq8Hv0+yL9TGkIPEcTNCK4XrdXBXz482gvsDEP4psyFDXot
 rZBQ==
X-Gm-Message-State: AOAM530q4QfDZguE7raODLrB8LdlYbnezqQod5qUYF2RU9bWPNrPfB/J
 9yRV/mSzrEYZDZgbxuegCqd0Sg==
X-Google-Smtp-Source: ABdhPJwWKlNe1OcVMUtkljyl/id5Qjq8SBe/J/S4se7kCaG2I6j/0YE5OJHuHUufo+J8HAOLMbFprQ==
X-Received: by 2002:a17:906:2b16:: with SMTP id
 a22mr49745415ejg.447.1638864266348; 
 Tue, 07 Dec 2021 00:04:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e12sm8107997ejs.86.2021.12.07.00.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:04:26 -0800 (PST)
Message-ID: <7d360d46-e4e5-bbf4-80a9-d5e1ff6a3ea1@mind.be>
Date: Tue, 7 Dec 2021 09:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, guillaume.bressaix@gmail.com
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206215730.GE2603@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206215730.GE2603@scaer>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade
 to version 2.6.1
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/12/2021 22:57, Yann E. MORIN wrote:
> Guillaume, All,
> 
> On 2021-12-06 20:31 +0100, guillaume.bressaix@gmail.com spake thusly:
>> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
>>
>> The python 'setup.py' script needs header files
>> in $(@D)/pybind11 to work since v2.6.1, and these
>> files are generated by an internal minimalist cmake build.
>>
>> Fixes
>>     http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
>>     http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
>>     http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
>>     http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
>>     http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
>>     http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
>>     http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69
>>
>> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>>
>> ---
>> This remains a python-package.
>>
>> 'python setup.py' actually hardcodes a system call to cmake now,
>> which seems dirty at first. But if we have a cmake env when they
>> do that, the install variables are passed and installation
>> is smooth. They probably introduced this call to make setup.py
>> self sufficient, as most people install this package from 'pip'.
>>
>> ---
>>   package/python-pybind/python-pybind.mk | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
>> index a6a1bdb976..bfd7f6f59a 100644
>> --- a/package/python-pybind/python-pybind.mk
>> +++ b/package/python-pybind/python-pybind.mk
>> @@ -9,5 +9,12 @@ PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
>>   PYTHON_PYBIND_LICENSE = BSD-3-Clause
>>   PYTHON_PYBIND_LICENSE_FILES = LICENSE
>>   PYTHON_PYBIND_SETUP_TYPE = setuptools
>> +PYTHON_PYBIND_INSTALL_STAGING = YES
>> +
>> +# every single 'python setup.py' call actually calls cmake
>> +# internally, to populate $(@D)/pybind11 with build requirements.
>> +# If we have a host-cmake env at that moment,
>> +# then the final installation paths are properly defined
>> +PYTHON_PYBIND_DEPENDENCIES = host-cmake
> 
> I am sorry, but I fail to see how this actually fixes things.
> 
> As I explained in my previous review, headers are supposed to be in
> $(STAGING_DIR)/usr/include/pybind11/. That's at least where they are in
> Debian-based distributions;
> 
>      $ apt-file search 'pybind11/pybind11.h'
>      pybind11-dev: /usr/include/pybind11/pybind11.h
> 
> However, with the way pybind is currently packaged, the ehaders end up
> in:
> 
>      $ sort output/build/python-pybind-2.8.1/.files-list.txt
>      python-pybind,./usr/bin/pybind11-config
>      [...]
>      python-pybind,./usr/lib/python3.9/site-packages/pybind11/include/pybind11/pybind11.h
>      [...]
> 
> So, those headers will most probably not be found by the compiler.
> 
> Also, since pybind is supposed to be a headers'-only library, there is
> nothing supposed to go in target, so it should be;
> 
>      PYTHON_PYBIND_INSTALL_TARGET = NO

  Note that this is only relevant to make sure that pybind11-config doesn't 
appear on target. The headers themselves are removed automatically by Buildroot.

> 
> Furthermore, /usr/bin/pybind11-config is a python script which hardcodes
> its shabang to #!/usr/bin/python, and this is incorrect:
> 
>    1. /usr/bin/python might be python2 or python3, we can't know
>    2. anyway, it would not use our host python, so it would miss the
>      proper modules search paths.

  Yeah, this is something that needs to be fixed - in particular, there may not 
be a /usr/bin/python at all.

  However, I think that is kind of orthogonal to this patch. This patch fixes a 
build failure of pybind itself. Your proposed change would be to fix the build 
of a dependency of pybind.


> So, if another package want to call that /usr/bin/pybind11-config to
> find pybind, they're gonna have incorrect results, if at all...
> 
> So I think we really, really need a package (like scipy) that actually
> makes use of pybind, so we can see how it works, and to fix it...

  Note that there are already two [1][2] submissions of scipy in patchwork, so 
feel free to review those.

  Note also that scipy depends on host-pybind, not pybind itself. I'm not sure 
how *that* is supposed to work - although, being header-only, it probably 
doesn't really matter if you link with the host or the target version of the 
library, and the host-installed pybind11-config makes sure that you pick up the 
host headers (which are normally not in include path). So conceptually wrong but 
works in practice.


  In conclusion: I think this patch is going in the right direction (modulo 
BR2_CMAKE_HOST_DEPENDENCY). It's still "conceptually wrong but works" because it 
doesn't set the toolchain file and other cmake options, but that happens to work 
because it's header-only so it doesn't actually need any of the cmake options. 
So it's not entirely the correct thing to do, but it does guarantee to fix 
things. I'm not sure if that means we should merge it or not...

  The proper fix, I think, would require patching setup.py so we can pass in 
additional cmake options to it.


  Regards,
  Arnout

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=168992
[2] https://patchwork.ozlabs.org/project/buildroot/list/?series=186146

> 
> Regards,
> Yann E. MORIN.
> 
>>   $(eval $(python-package))
>> -- 
>> 2.20.1
>>
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
