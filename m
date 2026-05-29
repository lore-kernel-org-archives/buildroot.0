Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A6CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C47E84513;
	Fri, 29 May 2026 18:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNXrIVvd75Ka; Fri, 29 May 2026 18:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795728450F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078134;
	bh=cD+cQMNM06WOAZpiFIhVtNR6fwPnnxKs1GjxoAsGHN0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ELOaHaJIV9v0ZzbN4LUtyhuPkP/8RnWuZOT7KQKDWcu+AGadH4HUsVVjH1DO6Qr2o
	 lFMQgx+x54pbO9oWhzO+GHNho3zfxGmA4X+Cm9Jlf0zh45BzwLr4ggvNoyqs6W4aJf
	 8QcfG9L8Vm4d8o8dVpKfrb7yoIo2RJuvPlw0f/XywptFRtNbXneg3aA7J6DCSuBBsu
	 +8MJWtaXnQioxNwAL9qqTgPQUzi1BhpaB5hWU6ttyt8JvTpuw2gjkPXCu8y2NiaWjn
	 44gUevNuRKnF3pAaGTOP8/KUXJQTO5FH6P8DKm3mQFLYH6mdJxdIfgykQh2ZRD/qfx
	 ocG7VCSg3AZfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795728450F;
	Fri, 29 May 2026 18:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD79B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C9B561609
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TGbSaAu32Ob for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:08:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1CF161608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1CF161608
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1CF161608
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:08:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 10C96C62462
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:08:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C9E3601FA;
 Fri, 29 May 2026 18:08:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05AE010888CBC; 
 Fri, 29 May 2026 20:08:47 +0200 (CEST)
Date: Fri, 29 May 2026 20:08:46 +0200
To: Mattias =?utf-8?B?V2Fsc3Ryw7Zt?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ahnWIsfnjiC47so7@windsurf>
References: <20260516190918.398905-1-lazzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260516190918.398905-1-lazzer@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780078128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1xnuQZyS0uFrZbha/TCpDxZy4SvsCFeIzfz7ALCL0nA=;
 b=gc3jB9208vD1dtZdVJUIbvGUPROlxHTChQBWELS5esZTk4usnd/Jz5D0jMDvo9vVVWJfHH
 Kyc6ree8TUylOQltH9VcBY1G/hpQosXdzMmUZfIAv+2YZttTa20oEp8nEA02urzm5X/8ek
 lAOWK9esoExh6+x45MS4CFf9ddVVjDUuYIboCA9yzrDWM2ro1HZEyv2n/xvVG0JyXqTNhW
 N0jp03la1CgrPi2lZmobxmBa2WbB74q06QaSAqwVBejisvUfzDEFFbbkxcadKqpc9uW2dP
 tU71vh7VByFj9DxocSWpAmQicFEVh3I/XdE4UGxjuQy+NXgzZ9LQJoMWSFwk1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gc3jB920
Subject: Re: [Buildroot] [PATCH v2 1/1] package/linux-firmware: Add MediaTek
 MT7916 WiFi 6E firmware files
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 16, 2026 at 09:09:18PM +0200, Mattias Walstr=F6m wrote:
> Signed-off-by: Mattias Walstr=F6m <lazzer@gmail.com>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 9 +++++++++
>  2 files changed, 14 insertions(+)

Applied to next, thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
