Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1B4CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 12:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AEAD40E5E;
	Mon, 24 Nov 2025 12:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHosXJ9RT5Fy; Mon, 24 Nov 2025 12:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B8AE40E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B8AE40E46;
	Mon, 24 Nov 2025 12:32:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14FC1E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 12:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0691440203
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdJglQe3vb4k for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 12:32:26 +0000 (UTC)
X-Greylist: delayed 318 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Nov 2025 12:32:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50928402EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50928402EC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::8faa;
 helo=smtp-8faa.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::8faa])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50928402EC
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 12:32:25 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246b])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dFQ7C50S5zqXn;
 Mon, 24 Nov 2025 13:27:03 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4dFQ7C1Mwcz7Bb; Mon, 24 Nov 2025 13:27:03 +0100 (CET)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Mon, 24 Nov 2025 13:26:54 +0100
MIME-Version: 1.0
Message-Id: <20251124-uboot-env-rename-v1-1-7ac5a21da6e2@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrE1i6ie4ilgUU2ahlRaRSO+us
 fwW770Q2AsH6LMXPN8SxNkEyjOYN21XRlmSQRWqJlIVXpNzJ7K90bPVO6NpW2q6qmsMlZCyw7O
 R518OY4wf4TCsumIAAAA=
X-Change-ID: 20251124-uboot-env-rename-f88169496f13
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Ozan Durgut <ozandurgut.2001@hotmail.com>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH] boot/uboot: fix externally provided env file
 not used on 2025.10
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

From: Quentin Schulz <quentin.schulz@cherry.de>

fb5235239aad ("env: Rename DEFAULT_ENV_FILE to
ENV_DEFAULT_ENV_TEXT_FILE") renamed the Kconfig symbols and thus we need
to adapt the U-Boot package in Buildroot to support it.

Fixes: 128c26f2875d ("boot/uboot: bump to version 2025.10")
Reported-by: Ozan Durgut <ozandurgut.2001@hotmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Only roughly build tested, warp7_defconfig modified:
- to use Kconfig for U-Boot,
- to add a dummy environment text file,

Built 2025.07 and 2025.10 and checked with make uboot-menuconfig that
the variable in U-Boot was appropriately set.
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7bd0937df2..8dad710bf3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -409,8 +409,12 @@ UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=
 ifeq ($(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_ENABLED),y)
 UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
 define UBOOT_KCONFIG_DEFAULT_ENV_FILE
+	# Pre-2025.10
 	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
 	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
+	# 2025.10 and later
+	$(call KCONFIG_SET_OPT,CONFIG_ENV_USE_DEFAULT_ENV_TEXT_FILE,y)
+	$(call KCONFIG_SET_OPT,CONFIG_ENV_DEFAULT_ENV_TEXT_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
 endef
 endif
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY

---
base-commit: c8cb1a238de5a803228f12ad32b36cae2acfc778
change-id: 20251124-uboot-env-rename-f88169496f13

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
