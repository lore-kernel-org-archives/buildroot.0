Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0125EC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B32EA605D8;
	Sun, 14 Jul 2024 15:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5CKpZ0DSSEO; Sun, 14 Jul 2024 15:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CABA860730
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CABA860730;
	Sun, 14 Jul 2024 15:09:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 973F31BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83A09404A8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHMsx6peQiEA for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31F9F404A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31F9F404A4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31F9F404A4
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:09:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D02D1C0003;
 Sun, 14 Jul 2024 15:09:20 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:09:19 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240714170919.144fbdf4@windsurf>
In-Reply-To: <20240713170337.1137765-1-dario.binacchi@amarulasolutions.com>
References: <20240713170337.1137765-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8M+UurRKIp9SDT2JSv8AaFLbowIRn9wc4p93g+4Qrc=;
 b=KPaJl6sT6A8U6Rtzlmh9GA5+O330s8FTG6v4S38K5Hzr/AVdKgi2lX03ZHarC5Pf78SRGJ
 AHPD5jpA7nfBT6hfT/tAx7lETMG9TbCC2Kqi+ryhqIVmZ8lbrJEoOP5PYZgTjheN5ZRgvT
 nbJpgGNihPb01VVYf5bGyWEDnGAHYclem/MnMJbKtYlsGrYZtO3hnGy3xKW8D5tewbZAYS
 eV3TK29CXBefnZNQ1YpEcnIRnDTbq1T64NwEHozpR0bOH+KnVwE1+fY3iKrypjkdBTApf/
 szReu5F11AF2EbTHeQr8WhUEmATD8VL3TjrhQHjL9TfQCFKSfQ4EtJX9qsrp3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KPaJl6sT
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2024.07
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 19:03:37 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/uboot/Config.in  | 6 +++---
>  boot/uboot/uboot.hash | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
