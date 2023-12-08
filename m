Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB6DC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 17:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A78402A7;
	Fri,  8 Dec 2023 17:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A78402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpBX3XKdbpxu; Fri,  8 Dec 2023 17:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA68A40246;
	Fri,  8 Dec 2023 17:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA68A40246
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 211051BF357
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 17:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D01F56F6C6
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 17:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D01F56F6C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8dRojvpvwRo for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 17:42:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4E596F6A0
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 17:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4E596F6A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97942FF809;
 Fri,  8 Dec 2023 17:42:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 18:42:12 +0100
Message-ID: <20231208174217.29735-1-louis.chauvet@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: louis.chauvet@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702057368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UlvaMT2MJH5orNdjvVEAj653tO67a2kckhnTP5pXFg0=;
 b=f4HKJNK8pOcbUyqWauMT0Iu1tt4RleLm/1kOMu4FvuAMyYmIruG8O4cu9iinvw4KPLywmZ
 frh+U3XjW8CJuOSpagbm1w/PJEJsnB8UU0epmt+GdqzHJjm+LG7bs8cCSqkaMUMl86b1MM
 gYSr4rj4NQhu0HkJfceKT65WNj0k+/f9/jPwz88rQBT6mjcbkflnRzHT3iyjua6o2YJniY
 jFQGNffSwk4pAsLi4oRbS0T9ZEjzg4FexxOGVZ2ioWAX/dLc+45lT7GqJjR5i38H2DWnSj
 WJMV8I4AvTu2570WGT+NKwTN6a9hx8uG+TiN4MKCfQqph9Y5e5BBdu3NMKdW8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f4HKJNK8
Subject: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH of
 fiptool
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
From: Louis Chauvet via buildroot <buildroot@buildroot.org>
Reply-To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Previous version:
   https://lore.kernel.org/buildroot/20231206164437.22191-1-louis.chauvet@bootlin.com/

Changes v1->v2:
   Update commit log about compatibilty


 .../arm-trusted-firmware/arm-trusted-firmware.mk | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 049beed36a91..bed873a1821c 100644
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
