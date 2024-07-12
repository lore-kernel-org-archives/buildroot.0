Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28854C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C7340628;
	Fri, 12 Jul 2024 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Il-u1cFRjKqM; Fri, 12 Jul 2024 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71878405B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71878405B7;
	Fri, 12 Jul 2024 14:48:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6EF1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AA861325
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-KXDNUyFx0P for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:48:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF72261324
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF72261324
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF72261324
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:48:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5636C240009;
 Fri, 12 Jul 2024 14:48:38 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:48:37 +0200
To: Gael PORTAY <gael.portay@rtone.fr>
Message-ID: <20240712164837.214641d2@windsurf>
In-Reply-To: <DB9PR07MB9104EEDA904AF785C1A5205182D42@DB9PR07MB9104.eurprd07.prod.outlook.com>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
 <0f36a666-274b-4980-aa08-e738f0fccb79@mind.be>
 <DB9PR07MB9104EEDA904AF785C1A5205182D42@DB9PR07MB9104.eurprd07.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PyN7Aqv4aA+X/SstwK1KlcQ7DymZLC/MrAllal5WQEs=;
 b=fJ3c/ZWjM5+MKNxj9KUPjhnwblSqKahUAxsV9bKtJNH+wZMhCOnDzCHorCrKldZQEJ1SQ0
 tP+QPWGV8G4fCrKp4ShKOTcTA0tDO+Hxrbb6Obd/0AL11ESepkX4hHOLDEmAck47nWL5u2
 4RE/g/B3OXPYu1OIIg7pTfb8ZVGeSK4pm66/6RLwlfH7k87hUa6rPzZB2GtksjpjEu0XpI
 ZAnUIdVkmSilQQAFzd0Ml6kUaSgizRsOoUZl/NthI0Dk+qCDQTpPBYf/onTqXVKiPNfUTq
 XAudhvp3C1F4gJvvtaDym8SkLp0yK0q/soKzUcXWgk9v7V6v1c+cZUtiMHkebQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fJ3c/ZWj
Subject: Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version
 to v1.20240529
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 24 Jun 2024 08:31:57 +0000
Gael PORTAY <gael.portay@rtone.fr> wrote:

> [I hope I am not responding in HTML, I have no choice but to use a new e-mail since today].

Argh, your HTML e-mail is a mess.

> Arnout, I agree, that symbol is unneeded.
> 
> However, BR requires that package to install the device-tree to boot
> the system because of the device-trees and device-tree overlays.

Apparently, not in the case of RPi5, because the patch from Athaariq
has:

+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi5/config_5.txt"

so neither BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS nor
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS are enabled. Therefore
the rpi-firmware package does not install DTBs or DTBOs.

> And I agree, there is possible work to get rid of that package for
> pi5.
> 
> BR could provides its own bare minimal config.txt for every pi, it
> can be overriden by menuconfig.
> 
> Also, I have that attempt to install the dtb and dtbo from the kernel
> package instead of using the ones from the rpi-firmware package.
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20240412140945.1626579-2-gael.portay@rtone.fr/ 

OK, but for the time being, I wouldn't mind to see a RPi 5
configuration merged that works in the current setup. Then we can
improve later on. We really want to have a RPi5 configuration in
Buildroot soon.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
