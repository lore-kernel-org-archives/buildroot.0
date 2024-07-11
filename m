Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A2C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 22:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD9C84146;
	Thu, 11 Jul 2024 22:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsJgXF2AZ51F; Thu, 11 Jul 2024 22:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5327884158
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5327884158;
	Thu, 11 Jul 2024 22:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8BB1BF860
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C0AC60766
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egMZHs3wmpmB for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 22:28:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0717660743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0717660743
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0717660743
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 22:28:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF9951C0003;
 Thu, 11 Jul 2024 22:28:13 +0000 (UTC)
Date: Fri, 12 Jul 2024 00:28:13 +0200
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <20240712002813.1a9e7f2a@windsurf>
In-Reply-To: <20240611165539.658551-1-jarkko@kernel.org>
References: <20240611165539.658551-1-jarkko@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720736894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGpj+8ft8O41IEGT2BdsbvPMn4XyELkicWRyEevHGco=;
 b=kRE6LDUlMDH+3JZah5Gn5z9CaVVNyGIG5ITg05xrNSbkynyrVxpzlPZdHOpW/fm2zWpCJA
 7WkmT60KYeO46QhKioxNDmEbuV8o3VKy7egzvwp9ifWUtTF25+RG6LDC803gKF/zzrYo4C
 SDhF2BW7Ydg9prD8dfBkiTJ5EHj7NAqtnGjvCcZgMZe+wI8CAoc9u8UfJIVEXLa5wR74ON
 hmxaZmMGGztGuXWs1zoShyoNl0nzrsBX4WpT9PRmjOVjbx7dV22w5fqw5obwRVIOHb2HS2
 gxtp9PgYge15Cuz/kuTa+ZEnoU3WiN3nQch1YRqEvYUEJIQZRhFplTLn+cxQRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kRE6LDUl
Subject: Re: [Buildroot] [PATCH] package/systemd: Add BCACHEFS superblock
 magic
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
Cc: Sen Hastings <sen@hastings.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jarkko,

On Tue, 11 Jun 2024 19:55:39 +0300
Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Add the magic number for the bcachefs superblock. Otherwise, systemd
> 254.13 fails to compile with the latest kernel versions.
> 
> Upstream commit ID:  201148b08de6 ("basic: Add BCACHEFS magic")
> 
> Cc: Norbert Lange <nolange79@gmail.com>
> Cc: Sen Hastings <sen@hastings.org>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Link: https://social.kernel.org/notice/Aie4Z8s4zYztoFTWUq
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Thanks for the patch, which I have applied, after fixing a few things,
see below.

> diff --git a/package/systemd/0001-basic-add-bcachefs-magic.patch b/package/systemd/0001-basic-add-bcachefs-magic.patch
> new file mode 100644
> index 0000000000..ca13067f6a
> --- /dev/null
> +++ b/package/systemd/0001-basic-add-bcachefs-magic.patch
> @@ -0,0 +1,50 @@
> +From e5ff9b585d7dc54f50085d518d7d588c250b0690 Mon Sep 17 00:00:00 2001
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +Date: Fri, 31 May 2024 09:51:38 +1200
> +Subject: [PATCH 2/2] basic: Add BCACHEFS magic

We don't want the 2/2 in our patches, because it always becomes out of
date very quickly.

> +
> +Import magic.h from Linux 6.9 to get the definition of
> +BCACHEFS_SUPER_MAGIC. Update filesystems-gperf.gperf to add knowledge of
> +bcachefs.
> +
> +This fixes the following error building against a bleeding edge kernel.
> +```
> +src/basic/meson.build:234:8: ERROR: Problem encountered: Unknown filesystems defined in kernel headers:
> +
> +Filesystem found in kernel header but not in filesystems-gperf.gperf: BCACHEFS_SUPER_MAGIC
> +```

Missing Upstream: tag, missing Signed-off-by: tag.

All 3 issues are reported by "make check-package".

I fixed them when applying your patch to master, and also improved a
bit the commit title/message.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
