Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AFFC71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 19:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EAEE408F2;
	Mon, 28 Aug 2023 19:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EAEE408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTpW838bFX1q; Mon, 28 Aug 2023 19:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20CC6408F4;
	Mon, 28 Aug 2023 19:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CC6408F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0137A1BF276
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 19:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB6A281E3E
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 19:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB6A281E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRsAYHXixYwA for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 19:38:16 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F8B881E36
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 19:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8B881E36
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99bc9e3cbf1so751765466b.0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 12:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693251494; x=1693856294;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n/7iTS3C9E8tE0KQgKmqp1aEto9lVz98TG2ipomv8II=;
 b=Pcf+CrAG44rM3aElYw/UZSUTneimEUlrtNJrT3xW8hUIBWzKT4qhJl6NvhtONo91rm
 WL3lGr5MoTsbgEzttYttFGdMWmADgg2Zyr8Pi4h8xXkeuMnw/Zixgd9ur3h2hZ2MQKkp
 OU4n3F0oubg1vYv+c7KzUFQBEd+rZI/oDAGnwL2bgx1FxhgpC/FXggKoKOFKFn53NSnX
 QHrhP4io27vsaKhpJ9oOkRyG5WGNuJcPvNHH8ijUpQCVxhdIWaKoPVyWfFhSY0uMVV5L
 AQ3Q7rs2PahBoqCdQMm4sZU1j2d6vnqCvXEhkkBPz25Y783rCjr/pPqW8OSWKy1jpr1s
 1bew==
X-Gm-Message-State: AOJu0YzLJZABLkqvSQ4lC/YGaT98EZAQ6OFeKqWNn+QkG6P7niU3raz5
 iQNz0oi4NJYeA13TYGthOccxdA==
X-Google-Smtp-Source: AGHT+IHtfItDs37Qm43Qe95OoaEJbmJ5lnSgVA+FlV1iOhxtOCWwT5RWE1vR+W4zWfx0L9D43C+/nA==
X-Received: by 2002:a17:907:8a26:b0:9a1:f9c5:f612 with SMTP id
 sc38-20020a1709078a2600b009a1f9c5f612mr571412ejc.5.1693251493825; 
 Mon, 28 Aug 2023 12:38:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a170906081900b00992ea405a79sm5011204ejd.166.2023.08.28.12.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 12:38:13 -0700 (PDT)
Message-ID: <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be>
Date: Mon, 28 Aug 2023 21:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>,
 Robert Smigielski <ptdropper@gmail.com>
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk> <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk>
In-Reply-To: <87r0nn5i61.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693251494; x=1693856294; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n/7iTS3C9E8tE0KQgKmqp1aEto9lVz98TG2ipomv8II=;
 b=AIloUg6pjn0r458Qe/eyBPtOmSCm1QeImuWVIhcd9vwbHCiCkkr49hxI5m4de1kbqW
 pmOylPAbpYdwXYhTlLKwycoKEInszD9t0b2T6mVTxuqCq0lcc93Rym4FQLNYhmGPZo40
 ApJHCNbKwGaWA8ASL0HlYhpC9vqRr8v2ZG+qeZYC63+eUadi//uRRDxKUiUxwQY1dkj7
 1LMjgAvd3CtY2NiGGqJaxDAggHfZJiwT4D4oIZDnFhbhg82F3admdz7GuMK/IuzS0thB
 hD2sxy7dQppL3LocJc4p81xD9DovW2G8M/3J23Ezw4FcuIsIO2uB2VLdtc/WTa2E5nLX
 CEEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AIloUg6p
Subject: Re: [Buildroot] CycloneDX SBOM support
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/08/2023 16:57, Peter Korsgaard wrote:
>>>>>> "Robert" == Robert Smigielski <ptdropper@gmail.com> writes:
> 
> Hi,
> 
>   > At this time I'm reading up on the difference between CPE and PURL. While
>   > we have CPE information in their currently, it may be beneficial to have
>   > PURL for some of the packages. I'm still new to the concept of what those
>   > two formats provide. Your feedback is most welcome. Glad you are finding
>   > this useful.

  I mentioned PURL vs CPE in my talk at ELC this year. You can look it up on 
youtube. It was near the end of the talk.


> Conceptually they seem quite similar, with PURL being more generic, but
> I fail to see how we could use PURLS in Buildroot, E.G. how to do the
> equivalent of the CPE matching we use to figure out if the version of a
> package in Buildroot is vulnerable to a specific CVE?

  I think Robert is not necessarily primarily concerned with finding 
vulnerabilities, but rather with constructing a meaningful and accurate SBoM 
(which is what dependencytrack does).

  That said, it you want to use PURLs for vulnerabilities, you have to use a 
vulnerability database that uses PURLs. To my knowledge, there is just one "open 
source" one: https://osv.dev. (There's also Sonatype which can be used gratis 
but is not free.) Since there are many, many CVEs that don't make it into OSV, 
using _only_ PURLs is certainly not enough. But we could combine the two.


  Another issue with PURLs is: which one do we use? PURLs are organised around 
ecosystems. For PyPI it's clear, but for your typical C library/application it's 
less so. E.g. openssl appears in the Debian, Alpine, AlmaLinux, RPM, RockyLinux 
ecosystems (and possibly more), each with a distinct PURL. We could start our 
own namespace, but that's kind of pointless unless we also issue advisories...


  There's by the way another issue (which also exists for the CPE-based 
approach): our "BoM" for the cargo and go packages is not correct: we vendor the 
dependencies, but they're not taken into account in the BoM. The tarball we put 
in legal-info does include the vendored dependencies, but they're not mentioned 
in the manifest, and we don't scan their vulnerabilities.

> I gave your generateBuildrootSBOM.py script a quick try here, and
> noticed a few things:
> 
> - The purl links seems wrong (missing slash between site and filename):
>    "purl": "pkg:generic/busybox@1.36.1?download_url=https://www.busybox.net/downloadsbusybox-1.36.1.tar.bz2"
> 
> - The patches are not mentioned in the SBOM. Adding the show-info data
>    does bring the CPE identifiers, but E.G. doesn't include _IGNORE_CVES
>    data (that we use to signal that a vulnerability is either not
>    applicable to Buildroot or fixed by a backported patch). I don't know
>    much about cyclonedx, but judging from
>    https://github.com/DependencyTrack/dependency-track/issues/919 it
>    sounds like such info can be represented in the SBOM.
> 
> - Latest version in git is 1.0.4 (using an non-annotated tag, whereas
>    1.0.3 was annotated), but on pypi there is (only) a 1.0.5, which seems
>    to match the 1.0.4 sources. It is marked as needing python > 3.10, and
>    doesn't pull in the dependencies, so it doesn't work very well
> 
> - The output filename is used as a prefix, with .json .one.xml and .xml
>    variants. I understand why you do this, but it is a bit confusing
>    still. Is there any real use of the non-JSON formats / available
>    tooling to convert if needed?
> 
> Is there a specific reason why you are maintaining it separately from
> Buildroot? Given the fairly tight link to the Buildroot details that
> may change in the future (not to mention ease of use/discovery) it seems
> to me to be something that would be interesting to ship together with
> our other python based tooling inside Buildroot?

  I absolutely agree with that statement!

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
