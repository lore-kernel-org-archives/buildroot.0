Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57280CA5537
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EFF483065;
	Wed, 13 Sep 2023 16:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EFF483065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlqRjAH-F_nq; Wed, 13 Sep 2023 16:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 499A982F6C;
	Wed, 13 Sep 2023 16:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 499A982F6C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2641BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44563405F8
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44563405F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBsbWY3r03i0 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F72C40151
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F72C40151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B6A386E13; Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 17:55:31 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ba81553a835743828a641efe69156989bd168c40
X-Git-Newrev: 16fa3fa6df30877179d3b2f4cf5479f8ac71a137
X-Patchwork-Hint: ignore
Message-Id: <20230913160117.4B6A386E13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/ramspeed: disable
 package if affected from gcc bug 43744
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

commit: https://git.buildroot.net/buildroot/commit/?id=16fa3fa6df30877179d3b2f4cf5479f8ac71a137
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This package is affected by gcc bug 43744 and I have not found a work
around for it(i.e. the common -O0 we use or other), so let's disable it if
gcc has such bug.

Fixes:
http://autobuild.buildroot.net/results/ab289769c5fea435934ed260d38e0a4fdd2ba72d

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6b3d0c5adb9a2d213b6e4dee2c412c2994649e60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ramspeed/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ramspeed/Config.in b/package/ramspeed/Config.in
index b236329a84..bd0438ffe1 100644
--- a/package/ramspeed/Config.in
+++ b/package/ramspeed/Config.in
@@ -1,5 +1,9 @@
+comment "ramspeed needs a toolchain not affected by GCC bug 43744"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
+
 config BR2_PACKAGE_RAMSPEED
 	bool "ramspeed"
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	help
 	  RAMspeed is a free open source command line utility
 	  to measure cache and memory performance.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
