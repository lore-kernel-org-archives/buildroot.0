Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB291C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549B660FDC
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 549B660FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316334034F;
	Sun, 26 Sep 2021 20:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTVwiOuNbhUt; Sun, 26 Sep 2021 20:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F48402EF;
	Sun, 26 Sep 2021 20:00:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F16DA1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29B7D60764
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtSY82sZp13Q for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85B1860757
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1BC738D25D; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:08:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6569e25a88bbbe5617ca4877c5e425eea2e354c2
X-Git-Newrev: 53495c204b84675f5f4b2bd255bfeb1cbcb100e9
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.1BC738D25D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad: fix build with
 glibc >= 2.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=53495c204b84675f5f4b2bd255bfeb1cbcb100e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with glibc >= 2.33:

src/client/linux/handler/exception_handler.cc: In function 'void google_breakpad::{anonymous}::InstallAlternateStackLocked()':
src/client/linux/handler/exception_handler.cc:147:49: error: no matching function for call to 'max(int, long int)'
  147 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/61a89fa954db16a7b5b9fcee55c545e489f8d489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0004-Fix-for-non-constant-SIGSTKSZ.patch       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
new file mode 100644
index 0000000000..4291216c61
--- /dev/null
+++ b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
@@ -0,0 +1,34 @@
+From 4a332d01186b09a9d46390b845024d914d9149cb Mon Sep 17 00:00:00 2001
+From: Michel Alexandre Salim <michel@michel-slm.name>
+Date: Sun, 21 Mar 2021 13:17:00 -0700
+Subject: [PATCH] Fix for non-constant SIGSTKSZ
+
+On glibc > 2.33, `SIGSTKSZ` might not be constant (in which case
+it expands to a call to `sysconf` which returns a `long int`); see
+http://sourceware-org.1504.n7.nabble.com/PATCH-sysconf-Add-SC-MINSIGSTKSZ-SC-SIGSTKSZ-BZ-20305-td650948.html
+
+Cast the two arguments to `max` to `unsigned`, which is the type of the variable
+we're storing the result in anyway, so that it works both with the old-style constant
+`SIGSTKSZ` and the new configurable one.
+
+Signed-off-by: Michel Alexandre Salim <michel@michel-slm.name>
+Change-Id: I3d87048561a87c6b9fcdbb14b3d53dd45b0a00f0
+
+[Retrieved from:
+https://chromium-review.googlesource.com/c/breakpad/breakpad/+/2776379]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+
+diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
+index ca353c4..3788829 100644
+--- a/src/client/linux/handler/exception_handler.cc
++++ b/src/client/linux/handler/exception_handler.cc
+@@ -138,7 +138,7 @@
+   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
+   // the alternative stack. Ensure that the size of the alternative stack is
+   // large enough.
+-  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
++  static const unsigned kSigStackSize = std::max((unsigned) 16384, (unsigned) SIGSTKSZ);
+ 
+   // Only set an alternative stack if there isn't already one, or if the current
+   // one is too small.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
