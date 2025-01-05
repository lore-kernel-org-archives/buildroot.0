Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF831E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 11:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8C580BA1;
	Sun,  5 Jan 2025 11:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYBDFu9wmUtF; Sun,  5 Jan 2025 11:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871FC80BA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 871FC80BA3;
	Sun,  5 Jan 2025 11:41:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD310D92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9623340247
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGcATvS-zJyM for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 11:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85A8740003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A8740003
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85A8740003
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:41:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4FE9C2003C3;
 Sun,  5 Jan 2025 12:41:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49808])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jan 2025 12:41:04 +0100
MIME-Version: 1.0
Date: Sun, 05 Jan 2025 12:41:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250104214947.828041-1-thomas.petazzoni@bootlin.com>
References: <20250104214947.828041-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <564fa14cfb8ef87669eb32f1f2eddcf8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736077265;
 bh=uQ50njvWf5aZJGCItupzIm9syX8ECz2wbBP0qkcoQqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KtkCw8iWy2+DuRGGAEoM2VUz9CMySF8f8Ypv9ftXPqKwEsdUPwnLkhvQXppQ70xHm
 S0P8gG8X8a1Z31CmbmXWuyxZC6Yg4ddLXgx/vHRfCrX0CQmlWCGecoabutPlTeDw7s
 PEPMoRjqCI3d1HP7CAeuXIKCGG2C7jJeTRd9mFg68e0EasI8sjxxyDBDdQiyNwloQY
 2E7s6Y4UCj506F08V0WGvNvq3yO/1YRXIki0hiZpB/NaAFfrVCmR39Lv9OUYDoKxv3
 Q81kbwwHndOJeyWw01QnGrdFhvw4AaXjbOW0G1Cm4CNwj45/L9S88HNQWFIRWmBFwr
 4TaYVyylwn9sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KtkCw8iW
Subject: Re: [Buildroot] [PATCH] package/gobject-introspection: disable on
 Microblaze
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

On 04/01/2025 22:49, Thomas Petazzoni via buildroot wrote:
> The build of GOI on Microblaze fails as qemu-user hangs forver when
> running the GOI programs. Considering how small Microblaze targets
> are, the use-case for GOI is very small if not inexistant, and it's
> unlikely anybody is ever going to debug this, so just disable GOI on
> Microblaze.
> 
> This issue is causing timeouts in the autobuilders on a regular basis:
> 
>   
> http://autobuild.buildroot.net/?status=TIMEOUT&reason=gobject-introspection%
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/f8e5ef74478c63c89e7b99fb928b97ac4518f943/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
