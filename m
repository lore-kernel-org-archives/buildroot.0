Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6B3C27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 23:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1FB849DE;
	Wed,  5 Jun 2024 23:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh1lh2BaEwLv; Wed,  5 Jun 2024 23:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A33E849E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A33E849E3;
	Wed,  5 Jun 2024 23:41:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7C911BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A50C0611A7
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c99suHr-4QsC for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 23:41:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D752611A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D752611A3
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D752611A3
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 23:41:37 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7e24b38c022so11477639f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 16:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717630897; x=1718235697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGYBpcBlKvtor+x4Mn5/PU5SIPa9ZoMtnpLWeI2JdFU=;
 b=T/fw1hpX2W3EKZltSqYl1JJV5EIEaNYUag3n6HzVOdVTbeCRg03TRyqHdhsiDcvyqK
 kyUZ3L30QZs1xB2x70gK8690iwlnZKt5CduajMdWj0dnlLiTu275cocmz+kPAdBXFr6j
 McrYb4sfSQkBvFS2yVrBWnX/FDvay0L2IXT6lQKWBTOGIjQ6TipzcG9Ixo3Q3Kc2tbHI
 WYFGgqWg2p8xFzZokdD2/xZZh4xGA3S//RfbxXcRWTsUM1VnsOdCBjkT1frH08fjBYSD
 veeTPEXOZoCJoGD15s7UlsV7q+9XC8lcKj3JhQFOQcT3NdM1kJwk/yIctWsUdqg2os8H
 VwNg==
X-Gm-Message-State: AOJu0YzqZvcDCUdT0WrzYghzPW9KeqeRiC38widKQYtvFlHgIkr6BLdh
 7YwhjjUXCvRvwrqcs6SBHDxh1hu7Sm9Cs7WQWgQHX7HABhmyH/pg+aezqtLD
X-Google-Smtp-Source: AGHT+IHIE+0TUT8ydUz7ecM4cVU/8SVEffcnsnwkRmNaNCbbO1Wv/G8wXxhNHmuAIEPWpn5YCQkkQg==
X-Received: by 2002:a05:6602:6b09:b0:7de:c47d:a740 with SMTP id
 ca18e2360f4ac-7eb49dc11a9mr57266739f.8.1717630896558; 
 Wed, 05 Jun 2024 16:41:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eb4c47d534sm4871139f.34.2024.06.05.16.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 16:41:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 17:41:30 -0600
Message-Id: <20240605234131.3370484-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605234131.3370484-1-james.hilliard1@gmail.com>
References: <20240605234131.3370484-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717630897; x=1718235697; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGYBpcBlKvtor+x4Mn5/PU5SIPa9ZoMtnpLWeI2JdFU=;
 b=gKVVql7Bi2iuJs7JtoKC16XJCKWwtG1jTo06ysZESo6gWx42tDCMOJ7taYvxiSlyQw
 XjLebslVuuSbsCPRTHhuqkCJv/Mk+lkE9D7aycdcwF9EjgbwV+VGoaGCtf0ByDl7q0Mp
 ch2559LVj4FOOdDLxqUbyKjUnXH2oQS09s7ASeYMV0WpOMV2qvAT66B2ehsalO/QUpJM
 bQjOHUJwO0VnnneZqA8bll8HpL6a2DnUh9drjnVMKO/SZNOyCGz0vyfFnHjUsiiB3czh
 wmQV4oNCQPpC+KNuUlZTpRozh3HA4JV8s9/YjVniXwyHQsXpcMAOMEyl5SGOwAsBoqaQ
 ulkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gKVVql7B
Subject: [Buildroot] [PATCH 3/4] package/flashrom: install to staging with
 meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be needed for the upcoming fwupd flashrom plugin to work
as only the meson build correctly installs the pkgconfig files
needed by fwupd.

Drop Makefile patch which is no longer relevant.

Backport a patch removing _LARGEFILE64_SOURCE which can result in a
redefination build error.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...G_INTERNAL-depends-on-raw-mem-access.patch | 35 ---------
 ...et_enable.c-Drop-_LARGEFILE64_SOURCE.patch | 38 ++++++++++
 package/flashrom/flashrom.mk                  | 74 +++++++++++++------
 3 files changed, 88 insertions(+), 59 deletions(-)
 delete mode 100644 package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
 create mode 100644 package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch

