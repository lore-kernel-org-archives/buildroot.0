Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3180AC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBEE61371;
	Wed, 22 Feb 2023 21:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBEE61371
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hqm6h-R1abI; Wed, 22 Feb 2023 21:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4B461390;
	Wed, 22 Feb 2023 21:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC4B461390
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85F9F1BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DF116139B
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DF116139B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKuNwJUNzqnB for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 21:01:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B892061371
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 21:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B892061371
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7158868C9; Wed, 22 Feb 2023 21:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 22:01:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5178b092a820e328434490cad47c2ea8342f392
X-Git-Newrev: f665acb88c7a9a50e6b93a0daefb53ca3bcc2f79
X-Patchwork-Hint: ignore
Message-Id: <20230222210118.A7158868C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=f665acb88c7a9a50e6b93a0daefb53ca3bcc2f79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

threads are mandatory since bump to version 2.2.0 in commit
af6f7aa76db5aed1eada0b27bd0375610a2fc728 and
https://git.savannah.gnu.org/cgit/lightning.git/commit/?id=d5a7c8e4ad719e84dbb4904c532f906a1ef5a77b:

In file included from incr.c:2:
../include/lightning.h:27:10: fatal error: pthread.h: No such file or directory
   27 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/62205869159d4a73c59a9795140fa77e9c3310ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lightning/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index a0542edce9..3cf7c28ae2 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -1,13 +1,14 @@
-comment "lightning needs a toolchain w/ dynamic library"
+comment "lightning needs a toolchain w/ dynamic library, threads"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
 		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIGHTNING
 	bool "lightning"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
 		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GNU lightning is a library that generates
 	  assembly language code at run-time.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
