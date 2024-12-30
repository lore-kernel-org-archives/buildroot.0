Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDDFE77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 21:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 143A880515;
	Mon, 30 Dec 2024 21:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erBaG1gZTRM0; Mon, 30 Dec 2024 21:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2733C8059E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2733C8059E;
	Mon, 30 Dec 2024 21:42:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4CE6E0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8F2B40133
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dbct4AUbL0Rm for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 21:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7791940263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7791940263
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7791940263
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 21:42:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5863EC0003;
 Mon, 30 Dec 2024 21:42:52 +0000 (UTC)
Date: Mon, 30 Dec 2024 22:42:51 +0100
To: John Ernberg <john.ernberg@actia.se>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, Jonas Blixt
 <jonas.blixt@actia.se>
Message-ID: <20241230224251.73600ba3@windsurf>
In-Reply-To: <20241227103623.1608053-1-john.ernberg@actia.se>
References: <20241227103623.1608053-1-john.ernberg@actia.se>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735594972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROc/ohLmbgl25QuRrVrjtn2JMzacTTIVuJpiGZ5XV5c=;
 b=iYZ2bMsrCZ2mwokml0uG/9jt2F7RqgZkqZQPkcFq7w5GCmdG4kLC60ojxgqqJjrRQFQCaA
 /uy7jy6dkh2e/v264L8RSw6HJn7CoBa55SjzawdD4erAV7M4nUIouY6Y/rT1oc/cq6carT
 wEVDTeoQdCUz7Y1n4Aba1YB0A+FlSrtkwJK3CqEsAgSfkN7csBVhX0EiQGx0pILKif1x3I
 dGeSVQZNoTj0JG6/VQuCptDza4R5p08q3pFLbLgjgZJe08PrXz1nYZfHuUuBmCJue5hUsM
 plr6ayboCW+FFwQLZtaQNMnEEAe5dIVocwB0IucVcPKDEIh1eX0ZEAKdfyM33g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iYZ2bMsr
Subject: Re: [Buildroot] [PATCH] fs/squashfs: Allow to disable compression
 of the filesystem
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

On Fri, 27 Dec 2024 10:36:35 +0000
John Ernberg <john.ernberg@actia.se> wrote:

> Devices with large amounts of flash but operating in connectivity-
> constrained areas can benefit from using uncompressed images as this
> allows delta updates using binary diff algorithms.
> 
> Connectivity-constrained areas in this context are defined as areas
> where the connection is very slow, unstable, etcetera, where it is
> difficult to transfer data in large scale.
> 
> Add a "none" option to the compression menu and map it to the mksquashfs
> -no-compression flag to enable this feature.
> Disable the ability to select extreme compression in this case as that
> makes absolutely no sense combined with no compression.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> ---
>  fs/squashfs/Config.in   | 6 ++++++
>  fs/squashfs/squashfs.mk | 2 ++
>  2 files changed, 8 insertions(+)

Thanks a lot for this patch, makes sense, so I've applied to our master
branch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
