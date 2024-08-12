Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BA4C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECCE680CB9;
	Mon, 12 Aug 2024 20:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ny_mX6XibEsw; Mon, 12 Aug 2024 20:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D0780DA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D0780DA0;
	Mon, 12 Aug 2024 20:52:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1661BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECD0840393
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wyv7SY52II3j for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE59D4038A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE59D4038A
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:52:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9EA285615; Mon, 12 Aug 2024 20:52:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 22:50:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 904acfc41e1464848daf0240251e7701954c4918
X-Git-Newrev: 81e6541efe054df635947d0c143818f8cf7cb048
X-Patchwork-Hint: ignore
Message-Id: <20240812205212.D9EA285615@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: fix build with fmt >=
 11.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=81e6541efe054df635947d0c143818f8cf7cb048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ime-io_signature-include-spdlog-ranges.h-.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
