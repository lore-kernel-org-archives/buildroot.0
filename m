Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FA6C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F22C60017;
	Mon, 26 Aug 2024 16:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhFd0cb2u5nx; Mon, 26 Aug 2024 16:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D6B160748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D6B160748;
	Mon, 26 Aug 2024 16:43:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8405C1BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D4640315
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSfGSZniC5OS for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27036402FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27036402FB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27036402FB
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:43:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 126031BF205;
 Mon, 26 Aug 2024 16:43:23 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:43:23 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240826184323.4c998f31@windsurf>
In-Reply-To: <20240824175821.828808-1-festevam@gmail.com>
References: <20240824175821.828808-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724690604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQpBFNpbB2VQ+QMtuY5WISCkN/GB+6DwWtjzglbHTwM=;
 b=TxBWodrJBHzepi11j7TnC1gNgFvuXylk5kQhrr3aT1UVWB6NwJD6ez+Q3WcUiuPQqwvtxb
 WBn3UdS5F1675Ip3eyzmW6rLBkGx2Kh2yX3OiSsU/ZtacUkCYzk8NNwReRLUPLq/naN8Q3
 b1YZPp9brvSE3OI+1oDTuFbzRzWtW/yF+FzSpdoolBN3DIxuvZFYDVtYTuZ85ZUmXZc2JQ
 NF6pIJx1PsIVk9NEGSEsWbekjtoNB+zE5/MKo0y0lUnEUnq8hFqqTTe29LFu/A1enUmRz8
 a12tPeDb5lSj2skwm0YSctKWs4LOBwxYrgg6wnvZzOjITQA36tSiCyZ3blkPOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TxBWodrJ
Subject: Re: [Buildroot] [PATCH] configs/mx6udoo: update U-Boot and kernel
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabio,

On Sat, 24 Aug 2024 14:58:21 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.07 and kernel 6.10.6 versions.
> 
> As kernel 6.10 fixes the USB kernel hang, remove the original patch.
> 
> Also convert it to use extlinux.conf file.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../linux/0000-udoo-disable-usbh1.patch       | 26 -------------------
>  .../boot/extlinux/extlinux.conf               |  4 +++
>  configs/mx6udoo_defconfig                     | 15 +++++------
>  3 files changed, 10 insertions(+), 35 deletions(-)
>  delete mode 100644 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
>  create mode 100644 board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf

Applied to next. You had forgotten to update .checkpackageignore, which
was referencing a patch that you are removing here.

Also, while you're working on this defconfig, what about enabling
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
