Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D0CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D63C81A4E;
	Tue, 12 Apr 2022 18:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIwt-lKq0u9f; Tue, 12 Apr 2022 18:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5367B81826;
	Tue, 12 Apr 2022 18:33:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534F11BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE9D41739
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id im34ktuRyX9G for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6FD41737
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 80BF2822ED; Tue, 12 Apr 2022 18:23:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 20:17:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e9d9b22797de25e5f6e1249a46258544ae6279f
X-Git-Newrev: 24d2bc3b1c747fbeb100fa79dfcd9f3645b98dd3
X-Patchwork-Hint: ignore
Message-Id: <20220412182311.80BF2822ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rt-tests: needs __sync_*_4
 intrisics
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

commit: https://git.buildroot.net/buildroot/commit/?id=24d2bc3b1c747fbeb100fa79dfcd9f3645b98dd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rt-tests needs __sync_*_4 intrisics since bump to version 1.9 in commit
32be34427956a590d07d12e965f97fa9d2110ae9 and
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=c86dec5765e1ad0bd1d0c429ca7c138c11da2c80:

oslat.c:(.text+0x1034): undefined reference to `__sync_add_and_fetch_4'

Fixes:
 - http://autobuild.buildroot.org/results/9b065ee7611db3a404863b85161f46a2e9e8ddad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
