Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CF3D44D78
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C3A40328;
	Wed,  6 Nov 2024 14:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulN-Rd34duCn; Wed,  6 Nov 2024 14:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A7B4035F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A7B4035F;
	Wed,  6 Nov 2024 14:28:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 418AB27D1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 14:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2275A40337
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 14:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IdgC4cazpwL for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 14:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7DD840328
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7DD840328
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7DD840328
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 14:28:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 90171C320F
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 14:27:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4CDA1BF20E;
 Wed,  6 Nov 2024 14:27:07 +0000 (UTC)
Date: Wed, 06 Nov 2024 15:27:06 +0100
MIME-Version: 1.0
Message-Id: <20241106-extract-fw_fdt_path-v1-1-0983c183f71e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALl8K2cC/x3MTQqAIBBA4avErBNMhKyrRIQ/Y86mQqUC8e5Jy
 2/xXoGEkTDB3BWIeFOi82gY+g5s0MeOjFwzCC7kwMXE8M1R28z8s3mXt0vnwNRojUJpUBgDrbw
 ienr/67LW+gFSoyQVZQAAAA==
X-Change-ID: 20241029-extract-fw_fdt_path-87cb8e4be2bb
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Drew Fustini <drew@beagleboard.org>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730903228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QdA6mGO+069r13i5WendTVdF9fXk3ADLpGfd7pPFuXE=;
 b=RXKJo3/0wZ4z2ji4PjqhVkFki3fOpzeCiMgpeF7aQprMZQ8mt+PzKX7/PMJ5iw4YfmrrLr
 l2WWeL7K+oUSq3RPoASyGJ6x1mjFrERY0UOOxnEHPT85DDEzK1h/vGBz0DnSzJMbKlxRgx
 iQ6tNqnsNvy/wLvsXma0NpeVtwa2OlJZ6LAKPM2UvEzU+1c11OMI5teOrV5OEz3o4LOuKg
 t1bMy6j0TPQLMp4TrzJHeCN/MiSZiMip++Y516keTXc89ZmYp+8zAtjZb1+TxQWyW5es2h
 pQ/EvzsayHE8kXqIp2mP7TbutpSX+qPBM/3M1zp3o78McyMI7UtdeVVJnPWB3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RXKJo3/0
Subject: [Buildroot] [PATCH] boot/opensbi: remove dependency on fw_payload
 to pass FW_FDT_PATH
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, Buildroot requires the installation of fw_payload.bin to pass
FW_FDT_PATH as a compile-time parameter.

According to OpenSBI documentation[1], all firmware types can have an
embedded flattened device tree.

This commit removes the dependency on fw_payload.bin, allowing users to
include the U-Boot flattened device tree using FW_FDT_PATH without
installing fw_payload.

[1] https://github.com/riscv-software-src/opensbi/blob/master/docs/firmware/fw.md

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 boot/opensbi/Config.in  | 3 ++-
 boot/opensbi/opensbi.mk | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index de2f0aae20dbe1ec62dc0f575a069a92d85bee4c..0a01615e5a0648110f48c0fbdb585ddba5eea33f 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -111,7 +111,8 @@ config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
 
 config BR2_TARGET_OPENSBI_FW_FDT_PATH
 	bool "Include U-Boot DTB in OpenSBI Payload"
-	depends on BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
+	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on BR2_TARGET_UBOOT
 	select BR2_TARGET_UBOOT_FORMAT_DTB
 	help
 	  Build OpenSBI with FW_FDT_PATH set to
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index dd113a0bf87589c49af74d63180007e35f0a796c..89571a771445c8c0b6f92345892985a800e25a14 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -47,10 +47,11 @@ endif
 ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
 OPENSBI_DEPENDENCIES += uboot
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
+endif
+
 ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PATH),y)
 OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BINARIES_DIR)/u-boot.dtb"
 endif
-endif
 
 define OPENSBI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)

---
base-commit: 1e9261d9b6388dc382e59f44174f1806d326ad15
change-id: 20241029-extract-fw_fdt_path-87cb8e4be2bb

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
