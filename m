Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E533CCD4F24
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 10:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1059F6112C;
	Wed, 13 May 2026 10:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-k-6mKwLrDw; Wed, 13 May 2026 10:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF0E61123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778666910;
	bh=+rP+oompEYZLPLjdVyFKvFGcxV2L9s+c7RGmiThRJX4=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VEZhu2SU7CX1Ow/i8ypclymBmB+RJIDCZlwyz1pFtsorO1+4HgH2/hCM7MA1CUhlf
	 yhDzBGiriXk2wVGKp8qXiKTsEyHUSHmiqTXEOJYXo1amf7GDyobiKceiLY5GKj45aY
	 Zy9S6CrAXXZHexuzPBlPZFkJUaRutBtMesMRTCYNgPZ3IbceudVxhHxcDUShmn+QlM
	 UWXKNXnyMZRRq5z9vVP2aEHHEx+77PfkItYxb12czZQHnI6rrn8Wr1cvxpZBfaqd9a
	 rAE0nVmSkaEvbHKacGaS968i9xMZhZAr130RCqwfBXpOU2FE3z80HyS1TeMz+/v/t0
	 y3fsgodtm9U9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF0E61123;
	Wed, 13 May 2026 10:08:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD15715F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE40C4096D
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CvqiO5ex4KM for <buildroot@buildroot.org>;
 Wed, 13 May 2026 10:08:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0BBBC40441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BBBC40441
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BBBC40441
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:08:26 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id 0E7D3440F5B;
 Wed, 13 May 2026 13:07:33 +0300 (IDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Joseph Kogut <joseph@anodize.com>,  buildroot@buildroot.org,  Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <f40ce0c6-0441-4aa0-91a6-fe80a66b2821@gmx.de> (Fiona Klute's
 message of "Wed, 13 May 2026 12:02:22 +0200")
References: <20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com>
 <87tsscyngb.fsf@tarshish>
 <f40ce0c6-0441-4aa0-91a6-fe80a66b2821@gmx.de>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 13 May 2026 13:08:00 +0300
Message-ID: <877bp7zkov.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1778666854;
 bh=4eXGejCFCeiXmfuwYgFS9JestGNI47B9Og/VmXJ2LpE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f2lqfRCzO6AEMkRrzeJKb1BJ/uGsKpLO0Y4+5IYEKuM5LmjCiD4BJlRW5sgQ9n0a4
 K1pWN8E9FB1cDGJrysxSs+c9xB8GMwQkXdUXomcUz9aiSiuCRRYbQQgpXYUxuEz/nv
 +yIl/JvJwu0DfO0Pv6Mgiawez/1Kjo9l8f2xDuqPHbINU8vLGHmGMw9iktp3HaZid7
 0S0o32BVOtjHniAAfJTI5FT+2nLrY1Z6W5PqPKQDTnWvkGkSkyaV3DXo8bxpHHytn9
 fKGDi5VwZOFiawWCh2n3qtUrN12+ELm+LXqsNjuG+wBqJ+08cgEuG/DPsmy2HSZpSs
 Cm3Oe4NM4laNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=f2lqfRCz
Subject: Re: [Buildroot] [PATCH RESEND] package/qemu: bump to version 11.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On Wed, May 13 2026, Fiona Klute wrote:
> Am 13.05.26 um 05:53 schrieb Baruch Siach via buildroot:
>> On Tue, May 12 2026, Joseph Kogut wrote:
>>> Changelog:
>>> https://wiki.qemu.org/ChangeLog/11.0
>>>
>>> Note:
>>>    Support for all 32-bit host systems has been removed.
>>>
>>> Signed-off-by: Joseph Kogut <joseph@anodize.com>
>>> ---
>>>   package/qemu/Config.in | 5 +----
>>>   package/qemu/qemu.hash | 2 +-
>>>   package/qemu/qemu.mk   | 2 +-
>>>   3 files changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
>>> index 0b16c8c284..c735381b4b 100644
>>> --- a/package/qemu/Config.in
>>> +++ b/package/qemu/Config.in
>>> @@ -1,11 +1,8 @@
>>>   config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>>>   	bool
>>>   	# Only tested on these architectures
>>> +	default n if !BR2_ARCH_IS_64
>>>   	default y if BR2_aarch64
>>> -	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
>>> -	default y if BR2_i386
>>> -	default y if BR2_mips
>>> -	default y if BR2_mipsel
>> qemu 11 dropped 32-bit host support as you mentioned in commit log. But
>> this config symbol indicates target support. qemu changelog does not
>> mention removal of all 32-bit targets.
>
> This is for building Qemu for the (Buildroot) target system though. That makes
> the Buildroot target the (Qemu) host (VMs running on the target), so it's
> affected by Qemu dropping 32-bit host support. The Buildroot host-qemu
> shouldn't be, unless someone is building on a 32-bit system (seems unlikely).

Thanks. I missed that part. I guess the commit log should explain this
host vs target complexity.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
