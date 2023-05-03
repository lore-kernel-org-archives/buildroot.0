Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC58C77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 02:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7AE822CA;
	Wed,  3 May 2023 02:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D7AE822CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mE7nVU6nuALJ; Wed,  3 May 2023 02:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DCD583B49;
	Wed,  3 May 2023 02:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DCD583B49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E380A1BF860
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA70541D96
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 02:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA70541D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4K4vMj05l7xs for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 02:37:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC00841D95
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC00841D95
 for <buildroot@buildroot.org>; Wed,  3 May 2023 02:37:30 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24dfc3c662eso2175298a91.3
 for <buildroot@buildroot.org>; Tue, 02 May 2023 19:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683081450; x=1685673450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPZz5iA89ShkH30muukCmMWjDrcI/zVhBpmSoduEDrM=;
 b=ijI+n1+CEhwKWOuN4eOsuYSF3KrN2NpkOV6ZDdvrgjLVnniNdI5ZbEojAntvs/YL3D
 F7MfkGKV3OMWzz7OxNfgwA4mZN/rX/LmINkVh8AWaKy6b8bmi6cpuIIuWbirM1KJ5shf
 q1OFoAzLnwnBtit+pe2SzUQsRhttUW52EL2NmvN7fAma/Pt9wU5qWDW3LQnP/B2nBzSB
 ebsgU2p7FDnC/rdmwWdxU1l0Xu6OKcbWPzyAvZK3qx0Mt2IBsFK3r2H3iz09ldqW8uZt
 2n0x5yHyp0dk+W9oXLcLBTUwedGf2K5JZ9sKPn8Oqfs+N8unQ05+lpLeGTmrWS4i8ARA
 8hFg==
X-Gm-Message-State: AC+VfDw/bd7A+z5FNE/6SIT//Fzz3czemp68ixNGVDQ+S/aQFI4zxokP
 p1WKcnjo7ckw23KmmlyQ2D2UrXyVNWD/6Q==
X-Google-Smtp-Source: ACHHUZ4u1tYTMkTZDC5VFLS0Y2DbIYyUhB+HJgG0powO22D/VHAcHVV8s0ZmGZfJKq76xPef0I9YqQ==
X-Received: by 2002:a17:90b:4a0b:b0:247:3895:e416 with SMTP id
 kk11-20020a17090b4a0b00b002473895e416mr19740209pjb.16.1683081449936; 
 Tue, 02 May 2023 19:37:29 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a17090ac08f00b0024b79a69361sm184877pjs.32.2023.05.02.19.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 19:37:29 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 12:37:11 +1000
Message-Id: <20230503023711.586439-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503023711.586439-1-alistair.francis@wdc.com>
References: <20230503023711.586439-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683081450; x=1685673450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPZz5iA89ShkH30muukCmMWjDrcI/zVhBpmSoduEDrM=;
 b=lmvpko9N0kmIn8TSLOMXeeYDMor1lQU0qSA+hJFAW7sp1aQZpA5dp+TtCBpc80A9Hy
 xHFtnWfCF1xPhYKdyhfj25ay1Dlf/7PILfYtX9nsaUd6qbsT1+MMwdzYUw8ub5QgTffA
 hvph+/gO8XcKVcZMygYacJX5Lwq4GLzkHFyVFiJOxIXnGRkQ1s1l9jeqBEtl1rZVgGIi
 RIe8+EE6bbS5wpls4c/GfhA1sURg6QFs1h3gfyFxKk2fVlioIsOXAs0WO/AngEFN4P0q
 4VZUIQHJtGUS2XXNo4rtxjhW+Xr6cXKFEqsFfc+Ug66gMgEH9AgKIqzz0lPQRXb8N39W
 rsjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lmvpko9N
Subject: [Buildroot] [PATCH 2/2] boot/opensbi: Allow a custom device tree
 path
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of hardcoding the u-boot device tree, allow the user to use a
custom device tree.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 boot/opensbi/Config.in  | 16 ++++++++++------
 boot/opensbi/opensbi.mk |  5 +++--
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 5e6b8d158e..62d0c5a56b 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -109,15 +109,19 @@ config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
 	help
 	  Build OpenSBI with the U-Boot as a Payload.
 
+config BR2_TARGET_OPENSBI_FW_FDT_PAYLOAD
+	bool "Install fw_fdt binary"
+	help
+	  This option enables the installation of the fw_fdt
+	  binary.
+
 config BR2_TARGET_OPENSBI_FW_FDT_PATH
-	bool "Include U-Boot DTB in OpenSBI Payload"
-	depends on BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
-	select BR2_TARGET_UBOOT_FORMAT_DTB
+	string "Include DTB in OpenSBI Payload"
+	default "$(BINARIES_DIR)/u-boot.dtb"
+	depends on BR2_TARGET_OPENSBI_FW_FDT_PAYLOAD
 	help
 	  Build OpenSBI with FW_FDT_PATH set to
-	  $(BINARIES_DIR)/u-boot.dtb. Note that CONFIG_OF_SEPARATE
-	  must be set in the U-Boot configuration for this file to be
-	  produced.
+	  $(BR2_TARGET_OPENSBI_FW_FDT_PATH).
 
 config BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES
 	string "Additional build variables"
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index dd113a0bf8..919270aec7 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -47,9 +47,10 @@ endif
 ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
 OPENSBI_DEPENDENCIES += uboot
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
-ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PATH),y)
-OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BINARIES_DIR)/u-boot.dtb"
 endif
+
+ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PAYLOAD),y)
+OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BR2_TARGET_OPENSBI_FW_FDT_PATH)"
 endif
 
 define OPENSBI_BUILD_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
