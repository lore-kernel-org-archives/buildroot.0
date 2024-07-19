Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D869C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 02:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7F1607C0;
	Fri, 19 Jul 2024 02:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3CqhcWfJjKA; Fri, 19 Jul 2024 02:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A25AC607F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A25AC607F7;
	Fri, 19 Jul 2024 02:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 169461BF842
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 02:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03686402F7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 02:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlSUME14IOFa for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 02:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACA3240146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACA3240146
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACA3240146
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 02:55:31 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-39641271f2aso5953805ab.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 19:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721357730; x=1721962530;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCGOznLCGcoKG3oRuT6ayrrnQs9WI3z0UjsoUzIL0FI=;
 b=VmiSvqm73sLFB4DICgnjW3wjnHxeBhA6UpDhgH1aR0ef7wX3HYyUgWN95BzEF9TCdF
 YjopdAL9J231pLt727/e3gbWZMupS6qXB21hcwAIVTCpl21VsA77j1x1lq+okSvAYIYK
 X0LqTbq+96KJsOiDRkyyTrqZj5Z7VjjXPNXH2J947K2s/MYkXZeksT0G+w4/3kIYYQ/9
 +ffkhZvyAwQi+xTNBM9t53QK8BGrTi3r65m6JhF10HKO690QQUz3lQFygCv4wqCFYyBD
 X7lZQewvvtcq6rzBmbm8Zzy0IRMJ3r1+eyC4XAIa8LP6ng4brv7ZhuE8I/9prtCW6qJW
 7gKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwDR4njCPEN7QU30j/YxbXE+41rYyeGSWCi3f6naLU66xQ0KOPQcy1m0A34Y56qTk+3GYOvfbd6wKFhxAVtv9Y2VEM3UNR0w==
X-Gm-Message-State: AOJu0Ywu1CoiyXjerQPTgoy5MndslAegMrpHJMZl9aAb4TraskphP6b7
 SXaCFIofPHXatHWJqIg43lMMPQw3JpEHoVtDaHBJz2VTwjjM6wBX
X-Google-Smtp-Source: AGHT+IEDVylOlsrmHBAoZAM1p5oHEdeMQccLpI67cfu29BKtRGx1Stw9o774FEcA20M/4aYaxFuQ7w==
X-Received: by 2002:a05:6e02:219a:b0:397:75a:39b9 with SMTP id
 e9e14a558f8ab-39707697d0cmr34055685ab.16.1721357730426; 
 Thu, 18 Jul 2024 19:55:30 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff56e7adsm242954b3a.102.2024.07.18.19.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 19:55:29 -0700 (PDT)
Message-ID: <2ea94197-d2f9-4e01-b138-c28e9cab8c13@gmail.com>
Date: Thu, 18 Jul 2024 19:55:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
 <20240717235322.5f90b271@windsurf>
 <57bbc792-5d28-4f2d-b33f-f0735c31fbae@gmail.com>
 <20240718220557.189b6f22@windsurf>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240718220557.189b6f22@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721357730; x=1721962530; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RCGOznLCGcoKG3oRuT6ayrrnQs9WI3z0UjsoUzIL0FI=;
 b=UXbrFRo52QfqltpOHtUkgolev/wiNnST9gK0dXdtfjYb2q/kZC0BHAdpg0vftx9fgq
 oRLU0FPv7dg7ynEvTAAmhNLqgkerTuRCBVVuxTx9IHK68I6WngA1j+zewPpGzyuuKFex
 Kpy9uKnoUzbKlLMPqR72faZ5eOssl6wFXJ/Aq0B4B4lHfpZiJEhZMN5C53J0FFhVwYCz
 ReIuM4mxrQEhk+tXZoLD6EVngl+7i5a5D2OxROVCJJ1fjCdTGHQv5UWdA3HUJMzoNIoW
 L/+k8HMZ9Sedgwqf+UdWSzz878GnPmjGqvVOXM8wvOz/nE1X26DcxdyH/pU36Xvlmknz
 Yuxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UXbrFRo5
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
Cc: "Karicheri, Murali" <Murali.Karicheri@sandc.com>, "Karicheri,
 Murali via buildroot" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 7/18/2024 1:05 PM, Thomas Petazzoni wrote:
> Hello Florian,
> 
> On Wed, 17 Jul 2024 15:06:50 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> This is not happening with a defconfig, however it is currently
>> happening after refreshing my existing .config file:
>>
>> https://gist.github.com/ffainelli/8fe7988c86ee8a3016b893268b9a2f49
> 
> For me, this configuration builds fine. Or more precisely:
> host-gcc-final builds fine, several target packages are built OK, but
> it fails when building the Linux kernel, because
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5.14" doesn't work, it should be
> v5.14.

Good point, not really an issue here because I have a local.mk 
overriding the Linux sources but I will go fix it anyway.

> 
> But clearly, I don't hit the <scsi/scsi.h> issue. Are you sure you can
> reproduce with this configuration? If so, on which host distro (even
> though I don't really see how this could be related to the host system,
> but who knows)?

Thanks for taking a look! I can reproduce it consistently from an 
incremental build. Distribution is Ubuntu 22.04.4. 
/usr/include/scsi/scsi.h is present and valid, so I am not too sure yet 
why this happening, I will try to investigate over the weekend.
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
