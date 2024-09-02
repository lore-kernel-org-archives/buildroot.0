Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EB2CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 11:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D46D16082A;
	Mon,  2 Sep 2024 11:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k37yaQKTNjT; Mon,  2 Sep 2024 11:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4117560897
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4117560897;
	Mon,  2 Sep 2024 11:28:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9ABF1BF46D
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C870560862
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEUArBc8xhG4 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 11:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c0c:9d57::1;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B5CA6081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B5CA6081F
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B5CA6081F
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 11:28:06 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 37CFDD48;
 Mon,  2 Sep 2024 13:28:01 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 13:27:35 +0200
Message-Id: <20240902112735.728574-1-michael@walle.cc>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1725276481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vXWxcFU5GIrvdc27f1Pzim6a1hE9koyGLLqORP+NXyE=;
 b=xqaRpCO2eDG130L9TtsUk10unl2MIOcD7SyWaRe9mhZhWDwFswrldSzaG30qX+GUhM7Spf
 jXqeF64xIlGSRCEGqyHGiVafb7sJwbxhFLApmDcvmNebtNDKneWWY/Ab03H9bB6/rzQSN5
 ZvMjlrspmfSfnSQmdZrVl9tbRu0r/kYz/0HcwOuEIZCkibPIQQM91vFk8XKoU6AUqwDPwl
 xbib5UsOdSa+PvZ+rhIM9+M0lTxaSJS6BqbCphw3opttyDX7GH8L6FVuaVcgKlmraS3WGS
 fQDVnXgyllGjytjEdwgqga5WDlhzawctmcrmxZHasS6tQYISvJXipDJXSmGJgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=xqaRpCO2
Subject: [Buildroot] [PATCH v2] linux: add support for device tree overlays
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Michael Walle <michael@walle.cc>, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The linux kernel can build device tree overlays (.dtbo) itself. Add
support to build and copy them along with the actual device trees.
These can either be in-tree device tree overlays
(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
overlay source files will be copied into the kernel tree first.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Regarding using the .dtso suffix (or the lack of here) in the
config symbol: I guess BR2_LINUX_KERNEL_INTREE_DTS_NAME used to
just a name in the good old days (and for arm32). But nowadays that
"name" also need a path prefix which makes it kind of a mix between
name and filename, i.e. freescale/imx8mm-evk. IMHO that looks a bit
odd, but I don't care too much and for the sake of consistency the
new config option also just use the "name" variant.

v2:
 - don't use the ".dtso" suffix, just use the name
 - renamed BR2_LINUX_KERNEL_INTREE_DTBOS to
   BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
 - remove leftover $(error debug)
 - rebased to latest next

 linux/Config.in | 14 +++++++++++---
 linux/linux.mk  |  7 +++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 429a7eabef..e2432dadd0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -417,12 +417,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
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
index 16d9f19470..a850353718 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -193,14 +193,17 @@ endif
 LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
 
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
+LINUX_DTSO_NAMES += $(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
 
-LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
+LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
