Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D70E95398
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A62DA605F0;
	Wed,  4 Feb 2026 12:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xfso_wCXQkR5; Wed,  4 Feb 2026 12:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A671860607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770208989;
	bh=Qm/AX7vVG2dGmCxBHKvrGZcdM++3Exd0osvBUlNGUHE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nRQJl1uirZuOSUkHekXR6jIvRW85ZpJTKnzNZn9Ic1H0IwjK80UBWutpqa0HL0HZj
	 t5kOJdErIMozdnMk77SmZdTK/1gHAUgWxlbRj8E9cB7WLsePAhzVk54+xkR1N0Jrnj
	 bQ2wZADHNnf54U+crHdDRFfa4qMm1/Q+16ov3c+pUcd7XrMZXb91lClNJZYK5xxpt3
	 Ur2MChIGOaF9ImBKjyx8WAUgPMcp3ZpqhuywgQEprlQqPiMuW6JP57VYGKzltI3iiJ
	 /Zb3jbsEmkJ0hlh7ebLzaSmQwCq2bYO2UfTTgPmchI0aPGJooHIo5C2pHCBa+EMqKn
	 CxfYPlio+DAyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A671860607;
	Wed,  4 Feb 2026 12:43:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BF9CF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB15D40363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvrtlYTFFv4H for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F184F400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F184F400FB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F184F400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:43:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9B7131A2BE2;
 Wed,  4 Feb 2026 12:43:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67EDC60745;
 Wed,  4 Feb 2026 12:43:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74586119A865B; Wed,  4 Feb 2026 13:43:02 +0100 (CET)
Date: Wed, 4 Feb 2026 13:43:01 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <aYM92EGh_q3ThFyU@windsurf>
References: <20251226181215.6817-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226181215.6817-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770208983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=BHnxgxOpmvWH0aAnHUBG7ZPdfnNWVwPBFozrcYEqMuo=;
 b=ePadwfSJt9JrVn4PVaCVUzVlTeNuy+9EBrbgUVCQk1Fv4yHhptqahssAVloQdPzfumdSPW
 IPLwO241giOKmpdckTI2zlXWpvmbMQjxoj4cIM6XKeOR0mt7hMeTNQtL6ayqSrNxECYS/h
 TpcDud4r24OVzJ6zyZI7M0AJp2AeBe5T3hCHSJrXPAL2uJCV972qOY0V5PL2+uE1dnb0fk
 1gshRaK5UsGS7foyy50fXuFnrr73asLbdmBYDal8PwXr2R6KoMSsGAGGhlQjuXaJ18RO4N
 uYmY/w9HN07AfaK4l2NDJIcYQZNGM03QzPSVmSMaOy58LBZqXYKKsUPGqXGbIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ePadwfSJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libbsd: fix build with uclibc
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

Hello Dario,

On Fri, Dec 26, 2025 at 07:12:15PM +0100, Dario Binacchi wrote:
> Building the package with uClibc raises the following error:
> 
>   Configure: error: unknown ABI selection for time_macros
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thanks for the patch. However, the upstream feedback was that your
patch wasn't quite correct. So I took upstream's feedback into
account, created a new patch and a new merge request.

Aside from that, your Buildroot message was missing some important
information: since when the problem was happening, and a reference to
the autobuilder issues being fixed.

The final commit is:

  https://gitlab.com/buildroot.org/buildroot/-/commit/c0fd48dc2651a8c60ca82bef760670b3a62ab621

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
