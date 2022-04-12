Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7E9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3A7E40B4C;
	Tue, 12 Apr 2022 20:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4TO5SaJtoSp; Tue, 12 Apr 2022 20:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC93A40B51;
	Tue, 12 Apr 2022 20:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57DB61BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D54360DED
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLrYztZ3uT9k for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 20:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1C6F605A0
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 20:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CBEEF83BB0; Tue, 12 Apr 2022 19:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 22:01:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc384b9734139a0654718c33f8e67546336750dd
X-Git-Newrev: 3872457e50ba98dbeea0dc44277a671b7923d03d
X-Patchwork-Hint: ignore
Message-Id: <20220412195243.CBEEF83BB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-driver: only available for
 arm or AArch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=3872457e50ba98dbeea0dc44277a671b7923d03d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currentlym this kernel module can be built by any architecture and this
leads to many failures. Since it's very unlikely that Mali will be part
of architectures other than AArch64 and arm let's depend on BR2_aarch64
and BR2_arm only.

Fixes:
http://autobuild.buildroot.net/results/f94885ef76865c3888d6cc52b35c93a742f92f3a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
