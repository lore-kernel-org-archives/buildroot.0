Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56974C3DA7F
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 21:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 286A440BA0;
	Tue, 30 Jul 2024 21:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5X07TLKp2mJ; Tue, 30 Jul 2024 21:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD3AD40BA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD3AD40BA7;
	Tue, 30 Jul 2024 21:46:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8FB1BF977
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F136D40B9E
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HEXnM9ETmBp for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 21:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83B4740B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B4740B8A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83B4740B8A
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 21:46:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACFB4FF802;
 Tue, 30 Jul 2024 21:46:02 +0000 (UTC)
Date: Tue, 30 Jul 2024 23:46:02 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240730234602.0e69bd1f@windsurf>
In-Reply-To: <20240720201659.2253736-5-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
 <20240720201659.2253736-5-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722375962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wl6VCLvuhdCaZXUBXOcSBq/7ltDHFHNWOW+iPZodev8=;
 b=W3Jqu9XOCcjwZQV9oogVDkm7tIB7IN97FgknjFuPZMDpOUsQHI5AXIGiWkCBASKhoCz7of
 tXX1/WEwjHEsaKUp3T+xmAVrV6sZMpxrPwtZfDG8Ucjl339zr/hLGMerJd8gszVDw+180Z
 p/88I5vK0TCPjjqOEP3u7QbGL96tEOmk0NaaZand3uu8vJYTcrnRlc7shjUT94ARycourS
 ksIQ9TXQXrIEt14n3Oc+YdMh7bsmxd6z7lE0MsIV7LRrS9xEhGv2+72J6xDUcMsLllsArp
 qLrhVvpmzmbPeG4cAeBRR4XeXtWQ/eM9cV2lo4rxArsKodxLsND4Id6rIp0+xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W3Jqu9XO
Subject: Re: [Buildroot] [PATCH 5/5] configs/beaglebone: bump Linux to
 6.6.32-ti-rt-arm32-r7 and U-Boot to 2024.07
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
Cc: linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 22:16:59 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 6.6.32-ti-rt-arm32-r7 and
> U-Boot to version 2024.07.
> 
> Tested on beaglebone black.
> 
> Link: https://github.com/beagleboard/linux/releases/tag/6.6.32-ti-rt-arm32-r7
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/beagleboard/beaglebone/patches/linux/linux.hash |  2 +-
>  board/beagleboard/beaglebone/patches/uboot/uboot.hash |  2 +-
>  configs/beaglebone_defconfig                          | 10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)

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
