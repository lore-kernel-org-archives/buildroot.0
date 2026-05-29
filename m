Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A4CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F1A610EB;
	Fri, 29 May 2026 21:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-6SfFtEW7Jq; Fri, 29 May 2026 21:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29EC46154D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780091602;
	bh=QzvTa244vYbortS+LbrG323NH6iPCOTsl6mBEB5jBAQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O3JblBPvkGu/pWsfsZ6SMqGFh0dhFtbJLlfFAzKRaH+XDBM79c5hInYb4BgP8NNcf
	 0Epf6CqLPry81XbhVxK45cDJYBeu99jgv2znV/zpJlZskXQFnZBBlgEXD1/9T1x2Gi
	 xkYg2+58LUIRNcrS7QWNeQLqb9b/v0cZeyZpPcX2Gd1c54jToCFVtjQgAUMPX0h3zM
	 AwhjLceBP1gz0+xOkFUc3HucfiO/7yDhI/6p0NltDp3NnO0ShVKalTXWACg+x1Hc8l
	 qxT+sG45sQ0oQBIjQu24QgXToXAFENQ3eg28i9gSpZIAa/4q9HbI56ymhuH2RVAtvN
	 fVfG7+GvZD/Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29EC46154D;
	Fri, 29 May 2026 21:53:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5408E288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AD16154D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvJQOyn2j1SB for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AD41610EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD41610EB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AD41610EB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31285B97C675; Fri, 29 May 2026 23:53:16 +0200 (CEST)
Message-ID: <176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>
Date: Fri, 29 May 2026 23:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
 <20260409204208.302842-1-thomas.perale@mind.be>
 <386b0af2-9193-4479-8b50-79c7da2d3853@mind.be>
 <bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780091596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QUagH2zTpSCu1FIdQgk1ZXQOUd3/hsB5wYxYbVzSAkU=;
 b=cSZ7EhKxmikPD0+NN9kyYDTGuDVyC8L95OFBXelSYvzZY5u3GE7Eaj5fVAYIuFmJ246Lpq
 cSVGcYZigB2ZCagRNc1UoglK7wUMBVP6SYa/ZejlIClaL4FNkZ5jE5prJwpal3hdbxTxL6
 EtqXTcQXM6aSP38wXo77uw0YfMXrBCUPMuP3XUBxwwvTOe8R9aFVD65hk9SP3gKXrHSYvE
 fQ1FrGJBM4eYEUyL66o2Mz5BUNtQu6n7RZ2DwqkTn234sivHTatQCjR4wOmG6BSWJJDv8h
 Dir+iX1dkdi+Yyr0KoNzoumB21mgHjGcPj4aNDGNvM3TkHPPBzZWgUuReOieUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cSZ7EhKx
Subject: Re: [Buildroot] [PATCH v5 6/8] utils/generate-cyclonedx: mark host
 packages as external
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  It's a bit late but let me jump into this discussion.

On 10/04/2026 11:12, Quentin Schulz wrote:
> Hi Thomas,
> 
> On 4/9/26 10:43 PM, Thomas Perale wrote:
>> Adding Arnout to the discussion, we briefly discussed this during the FOSDEM 
>> Dev Meeting. Maybe he can share his point of view as well.
>>
>> On 4/9/26 10:42 PM, Thomas Perale wrote:
>>> Hi Quentin,
>>>
>>> In reply of:
>>>> Hi Thomas,
>>>>
>>>> On 3/11/26 3:04 PM, Thomas Perale via buildroot wrote:
>>>>> Mark Buildroot's host packages as 'external' with the 'isExternal'
>>>>> property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
>>>>> property like the following [3].
>>>>>>> An external component is one that is not part of an assembly, but is
>>>>>> expected to be provided by the environment, regardless of the
>>>>>> component's .scope. This setting can be useful for distinguishing which
>>>>>> components are bundled with the product and which can be relied upon to
>>>>>> be present in the deployment environment.
>>>>>> This fits the usage of 'host' packages : a package provided by the
>>>>> environment and not bundled with the target.
>>>>>
>>>> That's not my understanding. None of the examples provided in the GitHub 
>>>> issue match a requirement on host executables (in the context of cross- 
>>>> compilation).

  I agree with Quentin that that explanation doesn't sound like it matches the 
Buildroot host package use case...

