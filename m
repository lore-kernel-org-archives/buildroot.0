Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE7E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 08:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B58A84192;
	Fri, 13 Dec 2024 08:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQcFLKS7EUHz; Fri, 13 Dec 2024 08:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FAE984194
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FAE984194;
	Fri, 13 Dec 2024 08:34:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE285ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6B8C84193
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbaA00yfmkE1 for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 08:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=07052b375=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0520F84192
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0520F84192
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0520F84192
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 08:34:43 +0000 (UTC)
X-CSE-ConnectionGUID: 9RopJkAtQ5W1DFhIUBEgYA==
X-CSE-MsgGUID: F/gAY62dRYO9po4QkIkpJw==
X-IronPort-AV: E=Sophos;i="6.12,230,1728921600"; d="scan'208";a="33082306"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2024 16:34:42 +0800
IronPort-SDR: 675be2f3_jGat3Xslma4+eAzDDGt0PDTisFdiLWJpQElVxgA6Bvhz42Y
 939U6th7XMkRfIkYPSzuuzNsdtKZfCpDa0Wq24w==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Dec 2024 23:32:03 -0800
WDCIronportException: Internal
Received: from ftxvgv4yxy.ad.shared (HELO ryzen.lan) ([10.224.3.234])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2024 00:34:41 -0800
To: buildroot@buildroot.org
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Walle <michael@walle.cc>, Niklas Cassel <cassel@kernel.org>
Date: Fri, 13 Dec 2024 09:34:29 +0100
Message-ID: <20241213083430.4121422-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1734078884; x=1765614884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zUVZm++Og+SCZGmrdZARz9lhiJXGqXZBWisX33/OmV4=;
 b=Ei2AjnOiyevlgYOIHQRrtXTkuWJrtFGoceuhJOKB5Z+qn7g0btxEmAcj
 4vbvh9VQktSi0SffBn4nLUZJRt8pjU8XWVXaUOgiKfbUm1D8ED7bLoqtZ
 ZP5+/ugRzOgOyAcXecoEqNg4EFNTqH7HWeDkfHTK4n38IAQcZnVLSZtl1
 WiYuNsJY2coEXuDyBENLh0G38WVAEWWuepw2ZbB9Mgr72zEKFjjKsogwB
 WJqg2WnSG7trmYFx+l3SQPXDF7x6d7/CQgytV6KgoM049Zit5n8JvY/xv
 pIH25tC9IPQWvHouGu5hNag/y8bxc+1y1uyy8Vd1MKepMxKGc/8rAagsT
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=Ei2AjnOi
Subject: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Walle <michael@walle.cc>

The linux kernel can build device tree overlays (.dtbo) itself. Add
support to build and copy them along with the actual device trees.
These can only be in-tree device tree overlays.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v2:
-Dropped support for out-of-tree device tree overlays, as Linux 6.12 no
 longer supports building an out-of-tree device tree by simply copying
 it to the kernel source directory (without also modifying the Makefile).

 linux/Config.in | 7 +++++++
 linux/linux.mk  | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index f537dd7adf..c59b56786f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -417,6 +417,13 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
+config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
+	string "In-tree Device Tree Overlay file names"
+	help
+	  Names of in-tree device tree overlay, without the trailing
+	  .dtso which should be built and installed into the target
+	  system, separated by spaces.
+
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 1d3d8fffa6..54b34d8281 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,6 +203,7 @@ endif
 LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
 
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
@@ -210,7 +211,7 @@ LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 # actually be generated as .dtb.
 LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 
-LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
+LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
