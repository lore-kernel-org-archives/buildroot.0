Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DB8C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58FB4400C1;
	Wed, 10 Jan 2024 20:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58FB4400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiFptz5lD9zE; Wed, 10 Jan 2024 20:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A0FE436D7;
	Wed, 10 Jan 2024 20:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A0FE436D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F82D1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6511C6152D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6511C6152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWtxAlPfetHN for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:51:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80A3460A61
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A3460A61
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3E91913F838;
 Wed, 10 Jan 2024 21:51:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:51:00 +0100
Message-ID: <20240110205100.147660-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704919866;
 bh=xDExiNtWcEnHfKco0NOCBmnap/lm6ZTSiyzPmUypGZc=;
 h=From:To:Cc:Subject:Date:From;
 b=sN6HHSv+afQ4Q19ERlpbgVgv030Z3zp9pFQkJkhBEgAsmwPzSZ69PQez75Dk//NU5
 1NFwu/5X+DvthFIJUJKlZT/vV4k2onegW0y33Dk05IcYun/TFl4gMSTE+Esmu3rxqW
 xIKnC/5wBS1C3xDlRPL2LSgaD+4mfp7GMSBnnZkDvzD+VHM+JrwfA9MNKHpYzzqc3C
 1bF1jDsVqIkqrM9mkIIoz1UsVbA8X9rqwnzqMzzNl2i/ZotsO2lwg0cWBf7ycI4oAn
 1Fa0SeWx5GzfTqb+tIg8/I9Bao/OJ484fDxjPYu0n/8+ykznNse+N3OABMFIM1hZF2
 cQt0HCiemb3qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sN6HHSv+
Subject: [Buildroot] [PATCH v2 1/1] configs/imx8mmpico: uboot needs openssl
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
Change v1 -> v2:
- Regenerated the patch, to fix a corrupted patch context.
---
 configs/imx8mmpico_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index c402ea675d..711cdeb390 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"
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
