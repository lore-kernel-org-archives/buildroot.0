Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D790DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9752A84CDF;
	Sat, 28 May 2022 09:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2w2mj2jWpb_Z; Sat, 28 May 2022 09:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B73B84CAD;
	Sat, 28 May 2022 09:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E75C71BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E42BB61093
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAjpSoQxLEoe for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42A4360B56
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0227C8424B; Sat, 28 May 2022 09:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:03:11 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 02bb0ecefe2b0b2eec21843cd386ad81d24b87a6
X-Git-Newrev: 6ac62f5920271c24d96e37cae55d6272bd3df958
X-Patchwork-Hint: ignore
Message-Id: <20220528090538.0227C8424B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] linux: add a comment
 about CONFIG_EXTRA_FIRMWARE requirement
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ac62f5920271c24d96e37cae55d6272bd3df958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Explain why the kernel needs firmware packages as build time
dependencies.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8c4b55053e093bfaa88d93a9e3ad0ca241679bcd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7ff7b05042..e0a1ff74f9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -70,7 +70,11 @@ LINUX_MAKE_ENV = \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES = host-kmod \
+LINUX_DEPENDENCIES = host-kmod
+
+# The kernel CONFIG_EXTRA_FIRMWARE feature requires firmware files at build
+# time. Make sure they are available before the kernel builds.
+LINUX_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
 	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
