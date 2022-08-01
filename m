Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5831C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BD0E4056D;
	Mon,  1 Aug 2022 18:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD0E4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvelqtzeMx-o; Mon,  1 Aug 2022 18:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DCA540556;
	Mon,  1 Aug 2022 18:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DCA540556
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 563E51BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3132B81285
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3132B81285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb8oP5Df6Wm5 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:13:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 324FE81277
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 324FE81277
 for <buildroot@busybox.net>; Mon,  1 Aug 2022 18:13:56 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f22so3825008edc.7
 for <buildroot@busybox.net>; Mon, 01 Aug 2022 11:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+JVVb76xrAkBZfkbGrqKRsLS8iVJPdmfmXI/NGMDVos=;
 b=3ZQEuv+mZ8q1nLmwrx2x8pIlchP+zoFDX8UsPVl1+v5Z6MUMi3lzFdPhBXQxDTxMGC
 9Zx7ho+68xv7eBTx5QeDFtuuZTbleIEGTzti+WCyOg+XEYtlxSC2mZlind2Mm4wNBgNc
 zR7sJdBIN0TzzvBVH7RzbTs6WXsETOSlWM2WNJr7XN86TjFK9DwT1HD+FT7AatSyyzVv
 VMesYfIo06jPTt9Lu2Rzfk7moWJVETHMbYk4IPbg9A1HaoJG5wl4nGHU7JRFhA5uqztH
 puD2fIdICVZZ0m+HZ9FcxA3MLh9n8ZTgaNdUHMMyBse+MM+ZqyEJYSNQ09A8Y/XrTllM
 CTMg==
X-Gm-Message-State: ACgBeo0XTTbEzoHent/VP9d2LwWKbKQC2gbl8SSH3tGnS4dop3FUATeT
 /Tl0Mn2ruZ80i0a9NNuQ6C9DPw==
X-Google-Smtp-Source: AA6agR4EMkIdgUlFCwXQMlHddFmfcBp8H4pzWz8YnQn0AF3L5jPO2XALdrfhp2lNhOtVawdh6IncuA==
X-Received: by 2002:aa7:db44:0:b0:43d:267c:edd9 with SMTP id
 n4-20020aa7db44000000b0043d267cedd9mr15769439edt.385.1659377634443; 
 Mon, 01 Aug 2022 11:13:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a056402203800b0043d3e06519fsm4766614edb.57.2022.08.01.11.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:13:54 -0700 (PDT)
Message-ID: <a6d37212-4112-fd83-43f6-9e9d0011799b@mind.be>
Date: Mon, 1 Aug 2022 20:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org
References: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
 <20210812234247.3618da82__12747.8516822279$1628804602$gmane$org@windsurf>
 <pan$781e4$7f830434$f8b8178c$4f096736@ID-313208.user.individual.net>
 <7bf9f809-a7cd-653c-4948-b3c9ea5f7488@mind.be>
 <pan$e5707$29931ad5$956a380b$791006aa@ID-313208.user.individual.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <pan$e5707$29931ad5$956a380b$791006aa@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+JVVb76xrAkBZfkbGrqKRsLS8iVJPdmfmXI/NGMDVos=;
 b=Bfh2YUoBHdtTuTwuBhHWUVgydKrTapHD22FLSB8hv4SHjdvwFYFKlJCSH1KMtLjKUr
 j78fthzeNrkGE4DuMpx6O/FH22IcPG6HcAL+cVoyKFJ7DhD+71E4/dhjh8x6MoBOsoed
 u3wXAGv4/XpNHnGzjlcsT8+XxJsDdB7hIvz8UkHIU6WWaWf9MiuQKUHFMamlCyK+pvrW
 dzZ5F2eeWdWHoHwyEZgAPG1uO+cqtDFCrOJYkoZ1lgVcddnraK+MM+UnGVRwPqItVpyL
 7wzopLQaFIVwSUkBf1lfXh4DK4i8vlIrwSqHDsaw/VyxI1tifbwVdSZkGP2sjEoFOQD0
 1hRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bfh2YUoB
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: fix locale
 independent on musl
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/08/2022 19:56, Bernd Kuhls wrote:
> Hi Arnout,
> 
> Am Mon, 1 Aug 2022 19:46:18 +0200 schrieb Arnout Vandecappelle:
> 
>>    I don't understand... We have the patch in Buildroot, so the corrected
>>    header
>> should be installed to staging, right?
> 
> Yes, but uClibc defines __GLIBC__ so the patch does not fix the problem.

  But then, shouldn't the patch in flatbuffers be extended with even more 
ifdefferey to exclude uClibc?

  Regards,
  Arnout

> 
>>    Or does your build somehow use the bundled flatbuffers instead of the
>> staging-installed one?
> 
> No, kodi uses flatbuffers from staging.
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
