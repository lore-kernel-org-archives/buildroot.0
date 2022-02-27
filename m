Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775B4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0037540533;
	Sun, 27 Feb 2022 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G52bxIGpdb8u; Sun, 27 Feb 2022 19:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDBD040148;
	Sun, 27 Feb 2022 19:28:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E766E1BF356
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3E3960A6C
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2g7q9FyeXIr for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:27:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC97607C9
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DAA8B82E00; Sun, 27 Feb 2022 19:19:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:19:38 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1a3eb64243d45ab457d3a1a44ed30517125f260c
X-Git-Newrev: 56ad2d9976da18da554eef71580417a08a62615f
X-Patchwork-Hint: ignore
Message-Id: <20220227191953.DAA8B82E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] linux: build after
 wireless-regdb if enabled for early loading support
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
Content-Type: multipart/mixed; boundary="===============8488952393874504692=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8488952393874504692==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=56ad2d9976da18da554eef71580417a08a62615f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

To support building in the wireless regulatory database files (regulatory.db*)
into the kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that
the database files are installed before the Linux kernel is built.
The dependency is harmless if CONFIG_EXTRA_FIRMWARE isn't actually set.

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit de0f5ba17a15a87bc16a6d6aa318104510c38f9d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index adde7a2c1d..db0c311adf 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -78,7 +78,8 @@ LINUX_MAKE_ENV = \
 
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
-	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode)
+	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
+	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but

--===============8488952393874504692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8488952393874504692==--
