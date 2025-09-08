Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A6CCAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 11:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C8DD42475;
	Mon,  8 Sep 2025 11:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOGPPHIefvNc; Mon,  8 Sep 2025 11:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C86E42136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C86E42136;
	Mon,  8 Sep 2025 11:52:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C231CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7301784F18
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIvuLftwMJZY for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 11:52:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.43.21;
 helo=mail-4321.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B1AD84F4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1AD84F4A
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B1AD84F4A
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:16 +0000 (UTC)
Date: Mon, 08 Sep 2025 11:51:59 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip.molloy@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Philip Molloy <philip@philipmolloy.com>
Message-ID: <20250908115200.3295727-2-philip@philipmolloy.com>
In-Reply-To: <20250908115200.3295727-1-philip@philipmolloy.com>
References: <20250908115200.3295727-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 111fa0447ad22b1ea3943b2fb765ba5daf4ed371
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1757332325; x=1757591525;
 bh=Si6xYbSbDnlTadz8/5OqLS54rDEMk/A2hhG8bZHMWzg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Zzj/szmunOggDNY0TKdP3HOa4/IJpN0WjxagwLrjUgpLhyESU66NOP4vgmXsKETxX
 1pAYgUvQnVhkPg2RnkzKRLuJwg4Ex2rsKllkAn7mhGHkNBGd4lj1I8jQ05FfB6VIE2
 tH5ewkZkVv/VxItmA2fqXSc3K4InfMSKkQvnZ0+TozZ0nWqPxQteVTULDMPsbno+QA
 CrWpvlsy0dTLbWXvi8x2Inz94J+niZOHNNIk9jpBH9vWc+aRiE+hq8JTPYc4uYK8d9
 JXXqJq7erTblqU/Ika+e+ELhtBEblIlfozRQiMP6IayL49oCiSc3rzAX8Zuywc3RDo
 gVEBhAlMBf/Fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=Zzj/szmu
Subject: [Buildroot] [PATCH v3 1/2] package/adsp-ldr: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Philip Molloy <philip.molloy@analog.com>

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
---
 DEVELOPERS                      |  3 +++
 package/Config.in.host          |  1 +
 package/adsp-ldr/Config.in.host |  8 ++++++++
 package/adsp-ldr/adsp-ldr.hash  |  3 +++
 package/adsp-ldr/adsp-ldr.mk    | 21 +++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/adsp-ldr/Config.in.host
 create mode 100644 package/adsp-ldr/adsp-ldr.hash
 create mode 100644 package/adsp-ldr/adsp-ldr.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a7bb3bd834..792f230e4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2742,6 +2742,9 @@ F:	package/psplash/
 F:	package/sispmctl/
 F:	package/zsh/
 
+N:	Philip Molloy <philip@philipmolloy.com>
+F:	package/adsp-ldr/
+
 N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index b0f7529a13..7ead116aa1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 	source "package/abootimg/Config.in.host"
+	source "package/adsp-ldr/Config.in.host"
 	source "package/aespipe/Config.in.host"
 	source "package/agent-proxy/Config.in.host"
 	source "package/amlogic-boot-fip/Config.in.host"
diff --git a/package/adsp-ldr/Config.in.host b/package/adsp-ldr/Config.in.host
new file mode 100644
index 0000000000..4776440eea
--- /dev/null
+++ b/package/adsp-ldr/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ADSP_LDR
+	bool "host adsp-ldr"
+	help
+	  adsp-ldr is a tool that generates boot streams to be
+	  loaded and executed by the boot ROM of Analog Devices
+	  ADSP-SCXXX SoCs
+
+	  https://github.com/analogdevicesinc/adsp-ldr
diff --git a/package/adsp-ldr/adsp-ldr.hash b/package/adsp-ldr/adsp-ldr.hash
new file mode 100644
index 0000000000..459b48cf09
--- /dev/null
+++ b/package/adsp-ldr/adsp-ldr.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a1b1b5700b75e47bae7f656cd61f8c635f5d3c82a90e20dfe594e0a3315e4eef  LICENSE
+sha256  0f240aa5aad9300d8f4bc7ffd9cc1c53e01dfd6120de4f20f60d4d4176d99c10  adsp-ldr-v1.0.1.tar.xz
diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
new file mode 100644
index 0000000000..d269ddb093
--- /dev/null
+++ b/package/adsp-ldr/adsp-ldr.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# adsp-ldr
+#
+################################################################################
+
+ADSP_LDR_VERSION = 1.0.1
+ADSP_LDR_SOURCE = adsp-ldr-v$(ADSP_LDR_VERSION).tar.xz
+ADSP_LDR_SITE = https://github.com/analogdevicesinc/adsp-ldr/releases/download/v$(ADSP_LDR_VERSION)
+ADSP_LDR_LICENSE = BSD-3-Clause
+ADSP_LDR_LICENSE_FILES = LICENSE
+HOST_ADSP_LDR_DEPENDENCIES = host-libusb
+
+define HOST_ADSP_LDR_INSTALL_CMDS
+	# The U-Boot Makefile expects ldr to be prefixed by $(CROSS_COMPILE),
+	# hence the rename to $(TARGET_CROSS)ldr
+	$(INSTALL) -m 755 -D $(@D)/buildroot-build/ldr \
+		$(TARGET_CROSS)ldr
+endef
+
+$(eval $(host-meson-package))
-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
