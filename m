Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABACC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FB0408C1;
	Sat, 13 Jul 2024 14:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6xqyAarbbTL; Sat, 13 Jul 2024 14:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B4540105
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9B4540105;
	Sat, 13 Jul 2024 14:54:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B191C1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAFC6409C5
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HhpqADexm79A for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 330C7408C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330C7408C1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 330C7408C1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:54:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32BE1E0002;
 Sat, 13 Jul 2024 14:54:03 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:54:02 +0200
To: Romain Naour via buildroot <buildroot@buildroot.org>
Message-ID: <20240713165402.1091446e@windsurf>
In-Reply-To: <20240713140133.2107977-1-romain.naour@smile.fr>
References: <20240713140133.2107977-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720882443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlB21DEgGoooqdjbS2A8o0Z/OuoF/o8VOU0bfT5iLdU=;
 b=YbsR8aKvEHocgdGKd2k2q1XYgK1P8JJ9QtDmhLOBf3CYS6pVMGSXWiZf4FzBXarZA0R4UA
 s+BjihHoCiKTk7p4KWk22sG6D9fWANzEQff13TrbIo82/K6yDLRjyGgahsZt9UhZv27JpC
 GRXDyNBk3E/egCVCJ6M7oOwZkF70mmDdZQCzEXCbUBwXvVnNsjeSZ+8jnItNkrwuXeJw4R
 gywGdxYqQjmiWvwVpVaCK38g38R97hdxGpKT71RhrEoDx12R9j9R8OWPDbPmX7Ehj8EiWP
 rSKKozpFtHDESzHM7Fkv9x+dKLURhq8F/SIZHiTygyGHO+hu2sehOFwEe/oJgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YbsR8aKv
Subject: Re: [Buildroot] [PATCH 1/5] configs/beagleboneai_defconfig: move
 board files to board/beagleboard/beagleboneai
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 16:01:29 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> The beagleboneai board files from beagleboard.org project should be
> moved to board/beagleboard directory.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  .checkpackageignore                                         | 4 ++--
>  DEVELOPERS                                                  | 2 +-
>  board/{ => beagleboard}/beagleboneai/genimage.cfg           | 0
>  .../beagleboneai/patches/linux-headers/linux-headers.hash   | 0
>  .../{ => beagleboard}/beagleboneai/patches/linux/linux.hash | 0
>  .../beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch  | 0
>  .../{ => beagleboard}/beagleboneai/patches/uboot/uboot.hash | 0
>  board/beagleboard/beagleboneai/post-build.sh                | 4 ++++
>  board/{ => beagleboard}/beagleboneai/readme.txt             | 0
>  board/{ => beagleboard}/beagleboneai/uEnv.txt               | 0
>  board/beagleboneai/post-build.sh                            | 4 ----
>  configs/beagleboneai_defconfig                              | 6 +++---
>  12 files changed, 10 insertions(+), 10 deletions(-)
>  rename board/{ => beagleboard}/beagleboneai/genimage.cfg (100%)
>  rename board/{ => beagleboard}/beagleboneai/patches/linux-headers/linux-headers.hash (100%)
>  rename board/{ => beagleboard}/beagleboneai/patches/linux/linux.hash (100%)
>  rename board/{ => beagleboard}/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch (100%)
>  rename board/{ => beagleboard}/beagleboneai/patches/uboot/uboot.hash (100%)
>  create mode 100755 board/beagleboard/beagleboneai/post-build.sh
>  rename board/{ => beagleboard}/beagleboneai/readme.txt (100%)
>  rename board/{ => beagleboard}/beagleboneai/uEnv.txt (100%)
>  delete mode 100755 board/beagleboneai/post-build.sh

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
