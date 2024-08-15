Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA9C52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 09:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C8B160A43;
	Thu, 15 Aug 2024 09:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UVd2dQncl8o; Thu, 15 Aug 2024 09:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80C660726
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80C660726;
	Thu, 15 Aug 2024 09:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 833AC1BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FDE440E04
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTMWw3h17VO6 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 09:02:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97AC2403C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97AC2403C2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97AC2403C2
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 09:02:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8704A60002;
 Thu, 15 Aug 2024 09:02:52 +0000 (UTC)
Date: Thu, 15 Aug 2024 11:02:51 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20240815110251.550760af@windsurf>
In-Reply-To: <20240809085334.3530176-2-jamie.gibbons@microchip.com>
References: <20240809085334.3530176-1-jamie.gibbons@microchip.com>
 <20240809085334.3530176-2-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723712572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xhdDt+GFJ/JdgY3qENfzcCl1EqujhI8BcWmf+e7G4E=;
 b=Yxf9yx8t1cpsw5/sTQmQUl/rYqBlu8Dmw4M68NIdnORPA5UTZATCR9h2+Au2rqwXaa0tQW
 ejnVzdiOUmjoIIBFSTezRQTmUyHKOTO+e75GzmIRIHkFGfnvtQKqgSYzeNx603WzW1DDcs
 1dsJoJRYzPuY4TimAFbD/L/enkCzhgXB8BqsIn3rTuSCmAuydknKS+qjxlruSuDa+4Fg9c
 cHyOSF8oUQzlaNkDpTI94zTZH6Nstsmaxmg12dovpds+gfnYkklu6qA7hv5aiL15Lwp+xS
 IT5brFvKPVimKR+fvVTODzVvDiNF4WUMZPLzACD8lvGYRTTgnufPh7PPx5D8xA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yxf9yx8t
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/beaglev_fire: update custom
 tarballs
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
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Aug 2024 09:53:33 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> The Linux kernel and U-Boot custom tarballs were updated incorrectly
> in commit 8ce97fd550d6. Update these to select specific release tags
> instead of branches. Update the U-Boot and Linux hashes to match
> these changes.
> 
> Fixes: 8ce97fd550d6 ("configs/beaglev_fire: bump Linux and U-Boot")
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> Tested-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
> ---
>  board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
>  board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
>  configs/beaglev_fire_defconfig                          | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Thanks, patches applied to our master branch!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
