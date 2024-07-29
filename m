Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363EC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14E160887;
	Mon, 29 Jul 2024 18:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uq2WAWjG_pm4; Mon, 29 Jul 2024 18:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6AC960888
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6AC960888;
	Mon, 29 Jul 2024 18:12:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1821BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8859B60887
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alWzHMiY3Vmz for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD5AA60889
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD5AA60889
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD5AA60889
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:12:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD00F1BF205;
 Mon, 29 Jul 2024 18:12:34 +0000 (UTC)
Date: Mon, 29 Jul 2024 20:12:33 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240729201233.299497c8@windsurf>
In-Reply-To: <20240728121822.2857477-1-ju.o@free.fr>
References: <20240728121822.2857477-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722276755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvUe1F5YDteNBbBhybdIU2c8TJVuc21NdmCwVOR+4p8=;
 b=ODL9KP+/F+jr/4Z/bXiqMnZ+dSH+B3yK/DXXZoAEBT1Gy0lT18R8m6hs2prB93IafpT8ew
 831xkgj75Ek5SEe0alUuFbHQUEKNSANDBgUfujfesy1/6og64VHGYu6lXLK76/SEoLtvVz
 4ZAq+GFmlnTgJmQx9z3m8GAiTOXOg+o1IXrtGRuf9spBU+/IRUSkOXKYOtGkQmsjBGPhls
 RuSV+9hKi98l12RaRE39BbKN/wPzdfyBPHIdl7XOI5z/tuC2XdW0pKngvX15zy93VzfNSL
 hgEDrOBXVUlK0Fg7no56/AyKNJB7tIGI40uBqVX8AyEgi/cYe5Pr2QW6etr5kA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ODL9KP+/
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx6{dl, q,
 sx}*: bump BSP components to lf-6.6.23-2.0.0
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jul 2024 14:18:11 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Note: configs/freescale_imx6{dl,q,sx}* corresponds to the five:
> freescale_imx6dlsabreauto_defconfig
> freescale_imx6dlsabresd_defconfig
> freescale_imx6qsabreauto_defconfig
> freescale_imx6qsabresd_defconfig
> freescale_imx6sxsabresd_defconfig
> 
> Those i.MX6 Sabre defconfigs have a lot in common. This is why they are
> all updated at once in this single commit.
> 
> This commit bumps U-Boot and Linux kernel to the NXP BSP
> lf-6.6.23-2.0.0 versions. The imx6sabre uboot patch is also rebased on
> the new version, and the "Upstream:" tag is added to flag this patch
> as Buildroot-specific. The ".checkpackageignore" entry for this patch
> is also removed.
> 
> While bumping those BSP components, this commit also adds the custom
> hashes by enabling BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in those
> defconfigs. Hash files are added in the _PATCH_DIR. The
> ".checkpackageignore" entries for those defconfigs are also removed.
> 
> Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
> those freescale_imx6{dl,q,sx}* are failing to build the Kernel
> with output:
> 
>     drivers/ata/libahci.c: In function 'ahci_led_store':
>     ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_340' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
>       315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |                                             ^
> 
> This commit fixes the issue by bumping components which includes the
> needed gcc-13 fixes.
> 
> The Kernel DTS names are also updated by adding the new "nxp/imx/"
> prefix, to follow the upstream reorganization in [1], first included
> in v6.5.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089449
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089451
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089452
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089455
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089456
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                 |  6 ------
>  .../patches/linux-headers/linux-headers.hash        |  1 +
>  board/freescale/imx6sabre/patches/linux/linux.hash  |  2 ++
>  ...common-boot-Linux-to-init-in-mfgtools-mode.patch | 13 ++++++++-----
>  board/freescale/imx6sabre/patches/uboot/uboot.hash  |  2 ++
>  configs/freescale_imx6dlsabreauto_defconfig         | 11 ++++++-----
>  configs/freescale_imx6dlsabresd_defconfig           | 11 ++++++-----
>  configs/freescale_imx6qsabreauto_defconfig          | 11 ++++++-----
>  configs/freescale_imx6qsabresd_defconfig            | 11 ++++++-----
>  configs/freescale_imx6sxsabresd_defconfig           | 11 ++++++-----
>  10 files changed, 43 insertions(+), 36 deletions(-)
>  create mode 120000 board/freescale/imx6sabre/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/freescale/imx6sabre/patches/linux/linux.hash
>  create mode 100644 board/freescale/imx6sabre/patches/uboot/uboot.hash

Applied to master, thanks a lot for the super detailed commit that
explained everything!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
