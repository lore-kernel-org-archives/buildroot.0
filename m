Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14ACC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782BC80E60;
	Thu,  7 Aug 2025 18:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Cyamo24hDP9; Thu,  7 Aug 2025 18:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA9680E16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA9680E16;
	Thu,  7 Aug 2025 18:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05C5B10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F316A803D8
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQvk8Sbn19kI for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C05680DC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C05680DC9
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C05680DC9
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso13017475e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591054; x=1755195854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9tlGN07bmREcpUmjeMSbo8cJYYaRzf7vjL/4QyJkAM=;
 b=hp5AcO56JSFEXZcw6JA/S/phwfKpo4YDZ5f629OdATwCquYE8gpqePKRS3X1nUadSW
 6N8Yf+lLLmZgn07YnmMA2exaFd+aBbw0nIUh/aiDDnMklKudq1G4CGhcqiO2sa7T6EWY
 +Qon0KzQxG1OXxrCnRZN8IlJPgenyNqnD30nTrNEPiS6Er0z0WTGg0VpX4tj177Dmoh5
 oQb9UWeRHg0E01qWRuC5vl1lGkr2LUFd+v0vUu171AJvENbeNtzrqjoLEqeSfC3HvW9f
 94B0Tqht7flVXGWkpU+mfAA5EbEi+WpWWIuSKH1gkYv7uxGssRpNDWQZCoOTBF22CnB2
 bqCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHDqS/fDf1sQUqXcR1FrP6VGbeRBbsi4WrQ1IyHjcGJmxGR1Gd8y2YbLxJjDBKEEeVPg0jpTn2P7A=@buildroot.org
X-Gm-Message-State: AOJu0YykK//97RScfBbf+VI2vsr7UovLXGue6JvrY/QoRfYqBFyFYcua
 lZLcxEVGACOZnUJv+YJO/CelQ30BpK/o8PNF4gLlXnMcF3yeWoh6bI0Y14FzkVlxNCg=
X-Gm-Gg: ASbGnctdScQlG4ywhX+jXH7xxIvKLog+8xJ5MByjSW9XY8ar/JyYSH5A6+N3qx4qGJk
 xgas4k80QTshuD1QM3iq77DgwdvmvXh5BEcpvAq6D2GguCh4tB2DLdLLn8SoadyxnMJa0nwBxe1
 3SkZ1lMjunqJn0Mzu9BoDNrRixJkuJq/pyAy0haYjBH5NBnYug/EXxhq/XrDLxkbfU1d8ossNJs
 o9jZoOvYrxQ5mvqYX14x+BfPyyWcPJ4kA4lXCvRCIpdnpTAHbL+ynB0IMti6nUSpDEAWzUPJDH5
 //IQQzA7nc7TfpsZiRVBQAt+g4ouLDpWBHidomobIDXY64xgYhSHivbfHU5uMFK5pAHiBdtgfDo
 qq/pEIX7znEb6CA==
X-Google-Smtp-Source: AGHT+IHFNWNqIXlE0B/qo3eTSo6EMVIKk6+rNLLeN2/CxjgbuXjwhbosBB/DfkgpWG9m74Gb3UBlKw==
X-Received: by 2002:a05:600c:19c6:b0:456:1923:7549 with SMTP id
 5b1f17b1804b1-459f43afda3mr6339185e9.26.1754591053877; 
 Thu, 07 Aug 2025 11:24:13 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e6214640sm105221775e9.1.2025.08.07.11.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:13 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:13 +0200
Message-ID: <20250807182413.724665-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718151953.97421-1-titouan.christophe@mind.be>
References: <20250718151953.97421-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591054; x=1755195854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9tlGN07bmREcpUmjeMSbo8cJYYaRzf7vjL/4QyJkAM=;
 b=af9/hh65bkfDJIQMSgKLOJLGXBQXi9nNJ8fwK/1sDKmuZHHH2AZ1rPzob37efagA2S
 DH4on7oUXLJ/+q0Jqkl/ic420r2KZ84SxpA2MCoOHU4xV7RvhJcuJmzuo8b7L27nsXba
 hhGZ0ZOqkma6cFmKIuNFG/+Q/7g9KPwzU5K2dM+/0MwCMkSpZCbmqsNME4g5bXi4uTZq
 /lLvo1+ZLzOX2pQiXRpo0B0cJZ3XBfwUPK3uOB3gEVDeMMv9FvW7E4vHqHeITY1GVR57
 tX0y2MaK5S1n5eQAyT9batyQdFlE80fKTix4rMb4ZoDLNWqHBRJSkli17zsyDyp/5GL1
 5Nyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=af9/hh65
