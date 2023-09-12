Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA3CEE3F00
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74D5B82266;
	Tue, 12 Sep 2023 18:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D5B82266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvS-k51ZUxkd; Tue, 12 Sep 2023 18:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA1E88227C;
	Tue, 12 Sep 2023 18:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA1E88227C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 869C81BF2A5
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F4BF414A1
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4BF414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iahv4l4eF0cP for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:30:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 892E741714
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892E741714
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A97D86906; Tue, 12 Sep 2023 18:30:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 20:18:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2414c25a076df1186da62e4b40aca52894f25fac
X-Git-Newrev: c11ea29c8a9e5c42e301f690827d6cc068210d71
X-Patchwork-Hint: ignore
Message-Id: <20230912183042.6A97D86906@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/perftest: fix
 unmet direct dependencies
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c11ea29c8a9e5c42e301f690827d6cc068210d71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Since it was introduced in commit d4ecefa3ccbe (package/perftest: new
package), perftest was missing the reverse dependency on the kernel
headers version inherited from rdma-core.

In commit 3279d8b9c455 (package/rdma-core: needs NPTL), the dependency
of rdma-core on NTPL was not propagated to its reverse dependencies,
notably perftests.

Fixes:
  - http://autobuild.buildroot.net/results/00c/00ce19a1589c6028ee77c333ed9107e2c8c8d6de
  - d4ecefa3ccbe
  - 3279d8b9c455

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[yann.morin.1998@free.fr:
  - also add misisng headers dependency
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 00cb5f5e4ab9c6b7dc6a8d4c70648dd2f0cf7eca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perftest/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perftest/Config.in b/package/perftest/Config.in
index 25cd1a9b8d..6d291b0f72 100644
--- a/package/perftest/Config.in
+++ b/package/perftest/Config.in
@@ -20,7 +20,8 @@ config BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
 config BR2_PACKAGE_PERFTEST
 	bool "perftest"
 	depends on BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # rdma-core
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # rdma-core
 	depends on !BR2_STATIC_LIBS # rdma-core
 	# musl does not define sysconf(_SC_LEVEL1_DCACHE_LINESIZE)
 	depends on !BR2_TOOLCHAIN_USES_MUSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
