Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD3C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 18:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B470403C2;
	Mon, 21 Nov 2022 18:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B470403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BynueypucJsD; Mon, 21 Nov 2022 18:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F109401F3;
	Mon, 21 Nov 2022 18:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F109401F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2A01BF34E
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 18:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 458DD401F3
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 18:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 458DD401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2c3QwnPKmlZ7 for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 18:08:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 218C0400AC
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 18:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 218C0400AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D2DC8403E; Mon, 21 Nov 2022 18:08:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 19:08:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81a02457b0f161d6a0b7c9f2f916d55983e5cb44
X-Git-Newrev: b91eb32120d5a810a7f5a8bb2ad17baf16eedd6a
X-Patchwork-Hint: ignore
Message-Id: <20221121180834.0D2DC8403E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gptfdisk: fix runtime failure with
 popt 1.19
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
