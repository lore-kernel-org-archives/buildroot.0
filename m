Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AD0C83F17
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 15:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E95411BB;
	Fri, 18 Jul 2025 15:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hG91ta0iuSZw; Fri, 18 Jul 2025 15:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A760640D85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A760640D85;
	Fri, 18 Jul 2025 15:20:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C6D8DA
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 15:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30FC760BB5
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 15:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlubtepP7Iz3 for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 15:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B616660A42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B616660A42
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B616660A42
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 15:20:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so16891095e9.3
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752852003; x=1753456803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gFYSHzclnry15T6vwP14nM3+ZwqrzZVHWyM7ol1wBw=;
 b=pcIJAcEi2fAC+m/TtdIurXGjlbQFw8HtAiK8/o4MJtdzO6Nod4PEOa6BOZv58JwzBn
 qE2KIx0FkHkZGSnQbpGx/8egcE5jk5AxASI70ohYg4AZ1ASU7v+EL7DMZiG+iED/o4b0
 6x7j9Hdm69iM1g1618Ni1QLbpwnyFRNiKkqFPxVwduK+LXVkCkpgn01iW0iT/Z8jTOfl
 hw2NazdoJik/D5BcNI7/th2g6W2EpPv4iIQv6SAYF1oVoj7NrlpSsWdw/Dlv39FXuczg
 BgKbcIkzVCOtIRQ0a+9T8i0hMJsiXd4HCLPGAHvKW+Xy7tyEho0I52WPXhesdC7hdAVR
 SqjA==
X-Gm-Message-State: AOJu0YyS0X6llrR9gH+5p+fTSASxQ2ypdptzOHj88QXh++poRyoOXBGS
 R7o3cGQ949V+eFgXz5xmHtUgom/oafAZpREQIJqqxEbSa9jZMe5qweQVzmautFln5joeWTarZZo
 n1NiQ
X-Gm-Gg: ASbGncv2kcvF5mgROgJtrrhbJh5Hqr45LQ881UDocvRWjk1x85XqNkOBFBqUpIvjLEb
 ud2Y2Vrz9Ve+gxB0igkzR4jUPFm4Y4or7mVQ0YRZKhqgf/hpHXgHn9QV1SZ1tYYePGb/ZwLM1fM
 MCitiVE5dS0IGhknDCFL+KKYJm6RlhNlA1dt516zAl24JMwTujMA3+3hd4TGW6gh/hE3nOF9uwR
 J0OhayXW6GJYjsMQFuuVbYs3T9CXdn/npsOZwn4Z2P0pPkFDDtp5UPQjkN4qtuK7+bXMM50sLCL
 hbIEc6y5e7e5t1HnTs3Av31p8XJjLUjcqlDPUppnrjlptCKjY6DG4d79zanebF/Pbry+ZH65aaU
 sFW3n95jhvVJACJoCSD9fwxgKAI05bVJfw0u5L4lucg7OvcVq/ee+cA==
X-Google-Smtp-Source: AGHT+IEWIhsxQ52xqQ4mWA4Eef6HSUgyOl+4WOnNXoJfahp6Cy0+XgCeOPhMLMICLgYuuFiLK5PjlQ==
X-Received: by 2002:a05:600c:450f:b0:456:2981:2d6 with SMTP id
 5b1f17b1804b1-4562e34dc2amr118955995e9.14.1752852003343; 
 Fri, 18 Jul 2025 08:20:03 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b75cb86sm22867835e9.32.2025.07.18.08.20.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:20:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 18 Jul 2025 17:19:53 +0200
