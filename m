Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5289C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80FDA80CAF;
	Mon, 19 Aug 2024 20:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoX8Aulu1F-F; Mon, 19 Aug 2024 20:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FE480E54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FE480E54;
	Mon, 19 Aug 2024 20:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CFC71BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5816260839
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WlH8jLgT-80 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2233C60611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2233C60611
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2233C60611
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:27:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D316C0002;
 Mon, 19 Aug 2024 20:27:55 +0000 (UTC)
Date: Mon, 19 Aug 2024 22:27:55 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240819222755.73958c4a@windsurf>
In-Reply-To: <20240819-boot-uboot-clean-for-pmufw-v2-1-055f6b9ad56d@collins.com>
References: <20240819-boot-uboot-clean-for-pmufw-v2-1-055f6b9ad56d@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724099276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZzZriqDYv51977kZu/YkUKMK3x87EGRR61b7FBQfkU=;
 b=fsnmS7v+TkbhGhBrUHu+T7506P9v8t6XLRnknqTSDWxTpNGM4wHWx6xyZIJuhgBLR2eNqm
 jMVjGX6j0cX/mO4UYjZIhq/ILruJDgKj7sELjYZYNcOw+9nzLER0aJNyk6px4Uyu/zJ4+h
 xAHjq0lfmPwUhN3BIgG6+HJ1dvrouS6Yni+oyFJAHh+LsZMDdD9ZA+pm/VSFMTMGpBeE+d
 /JZ4W/UlITZodeKxBD1/IgSImuXApTVHOPSfECuqfam0p9gSqlMaLnQBAde5SWbUAlNIt8
 BdZ2pMvzm06ivQOY0TkR/309EIBpjS+qeSFNf0T+ww8gTZbr7mwrNUKu/TBTtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fsnmS7v+
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: use $(TARGET_OBJCOPY) for
 ZynqMP pmufw.elf
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Aug 2024 19:39:29 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Converting the pmufw.elf to a binary works with any objcopy, regardless
> if it's from the host or cross-compiler. Prefer to use the
> $(TARGET_OBJCOPY) as it's always available and reproducible.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> Reviewed-by: Neal Frager <neal.frager@amd.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - Drop patch 1 [Luca]
> - Add a comment about using `objcopy` [Luca]
> - Link to v1: https://lore.kernel.org/r/20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com
> ---
>  boot/uboot/uboot.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

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
