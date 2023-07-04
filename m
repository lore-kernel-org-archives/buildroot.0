Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DA8EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C8140875;
	Tue,  4 Jul 2023 20:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C8140875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kULQJoroA0I6; Tue,  4 Jul 2023 20:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F20B40884;
	Tue,  4 Jul 2023 20:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F20B40884
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 486131BF42E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 219A140490
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 219A140490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPVOc8Ll01sK for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B714014E
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79B714014E
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:28:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51dec0b6fecso5709407a12.1
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 13:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688502537; x=1691094537;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tVpmh/JMSJBXGr9Egbf9xCTdq69F+TCxTVwlJKgdRcw=;
 b=KpRml0wQbyGslmizvw2JswWih2DBktuQdahUYejAzIHGEvHNKTm11OwRYE4Z8kOLjq
 9ir/z5zN6FMSqmHQ0DFqQNSH944TyQo1csPnFg4jf/QYCCNhLAOkocyHNLvugABj5lo0
 +u1+64rWKqtvPUpY4I1G5KLLNLYTosYQxFjOtKx7K9uLMOhvsIGufYqxkifiL8CF6u+Z
 PqDJXl5GtN7fnV7imcbXkXemIuAXyDOBOV7JEASVVL06CVya8rHVE/l03SXf+h4a5rjI
 wW8DYOF5ct3pWgWo3IQsD4xijYKLCjB7yih1I4k6IAUSMRRlZRILLnHLXgsymD1cQr0c
 3SzA==
X-Gm-Message-State: ABy/qLZRP+YVKh47ycVe16OmBkbfFAQlitBqPleozta939dk8uDTfbTo
 49Lgp6b1zulue9rfldCPXZ11IQ==
X-Google-Smtp-Source: APBJJlFRgEv0vf2H/vy0gD7oCt+fZyDA4F8+9UHzq7F2ayQP3w0Xu2Rza1ImvlHxhLNP0UDprPwxsw==
X-Received: by 2002:a05:6402:514:b0:514:9ab4:3524 with SMTP id
 m20-20020a056402051400b005149ab43524mr10307828edv.7.1688502537005; 
 Tue, 04 Jul 2023 13:28:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a50ed8a000000b0051e0eba608bsm3413192edr.19.2023.07.04.13.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 13:28:56 -0700 (PDT)
Message-ID: <38008674-4a63-4223-84d1-c55aa52f023b@mind.be>
Date: Tue, 4 Jul 2023 22:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230703182930.B08CA863E5@busybox.osuosl.org>
 <20230703205631.4dd121b0@windsurf>
In-Reply-To: <20230703205631.4dd121b0@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688502537; x=1691094537;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tVpmh/JMSJBXGr9Egbf9xCTdq69F+TCxTVwlJKgdRcw=;
 b=gq4qWsDmfEm7DViLCfOdQSkDlnNwhvJQDeRuApt7biEw2I2zrL+amQh9mB6MEjTAtC
 BeOf7mgQCDVYMpXNU05aypSURQghq4j0V+ocDexFm3iE2L4tTTMOcUa0ssqRT6TfUUDT
 myYjIPPhqdAnpPPjt9fUxe7MrfI4brx2R2LqkiT6eMKAGWLH23ni2ExVmlx4tqPggku2
 hG5QZ8bpX9D/LgEAHVkSIdHLLL1UKfVywztUQIqc/1jEUjIIgHLzTOGIrDckqQjAQimG
 lI+/ugswtJNFkda2h6OQOUGKmEcOJBmAAeT9PYypSxEzGYNmYdkbIUrBJUv4vRbwEPED
 t93g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gq4qWsDm
Subject: Re: [Buildroot] [git commit] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/07/2023 20:56, Thomas Petazzoni wrote:
> On Mon, 3 Jul 2023 20:20:31 +0200
> Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> 
>> commit: https://git.buildroot.net/buildroot/commit/?id=3b2913552ee4e304d4d86e577b237652a8f0a99f
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> While migrating to pep517 build backend the host-python-wheel
>> dependency has been added to host-python-setuptools but
>> not to python-setuptools. Note that host-python-wheel is not really
>> needed during the build of (target) setuptools, but the setup.py script
>> checks if the dependency is present in the host directory.
>>
>> To make everything consistent, add host-python-wheel as a build
>> dependency, and BR2_PACKAGE_PYTHON_WHEEL as a runtime dependency.
> 
> Hu, this was not in the patch from Romain I believe.
> 
>> +	select BR2_PACKAGE_PYTHON_WHEEL # runtime
> 
> This is not correct, there is no such symbol in Buildroot, and it
> causes a check-symbol error:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4586144848
> 
> What was the motivation behind this additional select?

  Because setuptools has a runtime dependency on wheel. The pep517 
infrastructure does a build-time check of this runtime dependency, but due to 
the way we run python, the build-time check looks at what is installed for the 
host, not what is installed for the target. Therefore, we have a dependency on 
host-python-wheel instead of target python-wheel.

  Since setuptools clearly defines that it has a dependency on wheel, I thought 
it logical that we would reflect that dependency in Buildroot as well. It is 
really a runtime dependency, not a build-time dependency, so I added this select 
like we do for runtime dependencies.

  Of course, I didn't notice that we don't have a target python-wheel package, 
so it doesn't actually work.

  So, dropping this select I'm pretty sure is going to break something, at some 
point. I've looked a bit closer now, and it turns out that wheel is actually 
only imported in one specific function, in the "editable_wheel" command. So it's 
quite unlikely anyone will ever see this breakage.

  However, now I look a bit more in detail at it, it looks like this commit is 
in fact bogus, and Yann's original comment that the wheel dependency should be 
added to the infrastructure is in fact correct. From the documentation:

    Historically this documentation has unnecessarily listed ``wheel``
    in the ``requires`` list, and many projects still do that. This is
    not recommended. The backend automatically adds ``wheel`` dependency
    when it is required, and listing it explicitly causes it to be
    unnecessarily required for source distribution builds.

And it's pretty clear what is adding this dependency: the pep517 infra calls the 
build with

    python -m build -n -w

The "-w" stands for "build a wheel" and I guess it's obvious that that implies a 
dependency on host-python-wheel? And I guess that the relatively few pep517 
packages we have already have a setuptools-based package (and therefore 
host-python-setuptools and host-python-wheel) somewhere in their dependency chain.

  So, I do think this dependency should move the the pkg-python infra _for 
pep517 packages_, as Yann originally commented.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