Message-ID: <20250718151953.97421-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752852003; x=1753456803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gFYSHzclnry15T6vwP14nM3+ZwqrzZVHWyM7ol1wBw=;
 b=LnOGBwioIXSG1S+PN04B8mGcUyxqfmp6MY1YI+iZCZAiAB3FHxkfYOUveC+YFSuLj1
 q4OeMcAmxtlzB87GodNe8sE+Wivk655eA53rPyJJkS0J8/nXeoGS2jjWsEUGEJ3acxxG
 3U5EZIzEiFBnCH/UM6pQUFY7MvOKLw0KWl0f/BIOvkYiMphhJbqeGv8ZtFoISE8mFJTh
 5goUQGU5kH9FbAUnerK29nbbmWEXO5fCnSRzK+18U3GKDyZZQtqcMaxZtxoPsYHdSkrR
 0ft025x95+5lMIFmAwm2Mzg9YMH5Z9tfjqm0yiaAsx4IIVc1OzWoEYJLJj0njrDnSEQi
 fZcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LnOGBwio
Subject: [Buildroot] [PATCH] package/assimp: security bump to v6.0.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:

- CVE-2025-2750:
    A vulnerability, which was classified as critical, was found in Open
    Asset Import Library Assimp 5.4.3. This affects the function
    Assimp::CSMImporter::InternReadFile of the file
    code/AssetLib/CSM/CSMLoader.cpp of the component CSM File Handler. The
    manipulation leads to out-of-bounds write. It is possible to initiate
    the attack remotely. The exploit has been disclosed to the public and
    may be used.
    https://www.cve.org/CVERecord?id=CVE-2025-2750

- CVE-2025-2751:
    A vulnerability has been found in Open Asset Import Library Assimp
    5.4.3 and classified as problematic. This vulnerability affects the
    function Assimp::CSMImporter::InternReadFile of the file
    code/AssetLib/CSM/CSMLoader.cpp of the component CSM File Handler. The
    manipulation of the argument na leads to out-of-bounds read. The
    attack can be initiated remotely. The exploit has been disclosed to
    the public and may be used.
    https://www.cve.org/CVERecord?id=CVE-2025-2751

- CVE-2025-2757:
    A vulnerability classified as critical was found in Open Asset Import
    Library Assimp 5.4.3. This vulnerability affects the function
    AI_MD5_PARSE_STRING_IN_QUOTATION of the file
    code/AssetLib/MD5/MD5Parser.cpp of the component MD5 File Handler. The
    manipulation of the argument data leads to heap-based buffer overflow.
    The attack can be initiated remotely. The exploit has been disclosed
    to the public and may be used.
    https://www.cve.org/CVERecord?id=CVE-2025-2757

- CVE-2025-3158:
    A vulnerability, which was classified as critical, has been found in
    Open Asset Import Library Assimp 5.4.3. Affected by this issue is the
    function Assimp::LWO::AnimResolver::UpdateAnimRangeSetup of the file
    code/AssetLib/LWO/LWOAnimation.cpp of the component LWO File Handler.
    The manipulation leads to heap-based buffer overflow. It is possible
    to launch the attack on the local host. The exploit has been disclosed
    to the public and may be used.
    https://www.cve.org/CVERecord?id=CVE-2025-3158

Also, drop local security patches that have been applied upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/assimp/0001-Fix-leak-5762.patch       | 139 ------------------
 ...ee-in-the-CallbackToLogRedirector-59.patch |  39 -----
 ...ASE-fix-possible-out-of-bound-access.patch |  29 ----
 .../0004-MDL-limit-max-texture-sizes.patch    |  41 ------
 package/assimp/assimp.hash                    |   2 +-
 package/assimp/assimp.mk                      |  12 +-
 6 files changed, 2 insertions(+), 260 deletions(-)
 delete mode 100644 package/assimp/0001-Fix-leak-5762.patch
 delete mode 100644 package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
 delete mode 100644 package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
 delete mode 100644 package/assimp/0004-MDL-limit-max-texture-sizes.patch

