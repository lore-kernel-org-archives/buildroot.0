Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF63C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:15:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B2C60FD8
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27B2C60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC28C60717;
	Sun, 14 Nov 2021 14:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lndBL45OyMLs; Sun, 14 Nov 2021 14:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC2C606F7;
	Sun, 14 Nov 2021 14:15:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF911BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A7F1606F7
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ug9HGZVJOtkc for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:15:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CF16606CA
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:15:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7DE581BF205;
 Sun, 14 Nov 2021 14:15:49 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:15:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20211114151548.79a357e8@windsurf>
In-Reply-To: <20211113214245.4067687-1-festevam@gmail.com>
References: <20211113214245.4067687-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] imx/genimage: Place the rootfs at a
 proper offset when BR2_LINUX_KERNEL_INSTALL_TARGET=y
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Nov 2021 18:42:45 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Currently, when BR2_LINUX_KERNEL_INSTALL_TARGET=y is selected, issuing
> a "saveenv" command in the U-Boot prompt may lead to rootfs corruption.
> 
> When BR2_LINUX_KERNEL_INSTALL_TARGET is not selected, then
> board/freescale/common/imx/genimage.cfg.template is used as per the logic
> inside board/freescale/common/imx/post-image.sh.
> 
> board/freescale/common/imx/genimage.cfg.template correctly puts the
> rootfs at a safe offset.
> 
> With BR2_LINUX_KERNEL_INSTALL_TARGET=y, then
> board/freescale/common/imx/genimage.cfg.template_no_boot_part or
> board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
> are used and no offset to the rootfs is given, which may cause U-Boot
> environment area to write into the rootfs area, causing the rootfs
> corruption.
> 
> Avoid this problem by placing the rootfs at an 8MB offset, just like
> it is done in board/freescale/common/imx/genimage.cfg.
> 
> Tested on a imx6qp-wandboard and also on a custom imx6ull based board.
> 
> "saveenv" does not corrupt the rootfs anymore after this change.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Improve commit log (Yann)

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
