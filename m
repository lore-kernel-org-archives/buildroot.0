Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B459CD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B506610F0;
	Sun, 17 Sep 2023 12:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B506610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEoDyGROs9A0; Sun, 17 Sep 2023 12:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F076E610EE;
	Sun, 17 Sep 2023 12:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F076E610EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0981BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77D62610F0
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D62610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jAhxMNIvbkO for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B35D1610EF
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B35D1610EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D37387140; Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 14:35:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 094c76a2bcd301e4aa1e27c9694314079440ce5b
X-Git-Newrev: 7691377873f26d2e8e7c3bcd2f1dcb0ea0712ce7
X-Patchwork-Hint: ignore
Message-Id: <20230917123755.9D37387140@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=7691377873f26d2e8e7c3bcd2f1dcb0ea0712ce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with uclibc but without MMU raised since
commit 223596c75d73a7eb29152235d3c5d9bf53bd58f5:

/home/autobuild/autobuild/instance-6/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: ./.libs/libcrun.a(libcrun_la-container.o): in function `.L0 ':
container.c:(.text+0x4e7c): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/f19482753e9262ec806cf550619170467a144daf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/crun/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index 1b69034459..f6a1ec7c66 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_YAJL # libocispec
@@ -9,5 +10,6 @@ config BR2_PACKAGE_CRUN
 	  https://github.com/containers/crun
 
 comment "crun needs a glibc or musl toolchain, gcc >= 4.9"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
