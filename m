Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8473C19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 12:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F8F040AF4;
	Thu,  4 Aug 2022 12:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F8F040AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sh4QDfTa_ZM; Thu,  4 Aug 2022 12:43:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230C240ACE;
	Thu,  4 Aug 2022 12:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230C240ACE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB53D1BF9CB
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 12:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36A440ACE
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 12:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C36A440ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AA7F__C2XAQa for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 12:43:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA3F40407
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDA3F40407
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 12:43:46 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D6C795C0A73;
 Thu,  4 Aug 2022 14:43:44 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 04 Aug 2022 14:43:44 +0200
From: Stefan Agner <stefan@agner.ch>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
In-Reply-To: <20220625175355.GF2608@scaer>
References: <82b5bbe664c06c5864debb660850e0cf@agner.ch>
 <20220625175355.GF2608@scaer>
Message-ID: <7cbe82b8824b1ef02000e683ddf2d556@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1659617024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phxM0DfDoVqXBWbwop+Z0a81yPB3wcuna4+Cnfqpddw=;
 b=nwJDces53fN7qNPlLtsAesHevn/FdzBKKIv6Szp+Xn+a/4HkIJe6G8+h33UhqxvZmJ8puN
 xQz3y7sMpCMSC9u6oE3yC8ViMlDiE36cfBvLNkji8PSkDvwcLyaluf1xgQQbuWmGYtELbq
 fb+omx7NuTTWVzxPP/J1AWEzb7DzmZk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=nwJDces5
Subject: Re: [Buildroot] Build error when building two GRUB2 configurations
 (race condition)
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
Cc: kory.maincent@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-06-25 19:53, Yann E. MORIN wrote:
> Stefan, All,
> 
> On 2022-06-25 09:44 -0700, Stefan Agner spake thusly:
>> In Home Assistant OS we use the capability to build two GRUB2 binaries
>> by enabling these two configurations:
>>
>> BR2_TARGET_GRUB2_I386_EFI=y
>> BR2_TARGET_GRUB2_X86_64_EFI=y
>>
>> Every now and then a from scratch build seems to fail with the following
>> error:
>>
>> config.status: creating config-util.h
>> In file included from ../include/grub/disk.h:***,
>>                  from ../include/grub/file.h:26,
>>                  from ../grub-core/kern/emu/hostfs.c:23:
>> ./config.h:38:10: fatal error: ./config-util.h: No such file or
>> directory
>>    38 | #include <config-util.h>
>>       |          ^~~~~~~~~~~~~~~
>> compilation terminated.
> 
> I had the same issue even with a single grub2 config enabled. This is a
> grub2 issue, and it was supposedly fixed with upstream commit
> 42f4054faf3c (Makefile: Make libgrub.pp depend on config-util.h) and we
> do have this patch backported as:
> boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch

I've tracked this down today.

It seems a very similar fix is required for grub_fstest.pp. I sent a
patch upstream to the GRUB mailing list and to the buildroot mailing
list:
https://lists.buildroot.org/pipermail/buildroot/2022-August/648479.html

--
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
