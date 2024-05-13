Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F9AC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D6E240356;
	Mon, 13 May 2024 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFP7rb1K53vW; Mon, 13 May 2024 21:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0916F407FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0916F407FA;
	Mon, 13 May 2024 21:30:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C95BB1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0A0E82290
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2WanptntVbp for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0DC882263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0DC882263
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0DC882263
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:30:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 840E21C0002;
 Mon, 13 May 2024 21:30:15 +0000 (UTC)
Date: Mon, 13 May 2024 23:30:14 +0200
To: Jan Kraval <jan.kraval@gmail.com>
Message-ID: <20240513233014.3b09e56e@windsurf>
In-Reply-To: <20240220051926.68559-1-jan.kraval@gmail.com>
References: <20240220051926.68559-1-jan.kraval@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715635815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdwsgXMYx11grlnVaW5WldY1TYYJw4ExcTD+h4I8p5o=;
 b=Ce0cBNoCewbb6LXq7p4YnhR2354/J0M0JM018txywCvjgCPHWbih5axvyu7aZAojv/yR6L
 X4SP7dWc+f5BgQTdxM6coSHZ4WLh8AeAvGTv7RBSjmzH+Lu1PF8V27YPEXN7lkG4+j/BO3
 me0+SO0zJgJZKwS/f23R9QGbw+bal74cRjWrrhosrqqoQiFep3+sgwenSi9bVRJxNkxZQN
 Q7udjU0HyBvixZ2luqhTpzJyUyuNM+ZiAUT+VRrXf5kDx10QZVWuNQ3b6pTHHszxSztkiC
 iUua7eFVVRQzfwUcq9cMe9XqSjhUfJilUqrpDr6rFcWWAUMq9XLRahpjoDT7VA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ce0cBNoC
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-lite: switch to
 extlinux
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

On Tue, 20 Feb 2024 06:19:25 +0100
Jan Kraval <jan.kraval@gmail.com> wrote:

> Switch to extlinux instead of U-Boot boot script. Drop custom
> boot script and genimage config. Instead use common orangepi
> files from board/orangepi/common.
> 
> Signed-off-by: Jan Kraval <jan.kraval@gmail.com>

Thanks for this patch, it looks good, except for one question, below.

> @@ -25,15 +29,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> -BR2_TARGET_UBOOT_NEEDS_PYTHON3=y

Why is this option being dropped? I don't see how the move to extlinux
has anything to do with this. For a given version/configuration of
U-Boot (which are not changed in this commit), whether host-python3 is
needed or not should not change.

Could you clarify?

Make sure to test your configuration with ./utils/docker-run, to verify
that you are not dependent on system-provided packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
