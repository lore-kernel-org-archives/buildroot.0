Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D193C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E710941649;
	Sat, 23 Jul 2022 08:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E710941649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmg8HopWSmOJ; Sat, 23 Jul 2022 08:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1E2840AB6;
	Sat, 23 Jul 2022 08:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E2840AB6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EAA21BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6904840AB6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6904840AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ku6NsxytTWO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:54:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DFCE40142
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DFCE40142
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:54:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h9so9387699wrm.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qc0jCkgc93lf1ZwnCyBxVijxXl2ZNfxZkfNquT1Fu7Y=;
 b=nV3ubHLFEAehEYnln3ABK6bngqFqvv6tcoy4KRR6dlQa1P0QymeSaNiO3ZYDYqYLk2
 RIehAkxNyJwOkZuwH4vk1X1L/04NpMlyDqL9cVlWIoKeXy02wveu0zW/VFe1hdgh80px
 062OfaKa111XBmoR1Gl2lSn6raxBgKyIxPZj1GfCZmr/7SmJvHUfth48Xx/j9yioxYjW
 tj+RyH8dFLBfqIQfPiOiGvbQdQ2mcUSE1gbIpXj48YTely7MwZ2lEj5eSGbGywZWlQwM
 uPTezuef9ZUiHBODOSqORbfmKZmsPKhmaZACBAMZRhLsJRL0sSwtUB1id4abI4CABD+Y
 hkBA==
X-Gm-Message-State: AJIora/R+0c8i4IJWAzT4ZZwe1zros1XZu18HC60kJY2Z5Dtb55TGaDy
 w7pssGrd5JkGwazS/wOTKo8KTg==
X-Google-Smtp-Source: AGRyM1v0DldNmB/UUnGgv5E+Uwuh6HqLnQ8irvftSAkXy9OmC5VCqePhYpoOio1itXrgKyIkvhR+cg==
X-Received: by 2002:adf:ef0e:0:b0:21e:69c9:2db4 with SMTP id
 e14-20020adfef0e000000b0021e69c92db4mr2251994wro.697.1658566490492; 
 Sat, 23 Jul 2022 01:54:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h17-20020adfe991000000b0021dd3e2fb60sm8000686wrm.0.2022.07.23.01.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:54:49 -0700 (PDT)
Message-ID: <989b969f-6450-bfad-c2ad-340a799c3dea@mind.be>
Date: Sat, 23 Jul 2022 10:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
 <20220720222430.7eb519f6@windsurf>
 <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
 <20220722231518.1536cd2f@windsurf>
 <65b22e0d-1a50-54e9-3ad2-92e3d804ebbb@mind.be>
 <CA+h8R2oX11-6vwu8SsqKQqKKZ8OsMDRzOcNThC9PPnYb+sXE=A@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+h8R2oX11-6vwu8SsqKQqKKZ8OsMDRzOcNThC9PPnYb+sXE=A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qc0jCkgc93lf1ZwnCyBxVijxXl2ZNfxZkfNquT1Fu7Y=;
 b=ZwQkTBAYIVNhZ5BhGVmWfYHVCGeFaedkpnhKPrm8rPRkPWzzgcDnkWVmZ9z78rJrPn
 +y4vrVpYx2Eb29jMrURNt5ZX27YMK2HpGo+omw4hRboFLPn0Uy4vMg+SDEJz5SwGqz07
 bsmoCtKpVjYjzOYM4fQXoRD19qaN4a+sSf/76MBQn+1GniF8NRWAvTcyZIq0H9MLt+2n
 g+Il7WTFA18ihJ4lAer3Xp2s6++gfpqBmoF2VjuJkPvNdHNiiNAN02dUvRnHGybGiV1X
 z9kc6mKqWXR5fc5Y7GJfewqa4MaIwakNV1m1GRVCcQwOOn4nfhVcgpivbJrKA3DXZ43V
 w5NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZwQkTBAY
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: "Barisani, Andrea" <andrea.barisani@withsecure.com>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 02:41, Christian Stewart wrote:
> Hi all,
> 
> 
> On Fri, Jul 22, 2022 at 3:03 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>    I'd actually expect that the package itself would specify whether it needs cgo
>> or not. Can we test a build of a package that actually uses cgo to verify if we
>> really need to set it in HOST_GO_COMMON_ENV?
> 
> "CGO_ENABLED" informs the compiler that it's OK to use Cgo.
> 
> It should still be set to 1 even if the package doesn't use cgo at all.
> 
>>    Regardless, we *will* need to set the 'osusergo netgo' tags for all cgo-using
>> packages when they do use cgo - so either we still need a per-package "enable
>> cgo" option, or we should just always add those tags if cgo is enabled and we're
>> doing static linking.
>>
>>    Is there any reason why this problem is only observed for the crucible package?
> 
> So, this doesn't work?
> 
> FOO_GO_ENV += CGO_ENABLED=0
> 
> .. because the package needs tags enabled conditionally if cgo is
> available or not?
> 
> I don't understand why this specific package can't just check
> HOST_GO_CGO_ENABLED and conditionally add the tags?

  Yes it can. However, Andrea wrote:

> These flags are not crucible specific but they are necessary when
> compiling static Go binaries with CGO enabled (which crucible does
> not require by the way) to ensure portability as cgo versions of net
> and os/users are not portable. 

and we are wondering why only crucible needs those tags, and other Go packages 
don't. And what is especially weird is the part "which crucible does not 
require" which makes it sound as if crucible isn't using cgo at all...


  Regards,
  Arnout



> 
> Best,
> Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
