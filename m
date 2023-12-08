Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A45BC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0FD840463;
	Fri,  8 Dec 2023 21:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0FD840463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6MfjnKdw2Vq; Fri,  8 Dec 2023 21:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99DF1409DD;
	Fri,  8 Dec 2023 21:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99DF1409DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9A01BF417
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 273708386F
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273708386F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFOkkwfnXRkO for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 21:28:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F2D0837C0
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 21:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F2D0837C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E625887898; Fri,  8 Dec 2023 21:28:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 8 Dec 2023 22:24:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b81b82da3e866559af0703184313ac4912e5dd8c
X-Git-Newrev: e7d16c35ae6b219ddb13248ed7d93f99694593df
X-Patchwork-Hint: ignore
Message-Id: <20231208212848.E625887898@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7d16c35ae6b219ddb13248ed7d93f99694593df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The arm-trusted-firmware package builds a host tool called "fiptool",
which is used during the build process of arm-trusted-firmware
itself. This tool links against the OpenSSL host library, and
therefore needs to be built with the correct RPATH pointing to
$HOST_DIR/lib.

This is why commit a957d9a90ade4194dffe3eb2fc0136bc5d077c28
("boot/arm-trusted-firmware: build fiptool separately with dependency
o n host-openssl") added the ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
variable, which builds the fiptool tool first, with the right
variables set, before invoking the full build of TF-A. This ensured
that fiptool was built with the correct RPATH.

However, more recent versions of TF-A have modified their Makefile
machinery, and fiptool is being rebuilt even if it was built
before. Unfortunately, this rebuild is no longer done with the right
flags, so we end up with a fiptool binary that no longer has the right
RPATH, and fiptool fails to find the OpenSSL libraries from
$HOST_DIR/lib.

In order to fix this, we take a different approach: we do not build
fiptool separately first, but we inject the necessary flags through
the HOSTCC variable. Indeed, there's no HOST_LDFLAGS or HOST_LDLIBS
variable or similar that would allow us to pass the -Wl,-rpath flag
that is needed. Shoe-horning this flag into HOSTCC gets the job done,
and actually simplifies our arm-trusted-firmware.mk.

This patch break the compatibility with version prior to 1.4 (upstream
commit 72610c4102990 ("build: Introduce HOSTCC flag")). v1.4 is very old
(July 2017), not used anymore in-tree and probably not used anymore
outside the tree.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 049beed36a..bed873a182 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -63,7 +63,8 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	BUILD_STRING=$(ARM_TRUSTED_FIRMWARE_VERSION) \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
-	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
+	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD) \
+	HOSTCC="$(HOSTCC) $(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
@@ -147,18 +148,6 @@ ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
-# fiptool only exists in newer (>= 1.3) versions of ATF, so we build
-# it conditionally. We need to explicitly build it as it requires
-# OpenSSL, and therefore needs to be passed proper variables to find
-# the host OpenSSL.
-define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
-	if test -d $(@D)/tools/fiptool; then \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/fiptool \
-			$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-			CPPFLAGS="$(HOST_CPPFLAGS)" \
-			LDLIBS="$(HOST_LDFLAGS) -lcrypto" ; \
-	fi
-endef
 endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
@@ -206,7 +195,6 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(if $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH),
 		cp -f $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH) $(@D)/fdts/
 	)
-	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
 	$(ARM_TRUSTED_FIRMWARE_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
 		$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
