Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A45EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 014EB40A38;
	Thu, 15 Jun 2023 13:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 014EB40A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hETqtursEZRp; Thu, 15 Jun 2023 13:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E46B0400D8;
	Thu, 15 Jun 2023 13:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E46B0400D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C32721BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CB7B60A47
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB7B60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhyiqmHreuVl for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D22E607C7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D22E607C7
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f8cc04c287so18456415e9.0
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836625; x=1689428625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWVMeiRKx5OIPUf32fq4Q7XiE3Jnb/qn/vozlAUlyy8=;
 b=i8CivYOeH1QkAkCREaDTxep5kA0wZqs8epozAVxiFLQML+5MBy7bvS8C44XYVCSkVW
 bKEb+5vvR2WOSw8s/HVsFZbV1nvnSjRoMX4Aqv0pL19U4jCrTysz8Ev0SVlXiOzq/sEq
 uaBoC58oDLWqbECN/9QI6aCsODNj5LdeHrKYNvYoFeW+xqr8aU0vOc79+CnjaeoyT+0J
 w9AL9Z97sfVuBVQm0e0KHjYGHouegT5LOUQD5qq3fvvCf8ergW7yjlOYT0+7DiDyEwrA
 XFreUu2h9CpmCNZBSLKqKIeUwIoSyvrYC28otw2Zbiemk57jCALqjezj9zPvmsooXtqa
 OAdA==
X-Gm-Message-State: AC+VfDzaxYsr7QoQcgz62EgB1ikODbId3Fa6IzpbgcL5SQ7V6AL9WewW
 xi2DhkUkcXy1HKG88mi3vCUJpOdrMuAdI6Ve6wk=
X-Google-Smtp-Source: ACHHUZ71c9+mSVOCnDmvEU8k/o/8MhgJyFsPhHS9hyoOF9auJzbsQLa1/FILQpnfOFMlj5ZKUyGdyg==
X-Received: by 2002:a05:6000:109:b0:309:43a2:8e9f with SMTP id
 o9-20020a056000010900b0030943a28e9fmr11614174wrx.27.1686836625019; 
 Thu, 15 Jun 2023 06:43:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:44 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:06 +0200
Message-Id: <20230615134315.494330-3-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836625; x=1689428625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWVMeiRKx5OIPUf32fq4Q7XiE3Jnb/qn/vozlAUlyy8=;
 b=2gXOIGfD1W+wEA+aa4kH+pkZeFSm8WaUh085uTCMzOvb74/UWaVPbY77sPcf+qVyhW
 pdiUHqBhHyWuGeu19yxNWu/7KqqqBO6dbBHoaCbYkGFRfn253S8/wIT/h5GYlw2LKGj4
 H7GMw0KZji1mt0wgVyr9lDM4R5BOJ8DwQ/6EjJ/yrfOHHiszF2YGWNz8jMu5sfRgU2IO
 FrHee+xLM5RsrEoXsnIf92QgBPqLkOgUtDBBtyggDHehLSgObjXygxmIdqHNFAppjWlA
 8mUgB6KuupxHmi22+h2Ry3ZvidRNGrtKKBYpfTZKwcaenJreSt4IYe9WurvigpuBl3OA
 AYjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=2gXOIGfD
Subject: [Buildroot] [PATCH v4 02/10] package/llvm: move to llvm-project
 folder
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
 Sebastian Weyer <sebastian.weyer@smile.fr>, Lang Daniel <d.lang@abatec.at>,
 Romain Naour <romain.naour@smile.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make updating easier, move llvm into the llvm-project folder
and use the defined information.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                                  | 6 +++---
 package/Config.in                                           | 2 +-
 .../llvm/0001-nfc-Fix-missing-include.patch                 | 0
 package/{ => llvm-project}/llvm/Config.in                   | 0
 package/{ => llvm-project}/llvm/llvm.hash                   | 0
 package/{ => llvm-project}/llvm/llvm.mk                     | 5 ++---
 6 files changed, 6 insertions(+), 7 deletions(-)
 rename package/{ => llvm-project}/llvm/0001-nfc-Fix-missing-include.patch (100%)
 rename package/{ => llvm-project}/llvm/Config.in (100%)
 rename package/{ => llvm-project}/llvm/llvm.hash (100%)
 rename package/{ => llvm-project}/llvm/llvm.mk (98%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56316201af..c4273c5f85 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1639,7 +1639,7 @@ F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/lld/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/
@@ -2538,7 +2538,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/mesa3d/
@@ -2949,7 +2949,7 @@ N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
diff --git a/package/Config.in b/package/Config.in
index bff090a661..dffffc195b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2128,7 +2128,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
-	source "package/llvm/Config.in"
+	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
similarity index 100%
rename from package/llvm/0001-nfc-Fix-missing-include.patch
rename to package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
diff --git a/package/llvm/Config.in b/package/llvm-project/llvm/Config.in
similarity index 100%
rename from package/llvm/Config.in
rename to package/llvm-project/llvm/Config.in
diff --git a/package/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
similarity index 100%
rename from package/llvm/llvm.hash
rename to package/llvm-project/llvm/llvm.hash
diff --git a/package/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
similarity index 98%
rename from package/llvm/llvm.mk
rename to package/llvm-project/llvm/llvm.mk
index 977c0a08c2..1adad17b16 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 11.1.0
-LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
+LLVM_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_SITE = $(LLVM_PROJECT_SITE)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
