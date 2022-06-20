Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9188EC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 18:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B05C82C8E;
	Mon, 20 Jun 2022 18:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B05C82C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaqOlOsCsElw; Mon, 20 Jun 2022 18:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4FE081A2B;
	Mon, 20 Jun 2022 18:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FE081A2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2571BF28A
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C91D41814
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C91D41814
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAIWjlhflsDO for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 18:27:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695CD410D4
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 695CD410D4
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 18:27:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z7so16235614edm.13
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 11:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vvX59+fdADCDAvFBBk9n7Cnv0TU5/FXkPzDh4YpDnkw=;
 b=0fPX7g13O4NcHJ0ANPUFloeMCXXx15fSJpknzH0nFSsK3ykXKRFaQxF09SZ16DN0YU
 7mB9W/1e9xuP8/CPW+O4ZFjguAApauF9sjNvFb+7ndOTqPSVmi3tLVveF1Rq6/PSroNv
 91uRyktl9sG0AnOEwM+tStRp6kizRuuvXu8voholOHe/T15vRxpDGWzkKecqfLRbyb+U
 Gwq5mv3rYtWi7g8fVuFUH3TXUErk5zoYDFkea87CDzsBJIcZc4TqtiPKxYreFYSlPlGN
 fFxwVUaL+FYwM6VSo3aQGKFlJUYqyOIU/gba0l6ulmhyLxTP+4Al+r/n5qfW7zeecYga
 V2DQ==
X-Gm-Message-State: AJIora/GWGbFE5PEDbH+9t8rE+QBT+53ObZ+XqIpryRN3oeedsiBKHjb
 ZkJHeyk6uvQzA0SSHTWnUjpWMSnVCCWnvQ==
X-Google-Smtp-Source: AGRyM1vJxR8zIoPM3P4dR2kFFHoUOQ+9Z0Dvch9F0QiHFsPseq4wZGg2/nfCzATwd4Pi1QNmvKNyYA==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id
 n9-20020a05640205c900b00420aac6257bmr30659337edx.128.1655749644505; 
 Mon, 20 Jun 2022 11:27:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170906304400b00711eea3fa9bsm6285421ejd.42.2022.06.20.11.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 11:27:23 -0700 (PDT)
Message-ID: <5132079e-acaa-323e-88c2-2237be612159@mind.be>
Date: Mon, 20 Jun 2022 20:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
 <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
 <CADvTj4rPGVpbbZTXO9J0NT6PLbT_Q8jDHhDwhH6u0jMDc4aJCg@mail.gmail.com>
 <ac05ab10-5b36-619c-3ccc-a619d6c0c0da@mind.be>
 <CADvTj4rFeH6m+vq+nrM8O61UJ4d6yyifJ6NdTadxkU-kGvOCMQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rFeH6m+vq+nrM8O61UJ4d6yyifJ6NdTadxkU-kGvOCMQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vvX59+fdADCDAvFBBk9n7Cnv0TU5/FXkPzDh4YpDnkw=;
 b=fTMD3a5UQXLVI5bq8vxttmesAyi8qqOwOnKCVhTDauMAhuZbmyLuziLkFK+GLDZzan
 YAVtSyO2A9Msg/CDYuUHX50dr1uuc+XEx2uO6WmpvK4s5M0jwrqOrMqvrLoFekkixsIo
 smt9t0pCIHtY+HCzrigxsKcmvN6qhiaiLRXkh6pcXUrL77Gmc8Blmt+MKQ72RTmCHRjm
 1qyPeQj4NjVDblNBoQ6rfKvKZIiKga+Onz19XHshZMraSIAGoG1JBDts7UP4WqnaM4W2
 j/opmKBqnMegAylFvzN41wdQ2E/0POmQ5duFf8Ftog1SdkvEEyFmrTdC4Tfnk6IQ5zkr
 w5fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fTMD3a5U
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2022 11:17, James Hilliard wrote:
> On Mon, Jun 20, 2022 at 12:45 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 20/06/2022 01:19, James Hilliard wrote:
>>> On Sun, Jun 19, 2022 at 9:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>
>>>>
>>>>
>>>> On 16/06/2022 10:11, Shahab Vahedi wrote:
>>>>> On 6/16/22 01:27, James Hilliard wrote:
>>>>>> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
>>>>>> <buildroot@buildroot.org> wrote:
>>>>>>>
>>>>>>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
>>>>>>>>
>>>>>>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
>>>>>>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
>>>>>>>>
>>>>>>>>     How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
>>>>>>>
>>>>>>> No, I don't do any sort of trickery to build bpftool on my end. The
>>>>>>> bootstrapping, if becomes available for your configuration, uses clang
>>>>>>> and only clang. I tried to explain this in v4 of the patch [1], the
>>>>>>> second paragraph of the commit message.
>>>>>>
>>>>>> I think clang/llvm support isn't going to work correctly yet since we only have
>>>>>> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
>>>>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
>>>>>>
>>>>>> Minimum clang/llvm version for libbpf co-re is version 10:
>>>>>> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
>>>>>
>>>>> You're right about the clang version, but it doesn't have anything to do
>>>>> with Buildroot's clang. The build process uses the clang that is installed
>>>>> on the host. For Debian bullseye, that is clang 11.
>>>>    >
>>>>> To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
>>>>> the bootstrap part of bpftool, uses the x86 clang of the Debian machine.
>>>>
>>>>
>>>>     Hm, that smells like we actually want to build host-clang (after updating it
>>>> to 11.1.0 of course) so that we are sure a known version of clang is used.
>>>> Possibly with a check-host-clang check to avoid building it if the installed
>>>> clang is good enough.
>>>
>>> Dealing with multiple external clang versions may be a bit tricky and difficult
>>
>>    We do it for GCC, so we can do something similar for clang.
>>
>>> to test properly, we don't really want to use the system clang/llvm although
>>> clang/llvm external toolchain support may be desirable here as those could
>>> be tested by the autobuilders.
>>
>>    For GCC, the host toolchain is completely unrelated to the target toolchain.
>> With clang, it's true that it's possible to use the target compiler for host
>> builds as well, but don't we still need binutils? So in my mind, there would be
>> a separate host clang toolchain and target clang toolchain.
> 
> BPF is kinda weird...for both clang and GCC. It's sorta a separate
> architecture in
> the compiler...but is also sorta not architecture specific in what it
> builds for.

  Ah! I understood from Shahab's message that host-clang was used to build a 
