Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234F8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 22:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4DEB4283D;
	Fri, 10 Dec 2021 22:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyIxYz04sySj; Fri, 10 Dec 2021 22:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0E24283E;
	Fri, 10 Dec 2021 22:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA6321BF3D6
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C776D855F0
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SETrPqs2IdTl for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 22:06:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EDC1855EF
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 22:06:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 75EEB825AC; Fri, 10 Dec 2021 22:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 23:02:58 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 5fa69e10ace5692f9eca1d469c1c43467417dcfd
X-Git-Newrev: c6ac525de67a2372af1890440067a0288d4fa980
X-Patchwork-Hint: ignore
Message-Id: <20211210220118.75EEB825AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] boot/uboot: kconfig needs
 the toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6ac525de67a2372af1890440067a0288d4fa980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Starting with uboot 2021.10, with upstream commit 473fc279c89 (kconfig /
kbuild: Re-sync with Linux 4.20), the kconfig in uboot now needs the
compiler to detect its features.

Like was done for linux in 3fc990a7983 (linux: kconfig needs the
toolchain) and barebox in 1c1a629d814 (boot/barebox: kconfig needs the
toolchain), add the toolchain to the kconfig dependencies of uboot.

Reported-by: Davian on IRC
Reported-by: Xogium on IRC
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c224e7e5c673b8a9c7eb7f3def1a2df2e959df4d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b6d67990a..0bc036f3cb 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -500,7 +500,11 @@ UBOOT_DEPENDENCIES += \
 $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
+# Starting with 2021.10, the kconfig in uboot calls the cross-compiler
+# to check its capabilities. So we need the toolchain before we can
+# call the configurators.
 UBOOT_KCONFIG_DEPENDENCIES += \
+	toolchain \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
