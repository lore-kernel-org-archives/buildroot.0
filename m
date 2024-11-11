Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9526CD3ABCF
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 22:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B9480E16;
	Mon, 11 Nov 2024 22:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trGDUoZd0O59; Mon, 11 Nov 2024 22:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC1F080DFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1F080DFF;
	Mon, 11 Nov 2024 22:46:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A26BD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 22:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB67B80DFF
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 22:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaZw6P_XJcuO for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 22:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBD6680AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD6680AC6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBD6680AC6
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 22:46:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AA441BF204;
 Mon, 11 Nov 2024 22:46:37 +0000 (UTC)
Date: Mon, 11 Nov 2024 23:46:36 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241111234636.704b57ae@windsurf>
In-Reply-To: <20241107144453.4093935-1-fiona.klute@gmx.de>
References: <20241107144453.4093935-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731365197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPanK5u73ZJdJsktAOWs6apdt9nvJmZ/VVkga8ZNDok=;
 b=Mm4TlXywhVJqL6PB7MaLL4wEEFshh7yj1x77AQCmrFtzHVCVL20JAt/Rqh710yjTkXPJsj
 nUl0DqmMZAUHbxwqM6jVpoYtoyDBBT28hoFtr7DYFDUCBlzRJ63+hJjHVUb/LlRzK2iWeO
 GqBmkXk+KO0kARPo6+vp/ykvJ6vtoFof1yNRqiAqoyqZ4We7uqFirmxtPMVQYWUN6ZGUD7
 yrUlCTXBPPkgzZ71esltqTW+JcbjF2PMp/b4SOi1BOPvVYFF+cZqdOTwbGzzuul1yi8txn
 lV4nuZ28rUWAhmvcm/WCnIK0KRriJuadwiZ5tB1S3cuCtHdpZjfoufxj+Y+N3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mm4TlXyw
Subject: Re: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump
 version to 20240926-102326
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Nov 2024 15:44:53 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This version adds the -i flag to select the device to boot by serial
> number [1], which is important when working with multiple RPi
> devices. Otherwise mostly firmware updates, see [2] for all changes.
> 
> Also switch to the git download method for reproducible archives.
> 
> [1] https://github.com/raspberrypi/usbboot/commit/481c5e8a77d7bbf81060deb0f3efe463ec97243f
> [2] https://github.com/raspberrypi/usbboot/compare/20221215-105525...20240926-102326
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  ...akefile-allow-passing-CFLAGS-LDFLAGS.patch | 20 +++++++++----------
>  .../raspberrypi-usbboot.hash                  |  2 +-
>  .../raspberrypi-usbboot.mk                    |  6 +++---
>  3 files changed, 14 insertions(+), 14 deletions(-)

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
