Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EECC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 13:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45C8760C27;
	Tue,  2 Aug 2022 13:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C8760C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1RYbPTj1YEt; Tue,  2 Aug 2022 13:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 525CB60B86;
	Tue,  2 Aug 2022 13:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 525CB60B86
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 284381BF329
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0216F40761
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 13:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0216F40761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IxC1lOsBAlHR for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 13:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D81B40863
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D81B40863
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 13:30:20 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id m10so10696152qvu.4
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 06:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IvMvG0NHBARwpZU1t/b4d7gSebDdW28YLyuqQamB66I=;
 b=M+ErY1yKL4vbw2evDMFM5jNxbTMvF5G1Ds1EV0eEDON/CBkhOEM6iB89e1zYPDAwRU
 7E2be45cYuT5uCjzG3tfBAuOXWautDFFgrtmQgROH+QB62aVY8h8FjAFSxDv2sLNPq8r
 FvF/h83tMD1aF6b91I2V/mmwyly/3Ki+vrONc1kAemKd19pLqH+nPfnsXCXMeckofuJq
 Z9zbFlN1li831VuanBS25QeGt/NGO22se4RBIt8PJv+cXuNGOq9ceKUfzNAJffA2HNS3
 ug8+lQv/cTA9ckByguGyBZsOc7ShzyKGzBSt6pxOqFcIXyYNFDJMxJ0ME3N686G0FWjA
 TXKw==
X-Gm-Message-State: ACgBeo2Fi7lVGzbbS7yffVxmGATwFSzhGnyLGlMz4IPKYLTBftAdTS+d
 C7Kcz+bQtEoGAj1/XLRbU9SIFMg8cuYSIQ==
X-Google-Smtp-Source: AA6agR4wKEREQ+hp9HpL7m/i2bjuuRQxtRFeRQth42mFGQyJmuz4rt6DhU/GVjEfvqpEuXne19piKg==
X-Received: by 2002:ad4:594e:0:b0:474:4e75:3579 with SMTP id
 eo14-20020ad4594e000000b004744e753579mr18833449qvb.74.1659447019559; 
 Tue, 02 Aug 2022 06:30:19 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 t17-20020ac87611000000b003051f450049sm8894638qtq.8.2022.08.02.06.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:30:19 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 09:30:07 -0400
Message-Id: <20220802133009.1282520-2-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
References: <20220802133009.1282520-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IvMvG0NHBARwpZU1t/b4d7gSebDdW28YLyuqQamB66I=;
 b=Hc9abmGX+fG6+QHBuhGJRORbq3N13huV4YG2UhhEo2HD2iqwci0dhOShXYRJPtXOut
 cEw0Uj305n+PLWcmrctgEzHvvczkF1RSrFLxM20bRFoVcjTiiMKZFEdbY5oRySwI49gM
 g7X2l436Q6X+ldcUHsPa7+oUktujuhd0ITEcC3eRCU4CusyUDs4k0ndVUdiby1npNUo/
 UoPaw0rNRbSZdP/Vw5uRIhzCVbZksAcaB6gevy6P64HTPWAx+GfJCb+TpFICbAE4m99m
 P5M6EOUJbUXkjj3FYIzrTbt2Qi7egC9PJwy2y/JtYwjC9j1PR3WAvFKzjVmW6u4EgNvh
 JARA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Hc9abmGX
Subject: [Buildroot] [PATCH 1/2] Revert "arch: drop now useless support for
 FDPIC"
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 58dcd28dfbed481becb822b009583a63efbc6ffa.

ARM supports FDPIC, so this code is needed once again.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 arch/Config.in           | 14 ++++++++++++++
 package/uclibc/uclibc.mk |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 1c0c400a98..c5d481b9e5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -12,6 +12,9 @@ config BR2_SOFT_FLOAT
 config BR2_USE_MMU
 	bool
 
+config BR2_ARCH_HAS_FDPIC_SUPPORT
+	bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -418,6 +421,7 @@ endif
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
+	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
@@ -429,6 +433,16 @@ config BR2_BINFMT_ELF
 	  and executables used across different architectures and
 	  operating systems.
 
+config BR2_BINFMT_FDPIC
+	bool "FDPIC"
+	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
+	select BR2_BINFMT_SUPPORTS_SHARED
+	help
+	  ELF FDPIC binaries are based on ELF, but allow the individual
+	  load segments of a binary to be located in memory
+	  independently of each other. This makes this format ideal for
+	  use in environments where no MMU is available.
+
 config BR2_BINFMT_FLAT
 	bool "FLAT"
 	depends on !BR2_USE_MMU
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0e17a8e65d..ff98a05c16 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -56,6 +56,14 @@ UCLIBC_LOCALES = \
 endif
 
 # noMMU binary formats
+ifeq ($(BR2_BINFMT_FDPIC),y)
+define UCLIBC_BINFMT_CONFIG
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_SHARED_FLAT,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+endef
+endif
 ifeq ($(BR2_BINFMT_FLAT_ONE),y)
 define UCLIBC_BINFMT_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT)
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
