Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398C6C27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 15:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E784069E;
	Tue, 11 Jun 2024 15:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3uMVylOWYf9; Tue, 11 Jun 2024 15:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C039540647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C039540647;
	Tue, 11 Jun 2024 15:22:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF711BF391
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27EB1405DE
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJgh4UV9FTOc for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 15:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85CEE40273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85CEE40273
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85CEE40273
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 15:22:11 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7ea0b5e0977so274238339f.2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 08:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718119330; x=1718724130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGYBpcBlKvtor+x4Mn5/PU5SIPa9ZoMtnpLWeI2JdFU=;
 b=YmudvtvkR8RRphKIZXgY19OVvFtru5Eu9FrFGV2jCW/LIaa0EXvsUeGFowmL7TjRMn
 VLESrGuMtPtmMpM2xDhfZ5YOIBknfRuXS1uTF959KQCmwOIBUBM8zXGEfRWzJow4cqqn
 IhCeDpSsjEJI4JKK4mYPWjmWS/zlbOh/fQpuxXMkDtWAKn32Lk9ESjF+/wHJ5TXtbkUU
 c0slV9QiUTZ2oMv/IJeOZmKQQTZp1sVo3CNWLBFQIotfpS5xPKLa+qvzgRKa/utRsex7
 2X0fLsJh/WzXjOyn+e9ERrjM005qulQEgXW5Od41vvU/+rLWBz9ipyqwPRFPt5er7OjV
 sdfA==
X-Gm-Message-State: AOJu0YzSvfupiz7qbV5CgfI3sa+Fmz03TT0KEDf0+KtH8lUGjdmHPzk0
 VUitskVJgU7AJzJzNY1oq/d7O/04wPEeEF1t6zKOOP5Hs6IsLZ10APZSkyFL
X-Google-Smtp-Source: AGHT+IGlWjVveZjQMsdbrqjpsLerb812pmMK8czM+yan02Wn1VIRvZeT0cLNM0uLHVVzRuBM9aM+/w==
X-Received: by 2002:a05:6602:1495:b0:7eb:699d:c3fb with SMTP id
 ca18e2360f4ac-7eb699dcaafmr1211577539f.19.1718119330110; 
 Tue, 11 Jun 2024 08:22:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eb81f14c0dsm128268939f.28.2024.06.11.08.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 08:22:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 09:22:01 -0600
Message-Id: <20240611152202.951202-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611152202.951202-1-james.hilliard1@gmail.com>
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718119330; x=1718724130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGYBpcBlKvtor+x4Mn5/PU5SIPa9ZoMtnpLWeI2JdFU=;
 b=SHkpsCN6AXJ6oLX17j5WGUlxER2RY+nwKi2bg0epN0DPyZFXWe0SBey6AwNozyRJzR
 oyyIUlZOccWTkwXyvXduJnBr4KyXHapQqczRDzwHKeK75Rlz+HmIZGLKNi3VLS1Q57wn
 vWuppFpcGn4r/k00vithryJTB9pwfP8b3Fj6CcIACMOIL9W+/B/ynHt5AbbioZIFFZbR
 bEUUfHPWv+Jgs4PaIuVmQttcu9pe7zD8nGxXaXwflQIZu6LjtlvmuHc5hgl1uE1RDfW0
 PG+zcOsOPD1vTq4LqMjbKuEhkDqRRveLQjNbLPX+ti4G4s+X4tjvOb5e7bvHPhD2/0Hg
 fGog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SHkpsCN6
Subject: [Buildroot] [PATCH v2 3/4] package/flashrom: install to staging
 with meson
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
