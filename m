Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 18:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E679F60E42;
	Sun, 10 Jul 2022 18:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E679F60E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BO_QsVN7JWCx; Sun, 10 Jul 2022 18:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E298B60E6B;
	Sun, 10 Jul 2022 18:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E298B60E6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7AF31BF339
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 18:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0F10416F4
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 18:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F10416F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1d9hV6fjUzUk for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 18:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 231C6416F3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 231C6416F3
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 18:08:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so3843158wme.0
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 11:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Da6zyLO+yw0zw6+PVcf/fSOyVg9+K8i7JjiUpBlUGmk=;
 b=LL3Q4+21njSlpMMfPaovoE1dwGbXC0hze+kuvT9Mtt7C1WGNnhVK561TpNRrtxw7VW
 nGTolgMW4D2O/3jqaCXe+30YSy68VbhFVOyN8nBfCAXBc29iWKyYTqhqh82tdj0jwgtl
 fPtC7Nbm7vx6tF2uTtyd1CH4sm+xlstOrYmdNcwEd8JOwIKYzhTbtQ7yM9RZS1209ian
 ZrZYzTeQ8EsNp6XQutVQaXsHTqQlSbZxq/CP11OXEsp45KAKfPuzPCJTfY8UbvmymOAq
 oTqjP4FLSodg1BU5ZcQfx8w96E74f/AK19Og9/7KoumxDWfQgN7VZW1rBZrmtTSxQJ82
 L2Sw==
X-Gm-Message-State: AJIora83RMiUfYNP6iGqg23JCyzoL6qkKsG1SiBY4zUAVxWiTzfH4EyX
 KOhzfCieOKhRvC8EaECZbLE1LZMoWrA=
X-Google-Smtp-Source: AGRyM1v7AfwO5ZygACijOaDcZoHlYVzWgsBT5/nd4G2VCUbp7rlP8kNZds8Ef/fyqCBpPNuu+k5OpA==
X-Received: by 2002:a1c:4383:0:b0:3a2:cf70:c342 with SMTP id
 q125-20020a1c4383000000b003a2cf70c342mr11778211wma.32.1657476499052; 
 Sun, 10 Jul 2022 11:08:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b003a2e2ba94ecsm3645344wmq.40.2022.07.10.11.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:08:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 20:05:22 +0200
Message-Id: <20220710180522.472809-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Da6zyLO+yw0zw6+PVcf/fSOyVg9+K8i7JjiUpBlUGmk=;
 b=YrpEQ6DSSfCfQC/EejtnEi8UaCpy0MZyyactwpYUFv5dWchlWZ/4QUSOWkTI3OQ13S
 dZ281iJT/YQGftQTokR1n7xPe0wBpMeXrWVTGjyeU8eBl3TISUlzGjRaLQiw3uTm1ZYp
 KMcXtTF2PklgyW6HOMorVEHkMapxnnKrIcY1dxZkKQphMZ/TTAZ2Xq2LNu3f1OwYrXiU
 n79uO+1+YAvRj4crP4Cce4hhsOU0kTZu78czcM6R2VKRV24IyXx572YJqnRQL3Z3T5ZF
 6EbIYdD70Pk78y1qoWwgA/3VOm4a5oQWrxgfZtyBFURO9Qwm94kJKykJHJHKjGupFG+v
 w3gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YrpEQ6DS
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-CMakeLists.txt-fix-build-without-C.patch | 41 -------------------
 package/minizip/minizip.hash                  |  2 +-
 package/minizip/minizip.mk                    |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch

diff --git a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index b0cb6a6c1e..0000000000
--- a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4e7899f3d0533f83b7230ffa787087b65ddd45c0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 5 Apr 2022 18:20:14 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Fix the following build failure without a working C++ compiler raised
-since version 2.0.0 and
-https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:
-
-CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
-  The C++ compiler
-
-    "/usr/bin/c++"
-
-  is not able to compile a simple test program.
-
-Fixes:
- - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zlib-ng/minizip-ng/pull/621]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fef46c3..83adaf3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -661,7 +661,7 @@ endif()
- list(APPEND MINIZIP_INC ${CMAKE_CURRENT_SOURCE_DIR})
- 
- # Create minizip library
--project(minizip${MZ_PROJECT_SUFFIX} VERSION ${VERSION})
-+project(minizip${MZ_PROJECT_SUFFIX} LANGUAGES C VERSION ${VERSION})
- 
- if(NOT ${MZ_PROJECT_SUFFIX} STREQUAL "")
-     message(STATUS "Project configured as ${PROJECT_NAME}")
--- 
-2.35.1
-
diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index e73637670c..0c6e218488 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a248c378fdf4ef6c517024bb65577603d5146cffaebe81900bec9c0a5035d4d  minizip-3.0.5.tar.gz
+sha256  383fa1bdc28c482828a8a8db53f758dbd44291b641182724fda5df5b59cce543  minizip-3.0.6.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index b9259f0c54..61936e0568 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.5
+MINIZIP_VERSION = 3.0.6
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
