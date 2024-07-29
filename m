Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7977C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6AA607C0;
	Mon, 29 Jul 2024 18:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4w3tNygZjoLJ; Mon, 29 Jul 2024 18:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A92D6087F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A92D6087F;
	Mon, 29 Jul 2024 18:20:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80E021BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D00880B94
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atl5NbgF6k7z for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3747280B86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3747280B86
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3747280B86
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:20:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FF0F1C0003;
 Mon, 29 Jul 2024 18:20:37 +0000 (UTC)
Date: Mon, 29 Jul 2024 20:20:36 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240729202036.437f035d@windsurf>
In-Reply-To: <20240728173720.495604-1-ju.o@free.fr>
References: <20240728173720.495604-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722277237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zOwBpXyHws0qfUJeoAXEK9SEEY+PMMPhdGWH9XUb2Y=;
 b=m95Y2wT9I7fxaeUuoVxtLGW0ZZkpfd4PVVAr6rH/8fI0VooTH8uxyUL6DlWLOX4yoxpWVu
 2SIXUYI+VA3uFmPJFhGByZ9m42xLsPixIxJL+TIeL+6JDRpISyjHzIYX1D7dNZE39HQ5+p
 WGbcyQIsNj8I+Y0ShEQDroTRIBBfDS42sGzb0NTntDidC/FNbEzkkB84YoTbRcru8FTJum
 0YQUVrd0NguDQitm/+8LGUyaRoRThCjw40veLW9dFt8PjSlZI+GvqY6VEbd0cmnN3KhS3G
 cs/p1AB7mYC653ue/RNGPotyE9xNODPfcVJSLdd7KNUVc0kiiYOCa+jXOaQ1qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m95Y2wT9
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx7dsabresd: bump
 BSP components to lf-6.6.23-2.0.0
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

On Sun, 28 Jul 2024 19:37:20 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit bumps U-Boot and Linux kernel to the NXP BSP
> lf-6.6.23-2.0.0 versions.
> 
> While bumping those BSP components, this commit also adds the custom
> hashes by enabling BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in this
> defconfig. A _PATCH_DIR is added for that purpose and hash files are
> added in it. The ".checkpackageignore" entry for this defconfig is
> also removed.
> 
> Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
> this freescale_imx7dsabresd_defconfig is failing to build the Kernel
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
> The Kernel DTS name is also updated by adding the new "nxp/imx/"
> prefix, to follow the upstream reorganization in [1], first included
> in v6.5.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7423016459
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                |  1 -
>  .../patches/linux-headers/linux-headers.hash       |  1 +
>  board/freescale/imx7dsdb/patches/linux/linux.hash  |  2 ++
>  board/freescale/imx7dsdb/patches/uboot/uboot.hash  |  2 ++
>  configs/freescale_imx7dsabresd_defconfig           | 14 +++++++++-----
>  5 files changed, 14 insertions(+), 6 deletions(-)
>  create mode 120000 board/freescale/imx7dsdb/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/freescale/imx7dsdb/patches/linux/linux.hash
>  create mode 100644 board/freescale/imx7dsdb/patches/uboot/uboot.hash

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
