Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87145C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80D5409FD;
	Mon, 15 Aug 2022 13:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80D5409FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwVc9pXgbfJZ; Mon, 15 Aug 2022 13:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F656409E5;
	Mon, 15 Aug 2022 13:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F656409E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25E001BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3E3A409E5
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E3A409E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtRJKrFum-HY for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED48C409D0
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED48C409D0
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8C66987644; Mon, 15 Aug 2022 13:32:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 15:47:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5874667922ca4d83994fd9649ea91d28be5a6042
X-Git-Newrev: a969e0f63ce7c9f500286deb5d5f5c8259bdc3f2
X-Patchwork-Hint: ignore
Message-Id: <20220815133257.8C66987644@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsniff-ng: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=a969e0f63ce7c9f500286deb5d5f5c8259bdc3f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
