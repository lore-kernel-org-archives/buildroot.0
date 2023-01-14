Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD6CC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C8681991;
	Sat, 14 Jan 2023 10:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34C8681991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwUhXKvOE1Yp; Sat, 14 Jan 2023 10:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7383681985;
	Sat, 14 Jan 2023 10:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7383681985
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 261B01BF419
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01E9881985
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E9881985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4D8NIOnFump for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 10:49:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F59817F5
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08F59817F5
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 10:49:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mp20so11127242ejc.7
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 02:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iujs3JeFQyY2GgmySZW1EPFFoyCNptL8T9j2Nd5DkWg=;
 b=pXBRBWVM0I9BEzPAJr3kFuTUQjL+MDEF+gbAhfwCs/O/pURBjQPt96PXveg8NvIU/P
 EFH7es0bT6Lg/06EEZf85X5d2Par8eeeqf6LVkpGYsoJXIHaenvv+m++OsIf9z24oe7r
 dTsv8Ytv1vTue1wQcecol3i566ri/OCikFeJshgp/cHpfhZKWWEQWLa2/y/ReKUCEYm7
 qtxYPMMXwmU7p8LhzsmvEKA/81gpSJftEThwAyDn05KLzWNkeO08xU/UeOFwWGtw5Qxt
 ycyc4SWtLhWggTIZ6L5do6vIwTtmf+VUChPlieOWBViCWsWqVdb/j62iA34pqVXFyVuJ
 7wxA==
X-Gm-Message-State: AFqh2krW4/2VHrXZ8KkvQia0YquiZ/hdMV7KvCWrH7yXgOYGPv3w4gq/
 leyt/KCgw2zZFxyzOM5UrBLniiuciYc=
X-Google-Smtp-Source: AMrXdXtTbtZMICVMseKyCpD88QrXuRpJ7aJkeoVSldBrehuKSa0SQbDgw1khMXHUTGlgQqyvpqcVdQ==
X-Received: by 2002:a17:906:7714:b0:829:6064:bc52 with SMTP id
 q20-20020a170906771400b008296064bc52mr63164624ejm.74.1673693346496; 
 Sat, 14 Jan 2023 02:49:06 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm8138825ejc.195.2023.01.14.02.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 02:49:05 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 11:48:36 +0100
Message-Id: <20230114104832.12702-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230114104832.12702-1-heiko.thiery@gmail.com>
References: <20230114104832.12702-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iujs3JeFQyY2GgmySZW1EPFFoyCNptL8T9j2Nd5DkWg=;
 b=iToaJ01LFp5Bj6S4rhIvetLjkx1uPBlHYoRdmhp0YlphPR0Tq8qeeLPYFXZsbSUOJk
 1O/JgIKuPAv2Pc3UkoYWmzFdsvCsXQvfxWZjwgKNcF5qHZwXL7p3a/sT0GdcNz4Qqf7v
 flSD00tjh2/tPFGAAhuz/qg9Lk85CoQfvL8oTyP9TPMsFd82CI/9BhNzvRUC9Y8sgOUE
 OZkIQizrNBMVEj1rBt0uwW0EALyBoqtCzzgXRAtI4kgCn9hfA1pkzPDlspmwVuOHSKPG
 OQB+93ZevfN+thdpaVAP9rA54GodvU8Qu9zJ4sI2DaA0jecCWVh0RbYIcbXp2COfhlQF
 DtCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iToaJ01L
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump version to 2.1.42
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is in upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...X-use-DESTDIR-when-executing-scripts.patch | 47 -------------------
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch

diff --git a/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch b/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
deleted file mode 100644
index 99febb56ad..0000000000
--- a/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 696b6be8a623f4466def2a161baa26094e5592a4 Mon Sep 17 00:00:00 2001
-From: Michal Vasko <mvasko@cesnet.cz>
-Date: Wed, 18 May 2022 09:14:35 +0200
-Subject: [PATCH] build BUGFIX use DESTDIR when executing scripts
-
-Fixes #1217
-
-[Upstream accepted 696b6be8a623f4466def2a161baa26094e5592a4]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index efe922d..60e3150 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -351,7 +351,7 @@ if(INSTALL_MODULES)
-         set(ENV{NP2_MODULE_GROUP} \"${MODULES_GROUP}\")
-         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
-         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
--        execute_process(COMMAND \"${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
-+        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
-         if(NOT SETUP_RES EQUAL \"0\")
-             message(FATAL_ERROR \" scripts/setup.sh failed: \${SETUP_RES}\")
-         endif()
-@@ -364,7 +364,7 @@ if(GENERATE_HOSTKEY)
-         message(STATUS \"Generating a new RSA host key \\\"genkey\\\" if not already added...\")
-         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
-         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
--        execute_process(COMMAND ${SCRIPT_DIR}/merge_hostkey.sh RESULT_VARIABLE MERGE_HOSTKEY_RES)
-+        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_hostkey.sh\" RESULT_VARIABLE MERGE_HOSTKEY_RES)
-         if(NOT MERGE_HOSTKEY_RES EQUAL \"0\")
-             message(FATAL_ERROR \" scripts/merge_hostkey.sh failed: \${MERGE_HOSTKEY_RES}\")
-         endif()
-@@ -375,7 +375,7 @@ if(MERGE_LISTEN_CONFIG)
-         message(STATUS \"Merging default server listen configuration if there is none...\")
-         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
-         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
--        execute_process(COMMAND ${SCRIPT_DIR}/merge_config.sh RESULT_VARIABLE MERGE_CONFIG_RES)
-+        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_config.sh\" RESULT_VARIABLE MERGE_CONFIG_RES)
-         if(NOT MERGE_CONFIG_RES EQUAL \"0\")
-             message(FATAL_ERROR \" scripts/merge_config.sh failed: \${MERGE_CONFIG_RES}\")
-         endif()
--- 
-2.30.2
-
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index b352bbb239..cc71a2dab8 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  89f7572d188e7b04be4b10656d7161d65fb557bac222d8c4596a97eaf833b691  netopeer2-2.1.23.tar.gz
+sha256  b166fe3425bb55b5f330fb7f53158f613bffc07493925ac437193e4d2defb3e7  netopeer2-2.1.42.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index d9a20d9969..7cb9202575 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.23
+NETOPEER2_VERSION = 2.1.42
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
