Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196A4C3DA7F
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 21:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF944403F8;
	Tue, 30 Jul 2024 21:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUjPUgecNMGA; Tue, 30 Jul 2024 21:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7448F40542
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7448F40542;
	Tue, 30 Jul 2024 21:46:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25FCE1BF5AE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC6B6082C
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YBcgoUGqbW6 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 21:45:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C027460732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C027460732
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C027460732
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 21:45:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E06FA1C0002;
 Tue, 30 Jul 2024 21:45:54 +0000 (UTC)
Date: Tue, 30 Jul 2024 23:45:53 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240730234553.03617a8b@windsurf>
In-Reply-To: <20240720201659.2253736-3-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
 <20240720201659.2253736-3-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722375955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOLH4ZK7xI2pv01Zg7m13q3y8gaeGbz1lbSIKcHuDnc=;
 b=CAF7dwccGyyy3dob/jJdqzxUvUxABW0BfSQOOy5W88KKvzKHYgnKHzZwMKWylP3HlUXNTL
 PdT9zJCtNZfUp6A9h4Fd7XN5Tf0l42MY0bouUXn9nPQ4HYIC0VVe6JcaQle2lo68Gq+mbE
 BF/G4O7ofHBox2QU/sOCjjmDpIQPFKDJdFvgO2Y7DUD2yT61Ytc5trEa26kHfIX/pevq8D
 P9MYenG6+adEogD927wRi+nAnw6qRW/bdPWnWAHVmsXMgyOWvdxOPJuwguvJaTl6Chip7W
 xxHZfJGSPPj6FbnyWzd1bfhaCGbV3gCHz2qc08MT/I+oUB2ZUOzoWWhIigFHSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CAF7dwcc
Subject: Re: [Buildroot] [PATCH 3/5] configs/beaglebone_qt5: move patches to
 qt5 subfolder
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
Cc: linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 22:16:57 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Compared to the beaglebone_defconfig, updating the Linux kernel is more
> tricky because it may also involve updating the ti-sgx-{km,um} packages.
> Therefore, it is unlikely that the two configurations can share the same
> software versions for the Linux kernel, and consequently a single path
> for the patches. For this reason, and with the foresight of adding the
> hash files for the beaglebone_defconfig as well, the hash files and patches
> are moved to the qt5 subdirectory. This way, future conflicts in managing
> the patches for the two configurations (i.e., beaglebone[_qt5]_defconfig)
> are avoided.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .checkpackageignore                                             | 2 +-
>  .../{ => qt5}/patches/linux-headers/linux-headers.hash          | 0
>  .../patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch | 0
>  ...2-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch | 0
>  ...03-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch | 0
>  .../linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch     | 0
>  board/beagleboard/beaglebone/{ => qt5}/patches/linux/linux.hash | 0
>  board/beagleboard/beaglebone/{ => qt5}/patches/uboot/uboot.hash | 0
>  configs/beaglebone_qt5_defconfig                                | 2 +-
>  9 files changed, 2 insertions(+), 2 deletions(-)
>  rename board/beagleboard/beaglebone/{ => qt5}/patches/linux-headers/linux-headers.hash (100%)
>  rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch (100%)
>  rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch (100%)
>  rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch (100%)
>  rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch (100%)
>  rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/linux.hash (100%)
>  rename board/beagleboard/beaglebone/{ => qt5}/patches/uboot/uboot.hash (100%)

I was not truly convinced by putting the patches in
board/beagleboard/beaglebone/qt5/patches, so instead I moved them into
board/beagleboard/beaglebone-qt5/patches/, a bit as if it was a
different board. I am also not 100% convinced, but I find this slightly
less confusing. Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
