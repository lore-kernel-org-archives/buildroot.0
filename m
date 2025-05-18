Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6650C3DA6D
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C685140126;
	Sun, 18 May 2025 12:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSML6A6dvU1H; Sun, 18 May 2025 12:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C4940866
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9C4940866;
	Sun, 18 May 2025 12:11:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B368EDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 995A440ACE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQ0mZdkJHNYH for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D164540142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D164540142
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D164540142
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F15431C0FC0; Sun, 18 May 2025 14:11:37 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 18 May 2025 14:11:30 +0200
Message-ID: <20250518121131.2821530-3-arnout@rnout.be>
In-Reply-To: <20250518121131.2821530-1-arnout@rnout.be>
References: <20250518121131.2821530-1-arnout@rnout.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747570298; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=8ECS11fc+dVWF1h9JXBPldC6Aw7SOPTvvxpwLQ8fHkU=;
 b=lUAfRemVLh517sCfniAmsmL0dx7HuNb4sSI2kMjvlZjaBReo5g2Yssp5svJZMcXu+z/hGe
 1yW3kyCe1NRvMWpaqEq8lpzK7k9E17wVii1mjmJga8R4bHCZ8aeusJjeYXvglkdGMCnK1W
 3u6apjlK2XAp5JcjdW9g4IrT5DOj1tD2APtv52JRnhwZIfoBkaG8JI7TbJY8zOWI/mXh/S
 BXncWqrB5kMGcOnwuojYvr/CWoWUYeXT+484PC3yYHQEewJd2IajYs0VFaxoXhU0eBCJab
 O1PkZTP5byVv6ulhRtsfEZGxtdl3uRoGzc1h82u9/DV8mgwcWNQiZf2tPYLkwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lUAfRemV
Subject: [Buildroot] [PATCH 2/3] package/qt5/qt5webengine-chromium: fix
 build with host GCC 15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ideally we should update our version of qt5webengine-chromium first,
we're more than 600 commits behind on the stable branch from KDE.
However, this is a quick fix solution that allows us to build the
current state in Fedora 42.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...de-cstdint-for-uintptr_t-uint8_t-etc.patch | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 package/qt5/qt5webengine-chromium/0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch

diff --git a/package/qt5/qt5webengine-chromium/0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch b/package/qt5/qt5webengine-chromium/0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
new file mode 100644
index 00000000000..f68f266e39c
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
@@ -0,0 +1,101 @@
+From 80ddc04dd2398611afd8eafd89f5a6cd81b82363 Mon Sep 17 00:00:00 2001
+From: Arnout Vandecappelle <arnout@rnout.be>
+Date: Sun, 18 May 2025 09:59:24 +0200
+Subject: [PATCH] Include <cstdint> for uintptr_t, uint8_t, etc.
+
+GCC 15 adheres more strictly to the standard about which type is defined
+in which header. As such, uintptr_t, uint8_t, etc. are  no longer
+available unless cstdint is included.
+
+Add #include <cstdint> in the files that gave errors with GCC 15
+
+Most (all?) of these fixes are already upstream, but spread out over
+various commits that don't necessarily apply to our version. Fixing it
+ourselves is simpler.
+
+Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
+Upstream: N/A, already fixed and we're very far behind
+---
+ chromium/base/task/thread_pool.h                                 | 1 +
+ chromium/net/tools/huffman_trie/trie_entry.h                     | 1 +
+ .../transport_security_state_entry.h                             | 1 +
+ .../perfetto/include/perfetto/ext/tracing/core/slice.h           | 1 +
+ .../perfetto/include/perfetto/tracing/tracing_backend.h          | 1 +
+ .../perfetto/src/trace_processor/importers/gzip/gzip_utils.h     | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/chromium/base/task/thread_pool.h b/chromium/base/task/thread_pool.h
+index 085c249ba58e6..afc674ca7f6fb 100644
+--- a/chromium/base/task/thread_pool.h
++++ b/chromium/base/task/thread_pool.h
+@@ -5,6 +5,7 @@
+ #ifndef BASE_TASK_THREAD_POOL_H_
+ #define BASE_TASK_THREAD_POOL_H_
+ 
++#include <cstdint>
+ #include <memory>
+ #include <utility>
+ 
+diff --git a/chromium/net/tools/huffman_trie/trie_entry.h b/chromium/net/tools/huffman_trie/trie_entry.h
+index fe70260f981f2..eac6a7fc2499d 100644
+--- a/chromium/net/tools/huffman_trie/trie_entry.h
++++ b/chromium/net/tools/huffman_trie/trie_entry.h
+@@ -5,6 +5,7 @@
+ #ifndef NET_TOOLS_HUFFMAN_TRIE_TRIE_ENTRY_H_
+ #define NET_TOOLS_HUFFMAN_TRIE_TRIE_ENTRY_H_
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
+diff --git a/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h b/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h
+index 59059d88f6df2..fe15bb7429f6d 100644
+--- a/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h
++++ b/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h
+@@ -5,6 +5,7 @@
+ #ifndef NET_TOOLS_TRANSPORT_SECURITY_STATE_GENERATOR_TRANSPORT_SECURITY_STATE_ENTRY_H_
+ #define NET_TOOLS_TRANSPORT_SECURITY_STATE_GENERATOR_TRANSPORT_SECURITY_STATE_ENTRY_H_
+ 
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <string>
+diff --git a/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h b/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h
+index 4ce66fdeadc3a..3f3932b228737 100644
+--- a/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h
++++ b/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h
+@@ -20,6 +20,7 @@
+ #include <stddef.h>
+ #include <string.h>
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
+diff --git a/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h b/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h
+index 67b0d2eb51e0d..3c2462de588dd 100644
+--- a/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h
++++ b/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h
+@@ -17,6 +17,7 @@
+ #ifndef INCLUDE_PERFETTO_TRACING_TRACING_BACKEND_H_
+ #define INCLUDE_PERFETTO_TRACING_TRACING_BACKEND_H_
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
+diff --git a/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h b/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h
+index 624363ff66f90..68783e879c8e0 100644
+--- a/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h
++++ b/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h
+@@ -18,6 +18,7 @@
+ #define SRC_TRACE_PROCESSOR_IMPORTERS_GZIP_GZIP_UTILS_H_
+ 
+ #include <memory>
++#include <cstdint>
+ 
+ struct z_stream_s;
+ 
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
