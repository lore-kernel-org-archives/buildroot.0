Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1721C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B71D60B98;
	Sat, 30 Apr 2022 18:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaKBNBYvHMPM; Sat, 30 Apr 2022 18:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC2160B5E;
	Sat, 30 Apr 2022 18:56:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DED91BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D365460B5E
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luQnz8c1SLK7 for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24A7760B6A
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B3DE984B54; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:40:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b715b549c5b156704b2f413cf97f39c500fc73d
X-Git-Newrev: 5cb1bbc6276c64815e299ed698d6d42f012634db
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.B3DE984B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imx-mkimage: install
 print_fit_hab.sh
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cb1bbc6276c64815e299ed698d6d42f012634db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script gives the address, the offset and the size of binaries have been
stored into U-Boot FIT image that contains TF-A, U-Boot and OP-TEE.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...support-for-overriding-BL31-BL32-and-BL33.patch | 61 ++++++++++++++++++++++
 package/imx-mkimage/imx-mkimage.mk                 |  1 +
 2 files changed, 62 insertions(+)

diff --git a/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
new file mode 100644
index 0000000000..4154b1c4a9
--- /dev/null
+++ b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
@@ -0,0 +1,61 @@
+From 8fc8fc3dfce7533b9c965185277d34e27055cc8f Mon Sep 17 00:00:00 2001
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
+index b915115d1ecc..dbc28f2d9af5 100755
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
++[ -z "$BL31" ] && BL31="bl31.bin"
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
index 17ba3596f7..b88be0ca64 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
