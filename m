Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D3C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 04:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A279C60DC2;
	Mon, 30 Jan 2023 04:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A279C60DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Us9-XLPVFbuO; Mon, 30 Jan 2023 04:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0BD660D88;
	Mon, 30 Jan 2023 04:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0BD660D88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26DA11BF333
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 04:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F42084161B
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 04:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F42084161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36wEupUPkipd for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 04:29:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D91409A8
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8D91409A8
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 04:29:18 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id k13so1456223iob.9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 20:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3FLcCx47tVEF6MdS9bt2ZcrWNybAJKjtw9ZA+Xfo0U=;
 b=kbcmOQCEsA8rT32/3ap409QFkrofLUtVZ3kv+pH+tm+eAhJapah/zrNjpt3nXoKkbt
 V1y6kqY8XTFCMpyjS1tWZt6wnH/fpvXpERJEzhfxY/Q1ta+xy0dGJmwpCqP/hodL/BWL
 IISxUOflGakpggbd/OF9qFZIo0d/5LIcY3+x0pgSJxtbYbbA3g8wF8O6mu5iDSMBulU/
 ua3l8MVV10EvJl9ZuxRRJVWAJp4NKeqnou7SpCe1hpD7y6LAnx/cAGA74UqhsXcej650
 it4/cjPMcbhhIYzhwiauOp3WR9jk9wVcI1qZTiMp/yubT7DKhV80kG5pe0LQAyTB88eN
 Ztkg==
X-Gm-Message-State: AO0yUKXcoWMq0GIBi+Gm23TBTncesoOqnJA8d0rWEEJ1BKshQ+DSRzuJ
 rZpoItv8AulryDoq7KqmKS6+eP2Nzit02g==
X-Google-Smtp-Source: AK7set+Pl/qNCDC8BmCIbgs0Z2a8gzlKaf+72M+pwopMW35lRM0loTiUB8VnBzb/IZWR+TpoKPnvow==
X-Received: by 2002:a6b:c849:0:b0:707:a501:e788 with SMTP id
 y70-20020a6bc849000000b00707a501e788mr4724544iof.7.1675052957535; 
 Sun, 29 Jan 2023 20:29:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 d3-20020a028583000000b003a7c47efde0sm4338153jai.11.2023.01.29.20.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:29:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 21:29:13 -0700
Message-Id: <20230130042913.3605338-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E3FLcCx47tVEF6MdS9bt2ZcrWNybAJKjtw9ZA+Xfo0U=;
 b=N+/dRb+VProz5cS10vRcsEMZKtpXnKsa26UKprAvjdEdRjIbeGT7zHYLxeHgOiizzI
 HC0XoU5RiLV+dQJ//+EEZON9q3g73rmmyGeVddOLVwNcZCI1KKezANeJGf3HVGocO6gB
 bKDQmnOjcu4o7+q4xCfNtgrMLiWej9uy6ffMzUTdMyuLgR6SociurN+0oyQ+gHEhJQeH
 pl0y7FBARCsxwS19P7gPCj0s2WG38rBgD5VWFvZwjUe3Dij2KqIKpo68AeUKGflDJ2k7
 MICRuJkEIHUDvc+k5u3EuxChvlWwyWE6VYR85yqWxLdmCnhTY4o7ckR5j/dWZeCR9T7k
 LVPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N+/dRb+V
Subject: [Buildroot] [PATCH 1/1] package/fxdiv: fix build without C++
 toolchain
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cmake project for fxdiv sets the project language to C and CXX
even when only C is required.

Add a patch which disables CXX unless required.

Fixes:
 - http://autobuild.buildroot.net/results/b0f/b0f3b6352429a5156a8c3a2b932331753887b65b
 - http://autobuild.buildroot.net/results/52f/52f634c06bdfe983280a2c01bb9fec4b0e1a4b34
 - http://autobuild.buildroot.net/results/181/181b85d9dd505693ed23fab823085b001aa785f4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...le-CXX-unless-building-tests-benchma.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch

diff --git a/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch b/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
new file mode 100644
index 0000000000..0336f5e1cc
--- /dev/null
+++ b/package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
@@ -0,0 +1,49 @@
+From 8c2d8fc60306a8edd21182a1f5f267a7aca55763 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 29 Jan 2023 21:18:28 -0700
+Subject: [PATCH] CMake: don't enable CXX unless building tests/benchmarks
+
+We only need CXX support when building tests/benchmarks.
+
+Fixes:
+CMake Error at CMakeLists.txt:4 (PROJECT):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/Maratyszcza/FXdiv/pull/3]
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bcae6b5..c75f558 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ CMAKE_MINIMUM_REQUIRED(VERSION 3.5 FATAL_ERROR)
+ 
+ # ---[ Project
+-PROJECT(FXdiv C CXX)
++PROJECT(FXdiv C)
+ 
+ # ---[ Options.
+ OPTION(FXDIV_USE_INLINE_ASSEMBLY "Allow use of inline assembly in FXdiv" OFF)
+@@ -16,6 +16,10 @@ ENDIF()
+ # ---[ CMake options
+ INCLUDE(GNUInstallDirs)
+ 
++IF(FXDIV_BUILD_TESTS OR FXDIV_BUILD_BENCHMARKS)
++  ENABLE_LANGUAGE(CXX)
++ENDIF()
++
+ IF(FXDIV_BUILD_TESTS)
+   ENABLE_TESTING()
+ ENDIF()
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
