Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44615E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B1381355;
	Wed,  8 Jan 2025 21:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppfFdWa06q8A; Wed,  8 Jan 2025 21:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C613813CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C613813CA;
	Wed,  8 Jan 2025 21:33:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66EA57AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46E87401EC
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmm-3swV6XyB for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:33:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13657401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13657401D5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13657401D5
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:33:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2070316165; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:33:09 +0000 (UTC)
Message-ID: <6ffef3bf-1614-4a97-ab28-9afe68b0fbed@korsgaard.com>
Date: Wed, 8 Jan 2025 22:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>
References: <20250102210235.3386319-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250102210235.3386319-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Wbg/JGY6TxXaaj5lbtvJA0ob1/E/Y7JIumBuKyoZl2IRu2bm3W5Nk1ReI0IcsJuabavaNkEw8YpG59iiuHjt8RIx0CdwITbVPgBLXM8D4/VjvmrgoVMfS/nRVMmjK18T2CGT0v7lWiPhQQyNCq5PSlOuqXGFKKi1lh32O3DgGU/8KgqWph/m1z/5IQhjD5SHhedpzTQb5hKh+JiGFHYZtpgXmtwU3tFHPjhRiQ21uMS6GRzpB7XnJnUy+2CVqOn+piBoLp2KHv1UWEFXzZJY+90iaL8wqhX8b4VhYjeS1BKTaEyeNRCuT4SuT4u4fBqBTcJlgDdwIGMTMwnGxxwtHw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ADxH33ndqa3wPwDhmhz1ITjGk2s+hA48py1yGrD4dfo=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Wbg/JGY6
Subject: Re: [Buildroot] [PATCH] package/v4l2loopback: enable
 CONFIG_MEDIA_CAMERA_SUPPORT kernel option
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/2/25 22:02, Thomas Petazzoni via buildroot wrote:
> Setting CONFIG_VIDEO_DEV is no sufficient as drivers/media/Kconfig has
> some very convoluted logic to hide some options behind a
> CONFIG_MEDIA_SUPPORT_FILTER option, unless CONFIG_EXPERT is
> enabled. Due to this, several arch defconfigs don't have
> CONFIG_VIDEO_DEV enabled when doing $(call
> KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV).
> 
> To fix this, we enable one of the possible options that ensures
> CONFIG_VIDEO_DEV is enabled, and we've more or less arbitrarily chosen
> CONFIG_MEDIA_CAMERA_SUPPORT.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/2a337d29e7870564027bcd42bd0addd228eb6a24/
> 
> We've tried to track down which kernel version introduced this
> exactly, but it's been introduced a while ago and step by step making
> it difficult to pin-point which version version exactly introduced
> this. But the issue has been appearing for quite some time in the
> autobuilders, so it's clearly not a recent issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
