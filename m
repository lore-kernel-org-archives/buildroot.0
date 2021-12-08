Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C0DC433FE
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 09:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0605C605AD;
	Wed,  8 Dec 2021 09:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBcwDdcSVMO3; Wed,  8 Dec 2021 09:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C1EF60657;
	Wed,  8 Dec 2021 09:09:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A30B1BF5A9
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 09:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76FA181B9A
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 09:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2AEtfLtkjSSf for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 09:09:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10DFE83EF6
 for <buildroot@busybox.net>; Wed,  8 Dec 2021 09:09:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id o20so6000662eds.10
 for <buildroot@busybox.net>; Wed, 08 Dec 2021 01:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dWO52dIaRWCQWzYXDuM1J3YeAoERQTXnk+AycXd/zmE=;
 b=OEE5HjnOJEwM8IyvkqcsZlBdz0C58t9afieuCxif/sBoB8NiXE0FQTPTcxHU1pWfpO
 nUqPmGnB76lpSaN21vfE7Uybgs55Tf+tvHGoZxRU1VBf1D7SY4rxP+xKxOlJAHsp6JBA
 SMhxhZpIpDhW85NFa4k+NLa2De3b9SFn9nbRWjxyU8ijqeT9Of0c1+faduqBNxGM+T8W
 9Hn0fZSHq0e8F6yntmmo/dRVAUbGKyu51mUCf3YKkr6/wJeKqoO2plBADo2nsg70xVwu
 fx8W0OJ38XnxmkVNUYHPla7et3J6psthhYCiwAWxGVHI3keApkJqTM2Up/rnoGVc2kbk
 JFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dWO52dIaRWCQWzYXDuM1J3YeAoERQTXnk+AycXd/zmE=;
 b=AWasv0+baCIJwOF/ZvUvsd+Qn4s9FWDrkU7pyLHyuhtLYeprxE5EnrSEI+cd31RGeX
 NBF4vGL728lNlUE0MpVLqyGh7EttPZF0+mtKWXR/q8FoDcfm3Tse3DdgrcJRpApDmKB7
 MEyPkNvWUSlrZtPmHKYKKjry1bd8jnrC8BrRBJsJOsR9qyFRfIaRLbtFMdcW1O5IzpKE
 JHkZT0EQXCUrJsE+J9aRacnEz6gPwU4NszqJOuZErHkHfWH12MPNIDvWMT+700orlWp4
 2VfQe7XUsK+KqyiOG74oSqQZfaqFzZs5aeowOho8APGrFpDscaap2mfGNco8Dh680Jii
 MF8w==
X-Gm-Message-State: AOAM533PAz0ekgfk1aXu/PHHloKGhf1YkB2rHocoA+EL2fwMEp6W9Neb
 y0sTMAh85w6j2u6G+50zT9zc/w==
X-Google-Smtp-Source: ABdhPJwzxSl/sGTzpq9/Tj+o2wh9P3tvqXObGBQcVeNShqegLK3pIdvlh/cF/guoc5DW1/tsAj6s1g==
X-Received: by 2002:a17:906:9b92:: with SMTP id
 dd18mr5852205ejc.425.1638954569650; 
 Wed, 08 Dec 2021 01:09:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ht7sm1196967ejc.27.2021.12.08.01.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 01:09:29 -0800 (PST)
Message-ID: <d97a2cf2-b042-88a8-87f6-5dc6aa5c434c@mind.be>
Date: Wed, 8 Dec 2021 10:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, guillaume.bressaix@gmail.com
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206214527.GD2603@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206214527.GD2603@scaer>
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



On 06/12/2021 22:45, Yann E. MORIN wrote:
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
> We do not hard-code a dependency to host-cmake, in case the system cmake
> is sufficient. Instead, we use $(BR2_CMAKE_HOST_DEPENDENCY) which is set
> appropriately.

  This turns out not to work in Guillaume's test setup.

  It turns out that he has a preinstalled cmake which is very old, but also 
cmake3 which is recent enough. Therefore, BR2_CMAKE is set to /usr/bin/cmake3 
and BR2_CMAKE_HOST_DEPENDENCY is empty. However, setup.py hardcodes "cmake".

  So, possible solutions:

- Forget about setup.py and instead hack it into a cmake-package. Not ideal from 
a maintenance perspective, because later updates may have changes to setup.py 
that we need to replicate.

- Patch setup.py so we can tell it to use BR2_CMAKE instead of cmake-in-path. 
This is nice because we can use the occasion to also pass in the rest of the 
cmake options for proper cross-compilation.

- In host-skeleton, symlink BR2_CMAKE to host/bin/cmake, so that will be the 
'cmake' that is found in $PATH. This has the advantage of also covering other 
potential cases of the same problem, but I feel it's a bit meh.

  So I have a slight preference for the second option, but Yann you may have 
other ideas.


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
