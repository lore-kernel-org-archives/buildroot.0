Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB9CC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF151405A3;
	Sun, 15 Sep 2024 09:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs5LgAfwozdS; Sun, 15 Sep 2024 09:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64469405C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64469405C4;
	Sun, 15 Sep 2024 09:31:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 774B11BF357
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FA8C405C4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isgBnDVF8NO8 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9E68405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E68405A3
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9E68405A3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:31:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so318385766b.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726392676; x=1726997476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RIWWX7YxN3N4rVy4DdDGt0zkJxltk7z2TA+kMtSxOMg=;
 b=balpaFmktTdtXt1RqADV0Be8MV/ifxWk6B9+tIXeLMiPwhJ6ywcEwi1WPHEk+VaE68
 b54YQVaAVzVsKoDrc6Wv2u/mPmzE9TsNmnesAR9FDqzNnEu10lK+a2MXyXxgYsjwAqEf
 AqvzLOq5w7+ukn4wDepYngsLtCtlpiyamwakGWnru/lGnYeDTDyenhdghU08X3CBzLe1
 TX+4EepakKQWfB0Zx+ZGxP3e2dnid0AEAm8jMbEZ2EXmaZDTueanbWt+rJehp4jPQdBB
 EWdyjaMbZ43LMTd9l/IH68CxhSHZB5puDKFJckOvdTlRtAKlhuf3jxOd1drN7+crAhqi
 I0TA==
X-Gm-Message-State: AOJu0Yxg7gdZX2jXW/1Lgq+TYF7vi2oDLUaGMuO/dRJPV2C9zs9JDwkt
 m1BtJV6f4rc+FZm6+/PuEPCBoKxjEa30mAk57OSmgjRNtT2m2pm9sDi7Fmd0uUt0gBjCS5KgtQi
 FZ01OzA==
X-Google-Smtp-Source: AGHT+IHbWVE/60kfz/XgSgWimi3zoOkSQIGjSUeak3ueP+PTo8IA4vZR5F6PeUEMCXPgjOah+uxOdg==
X-Received: by 2002:a17:907:7fa3:b0:a87:31c:c6c4 with SMTP id
 a640c23a62f3a-a9047ca725amr779791866b.24.1726392676244; 
 Sun, 15 Sep 2024 02:31:16 -0700 (PDT)
Received: from localhost.localdomain ([109.139.117.37])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061330c2asm173670366b.204.2024.09.15.02.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 02:31:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:30:48 +0200
Message-ID: <20240915093048.810466-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726392676; x=1726997476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RIWWX7YxN3N4rVy4DdDGt0zkJxltk7z2TA+kMtSxOMg=;
 b=Mdl764sFhUWrU3SYHKIFIe3mENSV3K37T9VTgC2JwHsZXE/pgeSPx7NaedGdTMDQ+Q
 HD1Lxr4EnTCmP+qB/SausMqvPD9uMxuYY1jWw+pWVUAMTqYgPa132vhNrTIjtqp+jBe0
 r0bk9K3tD2CaKw6ZldG0Wf8KA2GYPjJR0PZF9+bwBG5s6oknRjP/HGfl8goUor34eoiQ
 2JU5w9crgeHXc/u+YLI/KzMN8GjBh3IuNJLdCkSMh4YJlvuxUrM8QPcY0ipqq7/9RlA4
 lLu5EKF10xds8MlSow13HcFtp6LvkuT8VJEv8eTFhPTww+ZquB9a6ckiblwmoL7SLzLI
 yCNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mdl764sF
Subject: [Buildroot] [PATCH 1/1] package/libssh: fix build failure
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
 ...enable-CXX-when-running-the-coverage.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch

diff --git a/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
new file mode 100644
index 0000000000..71f70b6db1
--- /dev/null
+++ b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
@@ -0,0 +1,57 @@
+From 35982f76cdc2b51ac1ac875052cd4351c6ef5211 Mon Sep 17 00:00:00 2001
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
+Upstream: https://gitlab.com/libssh/libssh-mirror/-/merge_requests/537
+---
+ CMakeLists.txt                    | 3 ++-
+ cmake/Modules/AddCMockaTest.cmake | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a366ed4b..d484bdfa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -9,7 +9,7 @@ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
+ include(DefineCMakeDefaults)
+ include(DefineCompilerFlags)
+ 
+-project(libssh VERSION 0.11.00 LANGUAGES C CXX)
++project(libssh VERSION 0.11.00 LANGUAGES C)
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
