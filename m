Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BDEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2513940525;
	Thu, 30 Dec 2021 12:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbqMboOtS5OQ; Thu, 30 Dec 2021 12:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EEC2400F3;
	Thu, 30 Dec 2021 12:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDE871C113E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB6EF410E1
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGLNcZRDLEGY for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00A3E410DC
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3387182DB1; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c709ecd36bb62626f851a15f708598a7ac7baeae
X-Git-Newrev: b605caf3d89d031109728bd5707a4e50325c7804
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.3387182DB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rt-tests: needs kernel >= 4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b605caf3d89d031109728bd5707a4e50325c7804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rt-tests unconditionally uses CGROUP2_SUPER_MAGIC since
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=47e857d4bf77440cb59d17c6ed7882a48514f18d
which is only available since kernel 4.5 and
https://github.com/torvalds/linux/commit/67e9c74b8a873408c27ac9a8e4c1d1c8d72c93ff
resulting in the following build failure since bump to version 2.3 in
commit a952b016263cb9ae5f116dac0b3da4ad93a4c55f:

src/sched_deadline/cyclicdeadline.c:381:29: error: 'CGROUP2_SUPER_MAGIC' undeclared (first use in this function)
  ret = mounted(CGROUP_PATH, CGROUP2_SUPER_MAGIC);
                             ^

Fixes:
 - http://autobuild.buildroot.org/results/74766c215a6cc19cd02faec6181ccd5de49c15cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rt-tests/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 477fa288d7..47fa7cd840 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # deadline scheduler syscall
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU # fork(), numactl
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
@@ -29,7 +29,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dynamic library"
+comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
