Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACE2C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 09:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3358840448;
	Thu, 11 Jul 2024 09:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTAtlxEURyeM; Thu, 11 Jul 2024 09:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5EE64049D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5EE64049D;
	Thu, 11 Jul 2024 09:51:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C59E31BF574
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE4694167C
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HBAx_P1WaRZ for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 09:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AB2C4167A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB2C4167A
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AB2C4167A
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 09:51:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so323898f8f.0
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 02:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720691474; x=1721296274;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7tdUUcsCElFtFNih6k9Zb73mSKHaKn1U1N9JaFoLMSs=;
 b=v1nGn2cElDBFX0AdFjEY7lzwWo4W53lessmXt9oRaYJUJQv2IcQ46A4Ptgowb5q2Ae
 9LKVttjyRobCKsP9SQY4761gxBFtWixr5+d5AlqzLnm8P9SN9u99wHvq4H/pQHZvbr7/
 Z62i0HVtMIY6FCJKNoDWNx9/LwutKQU7RlJlbKVKKdVqGtPODT8zIbbEfsDpn6zQgA/3
 9xNOL0OUH4aF7SWYKB9Js/iDSQf6pNX/hu3xZTCphXGgoR4ZTlEZP6tVJdHD58Aim9V+
 k06BI7URZlUf4FgSGP7rnewLSvOS3N9EKxNS/bnRbQur6rKMESEIGzcQboRHi7mfDTtY
 rWvw==
X-Gm-Message-State: AOJu0YwjJDyA51gaa+o/pzHiQkGcyKqdjkoYi8r+1EYT0EW3BW3Kt6CK
 Zc0VYoU3B+MqRVBXNJa7+eCrzwavxrvDU3kZmVjYR3HbcLCh6ZU+F3O4LPPQA6OZxmpJe9r38ai
 Y
X-Google-Smtp-Source: AGHT+IEDUa0St36fi9F4189/RSHAyGUhDK4jXeZjXXSolfxBf5KaKUcZM/Flgmppt3BjMcGgxg2hEg==
X-Received: by 2002:a5d:4e12:0:b0:366:e1a6:3386 with SMTP id
 ffacd0b85a97d-367ceacaa9fmr5032498f8f.44.1720691474222; 
 Thu, 11 Jul 2024 02:51:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde891d9sm7345098f8f.65.2024.07.11.02.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 02:51:13 -0700 (PDT)
Message-ID: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
Date: Thu, 11 Jul 2024 11:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240711070525.1406612-1-dario.binacchi@amarulasolutions.com>
 <20240711105200.292f5783@windsurf>
Content-Language: en-GB
In-Reply-To: <20240711105200.292f5783@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720691474; x=1721296274; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7tdUUcsCElFtFNih6k9Zb73mSKHaKn1U1N9JaFoLMSs=;
 b=RU3I1xhpRh16ykwolLzdtb7sDWlVs0eW1M/tKL2b3vxeJ6IQwPpjn8xKSBEmZ14lSK
 8bbX897psuumAgUaIAnvaO5TXsIXOnxtbGKGmydEr+maXbqBD6VuHU/7TQDJmbN5WMTM
 swHj//ezf5on7G1ZdLsVNpGX92dzQ3jZaD+0ljteHlrx1PTmP2X5KIUc8sGjkMEGZ1e5
 aLpTH12MnR1ae1CVUXBMGMsybYATmZJe6bE0rKGRVgbYsVIr/8pQG9YYIvD68OAmYWU1
 lo2d010pk72HHjq6MGfcmWEpye5zpIYQaFWL+us30f886BPNHpVCtK9KCctj/3z8p17l
 fFlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RU3I1xhp
Subject: Re: [Buildroot] [PATCH 1/1] package/sunxi-mali-utgard-driver: fix
 patch fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/2024 10:52, Thomas Petazzoni wrote:
> Hello,
> 
> +Arnout in Cc.
> 
> On Thu, 11 Jul 2024 09:05:25 +0200
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> 
>> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
>> fuzz factor to 0") reduced the fuzz factor.
>>
>> Due to this change, sunxi-mali-utgard-driver fails to build with output:
>>
>>      - r6p2:
>>
>>          Applying 0018-mali-support-building-against-4.20.patch using series:
>> 	patching file src/devicedrv/mali/linux/mali_kernel_linux.c
>> 	Hunk #1 succeeded at 1125 (offset 193 lines).
>> 	patching file src/devicedrv/mali/linux/mali_kernel_linux.h
>> 	Hunk #1 FAILED at 16.
>> 	Hunk #2 succeeded at 33 (offset 5 lines).
>> 	1 out of 2 hunks FAILED -- saving rejects to file src/devicedrv/mali/linux/mali_kernel_linux.h.rej
>>
>>      -r8p1:
>>
>> 	Applying r6p2/0013-mali-support-building-against-4.15.patch using series:
>> 	patching file src/devicedrv/mali/common/mali_control_timer.c
>> 	patching file src/devicedrv/mali/common/mali_group.c
>> 	Hunk #2 FAILED at 1768.
>> 	1 out of 2 hunks FAILED -- saving rejects to file src/devicedrv/mali/common/mali_group.c.rej
>> 	patching file src/devicedrv/mali/common/mali_osk_types.h
>> 	patching file src/devicedrv/mali/linux/mali_memory_os_alloc.c
>> 	Hunk #1 succeeded at 202 (offset -2 lines).
>> 	patching file src/devicedrv/mali/linux/mali_osk_timers.c
>>
>> 	Applying 0020-mali-support-building-against-4.17.patch using series:
>> 	patching file src/devicedrv/mali/linux/mali_memory.c
>> 	Hunk #1 FAILED at 57.
>> 	1 out of 1 hunk FAILED -- saving rejects to file src/devicedrv/mali/linux/mali_memory.c.rej
>>
>> This commit fixes the driver patches on the current package version.
>>
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> ---
>>   ...he-patches-to-be-applied-with-fuzz-0.patch | 317 ++++++++++++++++++
>>   1 file changed, 317 insertions(+)
>>   create mode 100644 package/sunxi-mali-utgard-driver/0002-Update-the-patches-to-be-applied-with-fuzz-0.patch
> 
> Thanks for the patch, but I'm not entirely sure that's how we want to
> fix this issue. Indeed, apply-patches is used in quite a lot of
> packages to apply patches from Debian. Do we want to fix all those
> patches, like you did for the sunxi-mali-utgard-driver? I'm not sure.

  AFAIK, Debian patches should apply without fuzz (unless we do stupid stuff 
like applying our own patches first).

  I think this is the only case where we are downloading patches that have 
incorrect fuzz - or did you encounter any other case, Dario?

  And in this specific case, upstream is Giulio, so I expect that the PR will be 
accepted soon and we can simply bump.

> So in the end, I'm wondering if apply-patches.sh shouldn't take an
> argument that specifies whether we accept fuzz or not. We shouldn't
> accept fuzz for patches provided by Buildroot itself, but perhaps we
> should keep accepting fuzz for patches that are not part of Buildroot.

  I agree, but only if we actually encounter a situation where this is the case. 
Note that the implementation will not be super trivial (will require something 
like FOO_APPLY_PATCHES_FUZZ).


  Regards,
  Arnout

> Arnout, since you accepted the patch changing the apply-patches.sh
> behavior, what is your opinion on this?
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
