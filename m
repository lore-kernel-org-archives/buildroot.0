Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13716C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0BD360674;
	Thu,  9 Jun 2022 20:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0m2w-33iXNbU; Thu,  9 Jun 2022 20:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F0760681;
	Thu,  9 Jun 2022 20:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 046881BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E72A960672
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUWsE20hZTnq for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:47:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A6946060A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6FA3186F2D; Thu,  9 Jun 2022 20:36:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:44:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f8a979ff18dea28f0785501d6fc4de8cde2ddd95
X-Git-Newrev: c0a608e679850c3c7054d03acb19878148957970
X-Patchwork-Hint: ignore
Message-Id: <20220609203602.6FA3186F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] arch/Config.in.powerpc:
 disable some variants on ppc64le
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0a608e679850c3c7054d03acb19878148957970
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Following commit
e59b3acc3603e55fbaec25406258ec9ca9623564 ("toolchain/glibc: Restrict
ppc64le support to power8"), when selecting ppc64le as the
architecture, it is possible to end up with a selection for which no C
library is provided.

Indeed:

 - glibc only supports Power8
 - uclibc has no support for ppc64le at all
 - musl only supports ppc64le processors that have Altivec support

Therefore, this commit adds "depends on !BR2_powerpc64le" to those
PowerPC architecture variants for which no C library support exists.

Fixes:

  http://autobuild.buildroot.net/results/3f6fb1c2d5648e78f7856bdea3171b5a89dfa2f9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c0b02883148025ea3e62535f237b246818155a99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 4a39cfee70..db74270405 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -11,6 +11,8 @@ choice
 	  Specific CPU variant to use
 config BR2_generic_powerpc
 	bool "generic"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_401
 	bool "401"
 	depends on !BR2_ARCH_IS_64
@@ -61,8 +63,12 @@ config BR2_powerpc_604e
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_620
 	bool "620"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_630
 	bool "630"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_740
 	bool "740"
 	depends on !BR2_ARCH_IS_64
@@ -115,8 +121,12 @@ config BR2_powerpc_e6500
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_power5
 	bool "power5"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_power6
 	bool "power6"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
