Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135FBC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DB540B94;
	Tue, 16 Jul 2024 12:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lmwvi9Gccu8w; Tue, 16 Jul 2024 12:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7750F40BA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7750F40BA6;
	Tue, 16 Jul 2024 12:39:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B571D1BF38A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1EC640551
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIGd1ea2oa9n for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7B1403B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E7B1403B6
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 277DA866EE; Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 14:38:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e52605c092d8eaa926da8720ae498a38eddb5205
X-Git-Newrev: 37dded43ae681e8319d7b76f9a612c71991467a9
X-Patchwork-Hint: ignore
Message-Id: <20240716123912.277DA866EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: switch to meson build
 system
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37dded43ae681e8319d7b76f9a612c71991467a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson build system will be useful in future commits to have a
proper installation in staging with pkg-config files.

Drop Makefile patch which is no longer relevant.

Backport a patch removing _LARGEFILE64_SOURCE which can result in a
redefinition build error.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...CONFIG_INTERNAL-depends-on-raw-mem-access.patch | 35 ----------
 ...chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch | 38 ++++++++++
 package/flashrom/flashrom.mk                       | 80 +++++++++++++++-------
 3 files changed, 94 insertions(+), 59 deletions(-)

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
index 86bfec40cc..ed11b4ed31 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -9,41 +9,73 @@ FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
-FLASHROM_MAKE_OPTS = WARNERROR=no
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
+	realtek_mst_i2c_spi \
+	serprog
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+FLASHROM_PROGRAMMERS += rayer_spi
+endif
 
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
-endif
+FLASHROM_PROGRAMMERS += \
+	atavia \
+	drkaiser \
+	gfxnvidia \
+	internal \
+	it8212 \
+	nicintel \
+	nicintel_eeprom \
+	nicintel_spi \
+	ogp_spi \
+	satamv \
+	satasii
 
-define FLASHROM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -DHAVE_STRNLEN" \
-		$(FLASHROM_MAKE_OPTS) -C $(@D)
-endef
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+FLASHROM_PROGRAMMERS += \
+	atahpt \
+	atapromise \
+	nic3com \
+	nicnatsemi \
+	nicrealtek
+endif
+endif
 
-define FLASHROM_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/flashrom $(TARGET_DIR)/usr/sbin/flashrom
-endef
+FLASHROM_CONF_OPTS += -Dprogrammer=$(subst $(space),$(comma),$(strip $(FLASHROM_PROGRAMMERS)))
 
-$(eval $(generic-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
