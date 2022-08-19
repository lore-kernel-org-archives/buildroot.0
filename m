Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A46BC32771
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F41611AA;
	Fri, 19 Aug 2022 15:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F41611AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAtiOgkKjWZb; Fri, 19 Aug 2022 15:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61EC86123F;
	Fri, 19 Aug 2022 15:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61EC86123F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A68081BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 819B0842C8
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 819B0842C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-ZU6l3K-wAC for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CB77842A5
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CB77842A5
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:26 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id g16so3441285qkl.11
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tcMPPpy1TZtqaiqnUTAtjCVq2mcQ27rla5qf8+OGR80=;
 b=Q7PanqjVybHH63EGhqX8S2Eq2Y9By4uiGgh2mJnsXmk5FHgHwSOuZ9aE5jHN9tmQci
 6HjFZDP/TQt4lhvFOyzviC5tCv4pQz560HKfAEsw2FhAtJ5nKSEUx8OZNeJekWmgY1qr
 gwNTrJ+d1voOLg5CTwqsijswnZwNbP5ELaIITaP45g7nDD9WNkZx1ayY8+A3z4CbQkri
 8i4EGwFHZEecQaFmepnF3nrT8sKHggESVaVYhiNoPh92pn/t4euTMoqc7VJRPZ56LUqD
 7lUA0rfRQnFhP9WoxCLt0uQbGZ4IzIeVFLI97GLz7/pYMyqOCbzXGbuNlIr0Cs8Oj/Ya
 bGyg==
X-Gm-Message-State: ACgBeo1R8xIIdyJUQ1hk9YQ20c2gdBpcvGjGe0TMT8xYmahKtR+wh0G2
 XiZLsnNGBtPdJTR2/82AJpTb8Uvsr37/1A==
X-Google-Smtp-Source: AA6agR57FVtMDODY92LP0YJM5C9mblyaAv+2W5rvaCAcRc8f5gMmcqJ4z0aPnZdj8qTQkJ1X+XXlzQ==
X-Received: by 2002:a05:620a:3c3:b0:6af:9933:7cb3 with SMTP id
 r3-20020a05620a03c300b006af99337cb3mr5475175qkm.508.1660922305906; 
 Fri, 19 Aug 2022 08:18:25 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:25 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:31 -0400
Message-Id: <20220819151734.926106-7-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tcMPPpy1TZtqaiqnUTAtjCVq2mcQ27rla5qf8+OGR80=;
 b=FxRiucMufgT6B0ZCNKUcNCwIFp1alwE3R8R+47aQ0DYkte7PaHPJaXk5xh+XB+hOqw
 ovf79G0BMLw+3HvwkjQqoGFePgoIdKmLP9Qalm6MIHIJO8PnfBIBeZbqc6PdV/U8QXTj
 k8AGXAZDJQZnXTCEzkUoNYQR7FiRwLkY4WaK20zs4QSJ08tIAxx4gKMbx7k3UPOsiiI5
 HC+mFE95bB0/BcpZERiAIodZ+1/II6kWsE+Pjl5buPkPntN3iTnzHU6a5cSbJsc9H36N
 LhHNvd1R0Jn2K2FXd7TKPfMu1C1fG2M6cp1JIyPZAU0r7uF2PMdz43kRz+ApRhc2UZhP
 gP9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FxRiucMu
Subject: [Buildroot] [PATCH v3 6/8] linux: pass -mno-fdpic if FDPIC is
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building the kernel.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index efdc21eff2..646f0e9b27 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -152,6 +152,7 @@ endif
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
+	KCFLAGS="$(LINUX_CFLAGS)" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
@@ -172,7 +173,12 @@ endif
 # sanitize the arguments passed from user space in registers.
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
-LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+LINUX_CFLAGS += -Wno-attribute-alias
+endif
+
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+LINUX_CFLAGS += -mno-fdpic
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
