Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F17C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D70613CB;
	Fri, 11 Aug 2023 20:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D70613CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdkEvgUZAPJU; Fri, 11 Aug 2023 20:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B876D60F13;
	Fri, 11 Aug 2023 20:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B876D60F13
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BC8C1BF29F
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 337E04173C
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 337E04173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Exc2Wa7lOzsK for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 20:00:57 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D42FE401CC
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 20:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D42FE401CC
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-523d0fab783so1110464a12.2
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 13:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691784055; x=1692388855;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DBfyJ04kwavo8e2NauAxnNsteX3afozg3m+mMu4bvk4=;
 b=BnOLL9oTTj4U5CaxVt4+j/bFc3VbGB8bVAa+gV1mX16yACQaHo6Goqz8E5EdSqtYYZ
 jBkz2On+dAwAp+Ka4aRFHksKEu6uVBD4QK9yZYj3iDJ0io3JJIpdPWTg/kCBcY8WH30o
 yP2o5KwWUM/l/xehRL7EEM4LB2xKggDGwZWi4T9ULzrlnGdyLYR6tn7YH3bRpL/qeaal
 Y0FtyE+lNnWkaEAPwmZMaFw0cFn+uCOg0Zx2dITxtvPoyfLu1X1tlFzE/EVOFe1XRhZi
 nhrBbkYCbk37LjzswF4dRqPZllXNl/GiyKc+2QhF2crQ7b+HohWooe8CN5A/zyjH2L1f
 Hl1w==
X-Gm-Message-State: AOJu0YyP5Lt563YHTZmGxZi6d2yqJMB098j6wFZZ2ActAXX+fHyeNEhX
 S+c4Qgc5bb6lzgGZb4fX+Sd9tHEf6yhBfcN7gCw=
X-Google-Smtp-Source: AGHT+IElivf2mDCWi0fL6b5SylflX8L+qbdwQMhx6Zmm4pP6PZKANjGyDV8OkOq8i2vQyLxlvthhwA==
X-Received: by 2002:a17:906:31db:b0:993:fe68:569d with SMTP id
 f27-20020a17090631db00b00993fe68569dmr2224943ejf.17.1691784054247; 
 Fri, 11 Aug 2023 13:00:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a17090657ce00b00992ed412c74sm2598507ejr.88.2023.08.11.13.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 13:00:51 -0700 (PDT)
Message-ID: <cc38f5ec-c613-2323-e288-7fc1d0b186b6@mind.be>
Date: Fri, 11 Aug 2023 22:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230803001230.284ba84d@windsurf>
 <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691784055; x=1692388855;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DBfyJ04kwavo8e2NauAxnNsteX3afozg3m+mMu4bvk4=;
 b=iWclD8TjN649HXCLcLcH/zO8YO1ou3+Qa9XBwcC1CtRQiKkc36Fmjm1DhgF2qAzAAY
 eWX/LcYeqBaVgvGCgl09YG963cN/rFgqy5XMinBxKtc/2gN64EhDeIxkkEl7INECLQGN
 jH26o928pvkR6ePoICd9hBs3RfD+6M/r4oLVcmxJGHcBqoMTIKz9CmvuHsxJ5Cf2VTAr
 qVqkkFfdC/l4r2sf0y7Kd36U7798VS5J62RWOT7IY4z1saYGtlwbzwn8MbzCRb3Afl3c
 8HG8JyDAQsba/3jebixgqMNhwVOR0OkG8MdSA16JyLO5IWThSvGxi5JixvFsGVqa5ANQ
 oiMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iWclD8Tj
Subject: Re: [Buildroot] ARC support in Buildroot
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
Cc: ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/08/2023 09:59, Alexey Brodkin via buildroot wrote:
> Hi Thomas,
> 
>> On Wed, 2 Aug 2023 21:20:28 +0000
>> Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
>>
>>> We do have an interest in ARC cores support in Buildroot and in fact
>>> we and our customers actively use it.
>>>
>>> And the reason you were not seeing our contributions is two-fold.
>>>
>>>  From one point of view ARCompact & ARCv2 support is so good
>>> in the upstream components that barely anything needs to be done for them.
>>> Possibly I'm missing something but the only report I keep getting with
>>> ARC-related problems it's glibc build failure for ARC700 - that problem
>>> was discussed some time ago and I sill have that action-item to fix it.
>>
>> Well, if the support in upstream GCC/binutils/GDB is so good, why do we
>> still have ARC-specific version that are now outdated?
>>
>> config BR2_GCC_VERSION_ARC (based on gcc 10.x)
>> config BR2_BINUTILS_VERSION_ARC (based on binutils 2.34! super old)
>> arc-2020.09-release-gdb for GDB
>>
>> Can we drop those special versions and assume what's in upstream
>> GCC/binutils/GDB is good enough?
> 
> Well, we'll just update it to say 2023.03 [1] or maybe even 2023.09 later
> in the fall :)
> 
> And the reason is that ARCv3 support. As I mentioned ARCompact/ARCv2 is
> well supported in upstream GCC/Binutils/GDB etc and all the fixes go right
> to the upstream repos as we have our own maintainers who take care of that.
> 
> So, in theory it should be OK to remove "arc-xxxx.yy" toolchains from Buildroot.
> But since we were a bit late with ARCv3 changes for GCC 13, those will only
> land in GCC 14 which is going to happen sometime in 2024, I guess.

  I think (Thomas correct me if I'm wrong) that we would actually prefer that 
ARC just uses the normal toolchain, and that when ARCv3 is introduced in 
Buildroot, the "special toolchain" will depend on 
BR2_arc_v3_or_whatever_it_will_be_called rather than BR2_arc.


> Thus, we'll need to have "arc-xxxx.yy" anyway with sources from our GitHub
> forks, primarily to support ARCv3 stuff. Thus, I didn't want to introduce that
> turbulence with removal of ARC toolchain and then adding it back next week.

[snip]
>> (1) Drop ARC-specific versions of GCC/binutils/GDB if you confirm it's OK
> 
> As I said, we'll update ARC toolchain instead:
>   - Primarily to add ARCv3 support and while ARC toolchian will be there anyway
>   - It makes sense to keep it for ARCompact/ARCv2 as there're some fixes and
>     improvements which are not yet upstream (because release schedules don't match)

  And for those fixes, I think it's better for us if they're carried as patches 
in Buildroot.

  Using the upstream toolchain components is preferred because that way the user 
has the version choice, rather than being forced to use the ARC-specific version 
of that moment. Also, when someone updates to a new GCC version, it immediately 
becomes available for ARC as well (instead of having to wait 3 years for the 
ARC-specific version to be updated...).


  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
