Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DAAC67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2048D405A0;
	Thu, 27 Oct 2022 06:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2048D405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2PJY8QcMM1L; Thu, 27 Oct 2022 06:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AE6A40328;
	Thu, 27 Oct 2022 06:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AE6A40328
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A92631BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85BD6400FE
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85BD6400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpqifX-sxOY2 for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:50:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E60E640328
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E60E640328
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4F13872ED; Thu, 27 Oct 2022 06:50:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 08:50:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cff78c34fbf80880c39725049ff42c3dd632fd7a
X-Git-Newrev: 5335c9d12ce1bc269ae06996025ae8c6f9ee694c
X-Patchwork-Hint: ignore
Message-Id: <20221027065010.D4F13872ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=5335c9d12ce1bc269ae06996025ae8c6f9ee694c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since bump to
version 2.1.8 in commit ede944f53509f825aa983de19d34fc30259b812c:

Settings.cpp: In function 'void Settings_Interpret(char, const char*, thread_Settings*)':
Settings.cpp:1281:9: error: break statement not within loop or switch
 1281 |         break;
      |         ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2bcddf8439f6913fdf19b1fc2d33999a787ab3b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-fix-single-threaded-compile-breakage.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/iperf/0001-fix-single-threaded-compile-breakage.patch b/package/iperf/0001-fix-single-threaded-compile-breakage.patch
new file mode 100644
index 0000000000..85baf76ea4
--- /dev/null
+++ b/package/iperf/0001-fix-single-threaded-compile-breakage.patch
@@ -0,0 +1,32 @@
+From 6405b7a005bb2364466b56f480d50af0be423d76 Mon Sep 17 00:00:00 2001
+From: Robert McMahon <rjmcmahon@rjmcmahon.com>
+Date: Tue, 27 Sep 2022 20:31:04 -0700
+Subject: [PATCH] fix single threaded compile breakage
+
+[Retrieved (and backported) from:
+https://sourceforge.net/p/iperf2/code/ci/6405b7a005bb2364466b56f480d50af0be423d76]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/version.h | 2 +-
+ src/Settings.cpp  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Settings.cpp b/src/Settings.cpp
+index aac1b5f..fc5a181 100644
+--- a/src/Settings.cpp
++++ b/src/Settings.cpp
+@@ -1160,10 +1160,10 @@ void Settings_Interpret (char option, const char *optarg, struct thread_Settings
+ 			delete [] tmp;
+ 		    }
+ 		}
++	    }
+ #else
+ 		fprintf(stderr, "bounceback-congest option requires a platform that supports threads\n");
+ #endif
+-	    }
+ 	}
+ 	if (bouncebackdelaystart) {
+ 	    bouncebackdelaystart = 0;
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
