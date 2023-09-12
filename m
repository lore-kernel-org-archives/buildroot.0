Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5F0EE3F00
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA74C81297;
	Tue, 12 Sep 2023 18:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA74C81297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDk-Zl3eSpD8; Tue, 12 Sep 2023 18:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34EB782065;
	Tue, 12 Sep 2023 18:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34EB782065
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C617C1BF97A
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC28960ADE
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC28960ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fw9mGTqKYOZ1 for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA26D60AB0
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA26D60AB0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C68B786701; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 20:17:20 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: ee9a11bb440ced8bbcc614ab0fb8a5ee493dfd00
X-Git-Newrev: 4d50613e86ff2e3f42dc0563bdca839031b0e0e7
X-Patchwork-Hint: ignore
Message-Id: <20230912182931.C68B786701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/perftest: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d50613e86ff2e3f42dc0563bdca839031b0e0e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
