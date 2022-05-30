Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15DA26121A;
	Mon, 30 May 2022 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OavzOhH49iCC; Mon, 30 May 2022 20:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FBCD6123A;
	Mon, 30 May 2022 20:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 448521BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 325D241706
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvi2sVP3QM6q for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:56:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45BA741702
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:56:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 56EC28680C; Mon, 30 May 2022 20:45:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:56:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 636f201062dd2714c79647ca06d3ad5c36a7cdad
X-Git-Newrev: 858a7fe4e59ae43b6c83d203ca6591c444618eff
X-Patchwork-Hint: ignore
Message-Id: <20220530204515.56EC28680C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: fix build with gcc 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=858a7fe4e59ae43b6c83d203ca6591c444618eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 10:

/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h: In function 'bool LibCecBootloader(const char*)':
/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:175:14: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
  175 |       return NULL;
      |              ^~~~
/nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:184:12: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
  184 |     return NULL;
      |            ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/e34bd78cc81e6da12a85c1e4ee76931818d91073

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libcec/0001-cecloader-h-fix-null-return.patch  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libcec/0001-cecloader-h-fix-null-return.patch b/package/libcec/0001-cecloader-h-fix-null-return.patch
new file mode 100644
index 0000000000..424e41c0ae
--- /dev/null
+++ b/package/libcec/0001-cecloader-h-fix-null-return.patch
@@ -0,0 +1,37 @@
+From 452b2049b2ee3e73968c603e5524b2d349ac0c3e Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Sat, 9 Apr 2022 17:59:11 +0000
+Subject: [PATCH] cecloader.h: fix null return
+
+returning NULL is invalid for a return type of bool when NULL is defined
+as `nullptr` instead of 0L
+
+[Retrieved from:
+https://github.com/Pulse-Eight/libcec/pull/599/commits/452b2049b2ee3e73968c603e5524b2d349ac0c3e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/cecloader.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/cecloader.h b/include/cecloader.h
+index be76468f..550f598e 100644
+--- a/include/cecloader.h
++++ b/include/cecloader.h
+@@ -172,7 +172,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+     if (!g_libCEC)
+     {
+       std::cout << dlerror() << std::endl;
+-      return NULL;
++      return false;
+     }
+   }
+ 
+@@ -181,7 +181,7 @@ bool LibCecBootloader(const char *strLib = NULL)
+   if (!LibCecBootloader)
+   {
+     std::cout << "cannot find CECStartBootloader" << std::endl;
+-    return NULL;
++    return false;
+   }
+ 
+   bool bReturn = LibCecBootloader();
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
