Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209D9C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B771F6108D;
	Thu, 11 Aug 2022 11:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B771F6108D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opvsIbLc1qpk; Thu, 11 Aug 2022 11:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9FA460F5D;
	Thu, 11 Aug 2022 11:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9FA460F5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14F721BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E477C60F5D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E477C60F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_2-DfPxZ08K for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1359660AA5
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1359660AA5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DB06D8714B; Thu, 11 Aug 2022 11:38:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:50:16 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: fe8b3034da31930465e2706c9746235d7c552aaa
X-Git-Newrev: aaaaf7a1ee8450c64582a006bc031f609651c249
X-Patchwork-Hint: ignore
Message-Id: <20220811113805.DB06D8714B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/wine: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaaaf7a1ee8450c64582a006bc031f609651c249
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
