Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62811CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56ABB40399;
	Wed, 10 Apr 2024 19:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM901JghQ1pC; Wed, 10 Apr 2024 19:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6BC741707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6BC741707;
	Wed, 10 Apr 2024 19:26:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B04591BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C3BC60E22
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDFnveolaNDO for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:26:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 151C860BFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 151C860BFB
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 151C860BFB
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:26:14 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso2374915f8f.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 12:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712777172; x=1713381972;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zOm4cVle+1ZTFgpbMZxVmoz65qtaRCKUP2twhdRlRXk=;
 b=wR0U/K3UlzZo90Jo/UK3E2X+NpnR3HrjIxwld8W94BP1vT8oRg8Lb0UWOZ0HM3/VlN
 8RzMQhEsKGkSQtjYpL3sjwQ38wQsKacfj5JVk8fzWbo+oWdzGp0eiyanFTNZ9JHn8riS
 AIvsdg9YfxePCru/b2XXEKu5VxWsK4V6Z4CDbRjg3SgTyJy6kUvn5bYpl9D+Wg2ptvOL
 CQoIycIvBvXHvbHtSwU9UqMgFnt5chBmofCN6aPWmS6aZpPMXH+UsgZuWHrBO1uhsbp+
 UJaOyXeETaFpQiSi/BiPb+jpQeGnTouJ85qotC7iU+w7VMsUrONtRzmJexChgO7NG0OU
 hfYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhcgxO/qv28eI1B2dwyhNcAnYWT5B/Fl9LdBztNc2Z61IgVhpia+sNtfqJ8HKYtIhMqpJGxyiqGomHGFFDtJkaz3YykFiNTw==
X-Gm-Message-State: AOJu0Yx9pw6JYYPmh8ZfV77CNFrI5Iidg2w/6yDkd4tqbcvlv8oWcOwi
 cRh2tYspjVDjNdsnZFJC96WpE4KRLCOd2R/gGY+tgmv8+Y+IQniv8YmcZ/8q4GM=
X-Google-Smtp-Source: AGHT+IHK6Vmk3iePIO8IsT3K+88Vn8xrpfLbxJIb8FxSEGVRuZqFJc7HZWWiq+7evBwTLZygrE/9Sg==
X-Received: by 2002:adf:f992:0:b0:345:c20a:69ec with SMTP id
 f18-20020adff992000000b00345c20a69ecmr2896745wrr.70.1712777171949; 
 Wed, 10 Apr 2024 12:26:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b00414688af147sm3194711wmq.20.2024.04.10.12.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:26:11 -0700 (PDT)
Message-ID: <ca3fa476-0679-496f-989d-e070724da1ee@mind.be>
Date: Wed, 10 Apr 2024 21:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240404124329.768546-1-thomas.perale@mind.be>
 <20240407231500.2248bc22@windsurf> <ZhRCOocYgxC-C5GL@landeda>
 <ef73b0da-0127-4d58-b195-bb09c36bf39c@mind.be> <ZhbKkdeV6FEARag-@landeda>
Content-Language: en-GB
In-Reply-To: <ZhbKkdeV6FEARag-@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712777172; x=1713381972; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zOm4cVle+1ZTFgpbMZxVmoz65qtaRCKUP2twhdRlRXk=;
 b=UOy6B3zE0N0PfkqyVm0FvHTay0SCgSElGBxDAZaF5jAIRW4d7P0l8KnoVP+nwpxLU9
 pCs0ER/+QLesqUBRkRlzZgE7r3wcqtNQmQxgHhdFvHvFKimz8vtDCGNrIuwik2oUBm/M
 LMvx6Ipv/TKnqutppMRSnfHgdMCHiXfwW0N9fc5QNnxnPYWsi4Tb1RfDxxM1rNK/totm
 obg0/Cn2KymrVefmzRK7TBSv9MppjBdQpw3/zV69sAvpDN8DsPoEA4DXOn9cE6n5bHtu
 y3V76ecs+WaYcbqNXD6P8ga7gwqu9T+rOePZRyAjUQlPNZa5ZMB89GtEYdT9Sc3/eg6i
 cJ/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UOy6B3zE
