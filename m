Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2282AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 22:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF52E6149F;
	Fri, 10 Dec 2021 22:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTHp3Y3_Ecy8; Fri, 10 Dec 2021 22:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC49613D7;
	Fri, 10 Dec 2021 22:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 492D41BF3D6
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 389F4855F2
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6TQHOBPvtrp for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 22:06:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A72855F0
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 22:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 90A9E825DF; Fri, 10 Dec 2021 22:01:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 23:03:08 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 266e82f0e21f2f163223c06e93bfb8ae7006a33a
X-Git-Newrev: 937c03ba111e26fdac0c516c4be812996e019ace
X-Patchwork-Hint: ignore
Message-Id: <20211210220123.90A9E825DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] boot/uboot: kconfig needs
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

commit: https://git.buildroot.net/buildroot/commit/?id=937c03ba111e26fdac0c516c4be812996e019ace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 6f59018867..ec2114c584 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -502,7 +502,11 @@ UBOOT_DEPENDENCIES += \
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
