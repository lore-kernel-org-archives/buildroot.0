Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8F5E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B1B783C82;
	Thu, 21 Sep 2023 18:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B1B783C82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZphovRKJFqPM; Thu, 21 Sep 2023 18:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB9383C6F;
	Thu, 21 Sep 2023 18:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB9383C6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 706881BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 498E94195F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 498E94195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ByDvr_3x-e7 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:25:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51D2B4192B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D2B4192B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F045874A4; Thu, 21 Sep 2023 18:25:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 20:23:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 405ba7f2a64a05e19f6d4c178cbe48a10f4c3ddf
X-Git-Newrev: 9a9a41f8dfd4388f6cb0d9d4132ad7cfa7dedf48
X-Patchwork-Hint: ignore
Message-Id: <20230921182526.3F045874A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: fix build failure on
 s390x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a9a41f8dfd4388f6cb0d9d4132ad7cfa7dedf48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support Wi-Fi on Linux so let's disable the package for such
architecture.

Fixes:
http://autobuild.buildroot.net/results/f52e8a14330ff281a7096baa47f387f8c1859345

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/esp-hosted/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
index 43c802fa44..42e1afa8c5 100644
--- a/package/esp-hosted/Config.in
+++ b/package/esp-hosted/Config.in
@@ -1,8 +1,10 @@
 comment "esp-hosted needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_ESP_HOSTED
 	bool "esp-hosted"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  This package builds and installs the Linux kernel driver for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
