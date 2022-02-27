Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EA4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4405A812EC;
	Sun, 27 Feb 2022 19:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89P-v6LdlAb1; Sun, 27 Feb 2022 19:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B51080C64;
	Sun, 27 Feb 2022 19:28:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC861BF356
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A0381BB2
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vz_QvYvE-Ce7 for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD7AD81A6F
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:28:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6D9888212C; Sun, 27 Feb 2022 19:20:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:16:39 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: d5658ab951023d3f2a9a8bdd34de19a41e087bd1
X-Git-Newrev: e91440b904a6bae850a503f0938f833a5691d951
X-Patchwork-Hint: ignore
Message-Id: <20220227192002.6D9888212C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] linux: build after
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
Content-Type: multipart/mixed; boundary="===============3349917410380648075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3349917410380648075==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e91440b904a6bae850a503f0938f833a5691d951
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index b047061c3d..960a4ebd63 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -72,7 +72,8 @@ LINUX_MAKE_ENV = \
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
-	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware)
+	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
+	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but

--===============3349917410380648075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3349917410380648075==--
