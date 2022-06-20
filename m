Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4284C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 06:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 338B682F84;
	Mon, 20 Jun 2022 06:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 338B682F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHm0xuBDOC8y; Mon, 20 Jun 2022 06:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AF6182F9E;
	Mon, 20 Jun 2022 06:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF6182F9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19CC51BF2CF
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 06:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00DBE417D4
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 06:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00DBE417D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oeOaRD1MqosS for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 06:45:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B7EC417CE
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B7EC417CE
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 06:45:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b8so13650854edj.11
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 23:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z2eyts6Ar38gu7ZQAw0pf5ofgJRmb/QKQNe2rqdFnrM=;
 b=rD7FcAtsuGaMNLh98AsYkp9A74kCk+G9AS08TnHYgiiKnQMidfvgJkoDXLkRYgwyUD
 Q5g01k4pLudIBZ4zGX6yNYWIoQ5cTIFc2ZGZPdFgNoDExRz321G9iNIdFEZaERykcLpy
 3GQKPqXIe4eHGkvCgm6J4EuljujQpHkVqyyAkIrYOLbhNm912NPgYL9eQH5vlwEEqkcA
 JEPEC00x/Fzd7HP9Rbi+bwdub/sxO3jT0jv2dLViUSj0O2QFourafFi0jo0VJDAvObKV
 qJgd2nT14GGKBnbuA32LFqpOMirQJS19bIIdqcSJ8LUIoa+yFsGn3NQFZ8yxKKRhOoz0
 kWWQ==
X-Gm-Message-State: AJIora+U7zdSTa7eJ5cfEcytyuVCsq0MquQ5OZ6nUL4zXN6dqVvaYh4l
 QUakgwpxdks4zE4ivrHhxDaqeQ==
X-Google-Smtp-Source: AGRyM1tZO4mhlX+EN9uktf0a+95U72zBQlGDQZRvx+FEicQ4coOZrnYd2bQdRhM8VNLvH2kzBE/6GA==
X-Received: by 2002:a50:ef04:0:b0:435:6560:abba with SMTP id
 m4-20020a50ef04000000b004356560abbamr17499380eds.3.1655707509659; 
 Sun, 19 Jun 2022 23:45:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056402124200b004357738e04esm3508560edw.21.2022.06.19.23.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 23:45:09 -0700 (PDT)
Message-ID: <ac05ab10-5b36-619c-3ccc-a619d6c0c0da@mind.be>
Date: Mon, 20 Jun 2022 08:45:04 +0200
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
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rPGVpbbZTXO9J0NT6PLbT_Q8jDHhDwhH6u0jMDc4aJCg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z2eyts6Ar38gu7ZQAw0pf5ofgJRmb/QKQNe2rqdFnrM=;
 b=IaE4QXe+yGYXVNZfhg9MJoTDxX7y+GqUaiKgOpmreDWJIsy3SOMg53BSEJIqhRMLHn
 WD6BEcFFVoI7yxj4RW6WRVBnpCOzNdhxXQHumTB2crHxBL3iVE0lTZWNRyF015/d/+4J
 lNSx3T9rcdIr8YVbN1J1ZhA9J60anTrzOkIjOLS5m9YPT7nQyCeK7ypJJqU7KzKGiGlR
 nvnyYDE7ISg8v/hZfp2YQCcd3KzzQuccoA2LewtlUkPcDzmyoafFL1WNNLinuMZJzCpk
 kJH2rl7bwgzQU38e0TvFgFpYkNKS0Ui8xxASEV0ROQR3HooQcICH+BkjCfwenjmkSmqB
 xIzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IaE4QXe+
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



On 20/06/2022 01:19, James Hilliard wrote:
> On Sun, Jun 19, 2022 at 9:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 16/06/2022 10:11, Shahab Vahedi wrote:
>>> On 6/16/22 01:27, James Hilliard wrote:
>>>> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
>>>> <buildroot@buildroot.org> wrote:
>>>>>
>>>>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
>>>>>>
>>>>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
>>>>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
>>>>>>
>>>>>>    How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
>>>>>
>>>>> No, I don't do any sort of trickery to build bpftool on my end. The
>>>>> bootstrapping, if becomes available for your configuration, uses clang
>>>>> and only clang. I tried to explain this in v4 of the patch [1], the
>>>>> second paragraph of the commit message.
>>>>
>>>> I think clang/llvm support isn't going to work correctly yet since we only have
>>>> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
>>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
>>>>
>>>> Minimum clang/llvm version for libbpf co-re is version 10:
>>>> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
>>>
>>> You're right about the clang version, but it doesn't have anything to do
>>> with Buildroot's clang. The build process uses the clang that is installed
>>> on the host. For Debian bullseye, that is clang 11.
>>   >
>>> To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
>>> the bootstrap part of bpftool, uses the x86 clang of the Debian machine.
>>
>>
>>    Hm, that smells like we actually want to build host-clang (after updating it
>> to 11.1.0 of course) so that we are sure a known version of clang is used.
>> Possibly with a check-host-clang check to avoid building it if the installed
>> clang is good enough.
> 
> Dealing with multiple external clang versions may be a bit tricky and difficult

  We do it for GCC, so we can do something similar for clang.

> to test properly, we don't really want to use the system clang/llvm although
> clang/llvm external toolchain support may be desirable here as those could
> be tested by the autobuilders.

  For GCC, the host toolchain is completely unrelated to the target toolchain. 
With clang, it's true that it's possible to use the target compiler for host 
builds as well, but don't we still need binutils? So in my mind, there would be 
a separate host clang toolchain and target clang toolchain.


> It would be good to get clang/llvm updated soon as systemd is now using bpf for
> some service security/isolation features that we currently aren't able
> to support
> due to clang/llvm being too old.

  Unfortunately your series is rather large and has no Reviewed or Acked by 
tags... So it tends to languish on patchwork.


>>    And we probably want a user-visible option to enable co-re then, because it's
>> going to be expensive to build.
> 
> We may want to make llvm/clang part of the pre-built toolchains
> eventually, but for
> now I'd say we should just conditionally enable co-re here if we are
> already building
> a clang/llvm toolchain.

  Although I'm usually in favour of automatic dependencies, in this case I'd say 
it's worth adding an explicit config option.


> There's some early GCC support for co-re in 12.1 which I was experimenting with

  But then it would depend on both host and target GCC >= 12...

> as well which may reduce the need for a llvm/clang toolchain for co-re. The GCC
> toolchain BPF support build process is a bit complex however as one needs to
> sorta do a hybrid multitarget build with GCC and binutils since GCC
> treats BPF as
> a separate target(and since GCC along with the binutils GAS assembler
> don't natively
> handle multi-target toolchain builds themselves).

  Ouch, so we still can't reuse the existing host toolchain for the host parts? 
then it doesn't help that much, does it?

  Regards,
  Arnout

> 
> I have an experimental branch for that here:
> https://github.com/buildroot/buildroot/compare/master...jameshilliard:ebpf
> 
> I'll try and clean that up a bit once the GCC 12.1 series it is based
> on is merged:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=302389
> 
>>
>>    Regards,
>>    Arnout
>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
