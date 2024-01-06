Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228B8C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3BC483EED;
	Sat,  6 Jan 2024 09:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3BC483EED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5HdDm-SyZYJ; Sat,  6 Jan 2024 09:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE2E83EB1;
	Sat,  6 Jan 2024 09:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE2E83EB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7651BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 639C8405CE
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 639C8405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6KFv_ZTyLVd for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:35:25 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAD8B405CA
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD8B405CA
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso292161f8f.1
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 01:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704533722; x=1705138522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lSN2wgmzWOltWsbKWLI/P4lVp/dRvK5pUyGMd0WYJXg=;
 b=HrWcO9B/8c4BrR4qtaVWNNsp+XS9duhvJ6ZrenpGJToJWUkx48I05y1cqLaQcdy7kr
 QrBdmcByBr34bRrCj7EiMbOnUfOj+Rn38NXdWbnL9NYqyhEAK7bC+IAYlOm71xCPx7gE
 xsNKhbBgiwHWUeRLtdrTX1gZk40bVlnpFB3bd+qWQJ9ld4+8T6B7FGRBGx66p0LUrJ9q
 7OZXno7bQFPGpasBcnk0s+ySljnGhwqmWeXXrdwn0tvJ20MA1BLoL6rO0ndnOB08cslh
 ZXSgZAx1kXM4ttleXiYY+ePghWnosCkogFqefjznBMyz/LdKRGvdISoegF+12UlfChvl
 IbYw==
X-Gm-Message-State: AOJu0YwCZJqPG3oNcLnwgK3jPGDNmHE1VsMWjQ3+8iPRZkxVFfOlHSry
 rybduiV2EnhQ+qXza11fUsDXHrsQMV0=
X-Google-Smtp-Source: AGHT+IE8IPHA4rgQZX65lqIpbJtfjtkT6JydI9u+Ci0K2/P6O/MQ4/gHrZKEyjAVXRWWP6xL8yq7SQ==
X-Received: by 2002:adf:a4ce:0:b0:336:9689:bc70 with SMTP id
 h14-20020adfa4ce000000b003369689bc70mr363781wrb.44.1704533722007; 
 Sat, 06 Jan 2024 01:35:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k3-20020a5d5243000000b0033668b27f8fsm3011046wrc.4.2024.01.06.01.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 01:35:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 10:35:17 +0100
Message-ID: <20240106093517.436661-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704533722; x=1705138522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lSN2wgmzWOltWsbKWLI/P4lVp/dRvK5pUyGMd0WYJXg=;
 b=k6izHC4VMogRBsT1vwIpzLAnkIQuG+bLWoNIrhAH+njR/Yjees1pPwJT746c7EjTBG
 Gi3AnCVc7jjOH5/INMiTm/d5DFA0SC2X7m576xi88oA0cbeYKLaHllN3CTNSbVBeF7sc
 3BPBHss7RsO1/SB7YLfyCXRikxrZR6ZZkCgvxMmE/RZVYssu2Jn2L6x8P/HGjzKA5q1m
 3jgV7IdtvIDMcT+PUZrBSOFoAkrykZ7a2WB5SqBrHDY1O6VLUJv19q29Pbe/dvx7f86z
 8dnztGmi1ST5WuJukMzbPSGiVnnSLpMxjnk9kPZ4T5knRRSCzHz11O2jTXAPVUSHzNgh
 jWYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k6izHC4V
Subject: [Buildroot] [PATCH 1/1] package/optee-client: fix build with kernel
 < 4.16
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with kernel < 4.16 raised since bump to
version 4.0.0 in commit 8a8fa2006846cd3480741f03372e17fedb811898 and
https://github.com/OP-TEE/optee_client/commit/3ac968ee7c927271e83ea3a4247839649202ab5e:

/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c: In function 'register_local_shm':
/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c:356:44: error: storage size of 'data' isn't known
  356 |         struct tee_ioctl_shm_register_data data;
      |                                            ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/d63eb7c8574366377760f5ab2eaec02f46173975

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...upplicant-fix-build-with-kernel-4.16.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch

diff --git a/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch b/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch
new file mode 100644
index 0000000000..fa51bd5d5e
--- /dev/null
+++ b/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch
@@ -0,0 +1,56 @@
+From acc5aec37f5f246ebf185d2129e7630eb80bb388 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Jan 2024 09:47:43 +0100
+Subject: [PATCH] tee-supplicant: fix build with kernel < 4.16
+
+Commit 3ac968ee7c927271e83ea3a4247839649202ab5e moved linux/tee.h from
+libteec/include to libteec/src resulting in the following build failure
+with any kernel < 4.16 (i.e before
+https://github.com/torvalds/linux/commit/033ddf12bcf5326b93bd604f50a7474a434a35f9):
+
+/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c: In function 'register_local_shm':
+/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c:356:44: error: storage size of 'data' isn't known
+  356 |         struct tee_ioctl_shm_register_data data;
+      |                                            ^~~~
+
+To fix this build failure, update CMakeLists.txt and Makefile of
+tee-supplicant to add libteec/src to the include directories.
+
+Fixes: 3ac968ee7c92 ("Makefile, cmake: move teec related headers")
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OP-TEE/optee_client/pull/369
+---
+ tee-supplicant/CMakeLists.txt | 5 ++++-
+ tee-supplicant/Makefile       | 2 +-
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.txt
+index 31c6dac5..b44e9e95 100644
+--- a/tee-supplicant/CMakeLists.txt
++++ b/tee-supplicant/CMakeLists.txt
+@@ -93,7 +93,10 @@ endif()
+ ################################################################################
+ # Public and private header and library dependencies
+ ################################################################################
+-target_include_directories(${PROJECT_NAME} PRIVATE src)
++target_include_directories(${PROJECT_NAME}
++	PRIVATE src
++	PRIVATE ../libteec/src
++)
+ 
+ target_link_libraries(${PROJECT_NAME}
+ 	PRIVATE teec
+diff --git a/tee-supplicant/Makefile b/tee-supplicant/Makefile
+index 06c4b2e5..c3b32252 100644
+--- a/tee-supplicant/Makefile
++++ b/tee-supplicant/Makefile
+@@ -40,7 +40,7 @@ TEES_OBJ_DIR	:= $(OUT_DIR)
+ TEES_OBJS 	:= $(patsubst %.c,$(TEES_OBJ_DIR)/%.o, $(TEES_SRCS))
+ TEES_INCLUDES 	:= ${CURDIR}/../libteec/include \
+ 		   ${CURDIR}/src \
+-		   ${CURDIR}/../libteec/include \
++		   ${CURDIR}/../libteec/src \
+ 
+ TEES_CFLAGS	:= $(addprefix -I, $(TEES_INCLUDES)) $(CFLAGS) \
+ 		   -DDEBUGLEVEL_$(CFG_TEE_SUPP_LOG_LEVEL) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
