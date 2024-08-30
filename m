Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD85CA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C8D400D6;
	Fri, 30 Aug 2024 16:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4VEivaHRkS9; Fri, 30 Aug 2024 16:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6799040118
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6799040118;
	Fri, 30 Aug 2024 16:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8203A1BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FDAB840F2
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgYeehqEMrYE for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2940D813C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2940D813C3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2940D813C3
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:56:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96342240007;
 Fri, 30 Aug 2024 16:56:14 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:56:13 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240830185613.1d568c17@windsurf>
In-Reply-To: <20240830101327.2000179-2-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
 <20240830101327.2000179-2-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725036975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00UzTs4z4EcRIpZ2kt2sGm0GctBXJrTSsgiaOp/HIQA=;
 b=pokBeP1TDyJ6wt+IHTc6aHJ/D8rVWr+SACKV1iBwJPjPmEVFn0c2smsRhTwnkru9z74rfs
 tWEvkN8JTs0FsvKi3L3jIy3m5RjGwDNDBkAZj/a/DpW6fi7bB+wi6WDL1/auTCjVOtye4S
 NOlmZbCHye/lbyJQ2fcOqZW/ZBIvQlH1zLiDCVwO3/EtcNlqGWklmGrYPzr4lFBygI9dXO
 y9F7t/WfisL9XJjJvRz2oxaegZ5DR7jd6DMaQbFV/jpp6OgQfbEe/wsMuVNRTRjxpGxfiB
 5boJRX20Yr6Zc06R0tOUaZB3SVS/JhEUNmH4PFW5VeN3iONGq5j8VrXu0TL+2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pokBeP1T
Subject: Re: [Buildroot] [PATCH 1/4] board/radxa/rock5b: use PARTLABEL to
 specify rootfs
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 30 Aug 2024 12:13:24 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
> index a1a531f038..8759d7491c 100644
> --- a/board/radxa/rock5b/extlinux.conf
> +++ b/board/radxa/rock5b/extlinux.conf
> @@ -1,4 +1,4 @@
>  label Radxa Rock 5b Linux
>    kernel /boot/Image
>    devicetree /boot/rk3588-rock-5b.dtb
> -  append root=/dev/mmcblk1p1 rw rootfstype=ext4 earlycon rootwait
> +  append root=PARTLABEL=rootfs rw rootfstype=ext4 earlycon rootwait

I'm wondering how this can work. Indeed the genimage.cfg file for this
board creates a MBR partition table, which doesn't have any
concept/space to store partition labels (unlike GPT partition tables).
And my understanding is that PARTLABEL is based on GPT partition
labels. So how can this work?

From the Linux kernel code:

 *      9) PARTLABEL=<name> with name being the GPT partition label.
 *         MSDOS partitions do not support labels!

Note that I would be fine with switching to a GPT partition table to
make this work.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
