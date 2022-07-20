Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4457FC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99B8241B41;
	Wed, 20 Jul 2022 20:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99B8241B41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5W7FxrzwBFxB; Wed, 20 Jul 2022 20:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D96141978;
	Wed, 20 Jul 2022 20:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D96141978
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C59E1BF473
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2545B8249E
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2545B8249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id govlS151iLI7 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:34:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CA7E83F5D
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA7E83F5D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AFA168403E; Wed, 20 Jul 2022 20:21:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 22:34:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62a94cbd8f0a2cf6cb8fe2b491a77bfb1a142305
X-Git-Newrev: 14c093d25845aa657caea83e954eb36235e471c7
X-Patchwork-Hint: ignore
Message-Id: <20220720202115.AFA168403E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wine: needs NPTL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14c093d25845aa657caea83e954eb36235e471c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wine unconditionally uses pthread_attr_setstack resulting in the
following build failure without NPTL:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/11.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: dlls/ntdll/unix/thread.o: in function `NtCreateThreadEx':
thread.c:(.text+0x61b): undefined reference to `pthread_attr_setstack'

Fixes:
 - http://autobuild.buildroot.org/results/a866d65cda97845a8c829acad2c057bab00cde08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
