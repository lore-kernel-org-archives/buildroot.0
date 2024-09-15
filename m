Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A118FC35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3478B404E0;
	Sun, 15 Sep 2024 10:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUJ9O3YC_X2M; Sun, 15 Sep 2024 10:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3EE0401D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3EE0401D2;
	Sun, 15 Sep 2024 10:36:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 712431BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F65A401D2
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kow2mk3--AiF for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 10:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A1D9400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A1D9400EF
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A1D9400EF
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:36:48 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so290167066b.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 03:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726396607; x=1727001407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sd1A8S/ID6yw/8mvVXuULtEbtsqJ7rn4XTxfXhwt7b0=;
 b=Y4gD/W0Es6EZRqaz7Fr0D18E07rC0liQBSyVWwMpQANkTXyXiXVmkWyCcVyRUNhkzw
 /bIDQ4lTUs3IHlvZinNI4/nnbw6BF3Jw01O/90Fra4NwuuEUeoBCS5xsjpmEt2B/XYbe
 Z9jWAhsj7w5kM9uswZEKD+iLqHTlIxGbOnMPcRsIJTFyPk4KOLPWPdXtIqdTMnMfFeU2
 LTUG7tdMWiFLPoKUB9M7duQ9ekMqZ2IwPfedMyBI8Ug04R6XU+bScSwuIWibYgD4x8wQ
 69+ZbJtPBVlEPEGoIHkkVxWh/oxALqwzp0rDzMn5h/wGsajCbAZ98b3/uIP80Aj24rSK
 xY7w==
X-Gm-Message-State: AOJu0Ywh4XTACzDRNzrhxFxnVx83azR0eWWkYzD2mi/ngyGams+neiXT
 Gt1mRWR428b9fqT1WHMw9f8FJCu74EqkdoPkJQugqKefSfLOR+1A8NCzumX5zRD3+9q3qFn7o+v
 gcQ09Pg==
X-Google-Smtp-Source: AGHT+IFx7U6ZQfp9LAiGWgYB7tWlT7wdFQleoR4uNGMHQNxyboXtxjxDLZ1A0d1aa29weGHxNyFROQ==
X-Received: by 2002:a17:907:72d3:b0:a86:92a5:247a with SMTP id
 a640c23a62f3a-a9047ca0756mr845525866b.17.1726396606704; 
 Sun, 15 Sep 2024 03:36:46 -0700 (PDT)
Received: from localhost.localdomain (roof.metalab.wien.funkfeuer.at.
 [78.41.112.119]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610966ccsm181787066b.45.2024.09.15.03.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 03:36:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 12:36:29 +0200
Message-ID: <20240915103629.884407-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726396607; x=1727001407; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sd1A8S/ID6yw/8mvVXuULtEbtsqJ7rn4XTxfXhwt7b0=;
 b=EVdu1VAvTAX0uL6egJ9l/aRILaoQ153vt2X2LnojSM4mSmOVaWABQqMCdC/p1OcEXu
 ZOORkzku9hMZ20QbUJPDj7zJDzCph1o0W2uXVFUcVQ9QmybbI0M3eoPSKSDXRZZ3hEpo
 sn8S7OhOXf0tf+qJScer/eX7O97yXdY4spuNEWw335Iez1ahb4px9OztBubhtc7p7Uk7
 Jg9n4Taorwz3TFJAkunUwuPTl2u8TfeEmOynYqoMpcA9iG5nx+N03Sr8ztz5fnPYR4EZ
 FamsLZvbUo6pHzSjgspuCBBsoK8rd4TeHl5+T5X0If0oIHfRXiJGugLusB1pqd+G3p/h
 4wPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EVdu1VAv
Subject: [Buildroot] [PATCH 1/1 v2] package/libssh: fix build failure
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When compiling libssh without a C++ cross-compiler the build will fail.

This patch remove the CMake C++ dependency to build libssh. That dependency
is only used for the code coverage tool and is not required to build the
library.

Fixes:
  - http://autobuild.buildroot.org/results/927/92794da6346b856ad74f14f87cc51415871cb5d2/
  - http://autobuild.buildroot.org/results/89d/89dcd4982e4061732de635f9e7669db1f257330c/
  - http://autobuild.buildroot.org/results/b3f/b3feff5c21defb53c65a3d5d06b13230cfed3317/
  - http://autobuild.buildroot.org/results/bc8/bc8338d2c61eaa7c98c99140de5c491b7528c4f3/
  - ...

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...enable-CXX-when-running-the-coverage.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch

diff --git a/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
new file mode 100644
index 0000000000..e70c0fa44e
--- /dev/null
+++ b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
@@ -0,0 +1,56 @@
+From 328ae3d2306c9f65b5e85a2be98a368c07287a05 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Sat, 14 Sep 2024 21:07:30 +0200
+Subject: [PATCH] cmake: Only enable CXX when running the coverage
+
+Commit 25a678190c42b24076fdd805a8d7a722a8a9c798 introduced code coverage
+collection. That also introduced a dependency to CXX language.
+
+When cross-compiling libssh in an environment that doesn't have a C++ compiler
+the following error is raised: "No CMAKE_CXX_COMPILER could be found.".
+
+Since the C++ part is only needed for the coverage part, this commit only enable
+that language dependency when actually needing it.
+
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ CMakeLists.txt                    | 3 ++-
+ cmake/Modules/AddCMockaTest.cmake | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 13330ea3..5595a47a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -9,7 +9,7 @@ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
+ include(DefineCMakeDefaults)
+ include(DefineCompilerFlags)
+ 
+-project(libssh VERSION 0.11.1 LANGUAGES C CXX)
++project(libssh VERSION 0.11.1 LANGUAGES C)
+ 
+ # global needed variable
+ set(APPLICATION_NAME ${PROJECT_NAME})
+@@ -190,6 +190,7 @@ endif (WITH_SYMBOL_VERSIONING AND ABIMAP_FOUND)
+ 
+ # Coverage
+ if (WITH_COVERAGE)
++    ENABLE_LANGUAGE(CXX)
+     include(CodeCoverage)
+     setup_target_for_coverage_lcov(
+         NAME "coverage"
+diff --git a/cmake/Modules/AddCMockaTest.cmake b/cmake/Modules/AddCMockaTest.cmake
+index 79178183..f49961ba 100644
+--- a/cmake/Modules/AddCMockaTest.cmake
++++ b/cmake/Modules/AddCMockaTest.cmake
+@@ -117,6 +117,7 @@ function(ADD_CMOCKA_TEST _TARGET_NAME)
+         ${TARGET_SYSTEM_EMULATOR} ${_TARGET_NAME}
+     )
+     if (WITH_COVERAGE)
++        ENABLE_LANGUAGE(CXX)
+         include(CodeCoverage)
+         append_coverage_compiler_flags_to_target(${_TARGET_NAME})
+     endif (WITH_COVERAGE)
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
