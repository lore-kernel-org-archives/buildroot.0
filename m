Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B64C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 16:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15AB540228;
	Sun, 26 May 2024 16:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHhY-7n8UoTE; Sun, 26 May 2024 16:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E0C40240
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E0C40240;
	Sun, 26 May 2024 16:40:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD9B01D1140
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 16:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A41C4044D
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 16:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9zLwTL9lPtu for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 16:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5245B40141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5245B40141
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5245B40141
 for <buildroot@buildroot.org>; Sun, 26 May 2024 16:39:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5203F78050E;
 Sun, 26 May 2024 18:39:52 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54768])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 May 2024 18:39:52 +0200
MIME-Version: 1.0
Date: Sun, 26 May 2024 18:39:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87bk4ukj8c.fsf@dell.be.48ers.dk>
References: <20240524190137.10761-1-ju.o@free.fr>
 <87bk4ukj8c.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.5
Message-ID: <f3d8318b54a36c65bd0996889830263a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716741594;
 bh=DRGA4OohsYVG18e1dC48M0RGKJ+ySXL5ss2w5W6GD2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l0qq/DTsSoE71754HQ2hAte7xfc6ZmVHnxwK/IossLHZGkgUHNLE+/GPauFu3q12a
 4EirvCLy1KySrFmtc8maN5ZvoNm2WHx0+dJ2L/vF3IEjRTB+BIFSvZg1GrQkZWy249
 4zb822N3RShIxV4LuKjwLuFLe+K0qU3cQpu3XxGqtVUOQkbsN3eeaEjFSmOI2WtCdA
 kjFDtfY0jpTz+Fmwk+DTaf99qNuBjfzZJIa+o+Up+HtqUwj9fnMOvh6jNwi8F16jMO
 CE0C0ua2dQFrXP6eNQZ8eXsIbGEWeQ8iqb2YjqFVurU3WI/77bUH3A+fvNcd05FdK7
 e5QZ2+drLvFrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=l0qq/DTs
Subject: Re: [Buildroot] [PATCH 1/1] configs/mx51evk: bump bsp components to
 fix build
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 24/05/2024 23:12, Peter Korsgaard wrote:
>>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
> 
>  > Since commit dc0f721 "package/gcc: switch to 13.x as default",
>  > mx51evk_defconfig is failing to build in Kernel (see [1]),
>  > with output:
> 
>  >     drivers/ata/libahci.c: In function 'ahci_led_store':
>  >     ././include/linux/compiler_types.h:315:45: error: call to 
> '__compiletime_assert_328' declared with attribute error: BUILD_BUG_ON 
> failed: sizeof(_s) > sizeof(long)
>  >       315 |         _compiletime_assert(condition, msg, 
> __compiletime_assert_, __COUNTER__)
>  >           |                                             ^
> 
>  > This commit fixes the issue by bumping the bsp components:
>  > - u-boot to v2024.04
>  > - kernel to v6.6.31
> 
>  > The Kernel DTS name is updated to reflect upstream reorganization.
> 
>  > The kernel commit fixing the build failure is [2], first included in
>  > v6.2. There is many other gcc-13 fixes.
> 
>  > While bumping components, this commit also enables
>  > BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add the relevant archive hash 
> files,
>  > and removes the defconfig entry in ".checkpackageignore".
> 
>  > Fixes: [1]
> 
>  > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688967
>  > [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f07788079f515ca4a681c5f595bdad19cfbd7b1d
> 
>  > Signed-off-by: Julien Olivain <ju.o@free.fr>
>  > ---
>  > Note: I did not tested the generated image on an actual board
>  > (I don't have access to it).
> 
> Then maybe it would be safer to just bump to 5.10.217 (the gcc13 issue
> has been backported as of 5.10.184)?

I'll send an updated patch bumping only the Kernel to v5.10.218.

> 
> You don't mention why you are bumping U-Boot, maybe it is to fix the
> compatibility issue with python-setuptools v69 (E.G. see commit
> 2e349be94a87db05d07d37bd44a923581bca43f3)?

The only reason for updating u-boot was to have refreshed version
alongside the Kernel. The old one was still building fine (since
it is not using Pylibfdt).

> 
> --
> Bye, Peter Korsgaard

If I manage to get my hands on an i.MX51 EVK, I'll send another
patch bumping major versions later.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
