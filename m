Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B90C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 20:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4917812AF;
	Sat, 10 Aug 2024 20:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xI__85NpP5oy; Sat, 10 Aug 2024 20:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48C248113D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48C248113D;
	Sat, 10 Aug 2024 20:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4FA01BF48D
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE28540167
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 20:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSVAilvS6Wtt for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 20:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61045400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61045400D0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61045400D0
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 20:05:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D4435B0051E;
 Sat, 10 Aug 2024 22:05:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 22:05:28 +0200
Message-ID: <20240810200528.762941-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723320336;
 bh=60olG6OpE336t9mhuWFST48NCsCZkW8cE6Xc9XUwNnA=;
 h=From:To:Cc:Subject:Date:From;
 b=gM3ZjzJC5xE89CSeWvpkd/99Hi3VJSIDSTP7FOlDBRP63Y7fuyZLen95RfJtf+plv
 2x5ez2A0xOVaBjrIw4gOlm7MaxGVVxCxIY/90H6MfNvH7V4HndP5PqHKjVg5vHRqN5
 DchJFvEwW+8dfBKg3IBagXrtR0L1V7WZJXgox/YavK9rMYq7L0Vo+pis5lQqahqke2
 +JX7JIcU2QCrGyqUVlzZIX+8mpLXt2Rm1i0MB5URz4FmIooPCsThhy1T+UaRkkS8CM
 y0MCSHNHhBROlssIrnwsPnSN2GqzzEx4vS/zU8c5weDgJY3tYew9/aXamFz86wXKZq
 AgDswd2wEINuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gM3ZjzJC
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: fix build with fmt >= 11.x
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
Cc: Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gnuradio is failing to build since commit 6b86f076c3 "package/fmt: bump
to version 11.0.1" with output:

    /build/gnuradio-3.10.7.0/gr-blocks/lib/message_debug_impl.cc: In member function 'void gr::blocks::message_debug_impl::log(const pmt::pmt_t&)':
    /build/gnuradio-3.10.7.0/gr-blocks/lib/message_debug_impl.cc:65:44: error: 'join' is not a member of 'fmt'
       65 |                                       fmt::join(begin, begin + output_length, " "),
          |                                            ^~~~

This commit adds a backported upstream patch to fix the issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7540345284
http://autobuild.buildroot.org/results/4c92949ef74a119d9a70e4fdd55af05a66580b0c/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7551460731
---
 ...o_signature-include-spdlog-ranges.h-.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch

diff --git a/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch b/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
new file mode 100644
index 0000000000..6a08b8edee
--- /dev/null
+++ b/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
@@ -0,0 +1,38 @@
+From 03c9a40883e610e54b8fc3c3ce1842d68d7ce2e4 Mon Sep 17 00:00:00 2001
+From: Kefu Chai <tchaikov@gmail.com>
+Date: Mon, 15 Jul 2024 09:27:16 +0800
+Subject: [PATCH] blocks,runtime: io_signature: include spdlog/*/ranges.h for
+ using fmt::join()
+
+fmt::join() was moved into fmt/ranges.h since fmt 11, so let's
+include the corresponding header in spdlog for using it.
+
+Signed-off-by: Kefu Chai <tchaikov@gmail.com>
+(cherry picked from commit 19b070051c1c2b5fb6f2da8fb6422b27418c3dfa)
+Signed-off-by: Jeff Long <willcode4@gmail.com>
+Upstream: https://github.com/gnuradio/gnuradio/commit/ead459813367e7fd679dad067d1b020010d49b4f
+[Julien: backported commit ead45981 from v3.10.11.0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ gr-blocks/lib/message_debug_impl.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gr-blocks/lib/message_debug_impl.cc b/gr-blocks/lib/message_debug_impl.cc
+index 1e81aec0d..415d2be97 100644
+--- a/gr-blocks/lib/message_debug_impl.cc
++++ b/gr-blocks/lib/message_debug_impl.cc
+@@ -14,6 +14,11 @@
+ #include <pmt/pmt.h>
+ #include <spdlog/common.h>
+ #include <spdlog/fmt/fmt.h>
++#if __has_include(<spdlog/fmt/ranges.h>)
++#include <spdlog/fmt/ranges.h>
++#elif __has_include(<spdlog/fmt/bundled/ranges.h>)
++#include <spdlog/fmt/bundled/ranges.h>
++#endif
+ #include <functional>
+ #include <utility>
+ #include <vector>
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
