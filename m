Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA973C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDCD80B66;
	Wed, 13 Apr 2022 08:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqyrjYj49qQ3; Wed, 13 Apr 2022 08:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2CE80B60;
	Wed, 13 Apr 2022 08:13:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 063BE1C113E
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0355382881
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vSoVJeoFHAd for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44D8782B34
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 54B5983A4F; Wed, 13 Apr 2022 08:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 10:12:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a5a041a99e43367905cecb1117b07aa089c17191
X-Git-Newrev: 7813d493b52006b7aae49a398dac35de14c854bc
X-Patchwork-Hint: ignore
Message-Id: <20220413080257.54B5983A4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mali-driver: only
 available for arm or AArch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=7813d493b52006b7aae49a398dac35de14c854bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Currentlym this kernel module can be built by any architecture and this
leads to many failures. Since it's very unlikely that Mali will be part
of architectures other than AArch64 and arm let's depend on BR2_aarch64
and BR2_arm only.

Fixes:
http://autobuild.buildroot.net/results/f94885ef76865c3888d6cc52b35c93a742f92f3a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3872457e50ba98dbeea0dc44277a671b7923d03d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mali-driver/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mali-driver/Config.in b/package/mali-driver/Config.in
index fee67096c8..4c1a96d05c 100644
--- a/package/mali-driver/Config.in
+++ b/package/mali-driver/Config.in
@@ -3,6 +3,7 @@ comment "mali-driver needs a Linux kernel to be built"
 
 config BR2_PACKAGE_MALI_DRIVER
 	bool "mali-driver"
+	depends on BR2_aarch64 || BR2_arm
 	depends on BR2_LINUX_KERNEL
 	help
 	  This package builds and installs the Linux kernel driver for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
