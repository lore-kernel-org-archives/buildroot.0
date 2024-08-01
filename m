Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80046C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E1F8206A;
	Thu,  1 Aug 2024 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOnLV3fUEAbU; Thu,  1 Aug 2024 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE668209C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE668209C;
	Thu,  1 Aug 2024 21:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9761BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D3AE606CA
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rff6l1nZW1p for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12BED60615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12BED60615
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12BED60615
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:38:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15C1D1C0002;
 Thu,  1 Aug 2024 21:38:37 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:38:37 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801233837.05b46ad1@windsurf>
In-Reply-To: <20240801192750.50064-1-ju.o@free.fr>
References: <20240801192750.50064-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyMR3+irQJMRfWbEFTXD2+AlNm9rT9UIxmrnIK736KY=;
 b=Ju8rXSOg6WQYCvhpL58QGqe4CPa3lZGQWeGczknFcTxDVdE6VOnRJl2LJQzhAV8g8sIaNL
 JxxutVPuvluQ6AqLDcaiup+YiJL2uJVgO6AHuLLhUfVhs4fgNlp7KFs2/AXIrJpu9jF0q+
 BPgvDlfEPn9LIR/bqgicBW5WuJRIqHHF69H8zXpp7HFCtQgtfOJF13MsfmdklGn94EHkT/
 dTWANc8+w+4l+wfzzDVRfG6JXjEkLzfWRCgqkUtRIGt1d/7w5+czTR5aJc78S+EvJRlXZb
 89fBzU5XmqHsbqJoEjVdBsKb/BGwvWD1GGZ6uKgwzETpkRNJKVZ/EDAiitZwKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ju8rXSOg
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-sc-firmware:
 bump to version 1.16.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 21:27:50 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This version is aligned with NXP Linux BSP version "lf-6.6.23-2.0.0".
> 
> License hashes changed because the LA_OPT_NXP_Software_License changed
> from "v39 August 2022" to "v56 April 2024".
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
>  package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
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
