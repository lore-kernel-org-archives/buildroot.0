Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9341CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95916406AC;
	Mon, 19 Oct 2026 07:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmoLnFbjvL99; Mon, 19 Oct 2026 07:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF2E5406B0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792395746;
	b=rlD+4uVmL430QKWXX7iJpDEk6PTu8S64qOTqoOzISIn9i3aLKSNUFbqt3wm2xcQ7wqZF
	 3SYnSiHHSwIwUkWcsCZM3TKxqr1yr7MXo/ZuKmcQraHudZk3oEro1u9XVX+0v1HQxB6NE
	 0DXb7Q8ccz4yqrwub7hYIUj7uOmb1xf0At17CL6pEpSrumkKGMrM2xj7N4Dz2CsDmaBeN
	 H/AkINQHr9A+vaql/BzOFNh7S7JNGHKx4MSv/dDa2hb0o/Ry5QAwramVNf7OZnHuZHZBF
	 KMRAi1xUJgaldXXxL798M0l0YbligIpRJ34n+g87U9xZmI1mwAdqiaVnwv2MJW4YDjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792395746;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4EavxmB/553Fq+AAh/DffR5m1mKmGxgdv1t6tlHniZM=;
	b=nmuTtlSGk0xFA2GjlC9fMd7TXuvMjszYSENgqsjlep+Wpu0jEZtO6Y1pUYMnILhc6AH2
	 QrPzS7Qvk4KvHctFeADmtLVDtkgsdbS/z+Yud1Z9VrIN7ESfEeXfPDucLJf7hjdiaVCvQ
	 u2Yb8/YuVOV3UP4cetpVIdpc2PB0rHS62bN4OcpLRZdSHFJn8krjnZ8FlxoyKD2IActbL
	 1t0jqlPwspzq9N72wVsG1xMleWWYVd8xEzwxmtceP1yElUYcGrzi1GpLq5WMI3QUKJ77r
	 3tWRjnlM6/soEc63rl/NDR5ToyOmtlWWg7Z6vJGzT9X0hBtTIlz1OAFipmx5FdEhEdA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792395746;
	bh=4EavxmB/553Fq+AAh/DffR5m1mKmGxgdv1t6tlHniZM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QLZIfLAcWsEJbmJI8Cvc3Bs53VGc8oLB+Y7r5gu86FPsxNr2/XdCmW/s79YZG4lzF
	 2IMx7lUlhEtSywJl0mlYvWbwLdsZohgO2QbsnAc6ovZUp/k3hPYO7Ar35CvL0iCnL1
	 yYMO05yer9kc+xspAuPSunRWPBFeHwyQCF2WAscUC4GMw7Autkqn9J+ljzSRZyREIH
	 9kvJSHFcB6F4D5KKfpcNzksw7wy1DMcmdL+dsg1N/EK5/zCGSPoc0/T7/GhPQVmS5I
	 +R26u3CVQ2tWG7f0+UrKVtXTlrstwEdoMKVwBbVEYx7U0/XjcQdik2xfzOKCJ56dIh
	 AhBW4fnXtOHaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF2E5406B0;
	Mon, 19 Oct 2026 07:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5CE32A8
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B821406B0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WmutMDF_1zI for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:42:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7FD3C406AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792395744;
 b=dRFPliw1CKJB1N9FK8mfprJKzw0IAM9ZahyDS03p8a8jnCExBq1kO8JA3aiayqn5Xyg5
 yKySH2CGaXf87LzB3gAWA1IcJ58si5+guAS5bB2ijC1vlKSvN2VOp59uGenLBKajVhrVG
 aGLfC+IbKEDeV2mymbvR3TlOEHhrbUx+uWPD2nM6vQ9pfayw+DnenzQpg/k7tqx2LP5Pl
 G2HVWgqjKx5Ei0Bwridc9mXgbmtuIT45GJ9EsN3xpsAjuGxkLNrG6xv2M8qfKeFaL2Yql
 mTjwMdjG46A52vf98YhMo89gtNH3rHzXOhGwGM/HEt3LoVTqb5JO45+emCJFN6WpQxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792395744;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=AS36IeAuIZsqHYjvAGArNAvY8qZ97hrhfO/hfDKSdWg=;
 b=DTCNj7nnvbU+6DRDDdmKbWaZjfGXTkOin4CjOHWJH1cL7RVAYQjY3+YTxSKvDpKAMuIK
 sqg5x7z+ZZARl7PzixxRcOfljDbylH4ctacnV38hmvz8xmIn8V1KrUDJXpnB30Qgli9Ol
 T6BmEQiOC0nw0+RpONA8FNUSaq+evHrb80RVSO61ogUIz/O4xRfskzbT+MBzgvFaJaKN0
 KtluxQmS4qS2ucQNw9jshXQdR3sgzla0QWBMX4OZDDZ7qbE19r4Y+1DMmFmiQ5cA/tvqZ
 fENMEl9Ost0lm5RU4qtfkYhYb8YpXYEmw3wqV3HoHyuBVzq8CafhVwUsIjTq3xOo9Xg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ywbw5wVs; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FD3C406AC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:42:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 29D314E4127A;
 Mon, 19 Oct 2026 07:42:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F270E60582;
 Mon, 19 Oct 2026 07:42:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF40010328429; 
 Mon, 19 Oct 2026 09:42:19 +0200 (CEST)
Date: Mon, 19 Oct 2026 09:42:17 +0200
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org, Adam Ford <aford173@gmail.com>, 
 Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <atXJtW_DvHyZmjz8@windsurf>
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf>
 <CAAHg4Zgrrsjech9bC9zdkZREEnaB_sV675doMibN+9qw4ypy1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAHg4Zgrrsjech9bC9zdkZREEnaB_sV675doMibN+9qw4ypy1A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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

On Sun, Oct 18, 2026 at 10:57:15PM +0200, John Ernberg wrote:

> I'm just running mass builds working on finding conflicting packages,
> to hopefully in the end solve the per-package rebuilds as initially
> discussed with Arnout here:
> https://lore.kernel.org/buildroot/20241227160622.1654822-1-john.ernberg@actia.se/T/#u
> 
> I run into quite a bunch of build failures in the process.
> 
> Personally I have no interest in libglvnd other than being able to
> build "allyesconfig"-like configurations to find conflicts.
> 
> I'm also open to ripping libglvnd out if there is no use for it.

OK, thanks for your feedback. Let's see the outcome of the
conversation started with Yann to decide what we do with libglvnd.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
