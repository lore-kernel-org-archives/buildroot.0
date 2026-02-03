Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4D1E6E7EE
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E08E83705;
	Tue,  3 Feb 2026 10:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pumQMons1ZUn; Tue,  3 Feb 2026 10:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6428398E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115085;
	bh=iiuptLiY58bPPZpdjS/MQQNKXRmyE3W/h4gI5LcFf0Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EaVf7xuZ6ZxAxWhP5jVzITfylSN8BxW8QdfIvfpkLMJzlclrQb/oLkrDMz9SFonAY
	 2gdr1WNCBxXT+0Vdv22SlAyf0dBMrzbpuTotHNoMlQdkspTPUfBCXIaiE6xjBcAtqX
	 0nWDdR/YZHMOJt98lrrzgo+Irqh53FGrf6cOOvBwMlJi8dSxl6GKQSPE0NbkepX7UT
	 TcJuiLrvTvB5/aM2NtxBmWg95ZmEevc+1pwkO/YRV868zStf+uXAMGZC9/D9JRHDyk
	 43bErZz52G6xfLIFtqkQ/dxgMmhPAHUckP/98elINhFKEiE5MFaFRcnSaDrPDYS5x2
	 LKcw4HA9/uyqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6428398E;
	Tue,  3 Feb 2026 10:38:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0329F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE08440DF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pis2xFx8k26T for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6DB640DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6DB640DC6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6DB640DC6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:38:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9057F4E423E2;
 Tue,  3 Feb 2026 10:37:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5551860728;
 Tue,  3 Feb 2026 10:37:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AB42119A8888; Tue,  3 Feb 2026 11:37:56 +0100 (CET)
Date: Tue, 3 Feb 2026 11:37:55 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <aYHP9JNuQBzdwplw@windsurf>
References: <20260203080416.6451-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203080416.6451-1-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770115078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=QheltC3imWTFj5+d1TMHFChxhA5zxSpTTIeU77PwCQM=;
 b=ohDYCpr826F0OAGG9E1N7Bb8BKkvIO+ILgF6wtP1HGrOOHmjiB88yU/y8+p7/sU+iMZjB9
 ZucBwi+uFyUsrVbY1/LYJ3sUcMZrXiFNjvMFtagFgmLaQrvSRZOqfVHed/PolmB7Gi9p0S
 MR06dxdYNeSW559EP7rcV/L/6S3K6US1tzF+l6Xae+/kyk7Z3R7rp9FD4o4JA4/7xfTJWR
 5DvsuDZQoMnxTr6VjVMuaqjLB5FIJjtlLOtJO1Nlnjva8WB1mDonqOoEKNOcJGyoM3kXMq
 0niNq1i6PqXZD/Z07+fAqEluRqG5E+TAr0JZ8qHzo+ULJZoMwkQswdJBFXpE+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ohDYCpr8
Subject: Re: [Buildroot] [PATCH] package/depot-tools: fix python 3.14 support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 03, 2026 at 09:04:16AM +0100, Romain Naour via buildroot wrote:
> Backport a fix to support python 3.14 [1].
> 
> depot-tools is used to build flutter package but it doesn't run due to
> deprecated ast.Str et al. (since Py3.8) that was removed from python
> 3.14.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797062
> 
> [1] https://chromium.googlesource.com/chromium/tools/depot_tools/+/80d6ca1b1ac55fbd9dd8f506417824591251b8eb
> 
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
