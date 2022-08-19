Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC75FC32772
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33ECC60E5B;
	Fri, 19 Aug 2022 15:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33ECC60E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDaoUCJUv4gl; Fri, 19 Aug 2022 15:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568AB60BAF;
	Fri, 19 Aug 2022 15:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 568AB60BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 555431BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30CFA842C8
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CFA842C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlharRktJSKo for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B76E842A5
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B76E842A5
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:17 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id f4so3448133qkl.7
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3fAW2si+eMv6gptVTWpJcxVTSz5brJ/3a8q88kdDcao=;
 b=Tfho8LBD59awf8K+a+dBuYq4DcKghvHJgHBa6vvRp4Su5xEijRUrkI5h1X+QsXwZHX
 M2OW5g8booFGGLvoCqrubnyZowzQCyJmhH9Xw0Taw8291cjayDUQquX6bXTIc3E8AevU
 uM2+ZHym5ab+pzov5+OgVGIkIdNIOK0q9AxqP32jdrAJA3Fzwvy2nSGt3rxgUwWl3t4J
 j32TJPgHASLqJkL52PJaVxh/Vg559wBDSGt86Jp85c5PJtYXmWvPWgqgM+vAjxylT108
 YU/OCxda0yW8wa+6ibsg+WgDHzu+L5K7PUgknOi/ze1J0PzyxbEIfJqqBagHS30Pk+13
 UYPQ==
X-Gm-Message-State: ACgBeo0mOaWgmDJ7MJzQj0HWGRsfO/4ck/GWkujdqcBALN4rYUFNEfl0
 CmUxS1P1RE4gFhieSjd9eq++S0ZZykCB+w==
X-Google-Smtp-Source: AA6agR5bH6hZGhBmhCUrvai1JQhYg1uqrdT6Tu2TiGz1prq0vq4tmuddIvxI8NBSa8l0Edhu32qPlQ==
X-Received: by 2002:a05:620a:410e:b0:6b2:809f:2f62 with SMTP id
 j14-20020a05620a410e00b006b2809f2f62mr5501227qko.14.1660922296859; 
 Fri, 19 Aug 2022 08:18:16 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:16 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:26 -0400
Message-Id: <20220819151734.926106-2-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3fAW2si+eMv6gptVTWpJcxVTSz5brJ/3a8q88kdDcao=;
 b=RsdMKamXu2Utts2CQpVwd74VgWCnL5yu63qeX4s6vipXnEGtImjU/3H8aeooBRpcrF
 nC3fVd0slyDgYyW6nhYldHeRbZKSIKQALbPtO9BAx20qkCWuuynD6NA5nJ2FQKrDYxDU
 W8HZZmGy+pWBmytN6Tqbblmq8Wt+U4S0pUTy/JCtPidmyAyZnwl7Wpn1AtjbWNiFyW5V
 2pXJIwoLHm/HtahQBf7AsyLREG3CQpJcKqDDut3aswb+8QfDaPFq1VXmXQ+NPSUubGXO
 GA9CWeRfSlND8TMqlAgROqpjy7QGqFVs91jqvVvRn2zNtFLhkZMCLn+kse0WsD/fiiEH
 plzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=RsdMKamX
Subject: [Buildroot] [PATCH v3 1/8] Revert "arch: drop now useless support
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
index 0ddf7dfa6d..f7810e4974 100644
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
