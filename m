Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D7BEE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7089940B71;
	Mon, 21 Aug 2023 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7089940B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmoiKw_Ah31x; Mon, 21 Aug 2023 20:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE44A40B72;
	Mon, 21 Aug 2023 20:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE44A40B72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 085B31BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFECA61112
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFECA61112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeTOr8pYGMAr for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 195E36111C
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 195E36111C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0831C86026; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 12:51:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0d2a5cfec0ade7cb577cbff25aac289e746e61b
X-Git-Newrev: 00cb5f5e4ab9c6b7dc6a8d4c70648dd2f0cf7eca
X-Patchwork-Hint: ignore
Message-Id: <20230821200127.0831C86026@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perftest: fix unmet
 direct dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=00cb5f5e4ab9c6b7dc6a8d4c70648dd2f0cf7eca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since it was iontroduced in commit d4ecefa3ccbe (package/perftest: new
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
