Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6EAF364BD
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A6B40CAC;
	Thu,  9 Apr 2026 20:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzcRu4tt7-bF; Thu,  9 Apr 2026 20:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A2640CC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775767421;
	bh=rrPWYnF4E5FlJc3cCw5HnRBKXa8q3E9ywFEQm6vaq1Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o4DZkPoxU1kkcEAWXzE7JCtoM4SoiLlt83aprde23Qx/cDLFe6nOKNWpJNR9ojDId
	 +3DHOGi/vvvw23sL7rxPPm2YAYItFjcnKlAXqzCrt6bWycb0DhlMvtJZY/9UfNHHgh
	 pGjQHwE3PNyBBGbBux5NhQvN0Fv3sRejHoCmekLEaiSEYwwXsM+5r/ahVAH5gD4S1D
	 kriqfCX/YhgX/gg6gM9lah7B98NeXbgl3A4cTd7CbSseh484eVBtlK//WWXB50AZfO
	 l4t8DrJI+zNoN3X9CKM61fBhh53pjxBxgb60aomAKD/RlMSjKv9N6epIiCdJjVJeNc
	 qTkSpuVXrY2Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A2640CC2;
	Thu,  9 Apr 2026 20:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E75E194
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53EB581E5C
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1F-HIDZDejw for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4411781E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4411781E59
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4411781E59
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:43:38 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-483487335c2so14330945e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 13:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775767417; x=1776372217;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gj0Qsse8MW9LfsY6NdRfE4MKgPkRARhj0UTPJvLVc8g=;
 b=HxZHmJEPvuC/lTfNLpSWJH4FTHwfVHoO/aBXbwev+fqiJsAwYqEo8grIK+qsnwObEw
 Sud5WYAFnCuZD95hirRSmNNrn6KY8BYmZhL8y9+2G/IOvWPovdoQ1hVBn7Ek3Bos2Gii
 ZlKoEn6/qhDg1N0okfu6anib5QEmBOJOLaUyRDp2OsMfFak2M1G5k7SJLFKsRQuVS9W8
 zU92s/WBYXkjTI/W2wZ/iGSX8PiE36su/VG1cu93osFWQkokMBg+ODHo1veMEL9bVlWu
 5oWu8jXjd8yq829u82tNx/jiKv0InPhDEY3H2t0ZHAB4Xn9dybW945rjDPDGkc/QtzqX
 BSxQ==
X-Gm-Message-State: AOJu0Yy53UxwMxyLPsqzz7VCTtgkVyZTesFJOn/v4PoP8hMwl+51QosW
 UtqPOoVxtEyP9xOLqE67XY3gfwA9+JwyvDJuUaGCfty/X/2zDznPyLXYccfKbI4ogZA=
X-Gm-Gg: AeBDiet5un30WoFRdUYi+3sHASAxHt1z/oGiW25a1ZhpD4fQGFNwI793OCOXf2gvTHI
 y2mexCit2vH2k2F8NvHj+dHH5Kv38bKAp6k07yxgUNgsZjHIYwVZ8mbppTvuEf7mTpfzznjW6lM
 6jxeohJv36ZSfBTvGVyQRxhruHb8BSaPGGlUSgn/e2q/KDiMm6axAxtjJm5VSsG+/kMyXzpFs2T
 1d/vzK+cXshu4+eTQxWExQ1VzO79FaGGP0xSimhCGuzVP3U+8/UOCFoDiAN44hwgToQlkwX5PF6
 Y4liGvBxbNXgGeshmXBuT0z6vU33TrJ6mAmxHszdtFSzduZRZv3jFDElhgrNiXTPnb43H6jeCFp
 62yTb7PI6AOfps7sAGKKfyzgy3anDGjO2eWdjgjBrNVo+6mUAW/55PZh9Bn01CXWcwo59cFxnVg
 XGyhRj3hDBPZjl7PqWD27vp54xfE5T1w==
X-Received: by 2002:a05:600d:d:b0:485:2a85:e5ec with SMTP id
 5b1f17b1804b1-488d67b8db8mr3444095e9.2.1775767416983; 
 Thu, 09 Apr 2026 13:43:36 -0700 (PDT)
