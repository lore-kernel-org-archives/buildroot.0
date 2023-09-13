Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B9ACA5537
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C67811F4;
	Wed, 13 Sep 2023 16:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C67811F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51Gu1fv__-7B; Wed, 13 Sep 2023 16:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5F18126A;
	Wed, 13 Sep 2023 16:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5F18126A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 929581BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8292C41DE1
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8292C41DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3Of5U43caWt for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5815B400EA
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5815B400EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46B0E86E13; Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 17:55:13 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 1cbb24f995401fd3fef1539443e17cb120e8719e
X-Git-Newrev: b0be067143001ce5074243b042bf6b5ebbac61c0
X-Patchwork-Hint: ignore
Message-Id: <20230913160323.46B0E86E13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/ramspeed: disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0be067143001ce5074243b042bf6b5ebbac61c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
