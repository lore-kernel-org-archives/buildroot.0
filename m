Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282B1C021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 19:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6EBF83A05;
	Wed, 19 Feb 2025 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AIjhUTK3oTi; Wed, 19 Feb 2025 19:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF1783A3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CF1783A3A;
	Wed, 19 Feb 2025 19:57:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB916CF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76DC40533
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 19:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6y8WN5GhAKbc for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 19:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5B1404DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A5B1404DF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 19:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31CD387962; Wed, 19 Feb 2025 19:56:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 20:39:54 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 89767d4a3634737173585926bd5808a55d190cb0
X-Git-Newrev: e28f3ba80df9cee48f54e6a941ecb98e47bde882
X-Patchwork-Hint: ignore
Message-Id: <20250219195655.31CD387962@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/assimp: add
 upstream security fix for CVE-2024-48423
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e28f3ba80df9cee48f54e6a941ecb98e47bde882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes the following security issue:

CVE-2024-48423: An issue in assimp v.5.4.3 allows a local attacker to
execute arbitrary code via the CallbackToLogRedirector function within the
Assimp library

https://github.com/assimp/assimp/issues/5788
https://www.cve.org/CVERecord?id=CVE-2024-48423

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ad82b284271b7039144a290b503aba294c1e39bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/0001-Fix-leak-5762.patch            | 139 +++++++++++++++++++++
 ...er-free-in-the-CallbackToLogRedirector-59.patch |  39 ++++++
 package/assimp/assimp.mk                           |   4 +
 3 files changed, 182 insertions(+)

