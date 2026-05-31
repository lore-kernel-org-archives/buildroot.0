Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91D7CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A27184F06;
	Sun, 31 May 2026 06:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqgJCDjPl02u; Sun, 31 May 2026 06:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA9484EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780207615;
	bh=PCKgeokAWdhkw2tJ46gdjhQiki4Jdrc44x+V7hY0zn0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i924K7yLoQIHvfK3zTD4D8q6KwU4JuGm/rH1rMMNsYi1LK9NE9caUN4eAJivuxDIL
	 XoLUz14v3MjrPQ7nVacW9Ypl36IX9KLQtkwm/uKzlnWqL6VGJmGL4z5pqzpNXPUx9s
	 xUkt+ENW7/xgg6PzGu6SS/OK+o8qE2gbA8+cj2DkUUVd0S+Kpwysy9igLhOxEgcipy
	 wEQ/FPvofLY4nwqaS/f1yE41BgnuqpRc0M4Z4fBEOV2zJJIHb9qxaAsrIAFXVaASRh
	 ezubXR6+/ryZSarEx8/p60bFcRfkyDSVpQdK7F4CFu57hPS73eUpc789x0+JPB3Snf
	 Ozs6Pwzcmcm5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA9484EF3;
	Sun, 31 May 2026 06:06:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E05E1389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1C9C60F74
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXSetDowM0W2 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:06:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECD0660EF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD0660EF2
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECD0660EF2
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:06:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CB6FB4E42DAF;
 Sun, 31 May 2026 06:06:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7FBA8604EC;
 Sun, 31 May 2026 06:06:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D32CF10888CCD; 
 Sun, 31 May 2026 08:06:48 +0200 (CEST)
Date: Sun, 31 May 2026 08:06:47 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Peter Thompson <peter.macleod.thompson@gmail.com>
Message-ID: <ahvP6eN2_vtMY03O@windsurf>
References: <20260530224143.1478100-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530224143.1478100-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780207609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=85ChHnuIyEsh7zrTKD6MIAVHM1QgZs3pDPhEe/ET4Bo=;
 b=iLPIn4u8eAnun9ha4GcZzhXjC0+0gsYSj8/GudAOXaMrUQgrxan5W8aTNubabATqIGk5JH
 rSX39z+9Z6iQ+S2QFydNBWId32kccEPEhSwhATDh2ns0VnZpDe8F7Uk0ETt9thtefRNefl
 CmMeH+nNZ+DjlZc7boTXPA9isNtRBSzheqZyeju43lnmUlCQdtyCwOKxVFSBY5Jln8ZmV8
 LTDrxjRWQbN3YQ5JSOPAN9D86pWyUAGNv4ZP6P8xdg6IyHUJaFu78mcur//3LnLw8DCFZP
 KLKKA0yyQmoW1YubkcXFX4vDdjaoV8KliZscv3x5ZxrXL6PGHrES+RMlW1o0hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iLPIn4u8
Subject: Re: [Buildroot] [PATCH] package/sdl2_image: security bump to
 version 2.8.12
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

On Sun, May 31, 2026 at 12:41:42AM +0200, Peter Korsgaard wrote:
> Fixes the following security issue (in 2.8.10):
> 
> CVE-2026-35444: Heap buffer overflow READ via unchecked colormap index in
> XCF loader
> 
> https://github.com/libsdl-org/SDL_image/security/advisories/GHSA-gq8w-x74c-h6p7
> 
> In addition, 2.8.12 includes a number of memory related bugfixes:
> 
> Fixed memory overflow with corrupt LBM image
> Fixed crash when decoding an invalid XCF image
> Fixed out of bound read in GIF decoder
> 
> Update hash of license file for change of copyright year with:
> https://github.com/libsdl-org/SDL_image/commit/281b4ebcb02b106995a0c7fc21f689c160d3fefd
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
