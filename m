Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475BAC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 08:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD3B260D77;
	Mon,  4 Jul 2022 08:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD3B260D77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikagNUmMqYCp; Mon,  4 Jul 2022 08:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E229860D8C;
	Mon,  4 Jul 2022 08:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E229860D8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3B371BF338
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 08:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD62E82443
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 08:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD62E82443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCHZh5pHgWHu for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 08:56:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 261EB81A24
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 261EB81A24
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 08:56:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z12so2835173wrq.7
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 01:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEcwkc6CukaKyaQvKEoM2mjWb0wdqLDUqxUGanRWMZ8=;
 b=XgkuiW9Npzr/hNrHSDuuSEm7r7ISKDEjMFMuwIE2cSwWQSjAK/kYzg1ilENjYh+qaJ
 qtvVVYArJmQHCqdD+Hqw+hj1yGy+uCh6aM2Tyi+38x4EcQspunQ+j2BxfaejAC12lEZ4
 QXjWv9tTQcXGEw03n5rle/DYk/xd82ZvdP3AHQJLUfkj1yqKEHylVWti1ZSsFWILRYVB
 JIpv2tiPMpvzYJVVQVMn25dloevJTeD9OHlkA7ofpJJxrRC1o0czQg0c7y6LlIlCRzmU
 bfq3GFYJjjmjANlW8comviPzADfAY4HtrICQgBQ74CO9pV3zo3f4wywQFU3QrGfgVPaz
 D/jg==
X-Gm-Message-State: AJIora8VolgmpEdXBlgrrzwy1otzObjurDY0k9bL2jvd92u2g6vIVDH1
 ff6TsE/olg/vMXLAT8G7PtgILCqkC9pv8g==
X-Google-Smtp-Source: AGRyM1sxyPSmP72XR3epU7NkqzS45AIaHLj4G9xy+TGctelB5WmV7nEuGtmqVN+b38qRKAMMEwy2hw==
X-Received: by 2002:a5d:484c:0:b0:21d:6c71:a053 with SMTP id
 n12-20020a5d484c000000b0021d6c71a053mr2263698wrs.449.1656924960233; 
 Mon, 04 Jul 2022 01:56:00 -0700 (PDT)
Received: from jupiter.home (14.5.23.95.dynamic.jazztel.es. [95.23.5.14])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adff992000000b0021b9416fa13sm6624967wrr.90.2022.07.04.01.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 01:55:59 -0700 (PDT)
From: Abel Bernabeu <abel@x-silicon.com>
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 10:55:52 +0200
Message-Id: <20220704085552.3499243-2-abel@x-silicon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704085552.3499243-1-abel@x-silicon.com>
References: <20220704085552.3499243-1-abel@x-silicon.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEcwkc6CukaKyaQvKEoM2mjWb0wdqLDUqxUGanRWMZ8=;
 b=QiujlS33dv9ISRHM1xlKOnxnNKcSdC9l9NvCw1V01Kp6hpIbo/FmAqVs/e2NmQJRL0
 przYfTuHdR2ww1RIHEZ117g9+f+/CMGD6f2rcJ9odwlutTpeodwTiT45aJ+jYYBAcWNi
 HVoIUoznkZyFC0iLpOITK6JLo4qvYK9HyqCWGRin9dn7hpoChYjM479CgOjoM9YEELQT
 uc2DbHRpsLdJ/B0gwLkh0ix4Z8vPLSjo40UTs/Y88GohU9d01rpmilg5ePuYzWTkDtQt
 Y58RxlleScmvkvFvLrCq1n3aegVveS88WLmZHiyanZ3DGLOSAzQvI/h32A/NRjifWn41
 aMgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=x-silicon-com.20210112.gappssmtp.com
 header.i=@x-silicon-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QiujlS33
Subject: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V vector
 extension on the architecture menu.
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Abel Bernabeu <abel@x-silicon.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new setting will allow to test new toolchains already available
that support the vector extension (more patches coming soon).

Signed-off-by: Abel Bernabeu <abel@x-silicon.com>
---
 arch/Config.in.riscv | 7 +++++++
 arch/arch.mk.riscv   | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 288ed833eb..e4dc936cf8 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD
 config BR2_RISCV_ISA_RVC
 	bool
 
+config BR2_RISCV_ISA_RVV
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_riscv_g
@@ -63,6 +66,10 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
+
+config BR2_RISCV_ISA_CUSTOM_RVV
+	bool "Vector Instructions (V)"
+	select BR2_RISCV_ISA_RVV
 endif
 
 choice
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..07a94aa6a4 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,5 +26,9 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)v
+endif
+
 
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
