Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F2BC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3ADF8114A;
	Mon,  5 Aug 2024 20:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXf0t_SpbzeZ; Mon,  5 Aug 2024 20:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71AB381216
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71AB381216;
	Mon,  5 Aug 2024 20:41:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFA631BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C679440246
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LS8zYWET3q7R for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D43B4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D43B4023C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D43B4023C
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:41:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30DE0FF805;
 Mon,  5 Aug 2024 20:41:08 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:41:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240805224107.787f9a01@windsurf>
In-Reply-To: <20240805190627.3410877-1-bernd@kuhls.net>
References: <20240805190627.3410877-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtBkhieW0V5gULsU/DYEUdy1D/T3YAcIiKIgT4SRCtI=;
 b=VxWjmCBKuu0XcKiL6U5dmaHcgXZaXK+3nMOYe2gifqTeZEhdSPz3LCqQn1dzsrQXGaRHQO
 8DkbILfjCGTzYLfgqJtMX5zXq5lVN7kXakmwaayzxDGy6hxBPSYpj+Aa+jUrmXNopCdxTu
 JEMYEAOXL2Vm/Oq4wpGb6Wz9d5VYVkk2qFPICPhAD6yb3PkQVkvD66gO0Krf+8cpgHt/aF
 CtXi3qK4hDfx5cGsV2WRPtM/++Z5ojjb2GpJ9pRVJF6ALj/JACjM1WhAx861g3jEcIHk0h
 jD8vhxFfxecqiYo8NbaaruJiWm7AcroKwXRGnCnFScJiLR89He9P2MSQ/tON9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VxWjmCBK
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Aug 2024 21:06:27 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> This bump adds support for ffmpeg 7.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tvheadend/tvheadend.hash | 2 +-
>  package/tvheadend/tvheadend.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
