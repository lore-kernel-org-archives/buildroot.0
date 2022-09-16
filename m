Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD8BC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 14:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC8DC417D7;
	Fri, 16 Sep 2022 14:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC8DC417D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERouMHeiIPvT; Fri, 16 Sep 2022 14:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E27DB402E1;
	Fri, 16 Sep 2022 14:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E27DB402E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36F531C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 14:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 114A841848
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 14:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114A841848
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htKvXVKbBUNP for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 14:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E860A41824
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 14:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E860A41824
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D6C2583D78; Fri, 16 Sep 2022 14:12:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 16:03:05 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5e2e50b3ad9828c13afd22a6da7e0ae675302cd5
X-Git-Newrev: 2e62586c7ddbb2da11d58186ff20ded4b475926e
X-Patchwork-Hint: ignore
Message-Id: <20220916141236.D6C2583D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/netsniff-ng:
 needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e62586c7ddbb2da11d58186ff20ded4b475926e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

netsniff-ng unconditionally uses pthread_spin_lock since its addition in
commit 500d287b07190c9c1a1284bc91b37d07e1a835a3 and
https://github.com/netsniff-ng/netsniff-ng/commit/1a9fbac03c684f29cff9ac44875bd9504a89f54e
resulting in the following build failure:

/home/autobuild/autobuild/instance-1/output-1/per-package/netsniff-ng/host/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: netsniff-ng/tprintf.o: in function `tprintf_flush':
tprintf.c:(.text+0x42c): undefined reference to `pthread_spin_lock'

Fixes:
 - http://autobuild.buildroot.org/results/ceadbdea8cc35bfd7d601a6d4b18137f81f61406

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a969e0f63ce7c9f500286deb5d5f5c8259bdc3f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsniff-ng/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index bbb4172cd3..9ad3628f14 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NETSNIFF_NG
 	bool "netsniff-ng"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_spin_lock
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
@@ -28,7 +28,7 @@ comment "mausezahn needs glibc or musl toolchain"
 
 endif
 
-comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
+comment "netsniff-ng needs a toolchain w/ NPTL, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
