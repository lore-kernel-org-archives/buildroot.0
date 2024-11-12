Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB599D32D94
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 11:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E22940189;
	Tue, 12 Nov 2024 11:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3I8TRVGroiP; Tue, 12 Nov 2024 11:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1948B4007E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1948B4007E;
	Tue, 12 Nov 2024 11:20:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1843AD8F
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 11:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC81760676
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 11:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_Ec3ZT7KClH for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 11:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC19D60630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC19D60630
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC19D60630
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 11:20:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B5551C037A
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 11:20:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2502F240003;
 Tue, 12 Nov 2024 11:19:56 +0000 (UTC)
Date: Tue, 12 Nov 2024 12:19:40 +0100
MIME-Version: 1.0
Message-Id: <20241112-extract-fw_fdt_path-v2-1-0239de112994@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMs5M2cC/22NQQ6CMBBFr0JmbU2nECmuvIchhJapTKKUtA1iC
 He36tble8l/f4NIgSnCudgg0MKR/ZRBHQqwYz/dSPCQGZRUFUrVCFpT6G0S7tm5IXVzn0aha2s
 0VYaUMZCXcyDH67d6bTOPHJMPr+/Jgh/766E8/e0tKFDIRpcWdelqpIvxPt15Olr/gHbf9zeyS
 07HuAAAAA==
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
 d=bootlin.com; s=gm1; t=1731410396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6fho+OGQBZ9POAOFfDTPu0lUgE2U4VfyFmGhh0QZ+YQ=;
 b=Jus2AoV3DyPRQtUNDWV1aZQfni1HXU0lTMXQPfF6FiCf5WOEa+CSYbF9PQKJ2utQ4TH7li
 OrrUGkMPIcEeUqL9BrhxhojzM3CKECg5qoaBVxHTnDD8PgGOMWMZILBiFr0qNoE80CnJz7
 LgQUClX/4LtMhexZ6pW0V45tgg2rhYuKLZolBdsYjdaaWSEC3bqYQ03Z6R1r3iBSikEbM5
 dKYJ99wUztzkB+MXj8vJHQMFuPDOngQwY1IfZFPc75bBhn9GARyQoUhSX/jQXdHAe7+QrO
 yeaaIhFJBwmycvkZCazf1aThM2Oe9El4KC8vwbY0hpa9F7WV6CTi4rzvr7yOqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jus2AoV3
Subject: [Buildroot] [PATCH v2] boot/opensbi: remove dependency on
 fw_payload to pass FW_FDT_PATH
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

OpenSBI firmware can be built in three different ways depending on how
it transitions to the bootloader (fw_dynamic, fw_jump, and fw_payload).

Additionally, it is possible to pass a device-tree to OpenSBI during
compilation using the FW_FDT_PATH variable. If this variable is not
provided at compilation time, OpenSBI expects the previous boot stage to
supply the required device-tree.

Currently, in Buildroot, the only way to use the FW_FDT_PATH variable is
to include the device-tree blob generated by U-Boot. The upstream
Buildroot currently forces the user to install fw_payload for this
purpose.

This patch allows specifying FW_FDT_PATH without installing fw_payload,
as permitted by the "Firmware Configuration and Compilation" section[1].

[1] https://github.com/riscv-software-src/opensbi/blob/master/docs/firmware/fw.md

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Changes in v2:
- Rework commit message
- Add dependency on U-Boot to build u-boot.dtb
- Link to v1: https://lore.kernel.org/r/20241106-extract-fw_fdt_path-v1-1-0983c183f71e@bootlin.com
---
 boot/opensbi/Config.in  | 3 ++-
 boot/opensbi/opensbi.mk | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index dd113a0bf87589c49af74d63180007e35f0a796c..28e25f845a5d5453ee685998d4afc046dfc3fd91 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -47,10 +47,12 @@ endif
 ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
 OPENSBI_DEPENDENCIES += uboot
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
+endif
+
 ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PATH),y)
+OPENSBI_DEPENDENCIES += uboot
 OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BINARIES_DIR)/u-boot.dtb"
 endif
-endif
 
 define OPENSBI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)

---
base-commit: d242ab6b8e2805ee173de54bec47dbbcbcecc939
change-id: 20241029-extract-fw_fdt_path-87cb8e4be2bb

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
