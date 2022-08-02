Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33295C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEA5881846;
	Tue,  2 Aug 2022 20:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA5881846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zE77HAe4F00Z; Tue,  2 Aug 2022 20:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D695581836;
	Tue,  2 Aug 2022 20:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D695581836
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5187B1BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A6174099B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6174099B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYVr1Qnnb1oA for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:22:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CACF14018C
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CACF14018C
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:22:06 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id b25so11466688qka.11
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 13:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IvMvG0NHBARwpZU1t/b4d7gSebDdW28YLyuqQamB66I=;
 b=r/Kgb6bNGNkk4djK73SXEFeHMqbJePBIEvb+YaZF+MxBKGyUatomADYStRDuqQPLQc
 Lkdy/Xx4efx8w/yisaLZX63OxHJ/E/lmDDpk0GSUOgJHVe6ZW3K7r4Dx/SaD6x5yU3iC
 3TYEgjgXzsTzGpaU/mbWZGfu+XBKaWht8zP+z6/nkDGIW/4a/jvIaVgBHw1XD5p0yDit
 9WwMUdgipXeNOXYLpI1x4f3wtzvTdAKw3amjK3C095ca/63cdr0k0ahnKfS31NsevFa/
 uH4Ma8N09MF/NQCzGYk9wTFkHC/ZntDRroWmiLUpR/95eYVKgbwDR4jwfpZQQGItb9cF
 rd1w==
X-Gm-Message-State: ACgBeo3k9BT2RGsx8Yn9Ic1Ulw4zxBy3f6Orl6Irebaq8e9GdM8rX8Eh
 WXZHF60I90fAOoT1mHuc23/+Ziqno17F7A==
X-Google-Smtp-Source: AA6agR6XB5ORcOw2ZjPC7PjmV5Jnp6uQ0EWon2TL2Tfq/LKDwcG5GxDAH0hoxbeNPzOs+7IeyIk2gw==
X-Received: by 2002:a37:b1c2:0:b0:6b8:9885:a27e with SMTP id
 a185-20020a37b1c2000000b006b89885a27emr10450155qkf.270.1659471725595; 
 Tue, 02 Aug 2022 13:22:05 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a448e00b006b6757a11fcsm11661660qkp.36.2022.08.02.13.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 13:22:05 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 16:21:39 -0400
Message-Id: <20220802202142.1770838-2-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IvMvG0NHBARwpZU1t/b4d7gSebDdW28YLyuqQamB66I=;
 b=FXYOr4hP3+79oihQqQFRBB1cwkV7xcifpMqeOdlGl8wHxp7kIHsrliscz2Kkp8+wDx
 2l1Ip4xtIBowEyOn/QDcwlASlOly1r2Yl+GT1Zg49FK0HA/1WHANnu5DTNl76hOjN5bJ
 BzRkGQ7a4grB8JnlZpoMb7XghLkabzjo9IIyuE6JY1sP0xF1ilwx2vPPtZiXwZYkb5Hb
 6yi+XGiRyGuBTDmnCMIl3YrKs4N6NDFficbebH10fgNUC3yavC27j9X9iUer/IBe3qO4
 ArEL81k87fJ5b7rA1yeC8Gh2vJGpQsNj+DNYq3HBPg0lZE+5lEU9mrwdGudWv6rCGAG2
 Sn5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FXYOr4hP
Subject: [Buildroot] [PATCH v2 1/4] Revert "arch: drop now useless support
 for FDPIC"
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