Received: from [192.168.4.20] ([79.132.232.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3cbb2sm18557975e9.13.2026.04.09.13.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 13:43:36 -0700 (PDT)
Message-ID: <386b0af2-9193-4479-8b50-79c7da2d3853@mind.be>
Date: Thu, 9 Apr 2026 22:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
References: <de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
 <20260409204208.302842-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260409204208.302842-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775767417; x=1776372217; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gj0Qsse8MW9LfsY6NdRfE4MKgPkRARhj0UTPJvLVc8g=;
 b=RolLQPfIppgj57o64gfIkY3FuL7MyAWMb3gpS6dChwbIBAQspwsCeQJQHw1MfXTeys
 QaJd9ggv+Xmzo8bvcgfNoMaF88Ow6jNoePvoCryw2HoGsKlUZY1QWILCGH5BMNKWrqR4
 wb6HyXDP8o7CoxScvTKJgMy92MlEGnHEU/ZdBxAdCbw6Yrj85IqTa42VZUDtcmRqCgPR
 MiRqy3X6b1bM+P+D92M7jPnyidobxySaTbSLt4P2y+sUoZ2HAVXPapkmb90Ote7gOsI3
 +GHlLhpH4gKmtXPf5GwV6pif09xb2S3asbhFjD89ZUhFfmncve7YU4/3VQb1E4JCdN88
 j/xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RolLQPfI
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding Arnout to the discussion, we briefly discussed this during the 
FOSDEM Dev Meeting. Maybe he can share his point of view as well.

On 4/9/26 10:42 PM, Thomas Perale wrote:
> Hi Quentin,
>
> In reply of:
>> Hi Thomas,
>>
>> On 3/11/26 3:04 PM, Thomas Perale via buildroot wrote:
>>> Mark Buildroot's host packages as 'external' with the 'isExternal'
>>> property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
>>> property like the following [3].
>>>>> An external component is one that is not part of an assembly, but is
>>>> expected to be provided by the environment, regardless of the
>>>> component's .scope. This setting can be useful for distinguishing which
>>>> components are bundled with the product and which can be relied upon to
>>>> be present in the deployment environment.
>>>> This fits the usage of 'host' packages : a package provided by the
>>> environment and not bundled with the target.
>>>
>> That's not my understanding. None of the examples provided in the GitHub issue match a requirement on host executables (in the context of cross-compilation).
> Couldn't find any example that would suit the Buildroot case as well.
>
>> They all are related to runtime dependencies (dynamic linking, interpreters, hardware-limitation (which SoC/CPU can this run on)) you need to use with the binary(ies) associated with that SBOM.
>> What Buildroot generates is likely self-sufficient?
> As you said, I think this property was mostly added to support dynamicly linked libraries.
>
>> A Buildroot SDK is kinda different, but then the host packages wouldn't be external anyway since they would be part of the SDK and thus "internal".
> If you need to create an SBOM of the Buildroot SDK itself indeed that would be
> a completely different "point of view" for the software and would require a
> different logic.
>
> Is it something you are trying to create ?
>
>> Do you have a different reading of the spec on this? (We just started to look at CycloneDX generated by Buildroot so I wouldn't trust my own gut-feeling on that :) ).
> As you said, I don't think they have taken into account the use-cases for
> build-systems. It's mostly an interpretation of the spec that made me add this
> property.
>
> I saw other implementation use the `scope: excluded` property but imo it make
> less sense.
>
> According to this discussion: https://github.com/CycloneDX/specification/discussions/712
>
> For `isExternal` they mention:
>
>> This setting can be useful for distinguishing which components are bundled
>> with the product and which can be relied upon to be present in the deployment
>> environment
> If the firmware you generate with Buildroot is the "bundled product" and the
> build-system the "deployment environment" I found this property to suit well
> our use-case.
>
> For the `scope` property they mention:
>
>> "excluded" - Components that are excluded provide the ability to document
>> component usage for test and other non-runtime purposes. Excluded components
>> are not reachable within a call graph at runtime.
> The "other non-runtime purposes" part could also suits the "host" package
> definition I guess ?
>
> It's all interpretation so it's good that we have these discussions :-)
>
> PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
