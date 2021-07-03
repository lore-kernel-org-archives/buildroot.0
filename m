Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA69C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E383360231
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E383360231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC1756088A;
	Tue,  3 Aug 2021 21:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2CdnO59T40P; Tue,  3 Aug 2021 21:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1286A60864;
	Tue,  3 Aug 2021 21:47:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 160661BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41DC483ABC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYE73NSf8oDB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A1E0835C9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D490786A84; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 23:47:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d86f7f14157895801b7279ac49fa98ad8d12d19
X-Git-Newrev: fab6a64b52cdd92e0d20331c4ec5eff9f293429a
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.D490786A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgpg-error: fix
 build issue following 1.42 bump
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fab6a64b52cdd92e0d20331c4ec5eff9f293429a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The build failed with gazillions of:

"gpg-error.h:1211:2: error: stray '\' in program"

This is already fixed by upstream commit
33593864cd54143db594c4237bba41e14179061c, which we backport. It is
backported as patch 0001, and the existing 0001 renamed to 0002, as it
appears later in the libgpg-error Git history.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eneration-of-lock-obj-pub.native.h-for-cr.patch | 34 ++++++++++++++++++++++
 ....patch => 0002-build-Fix-disable-threads.patch} |  4 +--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch b/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
new file mode 100644
index 0000000000..621f070ee2
--- /dev/null
+++ b/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
@@ -0,0 +1,34 @@
+From 7350874f6f62314af4c8ec1973c91d305a6f4ddc Mon Sep 17 00:00:00 2001
+From: David Michael <fedora.dm0@gmail.com>
+Date: Fri, 26 Mar 2021 16:06:50 +0900
+Subject: [PATCH] build: Fix generation of lock-obj-pub.native.h for cross
+ build.
+
+* src/gen-lock-obj.sh: Capture echo output with quotes.
+
+--
+
+Fixes-commit: 99ae862a96a569724f49a604ebb7d3f6d2c2d374
+Signed-off-by: David Michael <fedora.dm0@gmail.com>
+Upstream: 33593864cd54143db594c4237bba41e14179061c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/gen-lock-obj.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
+index a710f0c..258eec6 100755
+--- a/src/gen-lock-obj.sh
++++ b/src/gen-lock-obj.sh
+@@ -38,7 +38,7 @@
+ #     AWK=gawk ./gen-lock-obj.sh
+ #
+ 
+-if test -n `echo -n`; then
++if test -n "`echo -n`"; then
+     ECHO_C='\c'
+     ECHO_N=''
+ else
+-- 
+2.31.1
+
diff --git a/package/libgpg-error/0001-build-Fix-disable-threads.patch b/package/libgpg-error/0002-build-Fix-disable-threads.patch
similarity index 92%
rename from package/libgpg-error/0001-build-Fix-disable-threads.patch
rename to package/libgpg-error/0002-build-Fix-disable-threads.patch
index 2d101aad9b..6ed0f83070 100644
--- a/package/libgpg-error/0001-build-Fix-disable-threads.patch
+++ b/package/libgpg-error/0002-build-Fix-disable-threads.patch
@@ -1,4 +1,4 @@
-From 220a427b4f997ef6af1b2d4e82ef1dc96e0cd6ff Mon Sep 17 00:00:00 2001
+From 7ede0d4ce19e0ed14cd1cec81ba7df4e467f1eeb Mon Sep 17 00:00:00 2001
 From: NIIBE Yutaka <gniibe@fsij.org>
 Date: Mon, 21 Jun 2021 12:16:20 +0900
 Subject: [PATCH] build: Fix --disable-threads.
@@ -35,5 +35,5 @@ index 258eec6..014667f 100755
  ## Local Variables:
  ## mode: c
 -- 
-2.11.0
+2.31.1
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
