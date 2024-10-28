Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8A6D5B149
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77A43605C4;
	Mon, 28 Oct 2024 20:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kufW_RYnn5Y; Mon, 28 Oct 2024 20:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90B6A6062F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B6A6062F;
	Mon, 28 Oct 2024 20:26:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA79D4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7445400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwDm0wS49hUd for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 778C4401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778C4401FE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 778C4401FE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81EA5E0002;
 Mon, 28 Oct 2024 20:26:45 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:26:44 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241028212644.4d36a228@windsurf>
In-Reply-To: <20241028200901.649397-1-ju.o@free.fr>
References: <20241028200901.649397-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730147205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUGvlip5Qv5MqraNw2Vy5ZgeAzKSsFPd2K+3a2cLFes=;
 b=X07D/zqlXmmzwS1mbFGg61mZDVuRpC8ZcEj/VRHzdmfv1zMmZkYiiwaGtgnPTfzX1NKrpe
 vG5SQadILd8UMU3LkyEbvu/j+IJ0dBgd9/GtIxTwiNdzwDVUZH6P8injDl4Al0KeySSaBj
 g2/5hvxM3aGpMGC0gcnP2hKLmY5SjMRbwiSz6PoeYOI6X4UETQ7UtqjUEoxwD5TAj/AW8K
 jlc4jQnCeYA7g41K3WMidzcplkWnwqgOr0UCWaJ1H74PIZltWuHHpZSf5we/LEpF309VeM
 W+lW/TdZhrQj/Gscu0CF//Wdzs/y0nWFvnL57V6ydTGO3KhIEsysMtQEt2vmmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X07D/zql
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.3.7
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

On Mon, 28 Oct 2024 21:09:01 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v2.3.6, see:
> https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch runtime tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8208922400
> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
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
