Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16421C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE813412D2;
	Fri, 10 Dec 2021 19:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7w6e5Ier0vsF; Fri, 10 Dec 2021 19:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC8E3412D3;
	Fri, 10 Dec 2021 19:13:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD1C01BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB6F5426E6
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrKJFK2g5rGC for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CA15426E7
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5A8578255D; Fri, 10 Dec 2021 19:07:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 20:01:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5a74af215b9213fb7efea78c8d23e73fd500589
X-Git-Newrev: c06bed7296faaf856895dad4b6b20d0fb66fae39
X-Patchwork-Hint: ignore
Message-Id: <20211210190713.5A8578255D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: update vcdbg runtime
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=c06bed7296faaf856895dad4b6b20d0fb66fae39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We used to select the rpi-userland to make the vcdbg tool work but it
conflicts with the use of mesa. It implies we can not install vcdbg with
mesa libraries but it is false. We could use the prebuilt libraries from
the rpi-firmware sources to run vcdbg.

This patch removes the select dependency of rpi-userland package and
installs the prebuilt libraries needed by vcdbg only if rpi-userland
is not selected.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Bryce Schober <bryce.schober@gmail.com>
Tested-by: Bryce Schober <bryce.schober@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpi-firmware/Config.in       |  1 -
 package/rpi-firmware/rpi-firmware.mk | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f9fc0b0e5e..8070dc3019 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -98,7 +98,6 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	depends on BR2_arm # prebuilt arm binary, rpi-userland
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
-	select BR2_PACKAGE_RPI_USERLAND
 	help
 	  Install vcdbg, to help debug communication with the GPU.
 
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 5e8b0379ba..f773f83999 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -57,12 +57,23 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
+# Install prebuilt libraries if RPI_USERLAND not enabled
+ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
+define RPI_FIRMWARE_INSTALL_TARGET_LIB
+	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libvcos.so \
+		$(TARGET_DIR)/usr/lib/libvcos.so
+	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libdebug_sym.so \
+		$(TARGET_DIR)/usr/lib/libdebug_sym.so
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
 		$(TARGET_DIR)/usr/sbin/vcdbg
 	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \
 		$(TARGET_DIR)/usr/lib/libelftoolchain.so
+	$(RPI_FIRMWARE_INSTALL_TARGET_LIB)
 endef
 endif # INSTALL_VCDBG
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
