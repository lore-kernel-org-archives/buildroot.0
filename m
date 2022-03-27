Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC651C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998A7827AA;
	Sun, 27 Mar 2022 15:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HohPpTUQ0qT2; Sun, 27 Mar 2022 15:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C7D81DB2;
	Sun, 27 Mar 2022 15:46:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11D131BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F302560EE7
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnCzxOL7hDcV for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AEF660E27
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EA55F85D39; Sun, 27 Mar 2022 15:37:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 16:53:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffcb5ded44e932ca6c7d03a8a33c051d94d47b2a
X-Git-Newrev: 87674334dd8a8c9094a806d26f2683f9fca782f0
X-Patchwork-Hint: ignore
Message-Id: <20220327153711.EA55F85D39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: usbpro needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=87674334dd8a8c9094a806d26f2683f9fca782f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with usbpro raised since re-introduction
of the package in commit 16ff948444c3978d63f483344a3d92d994c64312:

configure: error: compiler with C11 support is required to build libusb

Fixes:
 - http://autobuild.buildroot.org/results/e9239403bb13d3468db01a952da8c695c0e5ea30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ola/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 36b175138f..e59637b57f 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -164,8 +164,12 @@ config BR2_PACKAGE_OLA_PLUGIN_USBDMX
 
 config BR2_PACKAGE_OLA_PLUGIN_USBPRO
 	bool "usbpro"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Build UsbPro plugin for OLA.
 
+comment "usbpro needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
