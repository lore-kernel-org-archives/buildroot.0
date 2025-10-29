Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AA8CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 12:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C79408A2;
	Wed, 29 Oct 2025 12:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4X8GKDUMjClr; Wed, 29 Oct 2025 12:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A93C4090A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A93C4090A;
	Wed, 29 Oct 2025 12:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 466BD707
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 12:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3490B60DCA
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 12:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkpUTV9rd1BM for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 12:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=matthew.allen@fleet.space; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8043060DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8043060DBB
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8043060DBB
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 12:34:15 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-34003f73a05so1109949a91.1
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 05:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761741254; x=1762346054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ctF1fx2pR275M3OWUFiyCY6CjF+HRe/YFg5KJUG6+Tc=;
 b=R9jcZSpgfz5mOvtcfNMsJH64SIMYDxNQwAi7urSbtg1FqlbVmqzEYyb9u5ebW/0xwk
 n2ZXzN6kpwZct1ccUwZQ4oLtfw2uEd5isTklxaG66RENZcgWVeHmkyYzhsUDys2QfXDA
 JwqW1WeQObrPD2pgqJ+FzE9IN+/CmyBTf3Q9A/9jAi3/94H6kcCoqlrk4Nbacqoc7DxX
 zc8vkOCACzxJpNxJE+8bQjn/hcCJ9ITxvfIFELuo58fGPfB4Sri+tp/TbxZmmA0YBjcp
 pqJkceRQaSXKL/mEZPyGCVJrWSWYRiahtpvL3itV10kuTCtolYEBslmgXGPkqFr4WUju
 kaZA==
X-Gm-Message-State: AOJu0Yw4JJly+iDzz3Un5LZJeqpJF/YSrj4n5H1zxAMTkpN3cq/0nqej
 K+EH+dKQ05mqIraznZKGU9SJoQLzLSXE9aCpg7me9gKKEJIM2q7mHQLlxgQ8N5FgHYTfLzV2hG1
 F8Ull
X-Gm-Gg: ASbGncs1JCgcoFGn/hs06ex5hF9/iwTC0Umf1VVIOz2ABysSJYVrsfrJpGlGo5ZSXL2
 7461WAgqJaV3AF9X/jm6z5mxhL6SJLrv+Si8v4HiSI7bt9skAwNSk1xSSkOuM5ETIIMHKP5NjyG
 tD6vu/PAo42/ABHoS/u1GTYNP8//Sbm3XxYZ3QyCvC2QVasASm5syGYMCNyrBjGmGwucBudF2F/
 kRhk2YdRYQckUicaOtOudaEYBLBOEpEWIDRTOQpCznIs2bi7yXfMCKser5uziJycnkUY6zCJQmh
 YYSrNnE52SrE3LooLM6qebUwp3wxk5TgnblFsy+Recp5rW+FFOTaehI2hPmWzySWo49jIXx/Y4R
 sDbL+wWzwgOgV7yUXYjxVoqAeFcgd62h+d3sWfx5qNElsxTN5rpNIJ5xaNe9suGZ+VMwoieuhFA
 o3rYzhGmi5+C2XzQg7GZUZkrL1DZpg5EnokJnoT7pLXcr3ijcvH6Z7sGKfu30qWjmndjnZrCVE4
 4OFxz3GDy6flb9pzsA=
X-Google-Smtp-Source: AGHT+IEZMhhMyYHy0kWB+OvdgAen+xlajZdU4p0ogcfA5JLacdpZqua+/u5OpJaDEiKs/ThUK2Yh8g==
X-Received: by 2002:a17:90b:2b8b:b0:32d:a37c:4e31 with SMTP id
 98e67ed59e1d1-340289a12a5mr8575569a91.17.1761741254308; 
 Wed, 29 Oct 2025 05:34:14 -0700 (PDT)
Received: from exploration-flatbus-1.tailb41b.ts.net
 (159-196-51-36.9fc433.adl.static.aussiebb.net. [159.196.51.36])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed7e540csm15528195a91.13.2025.10.29.05.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 05:34:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Matthew Allen <matthew.allen@fleet.space>
Date: Wed, 29 Oct 2025 23:03:56 +1030
Message-ID: <20251029123356.1776894-1-matthew.allen@fleet.space>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fleet.space; s=google; t=1761741254; x=1762346054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ctF1fx2pR275M3OWUFiyCY6CjF+HRe/YFg5KJUG6+Tc=;
 b=JKPKPvbp870mzw3dk7gyC0pLxZY14p3FH5NfhfeLlAachczP7y0AlbCRw25IlM/pHy
 ViYrxeJFlCJwNTqS8xlCIxaiYhO/I8t6StkK/KYI379NKuDyockBkvt/QaESQLVKHVu0
 wHAw44YXA7NFWSjahB4367Y844MTcfriyC9TkT7Mh0sQE1r+LHlWPFUxR9xvet1Y0VJg
 wIWhYvQFPtd4U/+WuwoAJGnIYkQQhrGqDcMEAiMz3AF6jsSVzBqzf57+KZZDg0I/AK6m
 Jw96Gd8WIDwhqZzpjtCTU5ajvQiFY7ecpsE9vA+YvuIso+4YRH5Wh496EvSTYQELbmqe
 hBMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fleet.space
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fleet.space header.i=@fleet.space header.a=rsa-sha256
 header.s=google header.b=JKPKPvbp
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add support for u-boot-nand.imx
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
From: Matthew Allen via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Allen <matthew.allen@fleet.space>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Matthew Allen <matthew.allen@fleet.space>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d40e1e95e0..cea323425a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -364,6 +364,9 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
 config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
 	bool "u-boot-nand.bin"
 
+config BR2_TARGET_UBOOT_FORMAT_NAND_IMX
+	bool "u-boot-nand.imx"
+
 config BR2_TARGET_UBOOT_FORMAT_ELF
 	bool "u-boot"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7bd0937df2..15f53a8196 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -81,6 +81,11 @@ ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BINS += u-boot-nand.bin
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_IMX),y)
+UBOOT_BINS += u-boot-nand.imx
+UBOOT_MAKE_TARGET += u-boot-nand.imx
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
 UBOOT_BINS += u-boot-dtb.img
 UBOOT_MAKE_TARGET += u-boot-dtb.img
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
