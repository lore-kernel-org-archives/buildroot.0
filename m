Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B282FC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 15:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 459E641E77;
	Sat,  6 Jan 2024 15:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 459E641E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbivWhZJwezk; Sat,  6 Jan 2024 15:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC5F41E75;
	Sat,  6 Jan 2024 15:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AC5F41E75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB01D1BF290
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 15:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B48AF83E64
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 15:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B48AF83E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lR6wXAehxxup for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 15:35:49 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6920383E61
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 15:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6920383E61
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1CA0613F861;
 Sat,  6 Jan 2024 16:35:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 16:35:39 +0100
Message-ID: <20240106153539.570324-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704555346;
 bh=+3kQiQCeLNZA8NACuQnkh1vsUo12Jsb1YaTFcV+LMYo=;
 h=From:To:Cc:Subject:Date:From;
 b=NSf7LFFhMnMilrHKvWZZg00a3c+LFW1L2pPMISQJrNugODG41VzfKfRvfHcsZ2p0f
 1G9hYRWe2lXEW6pNRRFKaMrYqo29Tce72c27Wm+WE8AY/Xte6dujU9wGF65+lzfG0k
 TnLYU+LaqkRCdlNjkerU4E34bLhzLZKxA7d3ZEEczNhai+IvARhMzcpaHIlVJsrrHC
 Vm0ILKTfA3GCOTKoODemTjnnD1lEP60d2/OS6cuv+jp1RnMd+DgBFH2DMZ5lNmqYGm
 atrm3OIqg06Ojhqvu6V0Yrm1rPK/F8CsAnjiZkG4q/YwDXOB9cjA8Pdv4G/vXjJ39A
 BlDAXu83FvFlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NSf7LFFh
Subject: [Buildroot] [PATCH 1/1] configs/imx8mmpico: uboot needs openssl
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 78e8f383 "configs/imx8mmpico: bump bsp components to version
tn-kirkstone_5.15.71-2.2.0" bumped components, but forgot to add
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y.

This commit adds it to the defconfig to fix the build.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180248

    In file included from tools/imagetool.h:24,
                     from tools/aisimage.c:7:
    include/image.h:1166:12: fatal error: openssl/evp.h: No such file or directory
     1166 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/imx8mmpico_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index c402ea675d..711cdeb390 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Puck-imx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