diff --git a/package/assimp/0001-Fix-leak-5762.patch b/package/assimp/0001-Fix-leak-5762.patch
deleted file mode 100644
index a78970e1d3..0000000000
--- a/package/assimp/0001-Fix-leak-5762.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 4024726eca89331503bdab33d0b9186e901bbc45 Mon Sep 17 00:00:00 2001
-From: Kim Kulling <kimkulling@users.noreply.github.com>
-Date: Sat, 7 Sep 2024 21:02:34 +0200
-Subject: [PATCH] Fix leak (#5762)
-
-* Fix leak
-
-* Update utLogger.cpp
-
-Upstream: https://github.com/assimp/assimp/commit/4024726eca89331503bdab33d0b9186e901bbc45
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- code/Common/Assimp.cpp        | 13 ++++++---
- fuzz/assimp_fuzzer.cc         |  2 +-
- test/CMakeLists.txt           |  1 +
- test/unit/Common/utLogger.cpp | 52 +++++++++++++++++++++++++++++++++++
- 4 files changed, 63 insertions(+), 5 deletions(-)
- create mode 100644 test/unit/Common/utLogger.cpp
-
-diff --git a/code/Common/Assimp.cpp b/code/Common/Assimp.cpp
-index ef3ee7b5d..91896e405 100644
---- a/code/Common/Assimp.cpp
-+++ b/code/Common/Assimp.cpp
-@@ -359,20 +359,25 @@ void CallbackToLogRedirector(const char *msg, char *dt) {
-     s->write(msg);
- }
- 
-+static LogStream *DefaultStream = nullptr;
-+
- // ------------------------------------------------------------------------------------------------
- ASSIMP_API aiLogStream aiGetPredefinedLogStream(aiDefaultLogStream pStream, const char *file) {
-     aiLogStream sout;
- 
-     ASSIMP_BEGIN_EXCEPTION_REGION();
--    LogStream *stream = LogStream::createDefaultStream(pStream, file);
--    if (!stream) {
-+    if (DefaultStream == nullptr) {
-+        DefaultStream = LogStream::createDefaultStream(pStream, file);
-+    }
-+    
-+    if (!DefaultStream) {
-         sout.callback = nullptr;
-         sout.user = nullptr;
-     } else {
-         sout.callback = &CallbackToLogRedirector;
--        sout.user = (char *)stream;
-+        sout.user = (char *)DefaultStream;
-     }
--    gPredefinedStreams.push_back(stream);
-+    gPredefinedStreams.push_back(DefaultStream);
-     ASSIMP_END_EXCEPTION_REGION(aiLogStream);
-     return sout;
- }
-diff --git a/fuzz/assimp_fuzzer.cc b/fuzz/assimp_fuzzer.cc
-index 8178674e8..91ffd9d69 100644
---- a/fuzz/assimp_fuzzer.cc
-+++ b/fuzz/assimp_fuzzer.cc
-@@ -47,7 +47,7 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- using namespace Assimp;
- 
- extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t dataSize) {
--    aiLogStream stream = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT,NULL);
-+    aiLogStream stream = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
-     aiAttachLogStream(&stream);
- 
-     Importer importer;
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index 7b7fd850a..1a45adac7 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -100,6 +100,7 @@ SET( COMMON
-   unit/Common/utBase64.cpp
-   unit/Common/utHash.cpp
-   unit/Common/utBaseProcess.cpp
-+  unit/Common/utLogger.cpp
- )
- 
- SET(Geometry 
-diff --git a/test/unit/Common/utLogger.cpp b/test/unit/Common/utLogger.cpp
-new file mode 100644
-index 000000000..932240a7f
---- /dev/null
-+++ b/test/unit/Common/utLogger.cpp
-@@ -0,0 +1,52 @@
-+/*
-+---------------------------------------------------------------------------
-+Open Asset Import Library (assimp)
-+---------------------------------------------------------------------------
-+
-+Copyright (c) 2006-2024, assimp team
-+
-+All rights reserved.
-+
-+Redistribution and use of this software in source and binary forms,
-+with or without modification, are permitted provided that the following
-+conditions are met:
-+
-+* Redistributions of source code must retain the above
-+copyright notice, this list of conditions and the
-+following disclaimer.
-+
-+* Redistributions in binary form must reproduce the above
-+copyright notice, this list of conditions and the
-+following disclaimer in the documentation and/or other
-+materials provided with the distribution.
-+
-+* Neither the name of the assimp team, nor the names of its
-+contributors may be used to endorse or promote products
-+derived from this software without specific prior
-+written permission of the assimp team.
-+
-+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
-+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+---------------------------------------------------------------------------
-+*/
-+
-+#include "UnitTestPCH.h"
-+#include <assimp/Importer.hpp>
-+
-+using namespace Assimp;
-+class utLogger : public ::testing::Test {};
-+
-+TEST_F(utLogger, aiGetPredefinedLogStream_leak_test) {
-+    aiLogStream stream1 = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
-+    aiLogStream stream2 = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
-+    ASSERT_EQ(stream1.callback, stream2.callback);
-+}
--- 
-2.39.5
-
diff --git a/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch b/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
deleted file mode 100644
index c4cd2af5aa..0000000000
--- a/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f12e52198669239af525e525ebb68407977f8e34 Mon Sep 17 00:00:00 2001
-From: tyler92 <tyler92@inbox.ru>
-Date: Wed, 11 Dec 2024 12:17:14 +0200
-Subject: [PATCH] Fix use after free in the CallbackToLogRedirector (#5918)
-
-The heap-use-after-free vulnerability occurs in the
-CallbackToLogRedirector function. During the process of logging,
-a previously freed memory region is accessed, leading to a
-use-after-free condition. This vulnerability stems from incorrect
-memory management, specifically, freeing a log stream and then
-attempting to access it later on.
-
-This patch sets NULL value for The DefaultStream global pointer.
-
-Co-authored-by: Kim Kulling <kimkulling@users.noreply.github.com>
-Upstream: https://github.com/assimp/assimp/commit/f12e52198669239af525e525ebb68407977f8e34
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- code/Common/Assimp.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/code/Common/Assimp.cpp b/code/Common/Assimp.cpp
-index 91896e405..22e16bd36 100644
---- a/code/Common/Assimp.cpp
-+++ b/code/Common/Assimp.cpp
-@@ -416,6 +416,10 @@ ASSIMP_API aiReturn aiDetachLogStream(const aiLogStream *stream) {
-     DefaultLogger::get()->detachStream(it->second);
-     delete it->second;
- 
-+    if ((Assimp::LogStream *)stream->user == DefaultStream) {
-+        DefaultStream = nullptr;
-+    }
-+
-     gActiveLogStreams.erase(it);
- 
-     if (gActiveLogStreams.empty()) {
--- 
-2.39.5
-
diff --git a/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
deleted file mode 100644
index 427b7a4888..0000000000
--- a/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 65c95bf3207b81fe522811d45780d72ed41d9c1e Mon Sep 17 00:00:00 2001
-From: Kim Kulling <kim.kulling@googlemail.com>
-Date: Wed, 12 Mar 2025 20:17:38 +0100
-Subject: [PATCH] ASE: Fix possible out of bound access.
-
-Upstream: https://github.com/assimp/assimp/pull/6045
-
-CVE: CVE-2025-3015
-
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- code/AssetLib/ASE/ASELoader.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/code/AssetLib/ASE/ASELoader.cpp b/code/AssetLib/ASE/ASELoader.cpp
-index eb6b37dc9b..c63edcf6bf 100644
---- a/code/AssetLib/ASE/ASELoader.cpp
-+++ b/code/AssetLib/ASE/ASELoader.cpp
-@@ -731,6 +731,10 @@ void ASEImporter::BuildUniqueRepresentation(ASE::Mesh &mesh) {
-     unsigned int iCurrent = 0, fi = 0;
-     for (std::vector<ASE::Face>::iterator i = mesh.mFaces.begin(); i != mesh.mFaces.end(); ++i, ++fi) {
-         for (unsigned int n = 0; n < 3; ++n, ++iCurrent) {
-+            const uint32_t curIndex = (*i).mIndices[n];
-+            if (curIndex >= mesh.mPositions.size()) {
-+                throw DeadlyImportError("ASE: Invalid vertex index in face ", fi, ".");
-+            }
-             mPositions[iCurrent] = mesh.mPositions[(*i).mIndices[n]];
- 
-             // add texture coordinates
diff --git a/package/assimp/0004-MDL-limit-max-texture-sizes.patch b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
deleted file mode 100644
index ae7e54f35d..0000000000
--- a/package/assimp/0004-MDL-limit-max-texture-sizes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5d2a7482312db2e866439a8c05a07ce1e718bed1 Mon Sep 17 00:00:00 2001
-From: Kim Kulling <kimkulling@users.noreply.github.com>
-Date: Wed, 12 Mar 2025 21:29:33 +0100
-Subject: [PATCH] MDL: Limit max texture sizes
-
-- closes https://github.com/assimp/assimp/issues/6022
-
-Upstream: https://github.com/assimp/assimp/pull/6046
-
-CVE: CVE-2025-3016
-
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- code/AssetLib/MDL/MDLMaterialLoader.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/code/AssetLib/MDL/MDLMaterialLoader.cpp b/code/AssetLib/MDL/MDLMaterialLoader.cpp
-index 2cac8a1e26..2e09992e89 100644
---- a/code/AssetLib/MDL/MDLMaterialLoader.cpp
-+++ b/code/AssetLib/MDL/MDLMaterialLoader.cpp
-@@ -209,6 +209,8 @@ void MDLImporter::CreateTexture_3DGS_MDL4(const unsigned char *szData,
-     return;
- }
- 
-+static const uint32_t MaxTextureSize = 4096;
-+
- // ------------------------------------------------------------------------------------------------
- // Load color data of a texture and convert it to our output format
- void MDLImporter::ParseTextureColorData(const unsigned char *szData,
-@@ -219,6 +221,11 @@ void MDLImporter::ParseTextureColorData(const unsigned char *szData,
- 
-     // allocate storage for the texture image
-     if (do_read) {
-+        // check for max texture sizes
-+        if (pcNew->mWidth > MaxTextureSize || pcNew->mHeight > MaxTextureSize) {
-+            throw DeadlyImportError("Invalid MDL file. A texture is too big.");
-+        }
-+      
-         if(pcNew->mWidth != 0 && pcNew->mHeight > UINT_MAX/pcNew->mWidth) {
-             throw DeadlyImportError("Invalid MDL file. A texture is too big.");
-         }
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index bdcab695fc..93c081351e 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66dfbaee288f2bc43172440a55d0235dfc7bf885dda6435c038e8000e79582cb  assimp-5.4.3.tar.gz
+sha256  d1822d9a19c9205d6e8bc533bf897174ddb360ce504680f294170cc1d6319751  assimp-6.0.2.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 39ad234546..dd61b69ca2 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.4.3
+ASSIMP_VERSION = 6.0.2
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
@@ -12,16 +12,6 @@ ASSIMP_CPE_ID_VENDOR = assimp
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
-# 0001-Fix-leak-5762.patch
-# 0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
-ASSIMP_IGNORE_CVES += CVE-2024-48423
-
-# 0003-ASE-fix-possible-out-of-bound-access.patch
-ASSIMP_IGNORE_CVES += CVE-2025-3015
-
-# 0004-MDL-limit-max-texture-sizes.patch
-ASSIMP_IGNORE_CVES += CVE-2025-3016
-
 # relocation truncated to fit: R_68K_GOT16O. We also need to disable
 # optimizations to not run into "Error: value -43420 out of range"
 # assembler issues.
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
