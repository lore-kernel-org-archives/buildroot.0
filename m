Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A70C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB2940996;
	Mon, 20 Feb 2023 21:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB2940996
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hbR3aNvjHoG; Mon, 20 Feb 2023 21:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8170E43DF8;
	Mon, 20 Feb 2023 21:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8170E43DF8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3B61BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01493610D9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01493610D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H37nbjqliGMc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0700B610CA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0700B610CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01F1B8648F; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 19:08:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 81a02457b0f161d6a0b7c9f2f916d55983e5cb44
X-Git-Newrev: b91eb32120d5a810a7f5a8bb2ad17baf16eedd6a
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.01F1B8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gptfdisk: fix runtime
 failure with popt 1.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=b91eb32120d5a810a7f5a8bb2ad17baf16eedd6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following runtime failure raised since bump of popt to version
1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:

Problem opening  for reading! Error is 2.
The specified file does not exist!

Fixes:
 - No autobuilder failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reported-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-crash-of-sgdisk-when-compiled-with-lates.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
new file mode 100644
index 0000000000..bdeedd95cc
--- /dev/null
+++ b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
@@ -0,0 +1,60 @@
+From 5d5e76d369a412bfb3d2cebb5fc0a7509cef878d Mon Sep 17 00:00:00 2001
+From: Rod Smith <rodsmith@rodsbooks.com>
+Date: Fri, 15 Apr 2022 18:10:14 -0400
+Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest
+ popt (commit 740; presumably eventually release 1.19)
+
+[Retrieved from:
+https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ NEWS      | 8 ++++++++
+ gptcl.cc  | 2 +-
+ support.h | 2 +-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index c7add56..9e153fd 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,11 @@
++1.0.10 (?/??/2022):
++-------------------
++
++- Fixed problem that caused sgdisk to crash with errors about being unable
++  to read the disk's partition table when compiled with the latest popt
++  (commit 740, which is pre-release as I type; presumably version 1.19 and
++  later once released).
++
+ 1.0.9 (4/14/2022):
+ ------------------
+ 
+diff --git a/gptcl.cc b/gptcl.cc
+index 34c9421..0d578eb 100644
+--- a/gptcl.cc
++++ b/gptcl.cc
+@@ -155,7 +155,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+    } // while
+ 
+    // Assume first non-option argument is the device filename....
+-   device = (char*) poptGetArg(poptCon);
++   device = strdup((char*) poptGetArg(poptCon));
+    poptResetContext(poptCon);
+ 
+    if (device != NULL) {
+diff --git a/support.h b/support.h
+index 8ba9ad1..f91f1bc 100644
+--- a/support.h
++++ b/support.h
+@@ -8,7 +8,7 @@
+ #include <stdlib.h>
+ #include <string>
+ 
+-#define GPTFDISK_VERSION "1.0.9"
++#define GPTFDISK_VERSION "1.0.9.1"
+ 
+ #if defined (__FreeBSD__) || defined (__FreeBSD_kernel__) || defined (__APPLE__)
+ // Darwin (Mac OS) & FreeBSD: disk IOCTLs are different, and there is no lseek64
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
