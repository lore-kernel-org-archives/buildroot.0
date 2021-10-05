Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC2CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:25:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6727361502
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6727361502
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B81F83B67;
	Tue,  5 Oct 2021 15:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atEKUxSjZiEu; Tue,  5 Oct 2021 15:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA0283B5A;
	Tue,  5 Oct 2021 15:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51B3E1BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4222A40724
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVz1tbYg_lJq for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 15:25:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ADBA40704
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 15:25:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 880C6911C6; Tue,  5 Oct 2021 15:22:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 17:24:32 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: d2e36fd1fe4ecf056d2cb1bece95d77a68cf3520
X-Git-Newrev: 46da68c01bbfd486a1bbd9d80a29d90c138a1466
X-Patchwork-Hint: ignore
Message-Id: <20211005152259.880C6911C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/google-breakpad:
 fix build with glibc >= 2.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=46da68c01bbfd486a1bbd9d80a29d90c138a1466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure with glibc >= 2.33:

src/client/linux/handler/exception_handler.cc: In function 'void google_breakpad::{anonymous}::InstallAlternateStackLocked()':
src/client/linux/handler/exception_handler.cc:147:49: error: no matching function for call to 'max(int, long int)'
  147 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/61a89fa954db16a7b5b9fcee55c545e489f8d489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit 53495c204b84675f5f4b2bd255bfeb1cbcb100e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
