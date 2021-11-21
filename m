Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B99C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEFD040283;
	Sun, 21 Nov 2021 21:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8X6qhgBZ0Qs; Sun, 21 Nov 2021 21:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEC434019D;
	Sun, 21 Nov 2021 21:28:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32A201BF3BB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DE9B4019D
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdgvrH3xY8FD for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 21:28:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4583240153
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 21:28:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 11E958E49A; Sun, 21 Nov 2021 21:24:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 22:28:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73248c03fd04eddad78fea5096cd98b2a2d43e81
X-Git-Newrev: c224e7e5c673b8a9c7eb7f3def1a2df2e959df4d
X-Patchwork-Hint: ignore
Message-Id: <20211121212419.11E958E49A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: kconfig needs the toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=c224e7e5c673b8a9c7eb7f3def1a2df2e959df4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a10e224501..9661f901ea 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -525,7 +525,11 @@ UBOOT_DEPENDENCIES += \
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
