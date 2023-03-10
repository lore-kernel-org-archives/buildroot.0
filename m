Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523A2C6FD1E
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3C9141764;
	Fri, 10 Mar 2023 21:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3C9141764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-Kf7kTFrnUG; Fri, 10 Mar 2023 21:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EEC741748;
	Fri, 10 Mar 2023 21:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EEC741748
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 950941BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F78760FE1
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F78760FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcQsmB60BwNQ for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 21:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F84F6060A
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 21:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F84F6060A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E7A286E49; Fri, 10 Mar 2023 21:01:03 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 21:59:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1623664253853208773b7318165189b5cf94867
X-Git-Newrev: 3279d8b9c45572f9c435ba0b356c2ec7f1fa85f3
X-Patchwork-Hint: ignore
Message-Id: <20230310210103.7E7A286E49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rdma-core: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=3279d8b9c45572f9c435ba0b356c2ec7f1fa85f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rdma-core unconditionally uses pthread_spin_lock since its addition in
commit ea47e177f093d7378e8e8e1f50d6f4e3fce0a088 resulting in the
following build failure:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/sh4-buildroot-linux-uclibc/12.2.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: CMakeFiles/hfi1verbs-rdmav34.dir/verbs.c.o: in function `post_recv':
verbs.c:(.text+0xc4): undefined reference to `pthread_spin_lock'

Fixes:
 - http://autobuild.buildroot.org/results/a943e03b79c4cc328b7712046ecff09706045f81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/rdma-core/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rdma-core/Config.in b/package/rdma-core/Config.in
index 59f5ef63ae..3360e6873d 100644
--- a/package/rdma-core/Config.in
+++ b/package/rdma-core/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_RDMA_CORE
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4  # iproute2
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_IPROUTE2  # runtime
 	select BR2_PACKAGE_LIBNL
 	help
@@ -13,8 +13,8 @@ config BR2_PACKAGE_RDMA_CORE
 
 	  https://github.com/linux-rdma/rdma-core
 
-comment "rdma-core needs a toolchain w/ headers >= 3.4, threads, dynamic library"
+comment "rdma-core needs a toolchain w/ headers >= 3.4, NPTL, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
