Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E347BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71D4840354;
	Sat,  2 Apr 2022 17:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SdaYxp3dvEp; Sat,  2 Apr 2022 17:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7070640123;
	Sat,  2 Apr 2022 17:08:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22B2F1BF968
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1289C81CA5
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbB922hlqcBV for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:08:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDD1D819B8
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:08:36 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id u28so35255eda.12
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kEGjBLE+h/95M/RhWdzywMeAj39CWX0zVQwaPPFLCkc=;
 b=CzSlED9E04Vc4CtzaBpuxPGVChDT/qVLURpDJBA6KhwuqkoH5nILpbDqqfiNydN7Ul
 RJk681GW9bZ2K287+sySaIBawA5XjwJlvh/G3+SCS46XcYaq8QutujnuLYLlhWUE74zS
 XmSu/7eLTIvwGZ0cIi3b1Nv0hRlWPgzNOil7VHps+aNJn/OecTfvn+W00A15xXUGmmTY
 9WLERpLGDHJxsWW4KjsJOoKl1utdYfZK6ZNMJtA+6HxTo7R66MWrCpWxrpRvkyO9Wosj
 PeWbIa+8UZgkdMDlqb0ifsLhdOOe4ALdUjlbn5pvV+vAEF9dmjVxfs6rsP4PfnPGuWGh
 WWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kEGjBLE+h/95M/RhWdzywMeAj39CWX0zVQwaPPFLCkc=;
 b=ixjMFL/R5eUowaD1RqyOVieV+eD7+Uli0M03e44rrL2SeC/yZ7i5QVWPN/m/TW3KzH
 m759PA/EFQ4S1iopH3B+96VBEpydn7d7raA/cgVB7PQu/DcT1aIIu8NF6MnvGna0me4k
 1XXNHLFFwEtF3EdzTrt+qo+umReLlJMIYrvv5Kfe8CWQbno63KT5L6AbwqFR3aGElOMX
 Z6nnQM1atV23ypoNMFOyW4bYWYxEfph9XrMU8lGlw3ac2Lk99d+Rf4FmUHxKWBeWqxPg
 Tr389OBbdIVU/M+h+RqZqvhm5QbUWSDufPoQPnOow03q4Fh+dPdNWqs0ObIVLmlUHSxs
 8t1g==
X-Gm-Message-State: AOAM530gSAhTYNtcrZgI+pOaAFEIyYRPqsxg64G3FHevWNIFFjghnvb1
 dZRm8RZWiWBGqaKQRxtVZmIOYA==
X-Google-Smtp-Source: ABdhPJzLOvkuH8XqGNLHFYZct06UPN8gVkWN1q5LVeoH8ExJ9r8e5pJSCenO9QcI79K+ZduOfKxmaw==
X-Received: by 2002:a05:6402:5186:b0:419:49af:428f with SMTP id
 q6-20020a056402518600b0041949af428fmr26164709edd.177.1648919314351; 
 Sat, 02 Apr 2022 10:08:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a17090673d800b006df8ec24712sm2314857ejl.215.2022.04.02.10.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 10:08:33 -0700 (PDT)
Message-ID: <7bcc0cf7-5759-1ef4-9667-fd8ae0c4741f@mind.be>
Date: Sat, 2 Apr 2022 19:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: David Laight <David.Laight@ACULAB.COM>,
 "'Jason A. Donenfeld'" <Jason@zx2c4.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com> <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
 <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
 <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/04/2022 13:34, David Laight wrote:
> From: Jason A. Donenfeld
>> Sent: 01 April 2022 12:05
>>
>> On 4/1/22, James Hilliard <james.hilliard1@gmail.com> wrote:
>>> I should add that I do also think this should be upstreamed to busybox,
>>> which
>>> will also reduce the amount of duplicate work as busybox is commonly used
>>> across many distros.
>>
>> I'll work on that.

  +1 to have it in busybox.

>> And hopefully David won't sabotage it with his
>> "it's only 10 lines!" stuff.
> 
> :-)
> 
> Busybox tends to care about code size.

  Yes, but if it's not overly bloated, it's not going to be blocker for initial 
inclusion.

> You really want to roll-up the unrolled loop in blakes2.
> Performance really doesn't matter here.

  AFAIU (but neither the commit message nor the seedrng about page explain it) 
the Blake2 algorithm was simply chosen because it's small. Any hash function 
should be fine. There's sha1, sha2 and sha3 in libbb, so I guess one of them 
should have all the desired properties.

> In any case, don't new kernels just 'stir' the new entropy into
> input pool?
> So feeding in non-random data doesn't really make the output
> any worse?
> So you could add the saved entropy, force a reseed of the output
> generator, and then save data from /dev/urandom - which now
> contains any entropy collected since boot and the saved seed.
> No need for any cryprographic code in userspace??

  This is explained in commit f0986de551f46e72268857fd817986e9be697cd0.
TL;DR: the kernel actually does make the output worse if there's not much 
entropy available.

  Also, seedrng makes sure that it's powerfail safe. If power is interrupted at 
any point in time, we have not lost entropy.

  Regards,
  Arnout


> The old kernel code is just too horrid to think about.
> IIRC the output generator is just and xor of several LFSR
> and so is completely and trivially reversable.
> (One of the random number generators did that.)
> And the input pool tries to count bits in and out instead
> of 'stirring' input data into some data structure.
> So feed it non-random data and it discards the old random
> data it had.
> 
> How much state does the blakes2 input pool have?
> I'd have thought you'd want the input pool to have
> much more state than the output generator?
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
