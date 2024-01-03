Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9036DC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 07:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42AFE43629;
	Fri,  5 Jan 2024 07:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42AFE43629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EyfvR_HDfZB; Fri,  5 Jan 2024 07:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E40BF4362E;
	Fri,  5 Jan 2024 07:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E40BF4362E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E54621BF995
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 07:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE27941568
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 07:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE27941568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jonk-L45EzgJ for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 07:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C616E41521
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 07:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C616E41521
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA0AA84289; Fri,  5 Jan 2024 07:30:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jan 2024 12:04:45 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ad6bc91a0a73e73224df3241554ffafb496819ab
X-Git-Newrev: 678146f2ada0477c745494b4d28392d50ccc9a9e
X-Patchwork-Hint: ignore
Message-Id: <20240105073029.AA0AA84289@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 boot/arm-trusted-firmware: fix the RPATH of fiptool
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

commit: https://git.buildroot.net/buildroot/commit/?id=678146f2ada0477c745494b4d28392d50ccc9a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit e7d16c35ae6b219ddb13248ed7d93f99694593df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
