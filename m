Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B89BD149D9
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D80F80C1F;
	Fri, 25 Oct 2024 17:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXO606dV8XUM; Fri, 25 Oct 2024 17:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E23681D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E23681D5F;
	Fri, 25 Oct 2024 17:52:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF94281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E2AD40BEB
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSE5_VKLAdQ7 for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A1F40E8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0A1F40E8C
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:51:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CADA48373B; Fri, 25 Oct 2024 17:51:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 19:36:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d91624ad47628a0e67028add157ff9d72d05de85
X-Git-Newrev: f634043b29c7009cca02516e181d55bb589045c4
X-Patchwork-Hint: ignore
Message-Id: <20241025175157.CADA48373B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: fix build by removing
 unneeded package patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=f634043b29c7009cca02516e181d55bb589045c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gnuradio package patch 0001 was introduced in commit 81e6541ef
"package/gnuradio: fix build with fmt >= 11.x" [1] while Buildroot
was in a release client stabilization branch.
It was first in included in the 2024.08-rc2 tag. This is why the
gnuradio version was _not_ bumped at that time.

At the same time, the gnuradio package was also broken in the "next"
branch for the same reason. It was fixed by bumping the gnuradio
version in commit 101e7b69d "package/gnuradio: bump version to
3.10.11.0" [2] which contained the 0001 patch.

Both commits [1] and [2] are individually working. The gnuradio
package fails to build since the merge commit 3daa03752 "Merge branch
'next'" [3].

This commit fixes the issue by removing the package patch.

Fixes:
- http://autobuild.buildroot.org/results/dfda705bb1b3b975bde3d84c6b25a9b41c545c84
- http://autobuild.buildroot.org/results/7c32bd40b5e1420535734480bf5a4d4365b8896f
- https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800399

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/81e6541efe054df635947d0c143818f8cf7cb048
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/101e7b69da88148fa8333af05444e47bae631833
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/3daa037528c38b91caf616cb47992da7730f4343

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ime-io_signature-include-spdlog-ranges.h-.patch | 38 ----------------------
 1 file changed, 38 deletions(-)

diff --git a/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch b/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
deleted file mode 100644
index 6a08b8edee..0000000000
--- a/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 03c9a40883e610e54b8fc3c3ce1842d68d7ce2e4 Mon Sep 17 00:00:00 2001
-From: Kefu Chai <tchaikov@gmail.com>
-Date: Mon, 15 Jul 2024 09:27:16 +0800
-Subject: [PATCH] blocks,runtime: io_signature: include spdlog/*/ranges.h for
- using fmt::join()
-
-fmt::join() was moved into fmt/ranges.h since fmt 11, so let's
-include the corresponding header in spdlog for using it.
-
-Signed-off-by: Kefu Chai <tchaikov@gmail.com>
-(cherry picked from commit 19b070051c1c2b5fb6f2da8fb6422b27418c3dfa)
-Signed-off-by: Jeff Long <willcode4@gmail.com>
-Upstream: https://github.com/gnuradio/gnuradio/commit/ead459813367e7fd679dad067d1b020010d49b4f
-[Julien: backported commit ead45981 from v3.10.11.0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- gr-blocks/lib/message_debug_impl.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/gr-blocks/lib/message_debug_impl.cc b/gr-blocks/lib/message_debug_impl.cc
-index 1e81aec0d..415d2be97 100644
---- a/gr-blocks/lib/message_debug_impl.cc
-+++ b/gr-blocks/lib/message_debug_impl.cc
-@@ -14,6 +14,11 @@
- #include <pmt/pmt.h>
- #include <spdlog/common.h>
- #include <spdlog/fmt/fmt.h>
-+#if __has_include(<spdlog/fmt/ranges.h>)
-+#include <spdlog/fmt/ranges.h>
-+#elif __has_include(<spdlog/fmt/bundled/ranges.h>)
-+#include <spdlog/fmt/bundled/ranges.h>
-+#endif
- #include <functional>
- #include <utility>
- #include <vector>
--- 
-2.46.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
