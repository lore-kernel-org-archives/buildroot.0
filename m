Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C490E6E7F3
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4508F83705;
	Tue,  3 Feb 2026 10:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXMn_hf-HMmc; Tue,  3 Feb 2026 10:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5623483B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115100;
	bh=u3FH2+GxKw1xnEQF/c77dtN2RxR+2NEWvoq2ynbehBg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RS0N8q5765FHPf94bLKekleHs6zdQrB7zFYNtvp1k1oGqwkhpqCGKbjaF3DsQ0i8Z
	 jKCeoNQk7+2NMyKCC9M7MiiXgVfgsllkHfsHuzp1JTeG11jM7fwnnJ4zqRu+9B4apL
	 conoop03TpD8XJCOQwQ3ead4PyFwak09qNJfEGVGNK2m8LCSfuQwrFrc3lU6HmYh7H
	 OU+Liz+34hpPxDLu3G2OBIAAn0HO8MR1TU+1JF7+pTifDaXe8RsOS+8I7vWRoXoeV2
	 nqjA9lD1CQsRdkOaBKWXTcKH2MZ2Mbd1p84rScJUHPSyAbr+5XLMc1ISuFHI56CGYd
	 3QaL++WoSrpxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5623483B5B;
	Tue,  3 Feb 2026 10:38:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27757F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0770E83B5B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r05RYS2lO2A1 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BB8483705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BB8483705
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BB8483705
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:38:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB431C211C9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:38:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C31560728;
 Tue,  3 Feb 2026 10:38:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 292BA119A8891; Tue,  3 Feb 2026 11:38:13 +0100 (CET)
Date: Tue, 3 Feb 2026 11:38:13 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <aYHQCtfvNsDw3THR@windsurf>
References: <20260203075820.1945913-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203075820.1945913-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770115094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=L6JfZPuDmVV0mQPoI02M7/Gq6wIiJ1UxBeePWP4oDAU=;
 b=c+UaInne6ImLwOlM9zPVbz09gvH3wIUS1IUWZQfoM+E6/4Cf4Oje/2RGzXbaei8hLn8U0p
 42gAEpeBLXQO39qOCKkyy76+xJgq4erhBryna7w48EPSalV5zKy8XGIqJytAKh+OpM/kDx
 VJJtwBFqio6nOJI0L6liUc5qGhWAqpOw+ppDCy/FyBPzM22Zt7JpiKcIIS2evrcFHjyuy2
 WwUTDGX7KxMR21B3QY1ariRWYsgecRsOcGTsrUmFLvmu3KJwVEhkFnmoY+rnLDjhUG/hUu
 Oj4tfF76VCYlDp/E/2ZlItscpHPKhtyDNk4SRtgWXb7his/a82vwkjuQaednPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=c+UaInne
Subject: Re: [Buildroot] [PATCH] package/mpg123: add sdl2 support
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

On Tue, Feb 03, 2026 at 08:58:18AM +0100, Peter Korsgaard wrote:
> mpg123 supports (and prefers) SDL2 as well for the sdl backends since 1.26.9
> with:
> 
> https://github.com/madebr/mpg123/commit/792615f6512a0908081b5a2e98ca61f8677ed452
> 
> So support that here as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

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