Subject: Re: [Buildroot] [RFC PATCH 0/5] Support SBOM in CycloneDX format
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
Cc: Thomas Perale <thomas.perale@essensium.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2024 19:21, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2024-04-09 14:17 +0200, Arnout Vandecappelle spake thusly:
>> On 08/04/2024 21:15, Yann E. MORIN wrote:
>>> On 2024-04-07 23:15 +0200, Thomas Petazzoni via buildroot spake thusly:
>>>> On Thu,  4 Apr 2024 14:43:24 +0200
>>>> Thomas Perale <thomas.perale@essensium.com> wrote:
>>>>> This RFC patch series propose to add support for the CycloneDX
>>>>> SBOM format.
> [--SNIP--]
> 
>>> On 2024-04-07 23:15 +0200, Thomas Petazzoni via buildroot spake thusly:
>>>> My initial reaction is whether it is really the right solution to have
>>>> "make" spit out the CycloneDX format, or whether we should use "make
>>>> show-info", and then process the JSON output using some Python script
>>>> to generate the CycloneDX SBoM.
> [--SNIP--]
> 
>> On 08/04/2024 21:15, Yann E. MORIN wrote:
>>> This was also my reaction: when I introduced show-info,
> [--SNIP--]
> 
> On 2024-04-09 14:17 +0200, Arnout Vandecappelle spake thusly:
>>   My premise is that we should (in the longer term) _always_ generate the
>> CycloneDX SBoM as part of the world target, so without needing a separate
>> "make cyclonedx" step. I think we need to kind of force people to generate
>> SBoMs, so there is no excuse not to have it.
> 
> An SBOM is totally worthless when generated on the developers machines,
> as the build environment there is uncontrollable; it is useless during
> development as well [0]. An SBOM only ever makes sense when generated in
> a delivery pipeline, like in a CI/CD pipeline.

  Huh? It's equally worthless as the images created by Buildroot then. Those are 
also uncontrollable. Of course, you have no guarantee that the SBoM corresponds 
to the image that gets shipped to customers, but that's not really relevant. You 
can still use the SBoM to see which packages get installed, which patches are 
applied, which CVEs apply, which licenses are used, etc.

  And anyway, I don't think it's very relevant if this SBoM generation happens 
on a developer machine or in CI. In either case, I don't think we want to rely 
on a host-installed Python version.


> [0] except in the rare cases of those developpers explicitly looking at
> or working on the SBOM: evaluating the SBOM, fixing bugs in the SBOM
> generation tooling, adding SBOM-related metadata...

  So you're saying that for developers who do not use the SBoM, it's not 
relevant to generate them locally. That's true of course. Not very relevant IMHO 
though.



>>   This has a number of implications: it has to be quite lightweight (because
>> it is called for every build), so that basically limits it so make and shell
>> (I didn't like the idea of "always build host-python"). It should also be
>> possible to generate it without internet connection on condition that a
>> 'make source' was called before (that's why the license list in
>> support/misc/cyclonedx-spdx.mk is stored in the git repo and not downloaded
>> while building). On the other hand, the cyclonedx generation can depend on
>> the presence of downloads and build artifacts, if that is needed.
>>
>>   On that background, with the addition of cyclonedx, we now have 5 things
>> that do somewhat similar things: cyclonedx, legal-info, show-info,
>> pkg-stats, and printvars.
> 
> Forget about printvars: it is unusable and legacy. We have show-vars
> instead, which does provide a reliable extract of the internal
> variables (except for those that need a $(@) or $(@D) or such, because
> there is no actual target in that case, and thus it is not possible to
> properly extract the internal state of variables).
> 
> We should now drop printvars.

  OMG, I completely forgot about show-vars! But indeed, we still need to keep 
show-vars. And we should drop printvars.


>> So a second goal is to try to unify all that in a
>> single mechanism. And because cyclonedx is a standard, it makes sense to me
>> to try to use that as the primary mechanism, and make the others derivations
>> from it.
> 
> The nice things about standards, is that there are so many to pick from.
> ;-)
> 
> SPDX is also an SBOM standard, which predates cyclonedx by 6 years. It
> is more mature (older!), so why don't we settle on that instead?

  Because SPDX is horribly messy and complicated.


>> - For show-info: as long as the same information is available in the
>> cyclonedx file, we can simply use the cyclonedx file and deprecate show-info
>> (possibly with a conversion script, which is allowed to be written in
>> python, but might even be possible to write with jq, to convert to the
>> legacy format).
> 
> I strongly disagree. show-info has other usages than generating an SBOM,
> and contains a lot of info that does not belong in a SBOM. For example,
> as you noticed, the package infra is mising in cyclonedx, and there is
> no reason to add it there, while it has its place in show-info.

  Excellent example :-). The SBoM JSON (or show-info BTW) is not really usable 
