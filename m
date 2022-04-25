Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C45C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17281605A3;
	Mon, 25 Apr 2022 20:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iEJ9A5kXQaGz; Mon, 25 Apr 2022 20:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA7BC60F35;
	Mon, 25 Apr 2022 20:28:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4220C1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EA7A40AEA
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JON6YGNeIfr for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:28:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.186])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F62D40526
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:28:23 +0000 (UTC)
Received: from 1nj5Jk-0009qw-T6 by out3b.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1nj5Jl-0009uK-VD; Mon, 25 Apr 2022 13:28:21 -0700
Received: by emcmailer; Mon, 25 Apr 2022 13:28:21 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3b.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1nj5Jk-0009qw-T6; Mon, 25 Apr 2022 13:28:20 -0700
Received: from tsdebian (unknown [75.164.70.254])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 4DDE3431EC;
 Mon, 25 Apr 2022 13:28:19 -0700 (MST)
Message-ID: <1650918498.6000.6.camel@embeddedTS.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Mon, 25 Apr 2022 13:28:18 -0700
In-Reply-To: <81c16e83-25d8-d047-4752-b33daa2e91f4@mind.be>
References: <20220422223611.10443-1-kris@embeddedTS.com>
 <20220422223611.10443-4-kris@embeddedTS.com>
 <81c16e83-25d8-d047-4752-b33daa2e91f4@mind.be>
Organization: embeddedTS
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121;
 h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID;
 bh=6dU3U7onWq5IBO5UhzDTnH0sWgRSjYEbhzqK5UDznTY=;
 b=FI2xXwDHsO3EiGllM5T8DNkoTGjv66omCXDVIscyumUOeEFaTKUBftT1JqFF2gvW234TW3auqWg1p3DGCHqbYM9qDovUVrPDN618Pl5W6lITVyHl0sWzO1dwDOjXlR4pjPwgAVf3XrfWim2kmS4XxaVYQmteXlGAA3UAEtloDAgGnQi+DUQsXJmx+5YHLKv+87hENvX2bkRircuTyF+aKpnm4AQxEgLo6XoULo175fYyJ9fCaJW1UPaaOmlC/VWiWHmjJgxbqUGXP+irLAPv+D/oTev80FTGVhcAnCD5KsRbM5JiAUYFj4F+uHDiXhQC++QL2R2Ht/h7cWHruXoNew==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: Re: [Buildroot] [PATCH v2 3/4] configs: add WILC3000_FIRMWARE to
 compatible devices
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Featherston <mark@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 2022-04-25 at 22:07 +0200, Arnout Vandecappelle wrote:
> 
> On 23/04/2022 00:36, Kris Bahnsen via buildroot wrote:
> > The update to wilc-firmware added firmware files for WILC3000
> > devices as a separate config option. All Atmel/Microchip defconfigs
> > that previously only had WILC1000_FIRMWARE either have WILC3000
> > Wi-Fi hardware (WILC3000 is the same silicon but with BLE added)
> 
>   For the ones which have a WILC3000, there's no point to include the WILC1000 
> firmware, right?

I'm not familiar with the full Microchip lineup. Some have these modules soldered
down, others, however, can accept either module via some expansion/interconnect
system. I thought it safer to install both.

In Microchip's externally maintained tree, they just install all .bin files
together with their wilc-firmware package.

These defconfigs definitely need some maintenance though, as I said in the series
cover letter, the defconfig I tried failed to boot when built from master.

-Kris

> 
>   Anyway, applied to master as is, thanks. Can be fixed up later.
> 
>   Regards,
>   Arnout
> 
> > or have the capacity to have either WILC1000 or WILC3000 devices
> > added to the system. Install all firmware blobs to these devices
> > by default.
> > 
> > Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
> > ---
> >   configs/at91sam9x5ek_dev_defconfig                     | 1 +
> >   configs/at91sam9x5ek_mmc_dev_defconfig                 | 1 +
> >   configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 1 +
> >   configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 1 +
> >   configs/atmel_sama5d3_xplained_dev_defconfig           | 1 +
> >   configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 1 +
> >   configs/atmel_sama5d4_xplained_dev_defconfig           | 1 +
> >   configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 1 +
> >   configs/microchip_sam9x60ek_mmc_dev_defconfig          | 1 +
> >   configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 1 +
> >   configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 1 +
> >   configs/microchip_sama7g5ek_mmc_dev_defconfig          | 1 +
> >   12 files changed, 12 insertions(+)
> > 
> > diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
> > index bfa8e95941..8714463d89 100644
> > --- a/configs/at91sam9x5ek_dev_defconfig
> > +++ b/configs/at91sam9x5ek_dev_defconfig
> > @@ -47,6 +47,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
> > index 2e1a5c7f59..9481594716 100644
> > --- a/configs/at91sam9x5ek_mmc_dev_defconfig
> > +++ b/configs/at91sam9x5ek_mmc_dev_defconfig
> > @@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> > index ba2fa46790..38618a5732 100644
> > --- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> > +++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> > @@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_RNG_TOOLS=y
> > diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> > index a8b68ca0a2..1654408aa5 100644
> > --- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> > +++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
> > @@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
> > index cdfd9de17e..64455cb2e0 100644
> > --- a/configs/atmel_sama5d3_xplained_dev_defconfig
> > +++ b/configs/atmel_sama5d3_xplained_dev_defconfig
> > @@ -49,6 +49,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> > index a2205aeefa..8f5724d631 100644
> > --- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> > +++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
> > @@ -52,6 +52,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
> > index f8783f5652..fab91cf0b3 100644
> > --- a/configs/atmel_sama5d4_xplained_dev_defconfig
> > +++ b/configs/atmel_sama5d4_xplained_dev_defconfig
> > @@ -50,6 +50,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> > index b4e99f658a..f9074e9862 100644
> > --- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> > +++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
> > @@ -53,6 +53,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> > index 06e03967c4..2b4e234297 100644
> > --- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
> > +++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> > @@ -36,6 +36,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
> > index 3bcd5f0200..f9aa6cdc05 100644
> > --- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
> > +++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
> > @@ -39,6 +39,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_I2C_TOOLS=y
> >   BR2_PACKAGE_SETSERIAL=y
> > diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
> > index 27d1d3409d..b1b22c1312 100644
> > --- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
> > +++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
> > @@ -32,6 +32,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_SETSERIAL=y
> >   BR2_PACKAGE_SPI_TOOLS=y
> > diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> > index 6eb6c282e0..d68846e553 100644
> > --- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
> > +++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> > @@ -30,6 +30,7 @@ BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
> >   BR2_PACKAGE_MMC_UTILS=y
> >   BR2_PACKAGE_MTD=y
> >   BR2_PACKAGE_WILC1000_FIRMWARE=y
> > +BR2_PACKAGE_WILC3000_FIRMWARE=y
> >   BR2_PACKAGE_EVTEST=y
> >   BR2_PACKAGE_RNG_TOOLS=y
> >   # BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY is not set
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
