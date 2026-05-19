Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2016CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 23:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C70E40F7A;
	Tue, 19 May 2026 23:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkHFEgM_Q-zg; Tue, 19 May 2026 23:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A8F140F76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779233783;
	bh=+fFB7uH9WU8Tdz3KsoMLzFbnId74mcUdhHMFKdamDrg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iFfJVeMWimVYxZZ/OcvN1v9b+h5cuRX3v377eXB2KAFuKCXztCQeKIkPvJ8aS1lpe
	 LFaGynuQgXlOGF300Oq2RE1sXOeJmCDDU5Hfb10Jv0p+vW4EaSpHFd9WYn+kfZgE3S
	 EjO8ZlizkaHIN6dvDal3phBhcsc5u3iI/xM3d+ubWSvQRcd1m/iZR3kVqFSTjGQ2Ad
	 olasLMP+uoOld8G+zf1s/LBjcbVOQ77+w61MgCgrJFGbRfVp1J4R78WF6e/3rQkhCf
	 OwOhjpSotQOWHUWzartOaaoASWYaIqKwbUiBUzbO7PlTkvQqs/nVzJFSDeDsPoJW7W
	 xd+z7Yw+gWIdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A8F140F76;
	Tue, 19 May 2026 23:36:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6FD7265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 23:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99A2160DC1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 23:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rp2WbeS8a9u for <buildroot@buildroot.org>;
 Tue, 19 May 2026 23:36:20 +0000 (UTC)
X-Greylist: delayed 7220 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 May 2026 23:36:19 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33D2A60DC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D2A60DC0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.107;
 helo=smtp-outgoing-1903.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net
 [160.92.124.107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33D2A60DC0
 for <buildroot@uclibc.org>; Tue, 19 May 2026 23:36:19 +0000 (UTC)
X-mail-filterd: {"version":"1.9.5","queueID":"4gKnzH3FrSzFpTt","contextId":
 "43755fc7-bb05-49bb-87ac-b7877f9d5bd4"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0101.laposte.net (SMTP Server) with ESMTP id 4gKnzH3FrSzFpTt;
 Tue, 19 May 2026 23:35:55 +0200 (CEST)
X-mail-filterd: {"version":"1.9.5","queueID":"4gKnzH14mFzFpTZ","contextId":
 "b518ce4d-432d-4bf3-bd2f-abed467e808c"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-160-203-96.subs.proxad.net [88.160.203.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0101.laposte.net (SMTP Server) with ESMTPSA id 4gKnzH14mFzFpTZ;
 Tue, 19 May 2026 23:35:55 +0200 (CEST)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id E604E6FFE2F3; Tue, 19 May 2026 23:33:50 +0200 (CEST)
Date: Tue, 19 May 2026 23:33:50 +0200
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 Vincent Stehle <vincent.stehle@laposte.net>
Message-ID: <agzXPmTQKc6zGniW@romuald.bergerie>
Mail-Followup-To: Arnout Vandecappelle <arnout@rnout.be>,
 Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 Vincent Stehle <vincent.stehle@laposte.net>
References: <69fea782.050a0220.8af99.ac9e__38452.1139830881$1778296731$gmane$org@mx.google.com>
 <pan$51872$1013c278$a74b50e3$2f703bba@ID-313208.user.individual.net>
 <82c062f9-6151-4363-8344-f0fdba96f032@rnout.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82c062f9-6151-4363-8344-f0fdba96f032@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1779233777;
 bh=C0eJbWP6g4LzkKM5D+PUgJBLyB0Sj41Q+7oRV/+Ny1U=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
 b=E61Tnm1F+7eNAoy7oenQbJdVkvINUjgGGizj/Nzy/a6K9M+ZmTj5P757UTGv5JKf5Un978t0YJd17diys9Lv4CNBUKS85m/9RNyscWqt9r3/j9VeyxfqO/Zqx2hsxSzcBAWzZGIl3FvHUoyP5qha4IcAEjx7E1ItyjxhyH9Wkans/G+QhWIHgfFvfTWmsfq6f9UjKaPifbbutwmMlMnpJsbGeOiFRkGPBfkZbWkb6Gp/Hl3CLO/DSdJYepRkSvXTQRjRaRII76Pr8w5kOjwRSafh6yKjVWo67SLFxPXq5I6rdVOp8ix2g0TMIrcfuBsxQD+p5ZRilNmORFvJr5+1rg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=E61Tnm1F
Subject: Re: [Buildroot] HPPA fails to build , was: Analysis of build errors,
 was: Re: [autobuild.buildroot.org] Daily results for 2026-05-08
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, May 18, 2026 at 08:05:05PM +0200, Arnout Vandecappelle wrote:
>  Hi Vincent,
> 
> On 09/05/2026 09:00, Bernd Kuhls wrote:
> > > glibc-2.43-22-g8362e8ce10b2... | 2
> > fails only on hppa, no upstream fix in sight, what about reverting
> > 1822f07e94951c5a37f78c1009d54fc95d01d39c?
> 
>  Since glibc is the only libc for HP-PA, I think this means we'll have to
> throw out HP-PA entirely. Or do you see a solution?

Hi Arnout,

This might end up being the only solution, but that would be sad.
How about thinking it through during the Buildroot Hackathon in Nice next week?

Best regards,
Vincent.

> 
>  Regards,
>  Arnout
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