host tool that is then used to build the target package. But it's actually used 
as a cross-compiler then, just with a different target.


>>> It would be good to get clang/llvm updated soon as systemd is now using bpf for
>>> some service security/isolation features that we currently aren't able
>>> to support
>>> due to clang/llvm being too old.
>>
>>    Unfortunately your series is rather large and has no Reviewed or Acked by
>> tags... So it tends to languish on patchwork.
> 
> The tested-by for the v12 series ended up in the wrong thread I think:
> https://lore.kernel.org/buildroot/BN2P110MB16408DC4537E54EF7ECC7906F21A9@BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM/

  All right, I'll look into it!


>>>>     And we probably want a user-visible option to enable co-re then, because it's
>>>> going to be expensive to build.
>>>
>>> We may want to make llvm/clang part of the pre-built toolchains
>>> eventually, but for
>>> now I'd say we should just conditionally enable co-re here if we are
>>> already building
>>> a clang/llvm toolchain.
>>
>>    Although I'm usually in favour of automatic dependencies, in this case I'd say
>> it's worth adding an explicit config option.
>>
>>
>>> There's some early GCC support for co-re in 12.1 which I was experimenting with
>>
>>    But then it would depend on both host and target GCC >= 12...
> 
> I thought we don't support GCC on the target.

  Yeah, terminology is difficult... With "host gcc" I meant "the gcc that builds 
for the host, i.e. the native gcc" and with "target gcc" I meant "the gcc that 
builds for the target, i.e. the cross-gcc".

> We would essentially have a 2 architecture cross-toolchain(one real
> target arch, and the
> BPF virtual architecture compiler/assemblers and such).


  Yeah, that makes sense... So the idea is that we build GCC with bpf support, 
similar like how we build it with Fortran support, right?


  Regards,
  Arnout

>>> as well which may reduce the need for a llvm/clang toolchain for co-re. The GCC
>>> toolchain BPF support build process is a bit complex however as one needs to
>>> sorta do a hybrid multitarget build with GCC and binutils since GCC
>>> treats BPF as
>>> a separate target(and since GCC along with the binutils GAS assembler
>>> don't natively
>>> handle multi-target toolchain builds themselves).
>>
>>    Ouch, so we still can't reuse the existing host toolchain for the host parts?
>> then it doesn't help that much, does it?
> 
> We can create a GCC toolchain that can target both BPF and the normal target
> architecture...but it's sorta a strange multiarch style toolchain.
> 
>>
>>    Regards,
>>    Arnout
>>
>>>
>>> I have an experimental branch for that here:
>>> https://github.com/buildroot/buildroot/compare/master...jameshilliard:ebpf
>>>
>>> I'll try and clean that up a bit once the GCC 12.1 series it is based
>>> on is merged:
>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=302389
>>>
>>>>
>>>>     Regards,
>>>>     Arnout
>>>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
