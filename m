Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638E8C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C02A411A9;
	Tue, 26 Jul 2022 16:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C02A411A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lw0rli6EIXg5; Tue, 26 Jul 2022 16:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07DB741198;
	Tue, 26 Jul 2022 16:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07DB741198
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE601BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 184F74014B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 184F74014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlf_q4qjOznH for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:46:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57EFD40148
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57EFD40148
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3757985F11; Tue, 26 Jul 2022 16:32:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:46:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d1bae0707f0411a6874ba1c801d4e59d0d7b4fa
X-Git-Newrev: 3915a3f589d95b6793125f03d295671606d86e84
X-Patchwork-Hint: ignore
Message-Id: <20220726163253.3757985F11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: disable split-stack for
 non-thread builds for gcc powerpc spe
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

commit: https://git.buildroot.net/buildroot/commit/?id=3915a3f589d95b6793125f03d295671606d86e84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain for powerpc spe can use uClibc-ng without thread support.
So we need the same fix as commit [1].

[1] fff68f75b3519cadb2639fde2296b26db919d79d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
