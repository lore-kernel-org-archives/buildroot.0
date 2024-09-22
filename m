Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7F8CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD0F4066C;
	Sun, 22 Sep 2024 09:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wz1g8MxqMHzL; Sun, 22 Sep 2024 09:23:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 893804069E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 893804069E;
	Sun, 22 Sep 2024 09:23:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 222DF1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1183E813F3
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJ22pHMq_4mi for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35279813F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35279813F2
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35279813F2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:40 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so143231666b.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997018; x=1727601818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqQnF3E7ciw9GbEgIOpbevSW9KmfWN9UV4R/GKU3/vQ=;
 b=QKllUvK0bk2CyNzocAIJbXv3+8G63VjoKJU6w4MGeCb88d85KQmEn3+M9fT7r2cMnB
 EoTiwohzlLBaDCIrwg0wf2ZvmrpNjs41qRgQN0m+J5N1Hatvg1mTrr0oE+34TgdPLq62
 TjaylwWxg51di67HnhhDeD3Atp0DephRk0xiLv1kui+6BTrxPBFYr2uhPh5dPtKux52F
 duiteapiXzw/gq6LxdyL2BgFJ0xz42nSzq1f3ybWmqruMzPktyX9Lc0n6/6K5w78Rh07
 cHT0gi5Z6ZTGHhe33SDRI7fszbCCguQccmaeQhIxtalGqJTE25JtQ68f0oF9FJ5naRe4
 71fQ==
X-Gm-Message-State: AOJu0Yy2gqW4SpFJyclbfmrmMZBgHLDsNzyP/8zowSLhJ/cZQAJoJl2E
 d8jqwLSxhHcyt8PgAgsmEWAKyxfJdchDgWH/byiaeQJxXJpCr0hfuRxlzcii2KFlkcCma4V4vhw
 fv6g=
X-Google-Smtp-Source: AGHT+IFaZLr1j3Nel9GkOBR5wMs0Rk/OpP79P67IERmiVWSIGhfVFU1QCwjSRndOo4+fhJ3ZD7USiA==
X-Received: by 2002:a17:907:e656:b0:a80:7193:bd93 with SMTP id
 a640c23a62f3a-a90d565bf4cmr904021866b.25.1726997018087; 
 Sun, 22 Sep 2024 02:23:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:07 +0200
Message-ID: <20240922092312.2061358-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997018; x=1727601818;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqQnF3E7ciw9GbEgIOpbevSW9KmfWN9UV4R/GKU3/vQ=;
 b=lZw2NU75seN1GooeBUeHFVQES39kXiFtxmLyKJvl/XAp+lwrLvVNSsoAAGZJZWZozV
 OV7E2MAuJbCk/+UtK7RwFn4qmYJSkIkO6hJOHKbMB4RmVhjOoEBUlIFs4o0aEcxUNqPV
 6Zhg5HhMMaqbIzKLOumftjJ0+Cwv4Bj8mXd6Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lZw2NU75
Subject: [Buildroot] [PATCH v2 4/9] arch/arm: add support for FDPIC
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
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

Linux on ARM supports FDPIC binaries intended for use on no-MMU systems.
This patch enables support for building a toolchain that produces FDPIC
binaries.

The target name for a FDPIC toolchain must be
arm-<vendor>-uclinuxfdpiceabi, which doesn't follow the standard format
and requires a special case.

According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
available on all ARM platforms, not just no-MMU.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 arch/Config.in      | 1 +
 package/Makefile.in | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 52efe3aabda1..cd258b2530d8 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -39,6 +39,7 @@ config BR2_arceb
 
 config BR2_arm
 	bool "ARM (little endian)"
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
diff --git a/package/Makefile.in b/package/Makefile.in
index 808b71a93e99..829636900ba9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,7 +39,13 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 endif
 
 # Compute GNU_TARGET_NAME
+# FDPIC on ARM requires a special target name: it has no OS field and must
+# use the suffix -uclinuxfdpiceabi.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-uclinuxfdpiceabi
+else
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif
 
 # FLAT binary format needs uclinux, except RISC-V which needs the
 # regular linux name.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
