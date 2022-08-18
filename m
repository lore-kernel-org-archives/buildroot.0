Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360BDC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C445E41BA3;
	Thu, 18 Aug 2022 06:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C445E41BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adjA_x6EakL8; Thu, 18 Aug 2022 06:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7956941B58;
	Thu, 18 Aug 2022 06:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7956941B58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FBBE1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61DA441B99
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61DA441B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQuwReG74BKi for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 669F441BA7
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669F441BA7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C88C287996; Thu, 18 Aug 2022 06:16:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:28:02 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: b83c653199b52f454c09f70b717b090742825ac9
X-Git-Newrev: 1f49d55e845f5f1303b1efb619613b352d1ce097
X-Patchwork-Hint: ignore
Message-Id: <20220818061635.C88C287996@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/gcc: disable
 split-stack for non-thread builds for gcc powerpc spe
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f49d55e845f5f1303b1efb619613b352d1ce097
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The toolchain for powerpc spe can use uClibc-ng without thread support.
So we need the same fix as commit [1].

[1] fff68f75b3519cadb2639fde2296b26db919d79d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3915a3f589d95b6793125f03d295671606d86e84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch b/package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..8d99e89293
--- /dev/null
+++ b/package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 1ddcb4870533af1b71b6afb75b8f2b271fd88eb4 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
