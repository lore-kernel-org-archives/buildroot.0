Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D471C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96ED409FA;
	Wed, 27 Jul 2022 11:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96ED409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlMa_J62tMwH; Wed, 27 Jul 2022 11:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DDE04092E;
	Wed, 27 Jul 2022 11:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DDE04092E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE791BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37876403CC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37876403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88bEAr3V1zuj for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2A4F4035D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2A4F4035D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b26so23704446wrc.2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/Ct0feXqcuWTXFzPyXNfTKB/uJ01O68jB/1SQcQVVEQ=;
 b=Mk/pErY9BzXLRWrjv87Iq0mqHliAkokrubYuqKd82FGQbG7z05TNvcUO4ZTtbw6CB3
 zTc/I/W85ydPabtS9LHdlk4rEWMydCi7yOVwGwL95i+gvcUPOaj/QR9DfGeubrm1mDlI
 QKWYmBVfTeZsMND2ll3AU7m7a9TSyYZCbNgW8Q0WD579ZLWef6RI8BLBWzhT48dWsyWP
 MjOkc2fKqEUMdrYqaF54O/8Mo5uCIeTcBL1LniaYJXge8attmXZMnGl9WTTlj7rkOM5M
 Bs8Eh26qJjqVWT35ANJY0UOK+l7Ll3ZBFhjL/3cObhSTliaHZBMcZ/xauz5MWvreEgS4
 Ro0A==
X-Gm-Message-State: AJIora8mvHRC8iD3vIwr5vgCQvnZIal+azsw0YJ/2QXneL9tcVfWiNRt
 7eJu2ZoAIJgqorO80j6dlVVA4Q==
X-Google-Smtp-Source: AGRyM1t24NPB7hJ+kvEKaWAnyhXMOrxtK6N66R8kQ1yR+szREJ1IVTGHmz6dreH1i2Tf5fRXYYsGug==
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id
 a4-20020adffb84000000b0021a10f21661mr13466697wrr.2.1658920101041; 
 Wed, 27 Jul 2022 04:08:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 ay28-20020a05600c1e1c00b003a3200bc788sm2048170wmb.33.2022.07.27.04.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:20 -0700 (PDT)
Message-ID: <94447ef3-a122-7050-e369-2155a1e8e242@mind.be>
Date: Wed, 27 Jul 2022 10:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Xuanhao Shi <x-shi@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-3-x-shi@ti.com> <20220726205529.0e85e2de@windsurf>
 <8d1611db-29ae-e53b-f900-f57c037cfd01@ti.com>
 <20220726230742.0e538187@windsurf>
 <16705dba-bf96-5627-0c45-603ce5d7965e@ti.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <16705dba-bf96-5627-0c45-603ce5d7965e@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/Ct0feXqcuWTXFzPyXNfTKB/uJ01O68jB/1SQcQVVEQ=;
 b=aoXYItKMJb2asqzXuJOaZPuafqiKuqbI0IKEdAxRhCnpgxJJbM0kyVH7WfGrOxmDNA
 ayDPCZ3TGG5QX//Kk7FwBW5Bvd36uVi/KZQc2qV43Vqi6ilJJrk4SCKa6Z3rBXu4nXWr
 doSSVaX85ZNEVtN05h/z1DAhVdFA/T0FOSmYfzhS0si5XQKbheVrySNcdU1NSX9guf33
 +pI3JOugTAY1+zgOIQqowk0woD1M1NLWOZ9VCHCVIQIVPiALv5RJgiF1CS27he0KNOj1
 712VwiAc9BFpnYbazfWlk3X5WBIZ4rIOAUjVwtv3IimfmGq0Acf/qlXpp9yjl391eZ5y
 ND+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aoXYItKM
Subject: Re: [Buildroot] [PATCH 2/4] package/k3-image-gen: new package
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
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/07/2022 23:31, Xuanhao Shi via buildroot wrote:
> On 7/26/22 16:07, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Tue, 26 Jul 2022 15:56:31 -0500
>> Xuanhao Shi <x-shi@ti.com> wrote:
>>
>>>> Could you explain what you are trying to do? Is it because you need to
>>>> build two different U-Boot configurations?
>>>
>>> Yes, the R5 core requires a different U-Boot build than the A53 core. I
>>> mentioned a bit about it above.
>>>
>>> I understood that this patch currently does not achieve that in a proper
>>> way. Would you mind recommending a proper way to do this? Should I find
>>> a way to patch U-Boot directly so it has an option for a separate build?
>>>
>>> Since you mentioned earlier that k3-image-gen should be a package in
>>> boot/, should the patch modify boot/uboot/ for the separate U-Boot build
>>> instead?
>>
>> One option that I see, which isn't very nice, is to do like Barebox in
>> boot/barebox/, where boot/barebox/barebox.mk contains most of the code,
>> but in fact two barebox packages exist, boot/barebox/barebox/ and
>> boot/barebox/barebox-aux/.
>>
>> Another option, much simpler, is to do something that is more TI
>> specific, such as a ti-am64x-r5-loader package that would download your
>> U-Boot for R5 and build it, but without relying on the boot/uboot/
>> package. Exactly like if you had a custom bootloader/firmware for the
>> R5. I think this is the best option.
>>
>> What do you think?
>>
>> Thomas
> 
> Thanks a lot for the input.
> 
> I think we will take the second option to just add a separate TI U-Boot
> package to build the R5 in this case.
> 
> Should this package also be in boot/ just like the k3-image-gen package?

  Yes please. It's convenient to have everything that is special (i.e. not 
userspace) outside of packages/

  Regards,
  Arnout

> 
> Thanks!
> 
> Xuanhao
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
