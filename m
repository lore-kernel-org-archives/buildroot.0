Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A460C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B819381158;
	Sat, 29 Mar 2025 10:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skFXLk2VI-Bp; Sat, 29 Mar 2025 10:13:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E70A084729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70A084729;
	Sat, 29 Mar 2025 10:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A0AD19C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5446D4060C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJXcVV0GBLJA for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:13:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 551254018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 551254018F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 551254018F
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:13:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3E610B00585;
 Sat, 29 Mar 2025 11:13:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44288])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Mar 2025 11:13:13 +0100
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 11:13:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Nayabbasha.Sayed@microchip.com
In-Reply-To: <20250327164913.13610-1-ps.report@gmx.net>
References: <20250327164913.13610-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <d098b74024e6045a033f0b09f47dfa82@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743243197;
 bh=aq5hFSYK8wILx6GreSMhzcBCV9K6KNTWz3eU2f5t+OM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mcscOeRBa0by2cTYPWp1MilYeu1JEGd+xWkIWxHV1lkbcJ5P+A1pky8MTdBwQ+pH0
 KdixNyrr/LSJFgZhS0+pb/MleiApSFA17nYA5lXDDE7Az3uu30s/zxoira3rAYcpSW
 5kLun1Y0Y3szaMOodVCDYLoTDv8t6gmRC3pfGBX9va6JUI1IbofK3mUGfQCbIKsyy/
 yvUB7DA74AG0M2Yb+WUxgOhsRd0HN7qwHQV0u4grh61BLrx0mj/aDMA32a9FPRnfRf
 r2su1thoViqF9e4xAymDK/JER0xksIlFUZRVqixa3EACDIrJp2+FwuRywl5DNx6/r4
 nK0xYwzSc6e/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mcscOeRB
Subject: Re: [Buildroot] [PATCH v1] package/v4l2loopback: fix
 v4l2loopback-ctl compile/install
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

On 27/03/2025 17:49, Peter Seiderer via buildroot wrote:
> Since upstream commit [1] the original v4l2loopback-ctl bash script was
> replaced by a C version, so add a proper compile step (and remove bash
> runtime dependency) to fix '[help] v4l2loopback package build fails for
> raspberrypi5' [2].
> 
> Fixes:
> 
>   /usr/bin/install: cannot stat
>   '.../build/v4l2loopback-0.13.2/utils/v4l2loopback-ctl':
>   No such file or directory
> 
> [1] 
> https://github.com/v4l2loopback/v4l2loopback/commit/33922fa4e9965d400edcc2761e55fedf84bbb22a
> [2] 
> https://lists.busybox.net/pipermail/buildroot/2025-March/775911.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
