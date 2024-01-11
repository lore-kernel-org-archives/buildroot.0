Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC911C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 14:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450B661B14;
	Thu, 11 Jan 2024 14:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 450B661B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jk40Oynpg03l; Thu, 11 Jan 2024 14:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AA160A6B;
	Thu, 11 Jan 2024 14:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AA160A6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B201C1BF2A6
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 14:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B300417BB
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 14:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B300417BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owsNK-11y8lh for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 14:09:05 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2F504109B
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 14:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F504109B
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-557a3ce9942so5639820a12.1
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704982142; x=1705586942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=awxOQR2qBtYp6XZMwzwJBtFLPYBXFjiRISm2GefFiIk=;
 b=oXEC5To6ui/KGfdp8I/8pX+qcqd571sU+gL3jBODqU7u9wIqbVzNSdkr+4GvYZ1Ih9
 73CUpen/zV2EtzHbV/zwJd5QYgWRQOxP83hHC4t2d2bIeShZLK6lvT7EP+b5WXbfJlx9
 KmvbAIAMJ/OENs6X/PjmUmj+sOf7THpPUFW3EFEcbaKVihALMrSzZO3EqNPNJR0hzB0p
 mcT7Vj3+g5CYtdFJLlaRep/DIL7tYccw0anIpqI8970piBlFCv8ZdUUxpsZsUs/q63ou
 JxBSBuaV61xfR5jRUT/q9jhuYZ3Qrr659e6IvtBEmxTEv+YbOS1a+wqGE6CFcIwhKYm2
 nQ0w==
X-Gm-Message-State: AOJu0Yzj7TTEPOkfcQurwo027p+X330+n6/wHWPLgvDMnUla0OVH349G
 uOqZGr4vg2wrhAi4w3C2icx80PKeL/Nhbg==
X-Google-Smtp-Source: AGHT+IEj+gs6Z4AMM/vgkL7YSR4mTFhvG9Eg8i7c2mzUWWcEAHEXGFFG4K5ZzGP5uwGv12v21ngg0g==
X-Received: by 2002:aa7:c550:0:b0:558:40b:5c71 with SMTP id
 s16-20020aa7c550000000b00558040b5c71mr413281edr.81.1704982142479; 
 Thu, 11 Jan 2024 06:09:02 -0800 (PST)
Received: from [10.1.0.188] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 fj23-20020a0564022b9700b00557f54cceb6sm655694edb.4.2024.01.11.06.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:09:01 -0800 (PST)
Message-ID: <c67d1094-05c2-4f12-a5f9-f30c32844f5a@mind.be>
Date: Thu, 11 Jan 2024 15:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
 <20231225111537.7d46ac11@windsurf>
In-Reply-To: <20231225111537.7d46ac11@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1704982142; x=1705586942; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=awxOQR2qBtYp6XZMwzwJBtFLPYBXFjiRISm2GefFiIk=;
 b=ciKdbRWRC2UOmmiX55r+4I5tB0jpgPNC1BmUvSVmj61IzTb0zPEs5RFI9n+4mqQVQ7
 fziILO8lgGHt+Mt7IovCgNQoCeGTfZyy40fOq0R/ly0x3mK8rXCZsSCChlhJO1iLeBTS
 Msy7kwmcQIn3ArdEQhkT/LZAeVpqrlRMEHFaexiwMW9gsTZqwdNZzVQQaljEYTW/JKMJ
 Hbd+tGCCWiuvX5QrYXvXCs6uJ7+5v6smy9bw5Ikm6C+RX8tn2lGn5ecH9cyza81COmG/
 4jEeC17tgctHjLHse6z6tzQjdBO3zMsjf5xI5CYSeOiha+RUEQ/HDfY6KcYzFWzB2Kj0
 gwmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ciKdbRWR
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 BR2_TIME_BITS_64
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/12/2023 11:15, Thomas Petazzoni wrote:
> On Thu, 30 Nov 2023 20:13:05 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> This LFS workaround for glibc < 2.23 was added in 2016 by commit
>> ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not needed
>> anymore as glibc 2.23 was released in February 2016:
>> https://sourceware.org/glibc/wiki/Release/2.23
> 
> We still have in our external toolchains
> toolchain/toolchain-external/toolchain-external-codesourcery-arm/,
> which is a toolchain from 2014, and it uses glibc 2.18. So I suspect
> this change would break with this glibc toolchain. However, this older
> glibc toolchain will clearly not support 64-bit time_t.

  I'm in favour of removing that ancient toolchain.

  In fact, I don't think many of the external toolchains are still useful - 
other than the Bootlin toolchains of course.

> So either we decide that we stop supporting anything older than glibc
> 2.23, or we have to add some condition on the version of glibc being
> used.

  Yeah, I'm in favour of silently assuming that glibc is sufficiently recent. We 
already do that for uClibc BTW.



  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