for a human as is. So you'll want a tool to visualize it. You can make your own 
tool (pkg-stats), or you can use something that exist already (DependencyTrack). 
In the latter case, you want to make sure that that tool displays all relevant 
information - so the SBoM needs to contain that information. Fortunately, 
CycloneDX allows to add additional properties. Now we just need to extend 
DependencyTrack to display that information. Thomas Perale is looking at that.


> Another example, is that (AFAICS) there is no dedicated way to describe
> reverse depdndencies in cylonedx, except by injected an arbitrary
> property, which means that it does not really fit... show-info provides
> that.

  True.

> More generally: there is information that belongs to show-info, as it is
> usefull for generating various reports, that have absolutely no meaning
> in an SBOM,

  What kind of information would that be? show-info and an SBoM are pretty much 
the same thing: a list of packages and their properties.

> and so there is no reason to inject those in cyclonedx just
> because something else may need it. That's what show-info is for
  Anyway, for me replacing show-info is not the most important thing, it's more 
a nice-to-have. What I don't want is to generate CycloneDX by post-processing 
the show-info output, because it turns out that that is still fairly complicated 
and it's just easier to directly generate CycloneDX from make.


> And as Thomas said, if show-info is missing data, we can easily add it.
> 
>> - For legal-info, it's quite obvious that cyclonedx should basically replace
>> that - though legal-info currently still does a number of additional steps
>> (e.g. collect the actual source) that cyclonedx doesn't cover. I also think
>> the manifest.csv file makes a lot of sense. I'm not sure how to solve that,
>> but I can imagine that there could still be an explicit legal-info target
>> that consumes the cyclonedx file and does some additional steps.
> 
> Or the other way around: cyclonedx consumes the output of legal-info.

  Again, it's going to be much easier to generate everything from make rather 
than post-processing the output of legal-info and show-info.


>> - For pkg-stats, it turns out that DependencyTrack already covers a large
>> number of features that we have in there (CVEs, obviously, but also upstream
>> version). Some very buildroot-specific things are not in there (e.g. the
>> package's infra) but it could be possible to add those to DependencyTrack.
>> - For printvars I have no solution, I guess it will have to stay.
> 
> See above: we should drop it in favour of show-vars. But yes, this wil
> have to stay, indeed.
> 
>>   So, why is it not a Python script based on show-info? Because I want the
>> CycloneDX file to be _always_ generated, which means no Python. And
>> processing JSON in shell is horror, then it's better to just generate it
>> twice.
> 
> As I said above: it does not make sense to always generate it, because
> it is only relevant when it is generated in a controlled environment,
> like a delivery pipeline for a delivery tag (or such), and not during
> development on developers machines.
> 
> [--SNIP--]
>>>>> - [ ] Find a solution to handle versioning. The "version" property
>>>>>         should be incremented every SBOM generation.
>>> Also I don't see how that versioning works.
>>   In my understanding, the version should be updated every time you edit a
>> CycloneDX file. So we always generate version 1. It is updated by tools that
>> _process_ CycloneDX, e.g. to annotate with additional information.
> 
> Ah, so there are tools that have to run on the cyclonedx data after it
> has been generated, because they need to inject data we have no way to
> know in Buildroot?

  I don't know if those tools actually exist. I'm just saying that the version 
field is supposed to be updated by such tools.


> This means that those tools can very well consume show-info to generate
> the final cyclonedx, to begin with...

  I am _very_ sure that no such tool exists :-)


>>   IMHO the cyclonedx file should be bit-for-bit reproducible, so this must
>> _definitely_ generate the same version.
> 
> I do agree that it should be reproducible, but then I don't see how this
> articulates around the "version property should be incremented every
> SBOM generation."

  The statement "version property should be incremented every SBOM generation." 
from Thomas Perale is simply wrong (at least, AFAIU). It has to be incremented 
every time the SBoM is updated.

  There is also a UUID (serialNumber) field defined [1]. That one is supposed to 
be re-generated every time the SBoM is generated (but it can use any kind of 
UUID generation mechanism, e.g. random or time based). I don't like that very 
much though, because that makes the SBoM not reproducible.

  Regards,
  Arnout

[1] https://cyclonedx.org/docs/1.5/json/#serialNumber

> Note that, if the version really has to be incremented every time the
> cyclonedx data is generated, we could just use the UNIX timestamp, with
> milli- or microsecond precision, which is in practice going to be
> monotonically incrementing. It's not going to be a sequential +1 every
> time, though...
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
