Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904E9C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7B340B46;
	Sun, 20 Sep 2026 12:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acGNTeaS900W; Sun, 20 Sep 2026 12:42:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 94BF040B61
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789908165;
	b=oEXBpziSW5UVOVrvWftY+UOEsAuLFhGRRxAdt3tWfFRieyz67krbclOC6wZ3RejkXdEb
	 IhhPY0bd55bfQMxxgNcXsJNW2zlLYHYS/v/lFEA7zSfXeAgaIWxRXe9231oXGv8kckoMm
	 LFe03AcM5mqDboTCHKFmOqUG8ZtDkKy4ynqmK+ndTxOHYebSrVSiqLE9yk+0YQnUs7CSW
	 ddBWLnkf3kupRdiZZQEAGq/yGTIcQw8kXaZhfTqlIz5xFgf4TPwebxMD4bo3poNbZa1rD
	 8fFMUym9np8EScwg+TdOo6PIULP4mcXWYuKFRTN5IwhTrzdRxAIuu5m2AzPI9Z4Yu8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789908165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w4n4d2Fwgryjg5V7hMJ1ZqJCcP0Z9RwbXQyCBROsEhM=;
	b=M+jSLx1oaHOm1rTaeJdEhHHngMSXWoQIm2HHHz+WzOg0Dkx5Niso9KAEVudjGUQZO6Ak
	 7BEc1xAfUXzmTp7Y1X5Zf/KaUe0DYyTZ5hk8BCXirpcdaOugxnTxw/I/mpu6hyB60CenK
	 6mmihyjsHs4GDp0Hyu8M8UReNf/aPeiVnw22lqfeXd5tiKW+jEAZTUaoDLo/AtsRHDLMP
	 I/hodCJSBA6suh6IJPCnxSqkKj9zHSZFCyTBrqifhoYg3y37sCqGcpXz6FtroUTfVtnjM
	 mY8+8BaHc5jnSagTRayQ/rcgdFOcVlxpZZRe4VMsv+3HNbBo3sRlY66Z6Lb0l+0ZxXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789908165;
	bh=w4n4d2Fwgryjg5V7hMJ1ZqJCcP0Z9RwbXQyCBROsEhM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sszB9ftVMKZ6xzIjkviT47ByDndApq2Eikmx2G94W0X+HBNA3IRq1ctzmbHRJwVRZ
	 PtBcyQrmKigaqEwmM2UHseLkdh28czYzWtbaCQlSdLTspf8ge9otqx1PfBRsJYDnB1
	 MsCMQ72uD2nZK/gB5ejfzOP9pHxwq3BfDVsq03gx82KGnmc0r3xmWt0aB/8V/h0fVI
	 Zz6jTRJ46u+0EhIyj/Sj4um8YbUiOTqRkvFkEyB1cv/AD3nDmX3Axq8e/8FW/K2DTX
	 1YQmPmLnPVf1f4ngAD+VK7Dr5MRQiNzt24JOGCXvkNDm0XtOPgXcYbv+hOmJh/RmQ6
	 8sbm2BrakfFBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94BF040B61;
	Sun, 20 Sep 2026 12:42:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D2F6224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F307860600
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIzz7OGJrBF2 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:42:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B2343605FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789908162;
 b=FBIp0yehQ+hmxzjxWM9bL59Cn5Tx7opi2dyfyEadCNzajLDrw1p5z3ATwFhbFDE3cqsH
 kc/sQMJjE/AMVLSQ4zYLp6xkhGOdfsFZrykuNSZ0Pu2LWXaGD92BzTqrjct7aWh0vIK7O
 6YfP67cvMep6G74g3vkoZ5ExZwz7xVCIJWKfN+PMHE7I1UYRA/7XARzAmzM3wHEGvx7Ly
 yAyBNKLKr0CaZx2zdzhFcSWWTRl6Jz3fAUrZkW5VZVcpd4uaMJRdQh1EF6/5mL0mV/GKM
 Hir5JrXLQUz4W65IaGBNoL7TkcX0tPTBlaWLcaaTysdsRxlE8WmE223omMbhEdNwNwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789908162;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BFVwgd6rTUh+9Ens4zQvnEuZFugTpgjbpn8Lp/LI5fU=;
 b=n6JyS+ES3hNZor/iKm9Ux7dG9YUMWvb56KWmIdZ4+PwOeRJrdqJJZcjc4E6059GjvbA7
 5Oapwd38o5a6XsuHX8B6zkmQxGVMIK2P7S29uyb8hrTuC9PnL0Zd1m762Nw3xQFkV69R4
 GHT+AyAxrRO3f37XoF6LsUnXK2sXuG957rTM/vKZzZsQNoRdm2ItPmq7Ow9zRwUWUvE4o
 nTPt5qvBTNmVaegbCMSSAyHLFhlyTXssb0uf6+YByaI1jo+G+ZW8VU7CAwdWUTL8yexwc
 pupFN8jMlGz5hHYzVR7cyzAIoG+RLpRLer/zIZtwxKySnni/Im6NaFxvDxz+xkb8JLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WGY4fGdx; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2343605FC
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:42:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2679B4E40923;
 Sun, 20 Sep 2026 12:42:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECC0D604C9;
 Sun, 20 Sep 2026 12:42:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D67BF1032829C; 
 Sun, 20 Sep 2026 14:42:31 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:42:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_UsV4Nm68VclhE@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-8-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-8-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 07/77] package/cc-tool: Fix build with
 Boost >= 1.89
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

On Sat, Sep 19, 2026 at 05:57:32PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
