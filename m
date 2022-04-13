Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1404C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EE5F401F1;
	Wed, 13 Apr 2022 08:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiH95rZk66ah; Wed, 13 Apr 2022 08:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F0EF404C5;
	Wed, 13 Apr 2022 08:12:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF28B1BF403
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B81060E2E
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNIvuUtO61nJ for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E698460A82
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EFCBE83C12; Wed, 13 Apr 2022 08:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 09:47:29 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9da87c52934842026918b9eb8511b35cd935c552
X-Git-Newrev: 17440cadf9d5f0da60505d3ddaeb1ceefddead05
X-Patchwork-Hint: ignore
Message-Id: <20220413080256.EFCBE83C12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rt-tests: needs
 __sync_*_4 intrisics
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

commit: https://git.buildroot.net/buildroot/commit/?id=17440cadf9d5f0da60505d3ddaeb1ceefddead05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

rt-tests needs __sync_*_4 intrisics since bump to version 1.9 in commit
32be34427956a590d07d12e965f97fa9d2110ae9 and
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=c86dec5765e1ad0bd1d0c429ca7c138c11da2c80:

oslat.c:(.text+0x1034): undefined reference to `__sync_add_and_fetch_4'

Fixes:
 - http://autobuild.buildroot.org/results/9b065ee7611db3a404863b85161f46a2e9e8ddad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 24d2bc3b1c747fbeb100fa79dfcd9f3645b98dd3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 47fa7cd840..8efa3d194e 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU # fork(), numactl
@@ -30,6 +31,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
