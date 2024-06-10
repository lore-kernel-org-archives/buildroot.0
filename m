Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035FBC27C5F
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 18:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77ACE6089B;
	Mon, 10 Jun 2024 18:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3e3PDIntjRB; Mon, 10 Jun 2024 18:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B0060A38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B0060A38;
	Mon, 10 Jun 2024 18:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 058421BF3ED
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F003E40603
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 18:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQe3nFQRuU_c for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 18:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DDF340605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DDF340605
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DDF340605
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 18:20:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AIKEW2066853
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 13:20:14 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AIKEIp011213
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 13:20:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 13:20:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 13:20:14 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AIKErl044342;
 Mon, 10 Jun 2024 13:20:14 -0500
Date: Mon, 10 Jun 2024 13:20:12 -0500
MIME-Version: 1.0
Message-ID: <20240610-k3-mainline-v1-1-57ec7cfa0bfb@ti.com>
References: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
In-Reply-To: <20240610-k3-mainline-v1-0-57ec7cfa0bfb@ti.com>
To: Bryan Brattlof <bb@ti.com>, Buildroot Mailing List
 <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638; i=bb@ti.com;
 h=from:subject:message-id; bh=8hxbcAJYM0qZ5F5xMVLykV8bkfDA3aG5fxP5+Rou254=;
 b=owNCWmg5MUFZJlNZVo3glgAAZH////5Nc79y+N3vvvfUu/+/B+u/8PfdfsNl/a9/+/jvp3+wA
 RtWCHqAAPUAAAPUAA9Q9Q9TTRkBoAaAGgGg0A0DQ0AAaGhtQABoPRGg9Rj0KIGjEDRkDRoBo0aD
 QGg0ZAGI0NqaAZqDQNGQDE0GTRpppoAyMTTGkDEADRoDGSYgNHqaaBoAHqGjTRpoAZANAAaBoyA
 PUDQ02oDTJkBoDTE0NB6jammTJoNAA0ESLIlVEjDuG6kyjkFVAYhiLeBDIYsyCCEVKABR+E5GAr
 XoeGJzr08NI9w5gOFwnX0oMPW87eNAVJKZP3fGwcZhwrhuOYVQQBwEhmkjbA335M8qdGtMFYgcH
 XFOJsWmiBG/vVCi2q5IF2/2VzH31gZyxuihcLhbAnjcJ3HRywKiOf6hUAPODV0XNTNIfGjEzQHM
 9Vd8Sdz+Rr3cCHkFp3kWtli539+6JImggIzgm+fZXCwlaLC7VZ1fQi94g6O3TTrneYKgTxj+0BL
 0uebbcEPbqlUU4BIGCVWeYNiBN5rCMjwLWyxCjG6S9D646W6Bz1Z9cShJhXExZ5aZkJFDQI3uGx
 KCQyL4Ot9QkpOr3AK+Og7oox2ZJKEfmZcF/YYRiJOGLXwZpR8Viizis2jB2LzVQE988KW0LfGSF
 mArbu0N9jDf8XckU4UJBWjeCWA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1718043614;
 bh=dAM91QN/ZAVObH50qkSt6OpLNpZca7ZF5ZN1aP+BdfE=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=QIILj9b9u0V3Tjx1IvD6CPPMDyM3rF2xK7pDeGjtUe0QiifHXKh/41dpV+qB5Fq26
 /INxDW8polOPvZB+G9ng4HSg1iBJJRBxUfi14937Zfztqiww1YWWTxgQ9T3bAwFjYw
 Dmm9ZSuYvdBToFp1/9/6d95V/7hsKKU/ZxxJM1Mk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=QIILj9b9
Subject: [Buildroot] [PATCH -next 1/2] configs/ti_am62x_sk_defconfig: track
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
kernel for the am62x, to ensure we have all the latest fixes and
features for the board and SoC.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 configs/ti_am62x_sk_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 36052dba407a3..10b8a9c9b1c6b 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,4 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
@@ -7,8 +6,6 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"

-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
