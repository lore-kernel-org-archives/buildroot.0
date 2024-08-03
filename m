Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44014C52D6F
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11BE180CB9;
	Sat,  3 Aug 2024 20:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7B23sMlhaUB5; Sat,  3 Aug 2024 20:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9527B812C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9527B812C4;
	Sat,  3 Aug 2024 20:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAA2B1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A79F4402B1
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVl97bmEvv74 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4876F4026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4876F4026F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4876F4026F
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:30:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E37551BF203;
 Sat,  3 Aug 2024 20:30:45 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:30:45 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240803223045.5d256010@windsurf>
In-Reply-To: <20240803111855.1726141-1-ju.o@free.fr>
References: <20240803111855.1726141-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOs5z3yckdP18y0Tb2WH4WiFTkiLyOaAmRHTVhlVG9g=;
 b=e+K1OHPWknt6lb1LxAbqrQTPPmED5JzD0uK95VB7eeH/Y36MsDwWBhEkVJRaqNvMXf21xV
 7/3FKeUY+fGPKyMGbG1BVQysvd2tiB8uzQB9JR27N156AMmf8IdjjrStJl1v8XhTmZDaFT
 Jb8k2gDAgYHkdft1GVlTo2k344twS3Yte3t8FUt/am8qnnlMFPZxkFHc1NpgY2d9M09Hq5
 4WTgh01I4gwUT0TabYND3O3xd7Pt2Qf8OP0d7sFOdvps28/JuyyBZN5dIenl6mkN1Ak+fm
 r7gz5EOymRISuIyrukMvMqdD6V/Bv1QS1wLAVsovk6oJGUe/UDVdiA1MpjF+tA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e+K1OHPW
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx6ullevk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 13:18:55 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> versions.
> 
> This commit also adds the custom version package hashes. Therefore,
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is added in the defconfig, a
> BR2_GLOBAL_PATCH_DIR is also added in the board specific directory and
> the hash files are added. The corresponding ".checkpackageignore"
> entry is also removed.
> 
> The Kernel DTS name is also updated by adding the new "nxp/imx/"
> prefix, to follow the upstream reorganization in [1], first included
> in v6.5.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                                    |  1 -
>  .../patches/linux-headers/linux-headers.hash           |  1 +
>  board/freescale/imx6ullevk/patches/linux/linux.hash    |  2 ++
>  board/freescale/imx6ullevk/patches/uboot/uboot.hash    |  2 ++
>  configs/freescale_imx6ullevk_defconfig                 | 10 ++++++----
>  5 files changed, 11 insertions(+), 5 deletions(-)
>  create mode 120000 board/freescale/imx6ullevk/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/freescale/imx6ullevk/patches/linux/linux.hash
>  create mode 100644 board/freescale/imx6ullevk/patches/uboot/uboot.hash

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
