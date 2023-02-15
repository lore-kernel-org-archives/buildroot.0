Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EB1C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206B0402B3;
	Wed, 15 Feb 2023 21:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 206B0402B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1wzfs7hSVlR; Wed, 15 Feb 2023 21:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 177FA40209;
	Wed, 15 Feb 2023 21:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 177FA40209
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 195FC1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E81C761082
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81C761082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63GYGexPwPne for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:38:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2488860AD1
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2488860AD1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11A1F85EB8; Wed, 15 Feb 2023 21:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:37:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c77e31e0b360fffbd893807ccfbc4f35bf2558d1
X-Git-Newrev: 92f545da0b60a0c82f8f0e8b0e69e30268f0e9f3
X-Patchwork-Hint: ignore
Message-Id: <20230215213813.11A1F85EB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: disable package for
 s390x architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=92f545da0b60a0c82f8f0e8b0e69e30268f0e9f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/3a74d393cdbc308eab9ec3f0f9e420947669a0ea/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8821cu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
index a5a7b9d255..00a41b5196 100644
--- a/package/rtl8821cu/Config.in
+++ b/package/rtl8821cu/Config.in
@@ -1,8 +1,10 @@
 comment "rtl8821cu needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_RTL8821CU
 	bool "rtl8821cu"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8821cu wifi driver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
