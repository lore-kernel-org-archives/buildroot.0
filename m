Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41808C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D47B7405C6;
	Thu, 30 Dec 2021 20:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVeVfz13EVaY; Thu, 30 Dec 2021 20:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCE04405C5;
	Thu, 30 Dec 2021 20:36:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2251BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DE0760C11
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fM3DpXPg3QpQ for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:36:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ED06606ED
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:36:41 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 32A9nNu8yLDgd32AAnrjk7; Thu, 30 Dec 2021 21:36:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640896598; bh=dqNJIMvF6n2qFVDiJCgUqzACpFEex0HgjvACOkTpslQ=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=BChj56e4LCUoqPQhZQIKwTY7VVyjXKbx1ZanGQpxss7VTuJ2iTXJ3ttKNH92EeVlQ
 Gm7Yx0Sg/WGVERhuoBoqbkXrtgVBKz3GCOxjUBmBmd/v2FBoKp/O6bg+fv/hHHt5/O
 2o9yGD4Ww2U18xrVRYa7ns+A7PUyFm9T1yupy5ttem+nNlChM8ADMIXbl/hFksVWO5
 ckYZCBY38CiEilJGf8SQPUVtCUVyKX8RA89bxq9SgoxbgscGwokyEPaIx8a9f1yZ+2
 iQzva1p0KwUsl1X8jxVsCEv8G6PYlqHsWjPewkwzUam1UWLmiz7a82horY7+OrErJs
 Luq+hTfb6ZdEQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-4-giulio.benetti@benettiengineering.com>
 <105b5335-044a-b800-2451-7c9edf6cf987@mind.be>
 <d6448805-9a07-0d5a-c527-60b42944de69@benettiengineering.com>
 <391ca4ef-c213-e972-ac15-4ff3e225bf87@benettiengineering.com>
Message-ID: <2267d428-2230-6881-3181-607123dd45da@benettiengineering.com>
Date: Thu, 30 Dec 2021 21:36:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <391ca4ef-c213-e972-ac15-4ff3e225bf87@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPL15iOxrau76dhGwiCiqcneFCYyua/+4IkyT9yP0zyTO+fQNurNB6vzpUCOnyLB16GBWQXfONtKTvntSaotgw7TyO+j8Kv6mC59ipSFJQSXLiI25X++
 B7dVelp0px2d+tQLKkIyPLCQ7ZQLGx11JReN35z0v2+LslbTbSguRslTfxs0laTXtM7GoZHuUjj+9RqJUYoGqviavkRKZqItmK7dLegJPCVvWu59SGJT2y1H
 WanSzBFGt21iBHJVtzXcYWEJIylJgQQWLCAl5dT8P/+sIvuBJkSZC8hHUJ9PRXcLWGBw06u4rhO5okyTRgcWJUTui/SPzBXLST7/XzbLrX0wC0UMIrO9cCMT
 oTPkL/ukwvuGQvMvpl1GNW+OxkZwbcStM+AbzR2aVL5phP6xPwGuAAkGKd5DoBC4Pml85vN4HyqNFBCBiOyCQVeV+meSJfIQwkNlZ+evR6B/TcdyeFY=
Subject: Re: [Buildroot] [PATCH v2 3/3] toolchain: remove binutils bug 21464
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/12/21 21:05, Giulio Benetti wrote:
> Hi Arnout, Thomas, All,
> 
> On 17/08/21 23:27, Giulio Benetti wrote:
>> Hi Arnout,
>>
>> On 8/17/21 11:11 PM, Arnout Vandecappelle wrote:
>>>
>>>
>>> On 27/07/2021 00:34, Giulio Benetti wrote:
>>>> This bug has been fixed upstream and backported to buildroot binutils
>>>> package. So let's remove it from toolchain/Config.in and from packages
>>>> that are affected by it:
>>>> - libgeos
>>>> - postgis
>>>> - protobuf
>>>
>>>     It's not clear to me if all the external toolchains that we use also have this
>>> patch already. Basically that boils down to the stable and bleeding edge bootlin
>>> toolchains.
>>>
>>>     Well, I'm pretty sure they're not yet updated, since they're still  2020.08-1...
>>
>> For this patch we have to wait until all or1k patches have been applied
>> to Bootlin toolchain and they got rebuilt and bumped.
>> Then we can apply it since Buildroot will become OpenRisc bug free. But
>> this depends on external OpenRisc toolchains that only Bootlin provide
> 
> Unfortunately libgeos is still affected by this bug and postgis too
> because it's its dependency. The reason is that libgeos has been bumped
> and I've never given a build after that.
> 
> Only protobuf has been fixed after rebuilding all Bootlin toolchains.
> So I will report upstream that is usually very responsive and ask to fix
> this binutils again, hopefully once for all.

I've updated the bug on the gcc side that works together with binutils 
on the fix:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99783

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
