Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B703C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 10:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1510E61107;
	Mon, 30 May 2022 10:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJDySADYFlCa; Mon, 30 May 2022 10:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A9E561160;
	Mon, 30 May 2022 10:19:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31F721BF314
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 10:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 207A584088
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 10:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8q8upLRdLIgo for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 10:19:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A5AD84084
 for <buildroot@buildroot.org>; Mon, 30 May 2022 10:19:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CD21031E073D; Mon, 30 May 2022 12:19:27 +0200 (CEST)
Date: Mon, 30 May 2022 12:19:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <YpSaL4TApmsrqxe3@waldemar-brodkorb.de>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
Subject: Re: [Buildroot] [PATCH v2 00/11] Fix RV64 NOMMU and add Canaan K210
 SoC support
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

tested on a Sipeed Maix-Bit board.

Tested-By: Waldemar Brodkorb <wbx@openadk.org>

Damien Le Moal via buildroot wrote,

> This patch series is a rework of the old v5 series "Add RV64 NOMMU and
> Canaan K210 SoC support" already posted some (long) time ago.
> 
> This series adds support for building 64-bits RISC-V NOMMU kernels (both
> bootable kernels and u-boot sdcard boot envronements) for NOMMU RISC-V
> 64-bits boards. The board supported include QEMU and many boards using
> the dual-core RISC-V 64-bits Cannan Kendryte K210 SoC.
> 
> The first patch is a simple fix of elf2flt configuration menu entry.
> The second patch fixes the existing elf2flt RISC-V 64-bits support.
> 
> The third patch adds a Linux kernel patch that must be used for all
> NOMMU RISC-V builds. This patch will be present in the upcoming 5.19
> kernel.
> 
> Patch 4 adds a buildroot configuration file for QEMU NOMMU RISC-V
> 64-bits builds.
> 
> Patch 5 adds the python-kflash utility as a host package to allow users
> to program their K210-based boards with bootable images. This patch also
> modifies the python-serial package to add its host package definition to
> make the python-miniterm utility available to users to open serial
> consoles with their K210-based boards.
> 
> Patch 6 adds the configurations files common to all K210-based boards.
> 
> Finally, the last 5 patches add support for the following K210-based
> boards:
> * Sipeed MAIX Bit
> * Sipeed MAIXDUINO
> * Sipeed MAIX Dock (dan)
> * Sipeed MAIX Go
> * Canaan KD233 development board
> 
> For each board, a readme.txt file is added to document how to build and
> install images for these  
> boards.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
