Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A975C25B08
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 10:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F75607CE;
	Sun,  7 Aug 2022 10:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F75607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id De4NZvVfoCzS; Sun,  7 Aug 2022 10:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AAE60757;
	Sun,  7 Aug 2022 10:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8AAE60757
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE701BF83B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 10:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A95281ABA
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 10:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A95281ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3vqP90F9_H5 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 10:00:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5735881A9C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5735881A9C
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 10:00:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j1so7900017wrw.1
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 03:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=9VB2kGBSlgcgBt66D8xr9ff7jYiIPIX496q9lGXh1U8=;
 b=08vSkt3OMsH1ZR8+tUq8Clmxzxj1Rz9Rxg1qj8x05VutiTH55wOb/piXWBJXAsVfiM
 uZV/oYfEYfj8pa6ORlgwW7o31JB7+8bMT97HhwnGRMPnh9ZJS+BPYk2xzCU01oTsvpTl
 tSyQoy9WL2J4bEwP+trLPCGMbK1QW70/ooPGGhWkzMXteG5d0Jaqs8aFQjt463vueTvw
 s9gIguevizaWHZzneLLfiYmLiILRBW7XWV34HQN+sHtTnpaR0ZKvWLasIWGjVwcoBS4S
 60Uz1FIdEMkAASbX2C+GR8Bd4yXmvZzytgOPpP0SGMC1uPOj0EUOOCYhdVuXJFFTUxwd
 XQvg==
X-Gm-Message-State: ACgBeo3PaF4RV63v9O+E45hRQr7K4sNKPgtqywKPfNT2Moh2Fb1QzPqW
 4n+eUDsBb1co5lM9s++dwTzWRpV8uxc=
X-Google-Smtp-Source: AA6agR48JSDt9Mc8OaWWQ4gNowE6rGmd4h0xePpWC6vhWbGxKn+9Ma9Dtc4k8VRT09G5mBK/7SVSLA==
X-Received: by 2002:a5d:4407:0:b0:222:cd99:3f0 with SMTP id
 z7-20020a5d4407000000b00222cd9903f0mr408230wrq.44.1659866448315; 
 Sun, 07 Aug 2022 03:00:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c16-20020adffb50000000b002205c907474sm8703972wrs.107.2022.08.07.03.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 03:00:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 12:00:45 +0200
Message-Id: <20220807100045.3188645-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=9VB2kGBSlgcgBt66D8xr9ff7jYiIPIX496q9lGXh1U8=;
 b=T5alj9lJ00y+dgF3z7dGB1ZXvG/x5IVR6Y+vdNlL0QpfjxuJsOhAtP8LxcYZkBt2QK
 MEDsRqqypLuZE+ehg9GE8S1px1Nlocu2h+AH/fzKHqqqy316YqLKKyQIsr7qofFIsDzc
 y9Wgtiw3D+5ndZVknDRowuMkG61lg31MVZ9CW4GGRI6MjUSWZraT7VYeF0/nNErvl+An
 hJio+XKM3yV8y0ecYSLnrEXrFOvVYF4TnPkeNg8eN4lpD6WmFJW2zrEODh50gAcRJLMy
 QAki5pTHXVbFg6jv1u4kw5JgN4cSXWuBVuGhDWV7kMYWWlm5yLv5c+eSfSlShpUZGij2
 +yJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T5alj9lJ
Subject: [Buildroot] [PATCH 1/1] package/mbw: fix build without C++
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without C++ raised since the addition of
the package in commit e27ef7658265a62e74bf9f0e66e5e5432f453f6a:

CMake Error at CMakeLists.txt:3 (project):
  No CMAKE_CXX_COMPILER could be found.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
  to the compiler, or to the compiler name if it is in the PATH.

Fixes:
 - http://autobuild.buildroot.org/results/17e2d6e6d6ddf7845a37a8bbf733faf40d9faa61

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-CMakeLists.txt-fix-build-without-C.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch

diff --git a/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch b/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..2c2585ebe2
--- /dev/null
+++ b/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,38 @@
+From 059f67459912bba6d7f605b7c43519ff547f3a80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 7 Aug 2022 11:34:19 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Fix the following build failure without C++:
+
+CMake Error at CMakeLists.txt:3 (project):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/17e2d6e6d6ddf7845a37a8bbf733faf40d9faa61
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/raas/mbw/pull/14]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d3d4fcd..3b2cb3e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required(VERSION 3.10)
+ 
+-project(mbw VERSION 1.5)
++project(mbw VERSION 1.5 LANGUAGES C)
+ 
+ add_executable(mbw mbw.c)
+ install(TARGETS mbw DESTINATION bin)
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
