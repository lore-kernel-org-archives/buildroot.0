Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDDBC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 15:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3814740169;
	Tue, 13 Feb 2024 15:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiYaHlRQjE08; Tue, 13 Feb 2024 15:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8C744034A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8C744034A;
	Tue, 13 Feb 2024 15:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0571BF322
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 15:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56A8382185
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 15:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FuejjkpEIcrz for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 15:58:14 +0000 (UTC)
X-Greylist: delayed 556 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 13 Feb 2024 15:58:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBA6E8215D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA6E8215D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c0c:9d57::1;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBA6E8215D
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 15:58:13 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 2E178EA1;
 Tue, 13 Feb 2024 16:48:55 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 16:48:47 +0100
Message-Id: <20240213154847.914068-1-michael@walle.cc>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1707839335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gLg/PbPGMxbi4XmFlsewieOOkOdymzLVAzMpmRkJrcY=;
 b=eBUqei90ytuKM7d9wHC3PgsLkd937VH5Lyv1ImN/Cg0B3/7COJix+TeEW8XFGLqY4TDdbQ
 plA+9BTfz2F/mt3ECipWRPD8UHjn90kNnOAVDaH4TOJShVbDYdRbgxzh+bBbaE04t2s/h2
 Wy3Gaa7vH5bObC9F2w/B8nDtAjwzaGr7Hxu5gl/dKCB1bQMSjJcLG59IeJkNufOA9D8BME
 L5BBoEDSsB3AazOVdz1/B2B+AcW3Bv6N0hIJi7kMqilgIsnHUYfvk5oHBrIY9f8XThbyPz
 st1md2pLuuVI3kM8xLmSd9/ix2xVKUMumDfBB5OcgtAG5o5w/bKxeC5PrkfIgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=eBUqei90
Subject: [Buildroot] [PATCH] linux: add support for device tree overlays
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The linux kernel can build device tree overlays (.dtbo) itself. Add
support to build and copy them along with the actual device trees.
These can either be in-tree device tree overlays
(BR2_LINUX_KERNEL_INTREE_DTBOS) or they can be provided outside of the
kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
overlay source files will be copied into the kernel tree first.

Signed-off-by: Michael Walle <michael@walle.cc>

---
Alternatively, one could make BR2_LINUX_KERNEL_INTREE_DTS_NAME similar
to BR2_LINUX_KERNEL_CUSTOM_DTS_PATH and provide a list of dts and dtso
files. But that would mean deprecating BR2_LINUX_KERNEL_INTREE_DTS_NAME
and touch all defconfigs to rename that option and append the ".dts"
suffix. I'm not sure what's better here.
---
 linux/Config.in | 14 +++++++++++---
 linux/linux.mk  |  8 ++++++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 773cb4fbb5..486a2144e3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -411,12 +411,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
+config BR2_LINUX_KERNEL_INTREE_DTBOS
+	string "In-tree Device Tree Overlay file names"
+	help
+	  Names of in-tree device tree overlay files (.dtbo) which
+	  should be built and installed into the target system,
+	  separated by spaces.
+
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
-	  Source Include (.dtsi) files, separated by spaces. These files
-	  will be copied to the kernel sources and the .dts files will
+	  Paths to out-of-tree Device Tree Source (.dts), Device Tree
+	  Source Include (.dtsi) and Device Tree Overlay Source (.dtso)
+	  files, separated by spaces. These files will be copied to the
+	  kernel sources and the .dts files will
 	  be compiled from there.
 
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
diff --git a/linux/linux.mk b/linux/linux.mk
index 53e2ad6d48..de6c5bd602 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -190,14 +190,18 @@ endif
 LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+LINUX_DTBOS += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTBOS))
 
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
+LINUX_DTBOS += $(addsuffix .dtbo,$(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH)))))
+$(error $(LINUX_CUSTOM_DTS_PATH))
 
-LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
+LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(LINUX_DTBOS)
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
