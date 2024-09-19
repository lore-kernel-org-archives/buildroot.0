Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A27CE8D49
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 04:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0B0849B8;
	Thu, 19 Sep 2024 04:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkUasfNj_w4O; Thu, 19 Sep 2024 04:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F8D3849BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F8D3849BC;
	Thu, 19 Sep 2024 04:00:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 446F21BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 407C740142
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGi4letXNKYN for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@helium.openadk.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CA0A40109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CA0A40109
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CA0A40109
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0FAB9353746F; Thu, 19 Sep 2024 05:53:36 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:53:04 +0200
Message-Id: <20240919035308.2622723-6-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240919035308.2622723-1-wbx@openadk.org>
References: <20240919035308.2622723-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718018; bh=9G68bYbxynBveTbtc5+yOOkozn4GeF5CIpiT3klc2fU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FCxGKQqGXXGrVZaj0LZ1fYgmND92tChQLGp8SUfKA+qx3hIpyyDUErfS83R2rPfG0
 s9epgP65YhF/sgqK9Kn1gSLiojJCve8LZStSBJVwqqmD6Rr14oBepn/TssxWUL71QE
 GRsWhvUDlaDvi1J5q9CubDD8+BaTKt1RT/6IjH1HMe2iuTzF4X7yEdj557cLMKtcaV
 8PvpFdX4Uo/rYfxuRfVEoRxpOhg81Ay/iil/RjZEAyz0r/Rl6zJUJqWLIZ7qmHGNPM
 1l6CyGgZLbjO96m5J3wiGH4G+s41pRySn3lU6oFPiPevUnJe57AgQ6TBGv48btNvpW
 IUcW9jwel1aSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=FCxGKQqG
Subject: [Buildroot] [PATCH 5/9] boot/uboot: pass -mno-fdpic if FDPIC is
 enabled
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building U-Boot.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 boot/uboot/uboot.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2c04abc896..4054a7bb7b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -172,6 +172,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
 	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
 
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+UBOOT_MAKE_OPTS += KCFLAGS=-mno-fdpic
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
