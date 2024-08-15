Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA732C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874EE608FE;
	Thu, 15 Aug 2024 20:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNsYiNGZpXC6; Thu, 15 Aug 2024 20:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A06C360A80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A06C360A80;
	Thu, 15 Aug 2024 20:05:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E92781BF3F4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D598884085
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Reldl5LIQI5o for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C23AA84082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23AA84082
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C23AA84082
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:05:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CEE460005;
 Thu, 15 Aug 2024 20:05:36 +0000 (UTC)
Date: Thu, 15 Aug 2024 22:05:35 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240815220535.260e8aa2@windsurf>
In-Reply-To: <20240808-bsp-bump-v1-0-9e1c6f3c2592@ti.com>
References: <20240808-bsp-bump-v1-0-9e1c6f3c2592@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723752336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cz3BhBoDgc6JD6P5/p+TcT8+SuavUQlrMlyEuYxaqkY=;
 b=iPsRgNIawDY+KcYJ8LIzxvhx8KA5AWB9izfSKhguxUK3RyJ+HB+dsK6VRn4YENR9WvBNuw
 tdpmd0ukKgQ9qaJyVO6REgq52QCQdlpusUAU/G69EamcCTE/RqFHostJRLrSZPK8Pihf3T
 1oxXfkOmdD1ym7ludQzJoeE0omAXw7nUlADk1VkKqDqjwFrBCDOr2weACPNJ43uJ8zApnQ
 WLmax7UXeiUgkVFeMspPhBrtUZve3+IUqKlot7Kp+IksZWRGhfEIeL801l42Ozjm56dTmj
 31BSfFs8oY6Ga/9Xc5HwjH1so/H17ztAPUu3hZ8wXosyjbqw62rCyhkXBSMd4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iPsRgNIa
Subject: Re: [Buildroot] [PATCH 0/4] board/ti: baseport bump for TI boards
 and beagleplay
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 8 Aug 2024 15:35:11 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> Bryan Brattlof (4):
>       configs/beagleplay_defconfig: bump tfa, uboot and linux versions
>       configs/ti_am62x_sk_defconfig: bump tfa, uboot and linux version
>       configs/ti_am62ax_sk_defconfig: bump tfa, linux and uboot versions
>       configs/ti_am64x_sk_defconfig: bump tfa, uboot and linux versions

Thanks, all applied to next. I like the fact that all 4 configurations
are aligned on the same versions of TF-A, U-Boot and Linux.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
