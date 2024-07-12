Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF819C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BC84412A2;
	Fri, 12 Jul 2024 07:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Otuz4vIqEpV; Fri, 12 Jul 2024 07:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0145F41203
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0145F41203;
	Fri, 12 Jul 2024 07:10:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4637D1BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E7E8414B6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKF0uuLIiJAZ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E0EA413E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E0EA413E5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E0EA413E5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:10:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89B5F20002;
 Fri, 12 Jul 2024 07:09:57 +0000 (UTC)
Date: Fri, 12 Jul 2024 09:09:56 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240712090956.24409852@windsurf>
In-Reply-To: <20240711191539.90650-1-giulio.benetti@benettiengineering.com>
References: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
 <20240711191539.90650-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720768197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Zj4psXYgf8r7eeszs9MhCho0q4jR0VpfYcHLVZXA9w=;
 b=acUNRYFYArw4zEvEqW2tWvPUREqjWNsNeNfTuVnFP1zXpFXNPPsSMopLtK8w13YI/twha+
 eVFQcAr88G30wan4PBUDpzB6YgsuCiDZupF3fSEgBLjLFD17Juy8OPPlLlUAmYWiRflBC0
 fYxcD5hkCP82pVyZAAoTaNFU/UaBBqvWBJJzdJj86KTlWaDS4zX57p6qkajqURTKKSVIX4
 3eSFgajugRiiIuw4xTf19ce1CMzU5gQyIBWD1qo3iHcJN918F+3uJbB0Y5I/gNvM2Dwuti
 gchnZ+U1X8kWJZpMXbMA/8aVnezfP6GwbUyQJ+vyyJ2kkeQ70sqw2CdutFrCfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=acUNRYFY
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2024-07-11
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Jul 2024 21:15:39 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version provide patches that can be applied with fuzz 0 and this is
> now required by Buildroot.
> 
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for this update. However it seems to not work here:

>>> sunxi-mali-utgard-driver ad7e98bc1e81c7ac9c897f854c1a429d33e45d58 Extracting
gzip -d -c /home/thomas/dl/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58   -xf -
>>> sunxi-mali-utgard-driver ad7e98bc1e81c7ac9c897f854c1a429d33e45d58 Patching

Applying 0001-build.sh-do-not-apply-patches.patch using patch: 
patching file build.sh
ln -sf /series /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/patches
TAR="tar" PATH=/home/thomas/projets/buildroot/output/host/bin:$PATH support/scripts/apply-patches.sh  /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/ /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/patches

Applying 0001-makefile-Add-install-target-and-build-the-module-by-.patch using patch: 
can't find file to patch at input line 16
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 063c492b89cdbb8739d04b5190105cf2c9e12e6f Mon Sep 17 00:00:00 2001
|From: Maxime Ripard <maxime.ripard@free-electrons.com>
|Date: Tue, 29 Nov 2016 10:11:12 +0100
|Subject: [PATCH 1/4] makefile: Add install target and build the module by
| default
|
|Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
|---
| src/devicedrv/mali/Makefile | 7 ++++++-
| 1 file changed, 6 insertions(+), 1 deletion(-)
|
|diff --git a/src/devicedrv/mali/Makefile b/src/devicedrv/mali/Makefile
|index 44c7bb83981a..2fee5e096b51 100755
|--- a/src/devicedrv/mali/Makefile
|+++ b/src/devicedrv/mali/Makefile
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
make: *** [package/pkg-generic.mk:242: /home/thomas/projets/buildroot/output/build/sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58/.stamp_patched] Error 1

Am I doing something wrong?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
