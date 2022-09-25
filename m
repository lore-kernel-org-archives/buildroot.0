Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD33C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C72782EBA;
	Sun, 25 Sep 2022 09:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C72782EBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_XbMJjNXffF; Sun, 25 Sep 2022 09:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C5882EA1;
	Sun, 25 Sep 2022 09:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C5882EA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 619021BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41D9E60A9E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D9E60A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXTzSKPix91H for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3568E60784
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3568E60784
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:09:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 53FFE1BF203;
 Sun, 25 Sep 2022 09:09:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 11:09:19 +0200
Message-Id: <20220925090920.1585682-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664096967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pSdFZfp9jAsKhRrmhlmzRVSyhvdn/aFVSnMEBHlCNuo=;
 b=fx0OEgCt8N1UJ750aXTitDLzZ8YZaos3T0dVse4xFNVw2d3se9D9N/LXbWuLZ4r5FkgBq0
 dIkQ8+Uz+/2CUsdEd+08nfxZpPuVe03Kv3vgP59DQmT9YCVmni7D9Ji/UeEgI0WeZ7QQiC
 kVZBkpc2Z1UxCzh4QZnhLtaaJDvAcm9iL32upUJIndLsfzr48ZEkZl3f16K5Pb5uM8tvKZ
 6KC+nUnCvPHwJPla8ijF/sRc6lHkREI6wEeINqaXCvQqalQsYxBfz3Q621N96dIzwDZ4Rk
 uYwCx9mcWktWXEPpWw6DZ4Ewp0P/1TH8pUEDsIhwTz3HCXNubeNJ41eT4EnT5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fx0OEgCt
Subject: [Buildroot] [PATCH v2 4/5] arch/{Config.in,
 arch.mk}.xtensa: add explicit support for DC233C core
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DC233C Xtensa core is the one used by our Qemu Xtensa
defconfigs, and it is a little endian core. It makes sense to promote
it as a supported Xtensa core in arch/Config.in.xtensa, so that our
autobuilder testing covers build testing of little endian Xtensa
configurations. Indeed currently, both the FSF core and the custom
core are big endian (the custom core cannot be little endian without
an overlay).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.xtensa | 6 +++++-
 arch/arch.mk.xtensa   | 6 ++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 3745f84537..9aaf11203b 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -10,6 +10,9 @@ config BR2_xtensa_fsf
 	bool "fsf - Default configuration"
 	select BR2_USE_MMU
 
+config BR2_xtensa_dc233c
+	bool "dc233c"
+
 endchoice
 
 config BR2_XTENSA_OVERLAY_FILE
@@ -47,7 +50,7 @@ endchoice
 config BR2_XTENSA_USE_MMU
 	bool "MMU support"
 	default y
-	depends on BR2_XTENSA_CUSTOM
+	depends on BR2_XTENSA_CUSTOM || BR2_xtensa_dc233c
 	select BR2_USE_MMU
 	help
 	  Enable this option if your Xtensa core has a MMU (Memory
@@ -55,6 +58,7 @@ config BR2_XTENSA_USE_MMU
 
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_XTENSA_LITTLE_ENDIAN
+	default "LITTLE"	if BR2_xtensa_dc233c
 	default "BIG"		if BR2_XTENSA_BIG_ENDIAN
 	default "BIG"		if BR2_xtensa_fsf
 
diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index fd410f6bfa..92499f396f 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -9,7 +9,13 @@
 #       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
 #   endif
 ################################################################################
+
+ifeq ($(BR2_xtensa_dc233c),y)
+BR_ARCH_XTENSA_OVERLAY_FILE = https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz
+else ifeq ($(BR2_XTENSA_CUSTOM),y)
 BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
+endif
+
 ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
 ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
 ARCH_XTENSA_OVERLAY_FILE = $($(PKG)_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
