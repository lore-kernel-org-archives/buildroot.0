Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F361C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44154168D;
	Mon,  2 May 2022 22:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSiNf3EC4Tln; Mon,  2 May 2022 22:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC82541619;
	Mon,  2 May 2022 22:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EDE41BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56C5A415BB
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AL4uJcSaRA83 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B6E74156F
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 01FBE84EC9; Mon,  2 May 2022 21:48:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:40:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ea0b4fce62d8527d45e12490030126d568c9811
X-Git-Newrev: e5ff1de64e60f6ab2faaa751378fce0ec6bf1010
X-Patchwork-Hint: ignore
Message-Id: <20220502214851.01FBE84EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: do not allow selecting RTAI for
 latest/cip kernels
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5ff1de64e60f6ab2faaa751378fce0ec6bf1010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RTAI is only supported on very specific kernel versions that are
different from the latest/cip kernel versions, so we should not
allow selecting RTAI when building with latest/cip kernels.

Fixes:
 - http://autobuild.buildroot.net/results/412/412492e19b41f95ff2445df6b7564cb0fa48873b
 - http://autobuild.buildroot.net/results/32c/32c9ffd8e965eb690ca0b0471e9c1cc16bb2fa66
 - http://autobuild.buildroot.net/results/0bc/0bc178dcb11aa23e5f8bf75c958d8a56c6c38964

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.ext.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 734a52a533..5b968b0bcb 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -48,6 +48,9 @@ comment "xenomai needs a uClibc or glibc toolchain w/ threads"
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
 	bool "RTAI Real-time patch"
+	depends on !BR2_LINUX_KERNEL_LATEST_VERSION
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	select BR2_PACKAGE_RTAI
 	help
 	  RTAI Kernel part.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
