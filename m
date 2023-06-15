Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5766EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45BA24052E;
	Thu, 15 Jun 2023 13:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45BA24052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0SrnWlSP8yC; Thu, 15 Jun 2023 13:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 601A84193A;
	Thu, 15 Jun 2023 13:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601A84193A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 492EF1BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22BB340B8A
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22BB340B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLWLq8dIvcOV for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5350940A15
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5350940A15
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-311099fac92so1861618f8f.0
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836634; x=1689428634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tp493dPEWHQey7+yyST8QzcYt4tJXhedezIikoRejmA=;
 b=TqwOQcRip0tkOUkBcK0efmPXbMpbhG3EQrk9A7BYecebzkh8pwzuYXnHdTxLD4ZWrD
 FY2oLfl4NAxpCA4PXX420Q5K1ZZVBqXq5b8H579rHdJwuDcY6grAaayNCi12K/OknDIK
 3JkN+ti0vqnhNyeHqNB+ta0KdFu0J6TU8UFjaSEGlcKb7WbAZROaQORbeDF4kY7Nn1qR
 792lNaS8emjkD+VY4gecWswVkfUumkpXqA3FVwI3d6ue2nP70qqykpQ8aXxaCXNqslQn
 u1yhqcC19jaee2cgKIe7tUARDrYTOtlQyfTh0FFuxGnjmzMbeLQOd/Qo6RXLRdCub0ay
 kpEA==
X-Gm-Message-State: AC+VfDyxTJ17FhcnLONvGubr1/5s61gZIWZejOrV+G3mu4chI7/JF8k4
 Y/EhSlPWm9KKjVxEeXYxuqoXmZ/ITyxrROegnSA=
X-Google-Smtp-Source: ACHHUZ4AuEaVpJF2P8zbhgaFH1ZGzERvhlB0sTFwzc3g2YEWCXbWbUmcM7dHTFX1nlaMriz25quFDA==
X-Received: by 2002:adf:f150:0:b0:30f:cc45:5af1 with SMTP id
 y16-20020adff150000000b0030fcc455af1mr6020130wro.45.1686836634058; 
 Thu, 15 Jun 2023 06:43:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:53 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:12 +0200
Message-Id: <20230615134315.494330-9-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836634; x=1689428634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tp493dPEWHQey7+yyST8QzcYt4tJXhedezIikoRejmA=;
 b=VFL+lLn3a2IPl2MlYDmq+QjTmgNegMK82b7g1Kg3Us80SuKmxe3pgT078vjWSAHwvs
 wafqYV+i5m9yPc0ERdMU8wv195UzNytw2kzo1n9Wt994kU+juqgKsZ90KoMDtK0oqyOg
 oISPT8IAIcqO0u8TkL1d3IoqU3Y/UenxRb9VFtthUKBKk+rEFZILHLKSG7fWXz2TUvym
 BRZJJUpR6sijbVECywhRMrC+douDPt1qXkTtslAscX99laK+gS3sbx+b2ETyELskws+l
 i8vBIb13hMIgTFJe0auGY1hjqBGVTk2e46DiqDTHtIqEOGD3NGSeC+HJAeYlb3+NgKGd
 J/RA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=VFL+lLn3
Subject: [Buildroot] [PATCH v4 08/10] package/llvm-project/llvm-libunwind:
 new package
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

Starting with version 15, lld needs the llvm implementation
of libunwind, therefore it is added as a host package.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v3: force llvm-libunwind version to 15.0.3 since LLVM_PROJECT_VERSION
    is still at 11.1.0
---
 .../llvm-libunwind/llvm-libunwind.hash         |  3 +++
 .../llvm-libunwind/llvm-libunwind.mk           | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.hash
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk

diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
new file mode 100644
index 0000000000..86775f5dba
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114  libunwind-15.0.3.src.tar.xz
+sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
new file mode 100644
index 0000000000..825e1beac0
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# llvm-libunwind
+#
+################################################################################
+
+LLVM_LIBUNWIND_VERSION = 15.0.3
+LLVM_LIBUNWIND_SITE = $(LLVM_PROJECT_SITE)
+LLVM_LIBUNWIND_SOURCE = libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz
+LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
+LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
+LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+HOST_LLVM_LIBUNWIND_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBUNWIND_INSTALL_HEADERS=ON
+
+$(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