diff --git a/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch b/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
deleted file mode 100644
index 9d3f3d9c51..0000000000
--- a/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From aac91025386aa9d7b8214f8ad1746ef5c02f2d8d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 5 Nov 2023 10:38:32 +0100
-Subject: [PATCH] Makefile: CONFIG_INTERNAL depends on raw mem access
-
-CONFIG_INTERNAL depends on raw mem access resulting in the following
-build failure on sh4 since version 1.3.0:
-
-/home/thomas/autobuild/instance-3/output-1/per-package/flashrom/host/bin/../lib/gcc/sh4a-buildroot-linux-gnu/12.3.0/../../../../sh4a-buildroot-linux-gnu/bin/ld: libflashrom.a(internal.o): in function `internal_chip_readn':
-internal.c:(.text+0x8): undefined reference to `mmio_readn'
-
-Fixes:
- - http://autobuild.buildroot.org/results/f74a9d315fb519f284428234713f43fcf4e35fd0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://review.coreboot.org/c/flashrom/+/78930
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index bf01d0f8..cd21f22f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -115,6 +115,7 @@ DEPENDS_ON_RAW_MEM_ACCESS := \
- 	CONFIG_ATAPROMISE \
- 	CONFIG_DRKAISER \
- 	CONFIG_GFXNVIDIA \
-+	CONFIG_INTERNAL \
- 	CONFIG_INTERNAL_X86 \
- 	CONFIG_IT8212 \
- 	CONFIG_NICINTEL \
--- 
-2.42.0
-
diff --git a/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch b/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch
new file mode 100644
index 0000000000..1ee8d0f7e3
--- /dev/null
+++ b/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch
@@ -0,0 +1,38 @@
+From 59287a0bd0e4d58a4d2b434bde3db9b2376ac7c1 Mon Sep 17 00:00:00 2001
+From: Angel Pons <th3fanbus@gmail.com>
+Date: Tue, 16 May 2023 11:13:17 +0200
+Subject: [PATCH] chipset_enable.c: Drop `_LARGEFILE64_SOURCE`
+
+This file does not access any large files, so there's no need to define
+this feature test macro.
+
+Change-Id: I866cfa2f996eeea5846e5d9189647ad7a4a4e3e4
+Signed-off-by: Angel Pons <th3fanbus@gmail.com>
+Reviewed-on: https://review.coreboot.org/c/flashrom/+/75271
+Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
+Reviewed-by: Nico Huber <nico.h@gmx.de>
+Reviewed-by: Anastasia Klimchuk <aklm@chromium.org>
+Reviewed-by: Alexander Goncharov <chat@joursoir.net>
+
+Upstream: https://github.com/flashrom/flashrom/commit/59287a0bd0e4d58a4d2b434bde3db9b2376ac7c1
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ chipset_enable.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/chipset_enable.c b/chipset_enable.c
+index 9d3df5f8..3846ecfb 100644
+--- a/chipset_enable.c
++++ b/chipset_enable.c
+@@ -24,8 +24,6 @@
+  * Contains the chipset specific flash enables.
+  */
+ 
+-#define _LARGEFILE64_SOURCE
+-
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.34.1
+
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 86bfec40cc..be6cac3cc2 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -9,41 +9,67 @@ FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
-FLASHROM_MAKE_OPTS = WARNERROR=no
+FLASHROM_INSTALL_STAGING = YES
+FLASHROM_CONF_OPTS = \
+	-Dclassic_cli=enabled \
+	-Dclassic_cli_print_wiki=disabled \
+	-Dich_descriptors_tool=enabled \
+	-Dtests=disabled \
+	-Duse_internal_dmi=true
+
+FLASHROM_PROGRAMMERS = \
+	buspirate_spi \
+	linux_mtd \
+	linux_spi \
+	parade_lspcon \
+	mediatek_i2c_spi \
+	mstarddc_spi \
+	pony_spi \
+	rayer_spi \
+	realtek_mst_i2c_spi \
+	serprog
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
 FLASHROM_DEPENDENCIES += host-pkgconf libftdi1
-FLASHROM_MAKE_OPTS += \
-	CONFIG_FT2232_SPI=yes \
-	CONFIG_USBBLASTER_SPI=yes
-else
-FLASHROM_MAKE_OPTS += \
-	CONFIG_FT2232_SPI=no \
-	CONFIG_USBBLASTER_SPI=no
+FLASHROM_PROGRAMMERS += \
+	ft2232_spi \
+	usbblaster_spi
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 FLASHROM_DEPENDENCIES += host-pkgconf libusb
-FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB1_PROGRAMMERS=yes
-else
-FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB1_PROGRAMMERS=no
+FLASHROM_PROGRAMMERS += \
+	ch341a_spi \
+	dediprog \
+	developerbox_spi \
+	digilent_spi \
+	dirtyjtag_spi \
+	pickit2_spi \
+	raiden_debug_spi \
+	stlinkv3_spi
 endif
 
 ifeq ($(BR2_PACKAGE_PCIUTILS),y)
 FLASHROM_DEPENDENCIES += pciutils
-FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBPCI_PROGRAMMERS=yes
-else
-FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBPCI_PROGRAMMERS=no
+FLASHROM_PROGRAMMERS += \
+	atahpt \
+	atapromise \
+	atavia \
+	drkaiser \
+	gfxnvidia \
+	internal \
+	it8212 \
+	nic3com \
+	nicintel \
+	nicintel_eeprom \
+	nicintel_spi \
+	nicnatsemi \
+	nicrealtek \
+	ogp_spi \
+	satamv \
+	satasii
 endif
 
-define FLASHROM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -DHAVE_STRNLEN" \
-		$(FLASHROM_MAKE_OPTS) -C $(@D)
-endef
-
-define FLASHROM_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/flashrom $(TARGET_DIR)/usr/sbin/flashrom
-endef
+FLASHROM_CONF_OPTS += -Dprogrammer=$(subst $(space),$(comma),$(strip $(FLASHROM_PROGRAMMERS)))
 
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
