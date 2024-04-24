Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175E2C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 21:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2EE04013B;
	Wed, 24 Apr 2024 21:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kd2J1QqqN4gI; Wed, 24 Apr 2024 21:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C4854177F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C4854177F;
	Wed, 24 Apr 2024 21:21:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1983D1BF2CC
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 21:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F1EC82297
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 21:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NcZ7GU9mhwu for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 21:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B9828228B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9828228B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B9828228B
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 21:21:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41b34d344a0so2209575e9.3
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 14:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713993659; x=1714598459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=guo22L712ombq6+zHcn9CY5O/0jLaBCiYiGdhE7QiKg=;
 b=gKtsqZ1xVheHPlsSojlesNc9/vxBY4wgN3/JoQZXp0F3FNikERNG0YXPoeY598/CBq
 y2ZDe9iJum+6KVchw0+D5EQcPLMZIk9v3ydeZr3/+Dmkdn0GyzyGr86wy/12dVF+46oh
 0uF0AQDZGy/I2VgqinTkJYOTQWaoRTJsNq1KBSXqXvWk1hMr2WzfpeeRn5sGRdNiTZ8v
 zqFMtkjW8GoZEp5WRsQoMcYZ7ueA98TjT03N30JERCiayXMGp0byzeJ12zF7fotDKfMj
 FQxpEI42eD1UElqiOMxtnto+O7G0cGx+cbGAb/sIyDh5iIt+AZ6Aw+KDfNEmqYraX/KY
 By9w==
X-Gm-Message-State: AOJu0YwhiQmvA7MKMx2jVM2PwtAbJCDDaHihhJ5GE0TR6iHfGjMlvgpX
 U52zJgDkkJxVqcwJBTo0aRnzzIQgkntlKeatDaxnInU1xtG7Aly4K0/4J7vWDmv3uiXBZHbCfst
 8
X-Google-Smtp-Source: AGHT+IG1EugbvKwtU+JkPdarilg5CLLub32pQoKGYm7Zt0bvS0VJniztp+bOIsZQbCyM+XuS5Q5uaQ==
X-Received: by 2002:a05:6000:141:b0:33e:c307:a00a with SMTP id
 r1-20020a056000014100b0033ec307a00amr2284785wrx.43.1713993658980; 
 Wed, 24 Apr 2024 14:20:58 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6b45000000b003472489d26fsm18128327wrw.19.2024.04.24.14.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 14:20:58 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 23:20:56 +0200
Message-ID: <20240424212056.749427-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713993659; x=1714598459;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=guo22L712ombq6+zHcn9CY5O/0jLaBCiYiGdhE7QiKg=;
 b=uHX7EapIARdSLGw4dHiOYbeL0C9k02BOS0HwciDuTs28VD8slaKxSTSE28aNfTR7Xb
 NdakkJ5nEf9ThchypLtDzih3DhVtyZBMMupFe6IKTBdGzhuWL9rZAseoBT+/V9JlPIqK
 FnHrVFjW7XjY69o4hhaC2dc05ZugweM5/Ou3yRnVFsGhPWuzsilsJYzJDj68fCMOuJMf
 mYyTTuiAxqSuAppfYVJUz+EWn4eWV2om4y8IYiVx5InVXsNKQreraiFG1CDS75JOGLSL
 Tp3prF2raNLXKkOp3NyIKeHmciA00tnBEAspQ+G3eswWLfemTkIaOZiC9RAKRfafP+04
 Qfig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uHX7EapI
Subject: [Buildroot] [PATCH] package/llvm-project/compiler-rt: add libxcrypt
 dependency
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

But compiler-rt package still use crypt.h header and crypt() function
in the sanitizer code.

Use libxcrypt unconditionally since compiler-rt itself already depends
on glibc based toolchain.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6703222513

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/llvm-project/compiler-rt/Config.in      | 1 +
 package/llvm-project/compiler-rt/compiler-rt.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/llvm-project/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
index e8f2ac4201..10f5d796b3 100644
--- a/package/llvm-project/compiler-rt/Config.in
+++ b/package/llvm-project/compiler-rt/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_COMPILER_RT
 	depends on BR2_PACKAGE_LLVM
 	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang
+	select BR2_PACKAGE_LIBXCRYPT
 	help
 	  A collection of runtime libraries primarily used by clang and
 	  llvm to provide builtins, sanitizer runtimes, and profiling
diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 5d9c3d8fa8..d4bc4d305b 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -10,7 +10,7 @@ COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_CPE_ID_VENDOR = llvm
-COMPILER_RT_DEPENDENCIES = host-clang llvm
+COMPILER_RT_DEPENDENCIES = host-clang libxcrypt llvm
 COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 
 COMPILER_RT_INSTALL_STAGING = YES
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
