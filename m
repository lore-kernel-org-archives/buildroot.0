Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27340EE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB9D41622;
	Tue, 22 Aug 2023 20:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB9D41622
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHRihoxJD6kU; Tue, 22 Aug 2023 20:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE15B40965;
	Tue, 22 Aug 2023 20:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE15B40965
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CB731BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54B0E40965
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B0E40965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vP-7cof0-RcX for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56B9540959
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B9540959
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 426FC86183; Tue, 22 Aug 2023 20:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 22:08:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a4429a6dddafb6d6ed2aa3db5e4590bfae43d45
X-Git-Newrev: 6b3d0c5adb9a2d213b6e4dee2c412c2994649e60
X-Patchwork-Hint: ignore
Message-Id: <20230822200911.426FC86183@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ramspeed: disable package if
 affected from gcc bug 43744
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b3d0c5adb9a2d213b6e4dee2c412c2994649e60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is affected by gcc bug 43744 and I have not found a work
around for it(i.e. the common -O0 we use or other), so let's disable it if
gcc has such bug.

Fixes:
http://autobuild.buildroot.net/results/ab289769c5fea435934ed260d38e0a4fdd2ba72d

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
