Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9996DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5F741571;
	Fri, 12 Jul 2024 10:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knoXuXDX3evS; Fri, 12 Jul 2024 10:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D8D417EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D8D417EB;
	Fri, 12 Jul 2024 10:55:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9FA1BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BA4B403E4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2ajuReoc0sr for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE6840260
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE6840260
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4239985DA8; Fri, 12 Jul 2024 10:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 12:55:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3900807b22835451ddb1b1f78e179d8b472b3554
X-Git-Newrev: 51f753710d55a6a9e6ee778fba9d1c6b2a722485
X-Patchwork-Hint: ignore
Message-Id: <20240712105540.4239985DA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix build with
 uclibc-ng < 1.0.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=51f753710d55a6a9e6ee778fba9d1c6b2a722485
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6)
raised since bump to version 2.39 in commit
ad276d94a392fb13244e042851a44269e6254d61 and
https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4:

sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here (not in a function); did you mean 'PER_LINUX32'?
  106 |     X(PER_LINUX32_3GB) \
      |       ^~~~~~~~~~~~~~~

Fixes: ad276d94a392fb13244e042851a44269e6254d61
 - http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...setarch.c-fix-build-with-uclibc-ng-1.0.39.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch b/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
new file mode 100644
index 0000000000..12dd119ef3
--- /dev/null
+++ b/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
@@ -0,0 +1,39 @@
+From beef18da4de87ca5aaadf2beb14187f35cc4f50f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 May 2024 18:22:11 +0200
+Subject: [PATCH] sys-utils/setarch.c: fix build with uclibc-ng < 1.0.39
+
+Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
+https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6)
+raised since version 2.39 and
+https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4:
+
+sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here (not in a function); did you mean 'PER_LINUX32'?
+  106 |     X(PER_LINUX32_3GB) \
+      |       ^~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/util-linux/util-linux/commit/4647fc6afbf7e99c49531600425df60f1243fcd2
+---
+ sys-utils/setarch.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/sys-utils/setarch.c b/sys-utils/setarch.c
+index 227bc6b5de..4bcb5e69e6 100644
+--- a/sys-utils/setarch.c
++++ b/sys-utils/setarch.c
+@@ -89,6 +89,11 @@
+ # define PER_LINUX_FDPIC	(PER_LINUX | FDPIC_FUNCPTRS)
+ #endif
+ 
++/* fallback for old uclibc-headers < 1.0.39 */
++#ifndef PER_LINUX32_3GB
++# define PER_LINUX32_3GB	(PER_LINUX32 | ADDR_LIMIT_3GB)
++#endif
++
+ #define ALL_PERSONALITIES \
+     X(PER_LINUX) \
+     X(PER_LINUX_32BIT) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
