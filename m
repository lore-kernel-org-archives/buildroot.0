Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A601C61CE7
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 11:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDAAF81ECF;
	Sat,  7 Jun 2025 11:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMhPZc5nWJmV; Sat,  7 Jun 2025 11:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFCF581ED0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFCF581ED0;
	Sat,  7 Jun 2025 11:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D551A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 11:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90FF40027
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 11:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1G5n5fJpuxB for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 11:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32F814052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F814052D
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32F814052D
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 11:44:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad89c32a7b5so462701966b.2
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 04:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749296697; x=1749901497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yRXF1Y0NypGLj4yZDhEgcoUqZpZ5wXdAG0VUyk78Mo0=;
 b=BGk9JAtzP/DgmPg//ZzDnqeuDLDXicN9BaXQLORYXKPb/CroMabdWdcOI2Oq5czuCZ
 2Mu4uhB2i7jOGU2Rjjc68X5eDZqOMxuF7qEBPdJ/0xk/dA1oRMKoROo1JIdPx4zSmp1g
 b7EgRvrc3T6KA42c3/9nwV0hy1jicZbGqzG1OBGE11xq3KntZtyiovZpCvzMyU2py3RF
 m1fT5qILj2DpnXhsIsUInWi0KQWO+9CX8FHjvc6Bev9rZ0qcE+nXVX/HbMjm4n63s4vB
 e79ahuYoWh0pxriFqNvBMgLbnfbiEwEeAqYZ6jJWfjOJn3MdX6PLWbHwK3Y/djzrAG6w
 7svw==
X-Gm-Message-State: AOJu0YwxshHpL2hQL2zxP4NCr2shcm9Sn6ffaejw8C8+4MxQY1Dclz8z
 SZg02JZAYN2ShocJBMZWVtz7W7Q1ETVPJdj074Yz7aDHUzmMX486fs9n8dgg7VsTY44ptAcLMbp
 9F+bL
X-Gm-Gg: ASbGncuXuXOYF8wJw1ZMuI+TWwLhNOxnHRR9QcHhrL9uccI76soJ0C5cb7KBlUfGSUo
 Nse7KaFBKuY0M8qmRy9xjMqnfFeSdv+8Chg+Q/HFKlx3RugZnfM+toM2VN1eOjHMmC1NGqw07F6
 NkVLwyvCH49XvN6GxohR8JGbtd/8///EDl9KBZFa96YB94mFWgq2HA3noPrwAO0Wg2BDDMfvtjB
 kTRqKOUcTVq3vzcsqJxmVfhFr79sduWo4O2lM63PZOed6wHAtv9KvS6Q/SGeiv6wuAcR4DJplak
 NqK2Pg0unQf4k/r8xxFJe7WpQLeAUbEDdOFAUqgBE1uxTlOqw8iWBnakEJ8udTXidzcEECu0p0P
 u
X-Google-Smtp-Source: AGHT+IEv4zBXfjagpzP5K4SjThwXE1Uhmwui8/kcJfZPjJjM5ReHZRQa1sfKrJG0M4aEfdJV03TSRA==
X-Received: by 2002:a17:907:9443:b0:ad5:59ef:7f56 with SMTP id
 a640c23a62f3a-ade1aabb1f4mr601201866b.48.1749296697415; 
 Sat, 07 Jun 2025 04:44:57 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d755281sm267809666b.18.2025.06.07.04.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 04:44:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat,  7 Jun 2025 13:44:25 +0200
Message-Id: <20250607114425.774736-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749296697; x=1749901497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yRXF1Y0NypGLj4yZDhEgcoUqZpZ5wXdAG0VUyk78Mo0=;
 b=ffzLcy9KSuPfw1QmJhjr6eYKPnG31iAc4d7czxMJyZoYNbJWRrDP3SDPb4GsFC3NlH
 GZs1Z3vVKD1lS+xGPUydyHve9DfpHQOdxdqelCkWDfWvBre120dUBQwH19sM52ZrHSHg
 8UFVAKTLpS4wL8v8Nh2iKsxKgs4IF0v0ZtehqL5fZtyB4KiJWwElno45WQVa18G+2oLD
 1X6yLb/Dhw9ffNx/UL+98Xb/DJqarwK1C+1Gw59CqmouKREJuCh5HIt3a0/IiivOy4Uy
 XP3g38vzwnSANimslIPcvvGkT2GgmwulL3f9uWDrVeGeLyzcS2Ly9IYXj07brMidYHOe
 XFbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ffzLcy9K
