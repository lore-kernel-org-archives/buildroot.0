Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007A2C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C266B80BEA;
	Sat,  3 Aug 2024 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQrsbiQus4AQ; Sat,  3 Aug 2024 20:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF5E580C15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5E580C15;
	Sat,  3 Aug 2024 20:31:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBACE1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C60114012A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnkE3PCwb-Bz for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3959E400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3959E400DD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3959E400DD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:31:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2DE01BF203;
 Sat,  3 Aug 2024 20:31:48 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:31:47 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240803223147.66b48547@windsurf>
In-Reply-To: <20240803134328.2947645-1-ju.o@free.fr>
References: <20240803134328.2947645-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4l4wUgU4ol3Cdp5S4bw3iTcON4UjRFQMd6l9UA/xI6M=;
 b=UdmdPq6Qk+9kwREX9GV5jaiYSAh3gAEWpOcV8iZokMLafA+dfbdGOOm3vSsQPRIwn9rT6X
 1UVEq5sqG4rSIo7KSnfTaEYj3Mt9eEJP2zequcv2tTPKSBIK4xeNG3fKSuDSlEKJQ4dRH+
 i8DXtEri2cnaPj2+OYTMN/7rjCleY6l+GvK2oeXoAdmaicRnsBjs0/fRR3eSB8kvidfmpa
 JiCRLyOg8aOu5SKSNPFjh+SuIi5VOYDobBYPsNZf0m0aKURueqOCE9qFvl7QTphl8A7ZlA
 VJD8V+OLJEY730XGwOKlYi6CXtR9Ck0Y7fkMTd0C1xXkKQIWQt39fa6Dg9rfTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UdmdPq6Q
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx93evk: bump BSP
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 15:43:28 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> versions.
> 
> Also, commit c05f27c8ae "configs/freescale_imx93evk: new defconfig"
> introduced the custom hash files, but did not add
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig. This commit fixes
> this issue by adding this config directive. As a side note, commit
> 22fd54b737 "configs/freescale_imx93evk: Update to NXP lf-6.6.3-1.0.0"
> updated the defconfig components version, but did not updated the
> custom hash files, because they were ignored. This is why hashes were
> still at version 6.1 whereas components where already at 6.6.
> 
> Since hashes were not enabled, this was not detected by
> "make check-package", and the entry in ".checkpackageignore" was also
> kept. This commit also removes this entry.
> 
> Finally, with the bump of BSP components, this commit updates the
> custom hash files accordingly.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  board/freescale/imx93evk/patches/linux/linux.hash          | 2 +-
>  board/freescale/imx93evk/patches/uboot/uboot.hash          | 2 +-
>  configs/freescale_imx93evk_defconfig                       | 7 ++++---
>  4 files changed, 7 insertions(+), 6 deletions(-)

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