Subject: Re: [Buildroot] [PATCH] package/assimp: security bump to v6.0.2
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

In reply of:
> This fixes the following vulnerabilities:
> 
> - CVE-2025-2750:
>     A vulnerability, which was classified as critical, was found in Open
>     Asset Import Library Assimp 5.4.3. This affects the function
>     Assimp::CSMImporter::InternReadFile of the file
>     code/AssetLib/CSM/CSMLoader.cpp of the component CSM File Handler. The
>     manipulation leads to out-of-bounds write. It is possible to initiate
>     the attack remotely. The exploit has been disclosed to the public and
>     may be used.
>     https://www.cve.org/CVERecord?id=CVE-2025-2750
> 
> - CVE-2025-2751:
>     A vulnerability has been found in Open Asset Import Library Assimp
>     5.4.3 and classified as problematic. This vulnerability affects the
>     function Assimp::CSMImporter::InternReadFile of the file
>     code/AssetLib/CSM/CSMLoader.cpp of the component CSM File Handler. The
>     manipulation of the argument na leads to out-of-bounds read. The
>     attack can be initiated remotely. The exploit has been disclosed to
>     the public and may be used.
>     https://www.cve.org/CVERecord?id=CVE-2025-2751
> 
> - CVE-2025-2757:
>     A vulnerability classified as critical was found in Open Asset Import
>     Library Assimp 5.4.3. This vulnerability affects the function
>     AI_MD5_PARSE_STRING_IN_QUOTATION of the file
>     code/AssetLib/MD5/MD5Parser.cpp of the component MD5 File Handler. The
>     manipulation of the argument data leads to heap-based buffer overflow.
>     The attack can be initiated remotely. The exploit has been disclosed
>     to the public and may be used.
>     https://www.cve.org/CVERecord?id=CVE-2025-2757
> 
> - CVE-2025-3158:
>     A vulnerability, which was classified as critical, has been found in
>     Open Asset Import Library Assimp 5.4.3. Affected by this issue is the
>     function Assimp::LWO::AnimResolver::UpdateAnimRangeSetup of the file
>     code/AssetLib/LWO/LWOAnimation.cpp of the component LWO File Handler.
>     The manipulation leads to heap-based buffer overflow. It is possible
>     to launch the attack on the local host. The exploit has been disclosed
>     to the public and may be used.
>     https://www.cve.org/CVERecord?id=CVE-2025-3158
> 
> Also, drop local security patches that have been applied upstream
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/assimp/0001-Fix-leak-5762.patch       | 139 ------------------
>  ...ee-in-the-CallbackToLogRedirector-59.patch |  39 -----
>  ...ASE-fix-possible-out-of-bound-access.patch |  29 ----
>  .../0004-MDL-limit-max-texture-sizes.patch    |  41 ------
>  package/assimp/assimp.hash                    |   2 +-
>  package/assimp/assimp.mk                      |  12 +-
>  6 files changed, 2 insertions(+), 260 deletions(-)
>  delete mode 100644 package/assimp/0001-Fix-leak-5762.patch
>  delete mode 100644 package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
>  delete mode 100644 package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
>  delete mode 100644 package/assimp/0004-MDL-limit-max-texture-sizes.patch
> 
> diff --git a/package/assimp/0001-Fix-leak-5762.patch b/package/assimp/0001-Fix-leak-5762.patch
> deleted file mode 100644
> index a78970e1d3..0000000000
> --- a/package/assimp/0001-Fix-leak-5762.patch
> +++ /dev/null
> @@ -1,139 +0,0 @@
> -From 4024726eca89331503bdab33d0b9186e901bbc45 Mon Sep 17 00:00:00 2001
> -From: Kim Kulling <kimkulling@users.noreply.github.com>
> -Date: Sat, 7 Sep 2024 21:02:34 +0200
> -Subject: [PATCH] Fix leak (#5762)
> -
> -* Fix leak
> -
> -* Update utLogger.cpp
> -
> -Upstream: https://github.com/assimp/assimp/commit/4024726eca89331503bdab33d0b9186e901bbc45
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - code/Common/Assimp.cpp        | 13 ++++++---
> - fuzz/assimp_fuzzer.cc         |  2 +-
> - test/CMakeLists.txt           |  1 +
> - test/unit/Common/utLogger.cpp | 52 +++++++++++++++++++++++++++++++++++
> - 4 files changed, 63 insertions(+), 5 deletions(-)
> - create mode 100644 test/unit/Common/utLogger.cpp
> -
> -diff --git a/code/Common/Assimp.cpp b/code/Common/Assimp.cpp
> -index ef3ee7b5d..91896e405 100644
> ---- a/code/Common/Assimp.cpp
> -+++ b/code/Common/Assimp.cpp
> -@@ -359,20 +359,25 @@ void CallbackToLogRedirector(const char *msg, char *dt) {
> -     s->write(msg);
> - }
> - 
> -+static LogStream *DefaultStream = nullptr;
> -+
> - // ------------------------------------------------------------------------------------------------
> - ASSIMP_API aiLogStream aiGetPredefinedLogStream(aiDefaultLogStream pStream, const char *file) {
> -     aiLogStream sout;
> - 
> -     ASSIMP_BEGIN_EXCEPTION_REGION();
> --    LogStream *stream = LogStream::createDefaultStream(pStream, file);
> --    if (!stream) {
> -+    if (DefaultStream == nullptr) {
> -+        DefaultStream = LogStream::createDefaultStream(pStream, file);
> -+    }
> -+    
> -+    if (!DefaultStream) {
> -         sout.callback = nullptr;
> -         sout.user = nullptr;
> -     } else {
> -         sout.callback = &CallbackToLogRedirector;
> --        sout.user = (char *)stream;
> -+        sout.user = (char *)DefaultStream;
> -     }
> --    gPredefinedStreams.push_back(stream);
> -+    gPredefinedStreams.push_back(DefaultStream);
> -     ASSIMP_END_EXCEPTION_REGION(aiLogStream);
> -     return sout;
> - }
> -diff --git a/fuzz/assimp_fuzzer.cc b/fuzz/assimp_fuzzer.cc
> -index 8178674e8..91ffd9d69 100644
> ---- a/fuzz/assimp_fuzzer.cc
> -+++ b/fuzz/assimp_fuzzer.cc
> -@@ -47,7 +47,7 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> - using namespace Assimp;
> - 
> - extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t dataSize) {
> --    aiLogStream stream = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT,NULL);
> -+    aiLogStream stream = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
> -     aiAttachLogStream(&stream);
> - 
> -     Importer importer;
> -diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
> -index 7b7fd850a..1a45adac7 100644
> ---- a/test/CMakeLists.txt
> -+++ b/test/CMakeLists.txt
> -@@ -100,6 +100,7 @@ SET( COMMON
> -   unit/Common/utBase64.cpp
> -   unit/Common/utHash.cpp
> -   unit/Common/utBaseProcess.cpp
> -+  unit/Common/utLogger.cpp
> - )
> - 
> - SET(Geometry 
> -diff --git a/test/unit/Common/utLogger.cpp b/test/unit/Common/utLogger.cpp
> -new file mode 100644
> -index 000000000..932240a7f
> ---- /dev/null
> -+++ b/test/unit/Common/utLogger.cpp
> -@@ -0,0 +1,52 @@
> -+/*
> -+---------------------------------------------------------------------------
> -+Open Asset Import Library (assimp)
> -+---------------------------------------------------------------------------
> -+
> -+Copyright (c) 2006-2024, assimp team
> -+
> -+All rights reserved.
> -+
> -+Redistribution and use of this software in source and binary forms,
> -+with or without modification, are permitted provided that the following
> -+conditions are met:
> -+
> -+* Redistributions of source code must retain the above
> -+copyright notice, this list of conditions and the
> -+following disclaimer.
> -+
> -+* Redistributions in binary form must reproduce the above
> -+copyright notice, this list of conditions and the
> -+following disclaimer in the documentation and/or other
> -+materials provided with the distribution.
> -+
> -+* Neither the name of the assimp team, nor the names of its
> -+contributors may be used to endorse or promote products
> -+derived from this software without specific prior
> -+written permission of the assimp team.
> -+
> -+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> -+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> -+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> -+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> -+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> -+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> -+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> -+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> -+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> -+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> -+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -+---------------------------------------------------------------------------
> -+*/
> -+
> -+#include "UnitTestPCH.h"
> -+#include <assimp/Importer.hpp>
> -+
> -+using namespace Assimp;
> -+class utLogger : public ::testing::Test {};
> -+
> -+TEST_F(utLogger, aiGetPredefinedLogStream_leak_test) {
> -+    aiLogStream stream1 = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
> -+    aiLogStream stream2 = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT, nullptr);
> -+    ASSERT_EQ(stream1.callback, stream2.callback);
> -+}
> --- 
> -2.39.5
> -
> diff --git a/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch b/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
> deleted file mode 100644
> index c4cd2af5aa..0000000000
> --- a/package/assimp/0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From f12e52198669239af525e525ebb68407977f8e34 Mon Sep 17 00:00:00 2001
> -From: tyler92 <tyler92@inbox.ru>
> -Date: Wed, 11 Dec 2024 12:17:14 +0200
> -Subject: [PATCH] Fix use after free in the CallbackToLogRedirector (#5918)
> -
> -The heap-use-after-free vulnerability occurs in the
> -CallbackToLogRedirector function. During the process of logging,
> -a previously freed memory region is accessed, leading to a
> -use-after-free condition. This vulnerability stems from incorrect
> -memory management, specifically, freeing a log stream and then
> -attempting to access it later on.
> -
> -This patch sets NULL value for The DefaultStream global pointer.
> -
> -Co-authored-by: Kim Kulling <kimkulling@users.noreply.github.com>
> -Upstream: https://github.com/assimp/assimp/commit/f12e52198669239af525e525ebb68407977f8e34
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - code/Common/Assimp.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/code/Common/Assimp.cpp b/code/Common/Assimp.cpp
> -index 91896e405..22e16bd36 100644
> ---- a/code/Common/Assimp.cpp
> -+++ b/code/Common/Assimp.cpp
> -@@ -416,6 +416,10 @@ ASSIMP_API aiReturn aiDetachLogStream(const aiLogStream *stream) {
> -     DefaultLogger::get()->detachStream(it->second);
> -     delete it->second;
> - 
> -+    if ((Assimp::LogStream *)stream->user == DefaultStream) {
> -+        DefaultStream = nullptr;
> -+    }
> -+
> -     gActiveLogStreams.erase(it);
> - 
> -     if (gActiveLogStreams.empty()) {
> --- 
> -2.39.5
> -
> diff --git a/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
> deleted file mode 100644
> index 427b7a4888..0000000000
> --- a/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 65c95bf3207b81fe522811d45780d72ed41d9c1e Mon Sep 17 00:00:00 2001
> -From: Kim Kulling <kim.kulling@googlemail.com>
> -Date: Wed, 12 Mar 2025 20:17:38 +0100
> -Subject: [PATCH] ASE: Fix possible out of bound access.
> -
> -Upstream: https://github.com/assimp/assimp/pull/6045
> -
> -CVE: CVE-2025-3015
> -
> -Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ----
> - code/AssetLib/ASE/ASELoader.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/code/AssetLib/ASE/ASELoader.cpp b/code/AssetLib/ASE/ASELoader.cpp
> -index eb6b37dc9b..c63edcf6bf 100644
> ---- a/code/AssetLib/ASE/ASELoader.cpp
> -+++ b/code/AssetLib/ASE/ASELoader.cpp
> -@@ -731,6 +731,10 @@ void ASEImporter::BuildUniqueRepresentation(ASE::Mesh &mesh) {
> -     unsigned int iCurrent = 0, fi = 0;
> -     for (std::vector<ASE::Face>::iterator i = mesh.mFaces.begin(); i != mesh.mFaces.end(); ++i, ++fi) {
> -         for (unsigned int n = 0; n < 3; ++n, ++iCurrent) {
> -+            const uint32_t curIndex = (*i).mIndices[n];
> -+            if (curIndex >= mesh.mPositions.size()) {
> -+                throw DeadlyImportError("ASE: Invalid vertex index in face ", fi, ".");
> -+            }
> -             mPositions[iCurrent] = mesh.mPositions[(*i).mIndices[n]];
> - 
> -             // add texture coordinates
> diff --git a/package/assimp/0004-MDL-limit-max-texture-sizes.patch b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
> deleted file mode 100644
> index ae7e54f35d..0000000000
> --- a/package/assimp/0004-MDL-limit-max-texture-sizes.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 5d2a7482312db2e866439a8c05a07ce1e718bed1 Mon Sep 17 00:00:00 2001
> -From: Kim Kulling <kimkulling@users.noreply.github.com>
> -Date: Wed, 12 Mar 2025 21:29:33 +0100
> -Subject: [PATCH] MDL: Limit max texture sizes
> -
> -- closes https://github.com/assimp/assimp/issues/6022
> -
> -Upstream: https://github.com/assimp/assimp/pull/6046
> -
> -CVE: CVE-2025-3016
> -
> -Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ----
> - code/AssetLib/MDL/MDLMaterialLoader.cpp | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/code/AssetLib/MDL/MDLMaterialLoader.cpp b/code/AssetLib/MDL/MDLMaterialLoader.cpp
> -index 2cac8a1e26..2e09992e89 100644
> ---- a/code/AssetLib/MDL/MDLMaterialLoader.cpp
> -+++ b/code/AssetLib/MDL/MDLMaterialLoader.cpp
> -@@ -209,6 +209,8 @@ void MDLImporter::CreateTexture_3DGS_MDL4(const unsigned char *szData,
> -     return;
> - }
> - 
> -+static const uint32_t MaxTextureSize = 4096;
> -+
> - // ------------------------------------------------------------------------------------------------
> - // Load color data of a texture and convert it to our output format
> - void MDLImporter::ParseTextureColorData(const unsigned char *szData,
> -@@ -219,6 +221,11 @@ void MDLImporter::ParseTextureColorData(const unsigned char *szData,
> - 
> -     // allocate storage for the texture image
> -     if (do_read) {
> -+        // check for max texture sizes
> -+        if (pcNew->mWidth > MaxTextureSize || pcNew->mHeight > MaxTextureSize) {
> -+            throw DeadlyImportError("Invalid MDL file. A texture is too big.");
> -+        }
> -+      
> -         if(pcNew->mWidth != 0 && pcNew->mHeight > UINT_MAX/pcNew->mWidth) {
> -             throw DeadlyImportError("Invalid MDL file. A texture is too big.");
> -         }
> diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
> index bdcab695fc..93c081351e 100644
> --- a/package/assimp/assimp.hash
> +++ b/package/assimp/assimp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  66dfbaee288f2bc43172440a55d0235dfc7bf885dda6435c038e8000e79582cb  assimp-5.4.3.tar.gz
> +sha256  d1822d9a19c9205d6e8bc533bf897174ddb360ce504680f294170cc1d6319751  assimp-6.0.2.tar.gz
>  sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index 39ad234546..dd61b69ca2 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASSIMP_VERSION = 5.4.3
> +ASSIMP_VERSION = 6.0.2
>  ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
>  ASSIMP_LICENSE = BSD-3-Clause
>  ASSIMP_LICENSE_FILES = LICENSE
> @@ -12,16 +12,6 @@ ASSIMP_CPE_ID_VENDOR = assimp
>  ASSIMP_DEPENDENCIES = zlib
>  ASSIMP_INSTALL_STAGING = YES
>  
> -# 0001-Fix-leak-5762.patch
> -# 0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
> -ASSIMP_IGNORE_CVES += CVE-2024-48423
> -
> -# 0003-ASE-fix-possible-out-of-bound-access.patch
> -ASSIMP_IGNORE_CVES += CVE-2025-3015
> -
> -# 0004-MDL-limit-max-texture-sizes.patch
> -ASSIMP_IGNORE_CVES += CVE-2025-3016
> -
>  # relocation truncated to fit: R_68K_GOT16O. We also need to disable
>  # optimizations to not run into "Error: value -43420 out of range"
>  # assembler issues.
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