Subject: [Buildroot] [PATCH 2025.02.x] package/fluent-bit: build fix for
 toolchains w/o CXX
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the package bump [1] the fluent-bit package started to fail
because of an update introduced in fluent-bit v3.2.7 (see [2]).

The following error appeared on the autobuilder in the LTS branch.

```
CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/CMakeTestCXXCompiler.cmake:73 (message):
  The C++ compiler

    "/bin/false"

  is not able to compile a simple test program.

  It fails with the following output:

    Change Dir: '/home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc'

    Run Build Command(s): /home/buildroot/instance-0/output-1/host/bin/ninja -v cmTC_71bbf
    [1/2] /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
    FAILED: CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o
    /bin/false    -o CMakeFiles/cmTC_71bbf.dir/testCXXCompiler.cxx.o -c /home/buildroot/instance-0/output-1/build/fluent-bit-3.2.10/CMakeFiles/CMakeScratch/TryCompile-u4rLgc/testCXXCompiler.cxx
    ninja: build stopped: subcommand failed.

  CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
  lib/zstd-1.5.7/build/cmake/CMakeLists.txt:36 (project)
```

The commit [3] included two patches to fix the build error
for configs using toolchains without CXX.

Since the build error was already present on v3.2.10,
those patches actually fix the error for LTS version as well.
This patch pick them from the series to apply them on the LTS
branch.

[1] 8bc18fad29 package/fluent-bit: bump to 3.2.10
[2] https://github.com/fluent/fluent-bit/commit/0ce59cecdc3c3f8053bebe9d5d9ef7b30fc6c4e6
[3] 8181727e23 package/fluent-bit: bump to 4.0.0

Fixes: https://autobuild.buildroot.org/results/4b0/4b0646e8fcc3f023ab0173ea8725f381e5055152/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...able-CXX-support-if-tests-are-requir.patch | 34 +++++++++++++++++++
 ...-lib-miniz-only-require-a-C-compiler.patch | 27 +++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
 create mode 100644 package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch

diff --git a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
new file mode 100644
index 0000000000..f7b282165c
--- /dev/null
+++ b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
@@ -0,0 +1,34 @@
+From b6d898185d441e00acad867c0c80aadf4d7b0d37 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:43:30 +0200
+Subject: [PATCH] lib: zstd: only enable CXX support if tests are required
+
+Upstream: https://github.com/facebook/zstd/pull/4357/files
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/zstd-1.5.7/build/cmake/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
+index 347d41c0f..70e233df3 100644
+--- a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
++++ b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
+@@ -37,7 +37,6 @@ project(zstd
+   VERSION "${ZSTD_FULL_VERSION}"
+   LANGUAGES C   # Main library is in C
+             ASM # And ASM
+-            CXX # Testing contributed code also utilizes CXX
+   )
+ 
+ message(STATUS "ZSTD VERSION: ${zstd_VERSION}")
+@@ -170,6 +169,7 @@ if (ZSTD_BUILD_PROGRAMS)
+ endif ()
+ 
+ if (ZSTD_BUILD_TESTS)
++    enable_language(CXX)
+     enable_testing()
+     if (NOT ZSTD_BUILD_STATIC)
+         message(SEND_ERROR "You need to build static library to build tests")
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..bfd32d6b68
--- /dev/null
+++ b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
@@ -0,0 +1,27 @@
+From 3732cea4bb3dd9b79732da7bfbf60258bc418195 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 23:01:13 +0200
+Subject: [PATCH] lib: miniz: only require a C compiler
+
+Upstream: https://github.com/richgel999/miniz/pull/338
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/miniz/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
+index ce6ade1c0..91012b36a 100644
+--- a/lib/miniz/CMakeLists.txt
++++ b/lib/miniz/CMakeLists.txt
+@@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+   project(miniz C)
+-- 
+2.43.0
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
