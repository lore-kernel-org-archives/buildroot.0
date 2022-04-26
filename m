Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF47C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 14:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B5DB405D1;
	Tue, 26 Apr 2022 14:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wivK4eJ1iOv9; Tue, 26 Apr 2022 14:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2097E405B2;
	Tue, 26 Apr 2022 14:00:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02C5D1BF5B4
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 14:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F38F6823AB
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 14:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKElF1vT7u9U for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 14:00:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D652C81769
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 14:00:20 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 80762C0010;
 Tue, 26 Apr 2022 14:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650981617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TIIXQfGjBRqp+tVnSWKNML6CEhZKJLpnoZHvDxILaS4=;
 b=huomaqLOQbuOeFlI7Z1mq5Iu4BJGqqX2zz6MwURER7kIAdOfNbffBhG+hrXnanzpracVtQ
 Zg7KGHVnwknBvWqkXsdBm4+QeuAAO8ssHoKo/Wh59yV5wn3yf/GRDixTovC7GKbcdaglhN
 pqy2ptCgcN2vwI2+fE4hdoyDxI3LFBT9OGAldjN9XQotHFv8IQdzvrBvTeTrF+DS7FYTWW
 5T5rV/b2nYwHYq2Y25TJQ3MVrh657uBwScWeiuRbqrQuR3cO64GYAQ9UpTy4UWbmYE04Ve
 tQfqlDh+KW/WPfchJzm71gJcoZgPKIFowRlOm1byG5DfWbDH8lCszA7WttfY5Q==
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 16:00:08 +0200
Message-Id: <20220426140008.281259-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/imx-mkimage: install print_fit_hab.sh
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
From: Thomas Perrot via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This script gives the address, the offset and the size of binaries have been
stored into U-Boot FIT image that contains TF-A, U-Boot and OP-TEE.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 ...rt-for-overriding-BL31-BL32-and-BL33.patch | 61 +++++++++++++++++++
 package/imx-mkimage/imx-mkimage.mk            |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch

diff --git a/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
new file mode 100644
index 000000000000..7ad9573b6441
--- /dev/null
+++ b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
@@ -0,0 +1,61 @@
+From ff3204addcf737b7285a0c44eb0a34c9ca82be4e Mon Sep 17 00:00:00 2001
+From: Thomas Perrot <thomas.perrot@bootlin.com>
+Date: Tue, 26 Apr 2022 15:10:04 +0200
+Subject: [PATCH] Add support for overriding BL31, BL32 and BL33
+
+Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
+---
+ iMX8M/print_fit_hab.sh | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/iMX8M/print_fit_hab.sh b/iMX8M/print_fit_hab.sh
+index b915115d1ecc..9e025b78c04d 100755
+--- a/iMX8M/print_fit_hab.sh
++++ b/iMX8M/print_fit_hab.sh
+@@ -1,12 +1,16 @@
+ #!/bin/bash
+ 
+-BL32="tee.bin"
+-
+ let fit_off=$1
+ 
+ # keep backward compatibility
+ [ -z "$TEE_LOAD_ADDR" ] && TEE_LOAD_ADDR="0xfe000000"
+ 
++[ -z "$BL31" ] && BL33="bl31.bin"
++
++[ -z "$BL32" ] && BL32="tee.bin"
++
++[ -z "$BL33" ] && BL33="u-boot-nodtb.bin"
++
+ if [ -z "$ATF_LOAD_ADDR" ]; then
+ 	echo "ERROR: BL31 load address is not set" >&2
+ 	exit 0
+@@ -26,7 +30,7 @@ else
+ 	let uboot_sign_off=$((fit_off - 0x8000 - ivt_off + 0x3000))
+ fi
+ 
+-let uboot_size=$(ls -lct u-boot-nodtb.bin | awk '{print $5}')
++let uboot_size=$(ls -lct $BL33 | awk '{print $5}')
+ let uboot_load_addr=0x40200000
+ 
+ let last_sign_off=$(((uboot_sign_off + uboot_size + 3) & ~3))
+@@ -64,13 +68,13 @@ done
+ 
+ let atf_sign_off=$((last_sign_off))
+ let atf_load_addr=$ATF_LOAD_ADDR
+-let atf_size=$(ls -lct bl31.bin | awk '{print $5}')
++let atf_size=$(ls -lct $BL31 | awk '{print $5}')
+ 
+ if [ ! -f $BL32 ]; then
+ 	let tee_size=0x0
+ 	let tee_sign_off=$((atf_sign_off + atf_size))
+ else
+-	let tee_size=$(ls -lct tee.bin | awk '{print $5}')
++	let tee_size=$(ls -lct $BL32 | awk '{print $5}')
+ 
+ 	let tee_sign_off=$(((atf_sign_off + atf_size + 3) & ~3))
+ 	let tee_load_addr=$TEE_LOAD_ADDR
+-- 
+2.35.1
+
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 17ba3596f752..b88be0ca6441 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -21,6 +21,7 @@ endef
 define HOST_IMX_MKIMAGE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
 	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin/mkimage_fit_atf.sh
+	$(INSTALL) -D -m 755 $(@D)/iMX8M/print_fit_hab.sh $(HOST_DIR)/bin/print_fit_hab.sh
 endef
 else
 # i.MX8 and i.MX8X
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
