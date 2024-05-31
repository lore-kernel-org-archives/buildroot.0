Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E40C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 12:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AB9061122;
	Fri, 31 May 2024 12:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSQMXuCZND9q; Fri, 31 May 2024 12:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E52860853
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E52860853;
	Fri, 31 May 2024 12:22:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECEEB1D5203
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E551C408F9
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIOeMfrfPrte for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 12:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30F7405D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E30F7405D4
 for <buildroot@buildroot.org>; Fri, 31 May 2024 12:22:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 535AC87809; Fri, 31 May 2024 12:22:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 13:59:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eefc510767c3d9ea7f7c89642e34b8cdb6174195
X-Git-Newrev: a13aca12af814b789884ae84360b2397da9c84ca
X-Patchwork-Hint: ignore
Message-Id: <20240531122221.535AC87809@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/zynq: make post-image.sh
 a symlink to board/zynqmp/post-image.sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=a13aca12af814b789884ae84360b2397da9c84ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The zynq/zynqmp post-image scripts are now identical, so replace the zynq
copy with a symlink to limit redundancy.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynq/post-image.sh | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
deleted file mode 100755
index f44b66342d..0000000000
--- a/board/zynq/post-image.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-# By default U-Boot loads DTB from a file named "system.dtb", so
-# let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
-
-BOARD_DIR="$(dirname "$0")"
-
-support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
new file mode 120000
index 0000000000..775184415d
--- /dev/null
+++ b/board/zynq/post-image.sh
@@ -0,0 +1 @@
+../zynqmp/post-image.sh
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
