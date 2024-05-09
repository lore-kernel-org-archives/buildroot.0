Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486FDC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4009E41E8C;
	Thu,  9 May 2024 16:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1oyQ5Fwr8SB; Thu,  9 May 2024 16:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5FA41E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5FA41E90;
	Thu,  9 May 2024 16:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDBE1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6999B41D91
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ws2Jf_7-CL2b for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D8734039D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D8734039D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D8734039D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:42:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1A1C1BF203;
 Thu,  9 May 2024 16:42:50 +0000 (UTC)
Date: Thu, 9 May 2024 18:42:50 +0200
To: Ludovic Desroches via buildroot <buildroot@buildroot.org>
Message-ID: <20240509184250.0fa25dbb@windsurf>
In-Reply-To: <20240409122233.2529454-1-ludovic.desroches@microchip.com>
References: <20240409122233.2529454-1-ludovic.desroches@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715272971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scU/vUktAJ1K2CA2jbVMbWiDtUUhAIrNWhODB5qo3y8=;
 b=o8epC2lpbFzAQGlnfVyAtCrg7iKG2PKBfYjofnoljeORukGvcd6bUKxCoj31p+wu7KwBVK
 Db0v74C+nnE6WGFXY7xhbUoU5z0xz+GlOxpz6/+uag4F202PMOr20QTzsKPlkbuAsxoXEd
 hXY6TEok0hBH53945ZeWD8jnSCwEGX66YK/UKup5IK8/xBqRs8KTcKQrEs/LCkTRtq6DVN
 Li/PB3fMXufDTNkaIf2DxC2qOmG/QEZ0JWh9dayESjDRa3fEcCdm+7WomUqC9Usm35XEan
 OnKBBvx/T5yCE9LPbx5IN6yPMURgYIZ8yMhT7qZNQTr0PckOMBhfVj0SJjujUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o8epC2lp
Subject: Re: [Buildroot] [PATCH] package/evemu: add staging installation
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Naumann Andreas <ANaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 9 Apr 2024 14:22:33 +0200
Ludovic Desroches via buildroot <buildroot@buildroot.org> wrote:

> To make the evdev library available for other packages, install it to the
> staging directory.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  package/evemu/evemu.mk | 1 +
>  1 file changed, 1 insertion(+)

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
