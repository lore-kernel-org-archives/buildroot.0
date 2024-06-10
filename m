Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF09C27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 18:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5992D605D9;
	Mon, 10 Jun 2024 18:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXCrIHhoZPav; Mon, 10 Jun 2024 18:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7001A6060E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7001A6060E;
	Mon, 10 Jun 2024 18:20:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 290161BF3ED
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 236FD82046
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cj5PVAith3kP for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 18:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E8048203E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E8048203E
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E8048203E
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 18:20:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AIKEX2068336
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 13:20:14 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AIKE77011216
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 13:20:14 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 13:20:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 13:20:14 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AIKE8l044345;
 Mon, 10 Jun 2024 13:20:14 -0500
Date: Mon, 10 Jun 2024 13:20:13 -0500
MIME-Version: 1.0
Message-ID: <20240610-k3-mainline-v1-2-57ec7cfa0bfb@ti.com>
References: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
In-Reply-To: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
To: Bryan Brattlof <bb@ti.com>, Buildroot Mailing List
 <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797; i=bb@ti.com;
 h=from:subject:message-id; bh=tAubNs7zyWdC4DjeBbJJvYanxL5Zt4pr33pcKpzv21w=;
 b=owNCWmg5MUFZJlNZpNu5pAAAaf/////f/v/+//zb57qdvf43rbu/zv423GtLadx///bS/v2wA
 RszRD1AAAAaAAAA0AGjR6hpoAaGgNNBoAANAABoMhoDT1ANlBppieo9TJo0zFEAAaaABo0aAAAN
 GJpoGhpoAAAGJiYjTJpoD0j1A0DT0gHqNABjRDIZNGgAO1D1GmmnqZAADRoaBpkNAAZGRoGgaBo
 aYgyaAAGmEAAGagAADQeiAaNMhkBBWjapvvegEeNdZOSQRDhPU1iGf0Qlb07CtJDvSHSAnNbJGZ
 W5YgAYTPfl26NaaQCwFDOjoTlRBlC0leWydWXYgvPXNl6F8+PbmC4uBqpZaOpsobWpJjrdf+JCa
 DC8lQi1lmr1Zjj02pUJsqwgBBCwe7maAD7tGLTpYpuqJSsIBz8FX8DewQaWxSxRpiRoTAxIJ6Tm
 hkGJ2zBcNWKn7i+D9rZJBILBDKdM8kKlfRyqD9ccavc7ikhfSUaIOh5OrrLx8qN8f7yFsmx03RF
 O4NWhYcoNbTZsVMGizeoqSBVzr8ICwYILBcZLQrTc8tVTDCSiGiuxRdxEZFuXznGutRsfxMFxK2
 CYMiy9y+MZJAGmrNZvgKFJsskPrWhGyJsYVeqd7h4AXtJQq+BAjqW08PdGkMuiXaKQxzALiChDA
 kgn14LAyc/xdyRThQkKTbuaQA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1718043614;
 bh=K91FRGjvHfq7hrBwM1RSGmfkZlQRAccSTKoJLNXtDfU=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=CVQZNzpbJPkfBKUvY8MLG2ZYDfsqE05HJAaZkhDf7oq1/8r7P7y5SIgS9ueS3av4H
 S7NlMkFDkyyfkgx+7A1F2wssrtqrddvjZHgg64deCHVipBnnH/oANMokiUItbX0Qn/
 NtJfylldY89jIOCQcf/fxjVuMWXRqgm1sr6e+DTA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=CVQZNzpb
Subject: [Buildroot] [PATCH -next 2/2] configs/ti_am64x_sk_defconfig: track
 mainline Linux
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stable branches of the Linux kernel are great however they only receive
the bug fixes that are called out by developers who wish a fix be
backported. Therefore they only receive some fraction of the fixes that
the latest mainline kernel release receives not to mention the magnitude
increase in the development and testing that mainline kernels receive.

With this in mind, let's begin tracking the latest release of the Linux
kernel for the am64x, to ensure we have all the latest fixes and
features for the board and SoC.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 configs/ti_am64x_sk_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 1e8b8c9c02222..27e8d1e760028 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,14 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
-BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"

-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
