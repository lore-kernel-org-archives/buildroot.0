Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD48C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 16:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA38260FDA;
	Mon, 27 Feb 2023 16:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA38260FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDMCpJTM402X; Mon, 27 Feb 2023 16:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E196103F;
	Mon, 27 Feb 2023 16:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E196103F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9321BF86B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAD3581F38
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAD3581F38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5b6uxUCHFE9 for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 16:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06BC681F21
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BC681F21
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E92BD86C3B; Mon, 27 Feb 2023 16:05:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 17:03:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df83b6fb1404826cc6dbc154c5b4b5cb5a94c1ad
X-Git-Newrev: 8c4435190773195fc5d1a97f819e1160f4bd52ca
X-Patchwork-Hint: ignore
Message-Id: <20230227160515.E92BD86C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/mxs-bootlets: fix build without any
 bootstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c4435190773195fc5d1a97f819e1160f4bd52ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 2a636d15217cd326b4546e7017538c7a9e9d399c:

sed -i 's,[^ *]power_prep.*;,\tpower_prep="/home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/power_prep/power_prep";,' /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/
sed: couldn't edit /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/: not a regular file

Fixes:
 - http://autobuild.buildroot.org/results/b4b26f6b02fd1991f46eba5db240e5050b96d333

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/mxs-bootlets/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index b3e392afa8..8f9334b610 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -1,6 +1,8 @@
 config BR2_TARGET_MXS_BOOTLETS
 	bool "mxs-bootlets"
 	depends on BR2_arm
+	depends on BR2_TARGET_BAREBOX || BR2_LINUX_KERNEL || \
+		BR2_TARGET_UBOOT
 	help
 	  Stage1 bootloaders for Freescale iMX23/iMX28 SoCs
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
