Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F942C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D7F80D58;
	Tue, 30 Jul 2024 07:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVUJ7MkCY4ar; Tue, 30 Jul 2024 07:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E9580DB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E9580DB6;
	Tue, 30 Jul 2024 07:35:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6028D1BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DEF540199
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5lubGnM3n1L for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:35:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED35B400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED35B400F1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED35B400F1
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:35:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B0C5240008;
 Tue, 30 Jul 2024 07:35:13 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:35:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240730093512.4a22ef85@windsurf>
In-Reply-To: <ZqOOwxlgzv49IYFn@waldemar-brodkorb.de>
References: <ZqOOwxlgzv49IYFn@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722324913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXSIWLu3jiIQVoqLoRWaLT4uLMHo6YCPpYLFlrWm6zs=;
 b=JuN+LN8n1DIg6pX2YMpOD51TIZamPveCaU8CF5L7b8Qi3tycqGbdEP8+oBeaiSX9V/vtwB
 ys3TWuIkfiYZg2ywnPlmtL+YBQVyLWOkjkTuc0qpTyWkjxaCWuS3p3+P4x1Z7HBy/xtG5G
 Jf/VYciiEZ8sOBl/WTkbpWEQJnwhZ9kZTaBd4SreNx7pLbxIM1toU1tTzH6vrLw1RYjTbV
 AXiJNQmuQgD0NXaZL7wTgGHtbEgkvWa/NviX0d5sMKlkeQu1GXPIKDHlzT1QoBgCQMPrTJ
 cgWBBZi4Pm8KNhDnT92j4/xC74hq4OuJ2fL7n3xOKQLiVl4ZlVGANPRI9K7gcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JuN+LN8n
Subject: Re: [Buildroot] [PATCH] configs/beaglebone: update u-boot and linux
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Fri, 26 Jul 2024 13:55:47 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Update u-boot to 2024.07. Update Linux to 6.6.32.
> Add hash checking. Linux patches are no longer required so remove them.
> 
> Tested on Beaglebone Black.
> 
> Signed-off-by: Wademar Brodkorb <wbx@openadk.org>
> ---
>  ...1-keep-jtag-clock-alive-for-debugger.patch |  16 -
>  ...ce-Sun-Solaris-style-flag-on-section.patch | 432 ------------------
>  ...EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch |  80 ----
>  ...a-ahci-fix-enum-constants-for-gcc-13.patch | 357 ---------------
>  .../beaglebone/patches/linux/linux.hash       |   2 +-
>  .../beaglebone/patches/uboot/uboot.hash       |   2 +-
>  configs/beaglebone_defconfig                  |  15 +-
>  7 files changed, 12 insertions(+), 892 deletions(-)
>  delete mode 100644 board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
>  delete mode 100644 board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
>  delete mode 100644 board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
>  delete mode 100644 board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch

There is an earlier series from Dario that also updates this defconfig,
to the same versions:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=416030

And you can't drop the kernel patches like this, because they are still
used by the beaglebone_qt5 configuration.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
