Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581C7C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11BB880C6C;
	Sat,  3 Aug 2024 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyD7YKyWT-Mf; Sat,  3 Aug 2024 20:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17CCE80C71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CCE80C71;
	Sat,  3 Aug 2024 20:35:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1BD1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BEE060617
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUDNQfDIgYop for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A103D605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A103D605EF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A103D605EF
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:35:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 489BA40002;
 Sat,  3 Aug 2024 20:35:07 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:35:06 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240803223506.7ebdf0a1@windsurf>
In-Reply-To: <20240803134328.2947645-1-ju.o@free.fr>
References: <20240803134328.2947645-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OpMOA2TWaj1JbDaqAbKz0nXOCKurmK7WYUhK+n3gVQ=;
 b=ZZfyJY/ZpDIWFQRXU6wyiqejOLvu6IdZR5VZysIh6CH0kJL1ce7sbdCnMQ2gj7CeqvfpPg
 GJSiH5QQUrShiUVH5nf8wvohZn3A3W1PtaAd+hc8kwb3xIJOQo//CB/kFiRJzwjL7j25gR
 ahmDnPJw7Z0DFBdTabLMgUhkjcuDeMGRn+ShNRy8/20U3coZwUxacj/oJ1B9eVfMIsmlR+
 NwszqolHn7FFoY2X6W8GMGRcrdIOF1XpvGXQplvHK09MqmjkJgIAEwXYaZGPzG7jubaKa0
 av7w8F9zhl5c3IuhTVfznxH4TzZa2+89Ai0FKdwcqZ5Qe6yn8MrZ8bnkRMrF8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZZfyJY/Z
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx93evk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 15:43:28 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
> versions.
> 
> Also, commit c05f27c8ae "configs/freescale_imx93evk: new defconfig"
> introduced the custom hash files, but did not add
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig. This commit fixes
> this issue by adding this config directive. As a side note, commit
> 22fd54b737 "configs/freescale_imx93evk: Update to NXP lf-6.6.3-1.0.0"
> updated the defconfig components version, but did not updated the
> custom hash files, because they were ignored. This is why hashes were
> still at version 6.1 whereas components where already at 6.6.
> 
> Since hashes were not enabled, this was not detected by
> "make check-package", and the entry in ".checkpackageignore" was also
> kept. This commit also removes this entry.
> 
> Finally, with the bump of BSP components, this commit updates the
> custom hash files accordingly.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Actually, you had forgotten to remove the no longer relevant entry in
.checkpackageignore, so I did that.

FYI, at https://paste.ack.tf/e0a06d you can find a script (from Yann
E. Morin), which you can put as a post-commit and post-applypatch hook
in your Buildroot git repo, it will run some checks everytime you commit
something. Super handy!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
