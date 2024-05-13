Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9E6C25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED3C60658;
	Mon, 13 May 2024 20:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sp3haeVpAmJh; Mon, 13 May 2024 20:10:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDFFE60A9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFFE60A9C;
	Mon, 13 May 2024 20:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D316D1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4A340726
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usjISQDUhh-T for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:10:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C18940704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C18940704
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C18940704
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:10:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46F0E60002;
 Mon, 13 May 2024 20:10:07 +0000 (UTC)
Date: Mon, 13 May 2024 22:10:06 +0200
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20240513221006.415d4883@windsurf>
In-Reply-To: <AS1P250MB06087BB3F8FFBDD7D73C1436A9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06087BB3F8FFBDD7D73C1436A9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715631007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4YkTZLH+LTLZWC6pEUNoy94x0U23CHEUw0Y2XclNus=;
 b=nvJh6RFX6UVOTdi+VpVvHceQeJwdQVwwou3av0W70FxM9LayJE/Soq7oNhnv5htiSxBrQU
 qWn0V8ceVGHIXaAYmcMmytyqD/92KCAje5VrQNy1QERGt9Wq/RiA7eGmu1Jnjt/Ow2saWh
 xPpBVBrVqZ9XKTatjzRHALTPyGgDcINqY9dxz8EuQczYZaSH/Jw4X2s8KBsH4TccdLuUsO
 +kRC++zPmNkfyMXLgR8MGbzsrEKwj3RBONszJRLc/IzZ3o17jVJwAFAhSlHajf0xj23ffw
 ZDrhbrgYKks4/GY1/j9XNjTQ49HsRbsrhVu45d5PhPKG9Ce4XUgtCm087uyEmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nvJh6RFX
Subject: Re: [Buildroot] [PATCH 1/1] package/libzenoh-pico: bump to version
 0.11.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 May 2024 08:47:55 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/0.11.0.1
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>  package/libzenoh-pico/libzenoh-pico.hash | 2 +-
>  package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
