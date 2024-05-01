Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4378C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730A2813F1;
	Wed,  1 May 2024 21:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmyb4x2xpoRW; Wed,  1 May 2024 21:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7555881434
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7555881434;
	Wed,  1 May 2024 21:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1A31BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48E9D81364
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkCffp6xpLYW for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5D568133B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D568133B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5D568133B
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:34:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03F35C0002;
 Wed,  1 May 2024 21:34:29 +0000 (UTC)
Date: Wed, 1 May 2024 23:34:29 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240501233429.055e5225@windsurf>
In-Reply-To: <20240416000105.95779-1-festevam@gmail.com>
References: <20240416000105.95779-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714599270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJcacm43N0CHYtuksjCKMtiUy6U1cW6HT4LUxuwo/g4=;
 b=f3eexAcMeeOPzZDC/qeid2kTtCRv36A/NnNI8VvD8RNSoUbYGrzBW5lA5DKcvFW8ekCgOv
 8xSC/JGYxcUSsdlTZve/BOEleGcE+Ls3D95uNn414rcyH1zMJq6SRWsMuE0IYPnZeo3yc0
 Lgj4s4sdUWRyXRW+eJZX/cJLKz9pfBqPQZGZ+emP8LDTWUKzjBpT1gik755AAtx1Hz0ahs
 R6a5wdms7tjtQINdQvnPv2V2KCs/ET/XH5LeC5EhImYpmuGB0npySjfsJpUDEQBLxwN759
 S4RtiabVXK+ookjeOFrwpA4QOecVpSWnQN9umoE0WOGEeZQaZAketVuLFcr8WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f3eexAcM
Subject: Re: [Buildroot] [PATCH] configs/mx6cubox: update U-Boot and kernel
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

On Mon, 15 Apr 2024 21:01:05 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.04 and kernel 6.6.27 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/mx6cubox_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

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
