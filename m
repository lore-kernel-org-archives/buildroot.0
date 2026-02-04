Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60F4E95374
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 828D740C72;
	Wed,  4 Feb 2026 10:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqkf6MK-Th9H; Wed,  4 Feb 2026 10:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 345DE4077B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770201638;
	bh=N1ak7JeI/90UHGzXXBMhcFaeBTKZEchLyg47B2WOkpE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rvhACnxCoh42LhGDvskxMucRQJeytZDWUj7cOYfPNYLYAC9xXR5dKJ2jwSy4RfLSd
	 aoEumwq1egdoSVWq5vktFsWt/WcdcD6WgiQdFFGy56bUxsaBEiILKx7EXeJj1wDRPS
	 yWjqH+hSZ+2mCKm2R9P1z1v9IYxcLi33izla3CraRvpH5mYGoTUwSuFFNZq+9U3K8D
	 bits2RizJwvel3xmZe/1twvobDLpdEou8xWgABsECCi1JyJ9Dv/9L5wIP6Zo2a02wS
	 TDMguglAAT+x13ipjotvrflBccvyK8ar0zwHGjoW4R9+Mz92uQIn2d9hRt1+avz9li
	 Ds/JRYsD18Tiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 345DE4077B;
	Wed,  4 Feb 2026 10:40:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD6FF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59C4740164
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjhxJ7yDGWJs for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6592F4007B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6592F4007B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6592F4007B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:40:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7317E4E42314;
 Wed,  4 Feb 2026 10:40:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4300A60745;
 Wed,  4 Feb 2026 10:40:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62BC1119A865B; Wed,  4 Feb 2026 11:40:30 +0100 (CET)
Date: Wed, 4 Feb 2026 11:40:29 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <aYMhmfFpjTRSxB3I@windsurf>
References: <20260118114734.955796-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118114734.955796-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770201631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=AUlnWcqHIPu19RL7eH/iUqsiW9wa+K5rMluz92EjJCU=;
 b=1pWzol61hCAOTr1Sob+qKwDIS+aFrefGXCrKymaOjq3ELHUGIK0g6KHE2QJ20nrXciCwkr
 L65rt2CRnQoVpLfzgj40Q66pZKbXx6rBT79mjHAzH1ZrJDDA2ddeCGWUGqiB4zxp0ztJGw
 WAjoZdd0PZqx7+PTlUnSSeU3m/B3NVck1tjghP1jQ6mWyVZ82KVC0+ZWr1MqT9VET9XAgD
 KSpVRA/HoFMkPbqFrZv0qJrCA/7jTSUdPf6xPIzN++kTsmOOGtlkOdLoTnWWHaYs7IGYXD
 qdtJRyk4hxQelb01B1W7ed/RMEmMigqQ8UO+YyCn2wVo2K0MHaDfSOp8XlYvQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1pWzol61
Subject: Re: [Buildroot] [PATCH 1/1] package/screen: set socket-dir to /run
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

Hello Bernd,

+Fiona in Cc, since she gave feedback.

On Sun, Jan 18, 2026 at 12:47:34PM +0100, Bernd Kuhls wrote:
> Buildroot commit 4769724ee2bebd671f6a9372fb8922a8c22c5079 bumped the
> package from 4.9.1 to 5.0.0 which includes a major rewrite of the
> configure script
> https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.4.9.1
> https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.5.0.0
> 
> Upstream commit
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=78a961188f7da528c7cefcc63e07f35f04e69a93
> added an option to configure the socket directory which defaults to
> $HOME/.screen causing problems with read-only rootfs:

This is not correct: the option defaults to /run/screen. It's when the
option is not passed at all that it defaults to $HOME/.screen.

As suggested by Fiona, I've changed to just --enable-socket-dir, which
sets the path to /run/screen/ which is better than /run.

I've adjusted the commit message.

> Updated project URL to https.

I've also dropped this change which is unrelated.

Thanks, applied with those changes!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
