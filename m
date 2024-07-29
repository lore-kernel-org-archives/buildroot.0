Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E3C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA746086B;
	Mon, 29 Jul 2024 17:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljqBG8S8aQVY; Mon, 29 Jul 2024 17:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B5260875
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B5260875;
	Mon, 29 Jul 2024 17:53:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 472561BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D41C6086B
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXeunzVybTvw for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDDFE60888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDDFE60888
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDDFE60888
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:53:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8D10FF807;
 Mon, 29 Jul 2024 17:53:48 +0000 (UTC)
Date: Mon, 29 Jul 2024 19:53:47 +0200
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Message-ID: <20240729195347.195e5b5e@windsurf>
In-Reply-To: <20240729131401.148536-1-boerge.struempfel@gmail.com>
References: <20240729131401.148536-1-boerge.struempfel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722275629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YgUfgAqnZh4MnnY0N9UfKdrg4ccqW8BnBFMltgqNyg=;
 b=iQJtze6oQxMkuT+aJzY9t0x423Z6USDetU9IGh5K/7wlcyMFpd69UN3gmUG9cYtEON/GoE
 CBXVnnfke/Q8L99bh0Qnbsm07yclSlK3Ym2qsIfuxfplznVra+ovR1hqs0NKkOC82rtmhg
 qv9iPEmvX3vD/Ou3s0K4RkhrEGlp6UmlT93Yi4ItjXiunTU3wM6BhQIqipXLv5MfU81kdb
 SDuQ+a1YYbb44bv14W/YhWiAmy+zzSXa4LeQyoFvDOAZtBj2BWajTb2+ISAGhpCU4Eeuti
 q64zy8Z8LSLEWgPGl7ntRylhIo6ePACDYZJGs/+I5nhE+i9eIGGu1YO390AA2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iQJtze6o
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: Add Redpine
 RS9116 firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Boerge Struempfel <bstruempfel@ultratronik.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Jul 2024 15:14:01 +0200
Boerge Struempfel <boerge.struempfel@gmail.com> wrote:

> Add Redpine RS9116 firmware. This firmware is required for the
> rsi9116 wifi and bluetooth module which is driven by the rsi_91x
> kernel driver.
> 
> Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 8 ++++++++
>  2 files changed, 13 insertions(+)

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