>>> Couldn't find any example that would suit the Buildroot case as well.
>>>
>>>> They all are related to runtime dependencies (dynamic linking, interpreters, 
>>>> hardware-limitation (which SoC/CPU can this run on)) you need to use with 
>>>> the binary(ies) associated with that SBOM.
>>>> What Buildroot generates is likely self-sufficient?
>>> As you said, I think this property was mostly added to support dynamicly 
>>> linked libraries.
>>>
>>>> A Buildroot SDK is kinda different, but then the host packages wouldn't be 
>>>> external anyway since they would be part of the SDK and thus "internal".
>>> If you need to create an SBOM of the Buildroot SDK itself indeed that would be
>>> a completely different "point of view" for the software and would require a
>>> different logic.
>>>
>>> Is it something you are trying to create ?
>>>
> 
> Nope, but I think it could be important (though not sure generate-cyclonedx have 
> a way to know whether you're building an image or an sdk, or even if it should). 
> FWIW, we strip our SBOM of the host packages. We weren't asked for an SBOM but 
> for versions of the software running on our products, so a strictly valid SBOM 

  Note that a host package may still include things that end up on the target. 
The most obvious case is gcc, which provides libstdc++.so, but also libgcc.a 
which gets statically linked into programs. And we have no way to know based on 
the Buildroot metadata if the package does something like that. Well, 
specifically for gcc it was actually solved by adding a target gcc-final 
package, but there may be other packages that still do that.


  And then there are even more vague corner cases, like host-bison that 
generates a file that includes boilerplate that gets compiled.

  Bottom line: stripping host packages from the SBoM is not entirely correct. 
But maybe I'm being a bit too pedantic.


> isn't required per-se for now. That may change though. (we also duplicate 
> components for which we know there are multiple CPEs, since CycloneDX has 
> decided to not support that and there are multiple instances of packages having 
> multiple CPEs (arm-trusted-firmware, optee-os to name only those).

  Yeah that's a wholly different can of worms that I was just discussing with 
Thomas on #buildroot-lts. The whole CPE concept is just broken by design.

>>>> Do you have a different reading of the spec on this? (We just started to 
>>>> look at CycloneDX generated by Buildroot so I wouldn't trust my own gut- 
>>>> feeling on that :) ).
>>> As you said, I don't think they have taken into account the use-cases for
>>> build-systems. It's mostly an interpretation of the spec that made me add this
>>> property.
>>>
>>> I saw other implementation use the `scope: excluded` property but imo it make
>>> less sense.
>>>
>>> According to this discussion: https:// 
>>> eur02.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Fgithub.com%2FCycloneDX%2Fspecification%2Fdiscussions%2F712&data=05%7C02%7Cquentin.schulz%40cherry.de%7C571d171992b84ec86a4208de9678ad6c%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639113642214259479%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=gl4Nx2Id9MjfJ4DfXvVVlmfhhG5xxqVkhAqnGzrCcL4%3D&reserved=0
>>>
>>> For `isExternal` they mention:
>>>
>>>> This setting can be useful for distinguishing which components are bundled
>>>> with the product and which can be relied upon to be present in the deployment
>>>> environment
>>> If the firmware you generate with Buildroot is the "bundled product" and the
>>> build-system the "deployment environment" I found this property to suit well
>>> our use-case.

  No, it's actually the reverse: the "deployment environment" is what is already 
present in the target before you add the Buildroot artefacts from it. For 
example, if you have a bootloader already in EEPROM and you don't build it as 
part of Buildroot, but you still need to refer to it for some reason in your 
SBoM, than that would match this description.

>>>
> 
> I don't understand deployment environment as being Buildroot. I understand it as 
> being the device where this runs (hardware, OS, shared libraries and external 
> binaries linked against/called at runtime). So the target device is the 
> deployment environment. Deployment environment is where it's deployed, not where 
> it's built. When I say "I'm deploying to production", nobody cares from which PC 
> I do this, but to which device/server I'm deploying.

  Exactly.

> 
>>> For the `scope` property they mention:
>>>
>>>> "excluded" - Components that are excluded provide the ability to document
>>>> component usage for test and other non-runtime purposes. Excluded components
>>>> are not reachable within a call graph at runtime.
>>> The "other non-runtime purposes" part could also suits the "host" package
>>> definition I guess ?

  Yeah this matches much better I think. Except that it conflicts with what I 
said above, that some host packages actually do contain stuff that somehow ends 
up on the target.


> This sounds like a better match for a Buildroot host package. Though the comment 
> you referred to uses both .isExternal=True and .scope=excluded as example. The 
> question is where to draw the line... As far as I remember, some host tools are 
> not built by Buildroot, Buildroot expects them to be available on the host 
> system. So, should the host system be part of the SBOM too? (Of course, that's 
> likely outside of Buildroot's scope for generating an SBOM).
> 
>>> It's all interpretation so it's good that we have these discussions :-)
> 
> Maybe we should start a Discussion on GitHub about that? Yocto doesn't have 
> official support for CycloneDX (only SPDX) so not much we can check on that side.

  SPDX has the same problem. AFAIU Yocto solves it by making separate SBoMs for 
the normal and for the "native" packages. Also Yocto never uses anything from 
the system (except to bootstrap the native environment).

  Regards,
  Arnout

> 
> Cheers,
> Quentin

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
