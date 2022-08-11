Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C8DC19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951A94182B;
	Thu, 11 Aug 2022 11:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951A94182B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LlT91SnrOl1; Thu, 11 Aug 2022 11:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F7041827;
	Thu, 11 Aug 2022 11:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F7041827
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 437071BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CF8341827
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF8341827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKyuSUFuBtd3 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:51:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F174A41823
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F174A41823
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BECE487143; Thu, 11 Aug 2022 11:36:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:50:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 98fec9ea60786d9bbd7ffd3735712d68da28b07d
X-Git-Newrev: 2daae7260069311b71fb9aad3b4c07d74e0af09b
X-Patchwork-Hint: ignore
Message-Id: <20220811113640.BECE487143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wine: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=2daae7260069311b71fb9aad3b4c07d74e0af09b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

wine unconditionally uses pthread_attr_setstack resulting in the
following build failure without NPTL:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/11.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: dlls/ntdll/unix/thread.o: in function `NtCreateThreadEx':
thread.c:(.text+0x61b): undefined reference to `pthread_attr_setstack'

Fixes:
 - http://autobuild.buildroot.org/results/a866d65cda97845a8c829acad2c057bab00cde08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14c093d25845aa657caea83e954eb36235e471c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 9de8cf0f6d..18fb0a64a2 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_WINE
 	depends on BR2_PACKAGE_WINE_ARCH_SUPPORTS
 	# Wine unconditionally builds shared libraries
 	depends on !BR2_STATIC_LIBS
+	# pthread_attr_setstack
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Wine is a compatibility layer capable of running Windows
 	  applications on Linux. Instead of simulating internal
@@ -23,6 +25,6 @@ config BR2_PACKAGE_WINE
 
 	  http://www.winehq.org
 
-comment "wine needs a toolchain w/ dynamic library"
+comment "wine needs a toolchain w/ dynamic library, NPTL"
 	depends on BR2_PACKAGE_WINE_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
