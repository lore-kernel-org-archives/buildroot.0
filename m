Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F7EB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 09:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165AC82100;
	Fri,  7 Jul 2023 09:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165AC82100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aWL6ZI050nV; Fri,  7 Jul 2023 09:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391E782051;
	Fri,  7 Jul 2023 09:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 391E782051
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 200A51BF84C
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 09:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDBAC82051
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 09:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDBAC82051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTUbVP2a2Em2 for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 09:44:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E953182049
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E953182049
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 09:44:25 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so2298034a12.1
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 02:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688723064; x=1691315064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rppdjyhkMMxHxw3aLvluZoSFH3QIfM3zJjXEaApV++A=;
 b=NJMLecSx4BzP12rPrUY/aqyDMxGO6k7cnaYPKT1KzcBLZk+zLOI+7CYRE4/cNwuo5s
 9lj3Eb+13PJUEvPNmEC0mXdgEpgW9uxzvvSZ6NFxQbQZM6gPKsonnZkVkf0K9Egw+RNr
 9dW2PK2UIeZCNLFcZJ97XCXOFvQ+NjJYRtQC9fi21n20d8mGCRq9G4th89+gDjRph4C+
 m7KoWVPHEMhvjs9g5JU6y/XNLVL5leYr9XYH76QtQcjU5k0RTTPQcsdt93dW6JwzpQ+8
 9RIIAvftOBxzxIEt5bzUdV45S+BVvlDvKWEeXPjpRikP4WOuxfmZI3YO/PpaSpDA5qYJ
 uD0g==
X-Gm-Message-State: ABy/qLbJAfzF01lvWr85KpBJezXNAzQLtuIIz6cuX3njFVqVfuHy8PZw
 1Pb5fogmn1f1BAe3TIv7jEC2oQ==
X-Google-Smtp-Source: APBJJlGorS+HQwqSJM/0u4kixxFnE4HBLt95NSoQxkwVW2kIrQhBpcou7ktWVJq0ig8ZMLHGYNTV0g==
X-Received: by 2002:a17:906:dc:b0:98e:4c96:6e16 with SMTP id
 28-20020a17090600dc00b0098e4c966e16mr3706460eji.5.1688723063977; 
 Fri, 07 Jul 2023 02:44:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 gt4-20020a170906f20400b009935aba3a9dsm1928565ejb.48.2023.07.07.02.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 02:44:23 -0700 (PDT)
Message-ID: <1d33ec42-4e85-70ed-b93a-18eeeb6ff0db@mind.be>
Date: Fri, 7 Jul 2023 11:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
References: <20230626070536.311268-1-gwenj@trabucayre.com>
 <20230626070536.311268-2-gwenj@trabucayre.com>
 <503759ef-8263-e971-cfdb-5d2d2c395c27@mind.be> <20230707105851.0a3f3244@x230>
In-Reply-To: <20230707105851.0a3f3244@x230>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688723064; x=1691315064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rppdjyhkMMxHxw3aLvluZoSFH3QIfM3zJjXEaApV++A=;
 b=RP6k5dtHtQl5SQiB2Ykjx0cJNCl4BS2Nv2Ty4yMQOEfbPRhK8OBOzUsUpIoHwd8U/P
 VYaMB3EUS2N6sHet0IDfTjf6hrzQ6tilG2eXSMulAoGBxTMKpCizz7PP5748WJAh1A5y
 V6Ex/VL3JjUskc6XpPVAk+Or30U0OjZLExF/0dUWJgvNXXbe+rgPd5S4i/Fu67A7zINN
 N6lLdaG6eH0Re+IvnSlXgi6gbA/tXc/oLmivgEg8smUnF8AWzGTzSTfJoLwHDPGVQnU5
 LfNlJCeV6zNnNtuGzKnPqPusDvd0i5fR2E4Ho5UQLCrmaLAilLQh6xNG/q/moMMH0Njg
 yc7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RP6k5dtH
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnuradio: fix gnuradio
 python libraries for cross-compile
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/07/2023 10:58, Gwenhael Goavec-Merou wrote:
> Arnout, all
> 
> On Tue, 4 Jul 2023 22:51:57 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 26/06/2023 09:05, Gwenhael Goavec-Merou wrote:
>>> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>>>
>>> By default, module libraries have a suffix based on cpython version + host
>>> architecture: this is fine for a native compile when these libraries are
>>> used on
>>
>>    I think that this is solved in the python infrastructure by setting
>>
>> _PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)"
>>
>> Or it may be some other environment variable that is set. For sure though,
>> the same problem would exist in normal python packages, and it is resolved
>> there. So ideally we should use the same solution for gnuradio.
>>
> In fact I see I have missed to explain in my message this issue is related to
> pybind.
> If PYTHON_MODULE_EXTENSION is unset, .cmake uses a python script containing
> sysconfig.get_config_var('EXT_SUFFIX')
> This one return .cpython-311-x86_64-linux-gnu.so, because host-python is used.

  Ah, in that case the environment variable you need is 
_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)"
This will make sure the sysconfig that gets used is the one for the target 
instead of for the host.

  It's quite likely that you need all of PKG_PYTHON_ENV to be present in the 
environment.

  Regards,
  Arnout

>>    Regards,
>>    Arnout
>>
> Regards,
> Gwenhael
> 
>>> the same computer (or similar computers). But when target architecture is
>>> not the same python is unable to find libraries due to the wrong suffix and
>>> produces unclear errors messages:
>>>
>>> # python3
>>> Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
>>> Type "help", "copyright", "credits" or "license" for more information.
>>>>>> from gnuradio import blocks
>>> Traceback (most recent call last):
>>>     File
>>> "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py",
>>> line 18, in <module> ModuleNotFoundError: No module named
>>> 'gnuradio.blocks.blocks_python'
>>>
>>> During handling of the above exception, another exception occurred:
>>>
>>> Traceback (most recent call last):
>>>     File "<stdin>", line 1, in <module>
>>>     File
>>> "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py",
>>> line 22, in <module> ModuleNotFoundError: No module named
>>> 'gnuradio.blocks.blocks_python'
>>>>>>   
>>>
>>> By adding -DPYTHON_MODULE_EXTENSION=".so" at configure time, pybind11 will
>>> use this option instead of using host-python to forge suffix.
>>>
>>> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>>> ---
>>> Changes v1 -> v2:
>>> - replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
>>>     but less "noisy")
>>> ---
>>>    package/gnuradio/gnuradio.mk | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
>>> index 1453b78493..d7b3b86c31 100644
>>> --- a/package/gnuradio/gnuradio.mk
>>> +++ b/package/gnuradio/gnuradio.mk
>>> @@ -119,6 +119,8 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
>>>    # mandatory to avoid pybind11 to overwrite variables provided
>>>    # by gnuradio and buildroot
>>>    GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
>>> +# force libraries suffix (avoid to have libxxx.PYTHONVER-HOST_ARCH.so)
>>> +GNURADIO_CONF_OPTS += -DPYTHON_MODULE_EXTENSION=".so"
>>>    # mandatory to install python modules in site-packages and to use
>>>    # correct path for python libraries
>>>    GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