diff --git a/package/assimp/0001-Fix-leak-5762.patch b/package/assimp/0001-Fix-leak-5762.patch
new file mode 100644
index 0000000000..a78970e1d3
--- /dev/null
+++ b/package/assimp/0001-Fix-leak-5762.patch
@@ -0,0 +1,139 @@
+From 4024726eca89331503bdab33d0b9186e901bbc45 Mon Sep 17 00:00:00 2001
+From: Kim Kulling <kimkulling@users.noreply.github.com>
+Date: Sat, 7 Sep 2024 21:02:34 +0200
+Subject: [PATCH] Fix leak (#5762)
+
+* Fix leak
+
+* Update utLogger.cpp
+
+Upstream: https://github.com/assimp/assimp/commit/4024726eca89331503bdab33d0b9186e901bbc45
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ code/Common/Assimp.cpp        | 13 ++++++---
+ fuzz/assimp_fuzzer.cc         |  2 +-
+ test/CMakeLists.txt           |  1 +
+ test/unit/Common/utLogger.cpp | 52 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 63 insertions(+), 5 deletions(-)
+ create mode 100644 test/unit/Common/utLogger.cpp
+
+diff --git a/code/Common/Assimp.cpp b/code/Common/Assimp.cpp
+index ef3ee7b5d..91896e405 100644
+--- a/code/Common/Assimp.cpp
++++ b/code/Common/Assimp.cpp
+@@ -359,20 +359,25 @@ void CallbackToLogRedirector(const char *msg, char *dt) {
+     s->write(msg);
+ }
+ 
++static LogStream *DefaultStream = nullptr;
++
+ // ------------------------------------------------------------------------------------------------
+ ASSIMP_API aiLogStream aiGetPredefinedLogStream(aiDefaultLogStream pStream, const char *file) {
+     aiLogStream sout;
+ 
+     ASSIMP_BEGIN_EXCEPTION_REGION();
+-    LogStream *stream = LogStream::createDefaultStream(pStream, file);
+-    if (!stream) {
++    if (DefaultStream == nullptr) {
++        DefaultStream = LogStream::createDefaultStream(pStream, file);
++    }
++    
++    if (!DefaultStream) {
+         sout.callback = nullptr;
+         sout.user = nullptr;
+     } else {
+         sout.callback = &CallbackToLogRedirector;
+-        sout.user = (char *)stream;
++        sout.user = (char *)DefaultStream;
+     }
+-    gPredefinedStreams.push_back(stream);
++    gPredefinedStreams.push_back(DefaultStream);
+     ASSIMP_END_EXCEPTION_REGION(aiLogStream);
+     return sout;
+ }
+diff --git a/fuzz/assimp_fuzzer.cc b/fuzz/assimp_fuzzer.cc
+index 8178674e8..91ffd9d69 100644
+--- a/fuzz/assimp_fuzzer.cc
++++ b/fuzz/assimp_fuzzer.cc
+@@ -47,7 +47,7 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ using namespace Assimp;
+ 
+ extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t dataSize) {
+-    aiLogStream stream = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT,NULL);
++    aiLogStream stream = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
+     aiAttachLogStream(&stream);
+ 
+     Importer importer;
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index 7b7fd850a..1a45adac7 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -100,6 +100,7 @@ SET( COMMON
+   unit/Common/utBase64.cpp
+   unit/Common/utHash.cpp
+   unit/Common/utBaseProcess.cpp
++  unit/Common/utLogger.cpp
+ )
+ 
+ SET(Geometry 
+diff --git a/test/unit/Common/utLogger.cpp b/test/unit/Common/utLogger.cpp
+new file mode 100644
+index 000000000..932240a7f
+--- /dev/null
++++ b/test/unit/Common/utLogger.cpp
+@@ -0,0 +1,52 @@
++/*
++---------------------------------------------------------------------------
++Open Asset Import Library (assimp)
++---------------------------------------------------------------------------
++
++Copyright (c) 2006-2024, assimp team
++
++All rights reserved.
++
++Redistribution and use of this software in source and binary forms,
++with or without modification, are permitted provided that the following
++conditions are met:
++
++* Redistributions of source code must retain the above
++copyright notice, this list of conditions and the
++following disclaimer.
++
++* Redistributions in binary form must reproduce the above
++copyright notice, this list of conditions and the
++following disclaimer in the documentation and/or other
++materials provided with the distribution.
++
++* Neither the name of the assimp team, nor the names of its
++contributors may be used to endorse or promote products
++derived from this software without specific prior
++written permission of the assimp team.
++
++THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
++A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
++OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++---------------------------------------------------------------------------
++*/
++
++#include "UnitTestPCH.h"
++#include <assimp/Importer.hpp>
++
++using namespace Assimp;
++class utLogger : public ::testing::Test {};
++
++TEST_F(utLogger, aiGetPredefinedLogStream_leak_test) {
++    aiLogStream stream1 = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
++    aiLogStream stream2 = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
++    ASSERT_EQ(stream1.callback, stream2.callback);
++}
+-- 
+2.39.5
+
diff --git a/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch b/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
new file mode 100644
index 0000000000..c4cd2af5aa
--- /dev/null
+++ b/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
@@ -0,0 +1,39 @@
+From f12e52198669239af525e525ebb68407977f8e34 Mon Sep 17 00:00:00 2001
+From: tyler92 <tyler92@inbox.ru>
+Date: Wed, 11 Dec 2024 12:17:14 +0200
+Subject: [PATCH] Fix use after free in the CallbackToLogRedirector (#5918)
+
+The heap-use-after-free vulnerability occurs in the
+CallbackToLogRedirector function. During the process of logging,
+a previously freed memory region is accessed, leading to a
+use-after-free condition. This vulnerability stems from incorrect
+memory management, specifically, freeing a log stream and then
+attempting to access it later on.
+
+This patch sets NULL value for The DefaultStream global pointer.
+
+Co-authored-by: Kim Kulling <kimkulling@users.noreply.github.com>
+Upstream: https://github.com/assimp/assimp/commit/f12e52198669239af525e525ebb68407977f8e34
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ code/Common/Assimp.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/code/Common/Assimp.cpp b/code/Common/Assimp.cpp
+index 91896e405..22e16bd36 100644
+--- a/code/Common/Assimp.cpp
++++ b/code/Common/Assimp.cpp
+@@ -416,6 +416,10 @@ ASSIMP_API aiReturn aiDetachLogStream(const aiLogStream *stream) {
+     DefaultLogger::get()->detachStream(it->second);
+     delete it->second;
+ 
++    if ((Assimp::LogStream *)stream->user == DefaultStream) {
++        DefaultStream = nullptr;
++    }
++
+     gActiveLogStreams.erase(it);
+ 
+     if (gActiveLogStreams.empty()) {
+-- 
+2.39.5
+
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index ba0d506033..a4614a01a2 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -12,6 +12,10 @@ ASSIMP_CPE_ID_VENDOR = assimp
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
+# 0001-Fix-leak-5762.patch
+# 0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
+ASSIMP_IGNORE_CVES += CVE-2024-48423
+
 # relocation truncated to fit: R_68K_GOT16O. We also need to disable
 # optimizations to not run into "Error: value -43420 out of range"
 # assembler issues.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
