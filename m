Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFBDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:25:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693D7613AC
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 693D7613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DEB8347D;
	Wed, 17 Nov 2021 22:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Swno_tRkko_F; Wed, 17 Nov 2021 22:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78C7983438;
	Wed, 17 Nov 2021 22:25:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AD331BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A54960A9C
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKUXpPLLukB0 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:25:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 163E060A9B
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:25:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3BDE31C0007;
 Wed, 17 Nov 2021 22:25:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnTMq-00082n-Ba; Wed, 17 Nov 2021 23:25:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabio Estevam <festevam@gmail.com>
References: <20211113214245.4067687-1-festevam@gmail.com>
Date: Wed, 17 Nov 2021 23:25:24 +0100
In-Reply-To: <20211113214245.4067687-1-festevam@gmail.com> (Fabio Estevam's
 message of "Sat, 13 Nov 2021 18:42:45 -0300")
Message-ID: <87ilwqs9m3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Currently, when BR2_LINUX_KERNEL_INSTALL_TARGET=y is selected, issuing
 > a "saveenv" command in the U-Boot prompt may lead to rootfs corruption.

 > When BR2_LINUX_KERNEL_INSTALL_TARGET is not selected, then
 > board/freescale/common/imx/genimage.cfg.template is used as per the logic
 > inside board/freescale/common/imx/post-image.sh.

 > board/freescale/common/imx/genimage.cfg.template correctly puts the
 > rootfs at a safe offset.

 > With BR2_LINUX_KERNEL_INSTALL_TARGET=y, then
 > board/freescale/common/imx/genimage.cfg.template_no_boot_part or
 > board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
 > are used and no offset to the rootfs is given, which may cause U-Boot
 > environment area to write into the rootfs area, causing the rootfs
 > corruption.

 > Avoid this problem by placing the rootfs at an 8MB offset, just like
 > it is done in board/freescale/common/imx/genimage.cfg.

 > Tested on a imx6qp-wandboard and also on a custom imx6ull based board.

 > "saveenv" does not corrupt the rootfs anymore after this change.

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>
 > ---
 > Changes since v1:
 > - Improve commit log (Yann)

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
