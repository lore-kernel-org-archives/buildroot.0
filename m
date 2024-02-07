Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C01C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52603812A3;
	Wed,  7 Feb 2024 15:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCI-BxrTa2mf; Wed,  7 Feb 2024 15:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E7C81286
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E7C81286;
	Wed,  7 Feb 2024 15:15:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 632001BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42113401BC
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id woDMhX6-U05g for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87AA040176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87AA040176
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87AA040176
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:15:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33b4db36eb1so555731f8f.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 07:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707318951; x=1707923751;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lxkbb8Htu6VgBnfeYy75cxxp6rrz6DbdmoF7jKUdhKM=;
 b=R7/pNsAUd/twQ6PvaxcvsH0P/kbtppLbW2XrvExpb4+DuEBgGEVLwmUHaafwUWpbx+
 /TLAdBW7wr0YLS0Y7/TD3mp8IYXIKQzo4iYiyKgIF7P4+x1SvSC+lVgtpo305dCurDW0
 NU5mEa839OtHJZMupiRWRLD335Qpgxt1OZLfD2i6tqb8m4NfU6LaUjmHxwM74VnPo9kv
 PAMDtV00+KjDFZEyIOFQiGCaWeUrl/uXmHUUXqQqq2BILgkMNxjhFExsofae5k4mKmRf
 k9Uk6BpbdhL54H6b7XasgiXz7fEgZiOob8cdFiGHSAtanry+k1z43x0uUK0O/kGyiIV0
 881Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbMFmRhEwKvfRsyL+uqf9pHC9OK82kgg90Vv66hZffBZOo6mmr1dtV7M80soN3Cfh6AQf0H3H7Tpj9Y+JBjnP3eo4PRjwiRQ==
X-Gm-Message-State: AOJu0YzuaGsE/WxU1PeAjOiTY8jaC+9FHmxS8ZLI5XNtwfCX/vjtireW
 MGP6kFsnTWsH+rHbZ3cH6sdWYSVDpwTRrRX1DuOgTal7gB+ol/Siv4JRDDtELoE=
X-Google-Smtp-Source: AGHT+IFZEp0M/THnyf5tHmBtO/3j4VVSQLOY1vdSnQiJKMfBbm+q1as3ZajrzJCN5w6DMSWI0MdqCw==
X-Received: by 2002:adf:f984:0:b0:337:c729:454c with SMTP id
 f4-20020adff984000000b00337c729454cmr3231401wrr.18.1707318950880; 
 Wed, 07 Feb 2024 07:15:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXD5uuf/KogO8vYnCGeXNui1xSMgxL+SwUxUEjz4XJCLZiTc8i63tcc3qLgQEhMCz5mQEhDJ5YpiciGUk+SqptfGan7+5TUH0KEwi9Rf43F22ZEhaGJXoEZUUw8jwAaOswvVbNchm6rt6wBROPpV60jvF/kA0MhETDUtM7GpznMrCRjd7vb5J8q1g==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d5549000000b0033b41af645asm1715910wrw.108.2024.02.07.07.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 07:15:50 -0800 (PST)
Message-ID: <93c369b0-12f2-466b-bf6c-af8802bf706f@mind.be>
Date: Wed, 7 Feb 2024 16:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-4-antoine.coutant@smile.fr>
 <ZcOc-u_S09WCYWE1@landeda>
In-Reply-To: <ZcOc-u_S09WCYWE1@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707318951; x=1707923751; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lxkbb8Htu6VgBnfeYy75cxxp6rrz6DbdmoF7jKUdhKM=;
 b=Hg0seT/ZXD5ssdL372zh2/i+pNTBjBwJfyfXoQL/iDo1b4GUba6dJtVIAuRIpIR4Bp
 ZW4KpgAY3Ukb7Bv+PNS/ct+9DjBAI+1RODis4OugCYvRODSfxgGo35FnU/we/x6ZWrq/
 42B/GOd0Fq44/RWAdSpUaMzWwPqcL4EHtxyW50JduZmZH596KKXMy07tSLD+LUSL+vPy
 DrYbmIIpAGPwUtv4opUGagsji9vBwqncBWt5T4BxCHYPfYhMRsdQW1tr+SBysd0uIvvu
 R69//8wU3tXEWOkCHqnbhwvwCuf9FlWNjuDxcB27rE7G8SZlbHzm/o5GF05J+afmCWVI
 EN7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Hg0seT/Z
Subject: Re: [Buildroot] [PATCH v4 3/7] package/spirv-llvm-translator: add
 target variant to provide LLVMSPIRVLib
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2024 16:08, Yann E. MORIN wrote:
> Antoine, All,
> 
> On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
>> From: Romain Naour <romain.naour@smile.fr>
>>
>> This target version is needed for Rusticl which is an LLVM based OpenCL
>> framework[1]. Rusticl allow programs to compile OpenCL C/C++ code
>> at runtime with Clang. Clang generates LLVM IR which is translated into
>> SPIR-V by spirv-llvm-translator. Finally, mesa can use its internal
>> tools to manage SPIR-V.
>>
>> [1]: https://docs.mesa3d.org/rusticl.html
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
>> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> ---
> [--SNIP--]
>> diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
>> index 523890a986..8361a74c59 100644
>> --- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
>> +++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
>> @@ -10,7 +10,7 @@ SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c
>>   SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
>>   SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
>>   SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
>> -HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers
>> +HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers spirv-headers zlib
> 
> It looks dubious that a host package, host-spirv-llvm-translator,
> depends on target packages, spirv-headers and zlib.

  Purely based on the names of the packages, it sounds similar to hos 
host-gcc-final depends on target glibc, or host-rust depends on target toolchain.

  "host" often means "cross", so it _can_ indeed depend on target packages.


> If this is really the case, then this would require a good explanation
> in the commit log.
> 

  That is absolutely true!

  Regards,
  Arnout

>>   HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
>>   	-DLLVM_BUILD_TOOLS=ON \
>>   	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
>> @@ -19,4 +19,14 @@ HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
>>   	-DLLVM_EXTERNAL_PROJECTS="SPIRV-Headers" \
>>   	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(HOST_DIR)/include
>>   
>> +SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES
>> +SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm llvm
>> +SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
>> +	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_DIR}/usr \
> 
>      $ ./utils/docker-run make check-package
>      package/spirv-llvm-translator/spirv-llvm-translator.mk:25: use $() to delimit variables, not ${}
> 
> Regards,
> Yann E. MORIN.
> 
>> +	-DLLVM_BUILD_TOOLS=ON \
>> +	-DLLVM_DIR=$(STAGING_DIR)/lib/cmake/llvm \
>> +	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
>> +	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
>> +
>> +$(eval $(cmake-package))
>>   $(eval $(host-cmake-package))
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
