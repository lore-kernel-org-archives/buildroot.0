Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF990CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 09:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D61D60A88;
	Tue, 19 Aug 2025 09:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQ7ao-Whc714; Tue, 19 Aug 2025 09:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E26608DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E26608DF;
	Tue, 19 Aug 2025 09:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0785DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2569811A0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCs6UF5c6mwm for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 09:23:44 +0000 (UTC)
X-Greylist: delayed 516 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 Aug 2025 09:23:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 212988119C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 212988119C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org;
 receiver=<UNKNOWN> 
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 212988119C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 24A9F5C5C36;
 Tue, 19 Aug 2025 09:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78403C4CEF1;
 Tue, 19 Aug 2025 09:15:06 +0000 (UTC)
Message-ID: <aeed8205-7958-4442-9a58-bcba289e4971@kernel.org>
Date: Tue, 19 Aug 2025 18:15:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250819075441.3288414-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250819075441.3288414-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1755594906;
 bh=mSaI8AHxl+aTWCyoea3HZV3/QzFiLjS6AX4RrGD03lo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=qXVv+hx2sT0TyWYxbl2aBAV/M3yPtdeAvMli0Ahqxkd+s95uGUrnkB7wmFD0wOliw
 PHvVeEUgtEXZNcsYJcziOGskyA9wEtdR8lQlQKrrK6Sp6na07MFZ+Xh34MHU7w6ymv
 05fCNDds8VcDdacqB4sjJzJMbh8GCILPSVca6Xw61DmCWluLL2zWlASWagQxXqzKNi
 YJt2uce7gfbplB+YqAmktK8DTgEBQ0dhBJqmg+DbcLn6BRvYQ/q/KkaBKQpB3BxYte
 ayC28GWSI53ozVmU0aTNUO2GgnQsM1dciICLujrpdpPIZiCuOIymXfZecgS4PUJwmb
 HPLhdRzgERzvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=qXVv+hx2
Subject: Re: [Buildroot] [PATCH] configs/{canaan_kd233,
 sipeed*}: use BR2_LINUX_KENREL_IMAGE_TARGET_NAME
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/19/25 16:54, Thomas Petazzoni wrote:
> Since commit cb4f11a6964902990ce774ff7144b24a1ffd635c ("linux: handle
> empty BR2_LINUX_KERNEL_IMAGE_TARGET_NAME situation"), we error out if
> BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y but
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is empty, which is exactly the case
> of the RISC-V configurations being fixed by this commit.
> 
> They define the BR2_LINUX_KERNEL_IMAGE_NAME variable, but not
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME, while BR2_LINUX_KERNEL_IMAGE_NAME
> will automatically default to BR2_LINUX_KERNEL_IMAGE_TARGET_NAME if
> BR2_LINUX_KERNEL_IMAGE_NAME is not provided.
> 
> It probably used to work because specifying an empty make target was
> generating the right images, and they did have the name specified in
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME. But with the additional check
> added in cb4f11a6964902990ce774ff7144b24a1ffd635c this scenario is no
> longer supported.
> 
> Fixes:
> 
>               canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273088
>            sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771237
>     sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771342
>           sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771387
>    sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771472
>             sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771505
>      sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771581
>           sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771663
>    sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771885
> 
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks for fixing this !

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
