Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00123CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 11:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B24DA852DA;
	Sat, 30 May 2026 11:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo1z70fwHDpD; Sat, 30 May 2026 11:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E2A852D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780142202;
	bh=shSYg+XcZgcsUCrZbzb9HqfzLMDiqFUWIWFbA71ZPhw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aszy44GdCvr+BlSKF4EhMXRJnx/SPMQiG6bjYtTTnBqQQUofdYZ4WMY/noFpyz5Lr
	 A12K5N1S5X30eLs2htkudXOHH9vTPvGFtxo0ZDKYI91w8wtXQw/Y1zjI9RKdDiaUnN
	 yHt69qcqLSdbZlr8gRn68rUHkK/skrvYvmkqtKt9xQFFpQ+4IzePZrmoacee3YNvu5
	 vNPDLxoBEes9FN5/IH8f0xMH2qXEW/Tjt5gfxiKpwtcsgtsyvmF/F8frA7RRyR7IhC
	 KTtn/2JJqmneNiGdn4bG5liZASa+v3q9W+TsMu4BGfWW7MTGdxhykWRvMke1zgWwcn
	 NNar4cJxwXuQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E2A852D0;
	Sat, 30 May 2026 11:56:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D9C6D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F367852CD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wE2d8xKU2lBw for <buildroot@buildroot.org>;
 Sat, 30 May 2026 11:56:40 +0000 (UTC)
X-Greylist: delayed 1167 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 30 May 2026 11:56:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85A19852CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A19852CC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:598:64:8a00::1000:a08; helo=mxd-2-a08.seznam.cz;
 envelope-from=havran.jan@email.cz; receiver=<UNKNOWN> 
Received: from mxd-2-a08.seznam.cz (mxd-2-a08.seznam.cz
 [IPv6:2a02:598:64:8a00::1000:a08])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85A19852CC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:56:40 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-f659df87d-k746b
 (smtpc-mxd-f659df87d-k746b [2a02:598:64:8a00::1000:a08])
 id 349f8ea2b478e43f36ebb0cc; Sat, 30 May 2026 13:56:38 +0200 (CEST)
Received: from arch-zen ([2a02:8308:b086:3c00:3636:4bcf:b8c2:e5cf])
 by smtpd-relay-5698866cf-d84zp (szn-email-smtpd/2.0.73) with ESMTPA
 id eda13432-b11d-488d-b612-2a5facd66dac;
 Sat, 30 May 2026 13:36:55 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jan Havran <havran.jan@email.cz>
Date: Sat, 30 May 2026 13:35:42 +0200
Message-ID: <20260530113540.26204-5-havran.jan@email.cz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530113540.26204-2-havran.jan@email.cz>
References: <20260530113540.26204-2-havran.jan@email.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn1; 
 t=1780142198; bh=QjO5R3AjkpwFGZ+7NNzPFVMdyv5pIypsq2i/VTKKgqs=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding;
 b=GyvQ+QJZqcLyHeKbouqRsAtRlEqPuT75H4srHWb5wUtkCoV8E9dbZWjrCwDD0XdEz
 dYVwzQjlV4E4ag5EC6p5uqLluSYKKPKF7PMiUMnyrTl9MfPscVeBBJgsDvX4MLaGZl
 znAHSzPMIZ5MNW+Ih5yU28damWt+fxmu6wXYnpU6IujKAPby+eDgdiihEr7DI3u7BM
 gSctfsmDQZGnD6yxSlK1ldVGAgBDOHaqHYG95nj7CyXBAKYk25L5xtTdi3V+S3eD7C
 eMewaMu/mQ3QH4oe2r/1MeQ1lcFYY7fKXc7EJ7zYNHo7X7BGrSJ/zDlObGrglGr4Vb
 lQUGM1yFmpEGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=email.cz
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn1 header.b=GyvQ+QJZ
Subject: [Buildroot] [PATCH 3/3] configs/pine64_pinecube: enable
 FORCE_CHECK_HASHES
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

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 .checkpackageignore                            | 1 -
 board/pine64/pinecube/patches/linux/linux.hash | 2 ++
 board/pine64/pinecube/patches/uboot/uboot.hash | 2 ++
 configs/pine64_pinecube_defconfig              | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 board/pine64/pinecube/patches/linux/linux.hash
 create mode 100644 board/pine64/pinecube/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 691e2b8138..c4249786fc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -131,7 +131,6 @@ configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
-configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/pine64/pinecube/patches/linux/linux.hash b/board/pine64/pinecube/patches/linux/linux.hash
new file mode 100644
index 0000000000..788483030c
--- /dev/null
+++ b/board/pine64/pinecube/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  6f16ff302599f6fe34742890322cf0775703105fbd8767449682fca6af0fb782  linux-6.18.33.tar.xz
diff --git a/board/pine64/pinecube/patches/uboot/uboot.hash b/board/pine64/pinecube/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..36322a6a90
--- /dev/null
+++ b/board/pine64/pinecube/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
index 742be94d17..2a0c567d76 100644
--- a/configs/pine64_pinecube_defconfig
+++ b/configs/pine64_pinecube_defconfig
@@ -4,6 +4,8 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/pine64/pinecube/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="pinecube"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Pine64 Pinecube"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
