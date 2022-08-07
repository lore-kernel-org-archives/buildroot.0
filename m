Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEB4C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADCD408CA;
	Sun,  7 Aug 2022 12:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADCD408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVqjuSyxqSoe; Sun,  7 Aug 2022 12:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787BE40650;
	Sun,  7 Aug 2022 12:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 787BE40650
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9141BF836
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E6140169
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E6140169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBvFGXPU5QF3 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:38:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F247400FE
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F247400FE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5140F86EE8; Sun,  7 Aug 2022 12:24:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:38:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bd277572e695ce390b52d0dec03fa8ee5485f64
X-Git-Newrev: ebe4ac73698bb79e1129b71e69e1c0c28ace0995
X-Patchwork-Hint: ignore
Message-Id: <20220807122406.5140F86EE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dump1090: fix dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebe4ac73698bb79e1129b71e69e1c0c28ace0995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dump1090 needs threads and gcc >= 4.9 since bump to version 7.2 in
commit e80c99e1519dafc2cf88ab4672eecda88359ecb1 to avoid the following
build failures:

In file included from dump1090.c:50:
dump1090.h:69:10: fatal error: pthread.h: No such file or directory
   69 | #include <pthread.h>
      |          ^~~~~~~~~~~

In file included from dump1090.c:50:0:
dump1090.h:68:23: fatal error: stdatomic.h: No such file or directory
 #include <stdatomic.h>
                       ^

Fixes:
 - http://autobuild.buildroot.org/results/a8993d9a09c79231358f50d2c1eb2e08cf7d5fd6
 - http://autobuild.buildroot.org/results/7367abae7dc8187e4a2aae5397618c6e1b7aa521

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dump1090/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dump1090/Config.in b/package/dump1090/Config.in
index 897ad46679..ca3165dc74 100644
--- a/package/dump1090/Config.in
+++ b/package/dump1090/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_DUMP1090
 	bool "dump1090"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_NCURSES
 	help
 	  Dump1090 is a simple Mode S decoder for RTLSDR devices
 
 	  https://github.com/flightaware/dump1090
+
+comment "dump1090 needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
