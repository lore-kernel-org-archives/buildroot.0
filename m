Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253ACC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 05:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF36581AAB;
	Mon,  4 Jul 2022 05:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF36581AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALoNwUWtNMdt; Mon,  4 Jul 2022 05:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD60A812D6;
	Mon,  4 Jul 2022 05:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD60A812D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 307C91BF3C0
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1807440166
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1807440166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5pk4x2osN2W7 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 05:57:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 360F6400F6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 360F6400F6
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 05:57:45 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id o25so14842047ejm.3
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 22:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oR4f9TdMrqGvoijNeHg8FsLDMZVMZkIvqfUxau8szrQ=;
 b=R8vJVQTu5fJYw0mPJpeoW7HW1lvCVsxE1N72e3hpilLXN2ciG/LpBjX4kg/DUNqsPJ
 3a8NObEPzM7fgfge8KjXnRVCSpnatwCYuK6y06gNshMyCszYHsoI/wYoeA+q+5I/rHdv
 oGA2gRvJU7EmCeP5yLqnIVTREIkWibnHqPJPsAfyEtW993psT0tS8jpCOvfzbGaKNLXy
 Szq7JvxkxoLm/yY1/x8v7mmS+McX1S4r8mXkVs0bivqSXAnz5m30P1jPudRjXLBFq4my
 8pVKZfRkFzdJVgNOA+hvNsFi1ywUXI7KLAaMWic8c8MfM50/27FlrXMJW+ed0OqKhgZ0
 UJhA==
X-Gm-Message-State: AJIora8NnH57dPmrGSsEJ83YrBxmYkpxeD4klxgUxHlALz04sNC2sbsx
 iOWMzph99caxu3lssbC9kqIOEp9/fZQ=
X-Google-Smtp-Source: AGRyM1vWMp1J0fX7jkGKbgNBLL3aEf0A5uVzsOYXlCikaKzeIJHj3MdkXZGS4v4jaPK22yx0ErHMhg==
X-Received: by 2002:a17:907:a428:b0:726:c9f6:cb72 with SMTP id
 sg40-20020a170907a42800b00726c9f6cb72mr26114602ejc.663.1656914263052; 
 Sun, 03 Jul 2022 22:57:43 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170906780600b006fef557bb7asm13729888ejm.80.2022.07.03.22.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:57:42 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 07:56:54 +0200
Message-Id: <20220704055649.2780-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704055649.2780-1-heiko.thiery@gmail.com>
References: <20220704055649.2780-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oR4f9TdMrqGvoijNeHg8FsLDMZVMZkIvqfUxau8szrQ=;
 b=ecglc68wPgx0NnU2Ou5iPMr/57iMTwX6rk5KvUGCNhiuG9TYuj4PNyK5KCzZb7eIjF
 /mXe0aYwyzlPwCFX22NjmpJUuCAM/hXcLEf4nMzTygsVCbWVLSPlb3WklScDwTSbWuZg
 c1ZfFjRb0QTNAERRt//5+2dQWJ+G+aNaVNGJaHIfwIIybuT08AxaH8wDWjrNlXaJLGkR
 7Pt8Y91g8WMD2DX62rLdMY8AhLWQiF64mwpInwpEU3LeEtZjV9NmZjI/kZvtkFr0JwBd
 xbTB8Fdrt7zNLqWREK/TQoEo/vf+CQSdECq8Zply9hEgX0nMkqQGsHb+WRzAgnDrO9c6
 4lUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ecglc68w
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump version to 2.1.23
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch to fix issue building with buildroot. The patch is already
accepted upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...X-use-DESTDIR-when-executing-scripts.patch | 47 +++++++++++++++++++
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                |  2 +-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch

diff --git a/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch b/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
new file mode 100644
index 0000000000..99febb56ad
--- /dev/null
+++ b/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
@@ -0,0 +1,47 @@
+From 696b6be8a623f4466def2a161baa26094e5592a4 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Wed, 18 May 2022 09:14:35 +0200
+Subject: [PATCH] build BUGFIX use DESTDIR when executing scripts
+
+Fixes #1217
+
+[Upstream accepted 696b6be8a623f4466def2a161baa26094e5592a4]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index efe922d..60e3150 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -351,7 +351,7 @@ if(INSTALL_MODULES)
+         set(ENV{NP2_MODULE_GROUP} \"${MODULES_GROUP}\")
+         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
+         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
+-        execute_process(COMMAND \"${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
++        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
+         if(NOT SETUP_RES EQUAL \"0\")
+             message(FATAL_ERROR \" scripts/setup.sh failed: \${SETUP_RES}\")
+         endif()
+@@ -364,7 +364,7 @@ if(GENERATE_HOSTKEY)
+         message(STATUS \"Generating a new RSA host key \\\"genkey\\\" if not already added...\")
+         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
+         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
+-        execute_process(COMMAND ${SCRIPT_DIR}/merge_hostkey.sh RESULT_VARIABLE MERGE_HOSTKEY_RES)
++        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_hostkey.sh\" RESULT_VARIABLE MERGE_HOSTKEY_RES)
+         if(NOT MERGE_HOSTKEY_RES EQUAL \"0\")
+             message(FATAL_ERROR \" scripts/merge_hostkey.sh failed: \${MERGE_HOSTKEY_RES}\")
+         endif()
+@@ -375,7 +375,7 @@ if(MERGE_LISTEN_CONFIG)
+         message(STATUS \"Merging default server listen configuration if there is none...\")
+         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
+         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
+-        execute_process(COMMAND ${SCRIPT_DIR}/merge_config.sh RESULT_VARIABLE MERGE_CONFIG_RES)
++        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_config.sh\" RESULT_VARIABLE MERGE_CONFIG_RES)
+         if(NOT MERGE_CONFIG_RES EQUAL \"0\")
+             message(FATAL_ERROR \" scripts/merge_config.sh failed: \${MERGE_CONFIG_RES}\")
+         endif()
+-- 
+2.30.2
+
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 0145a9cc78..b352bbb239 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e4b46f2e4889f5a8203f36f9faed6dff82093dd783bb6e3c4f14b73b7e16871  netopeer2-2.1.16.tar.gz
+sha256  89f7572d188e7b04be4b10656d7161d65fb557bac222d8c4596a97eaf833b691  netopeer2-2.1.23.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index fe6e0caf55..d9a20d9969 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.16
+NETOPEER2_VERSION = 2.1.23
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
