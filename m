Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BBCC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E659C40826;
	Fri, 16 May 2025 14:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syXp7MjoQIj7; Fri, 16 May 2025 14:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FAA2408BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FAA2408BC;
	Fri, 16 May 2025 14:10:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4FA9185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B690C83A59
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLmi09GPZ1DN for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C8F383C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C8F383C53
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C8F383C53
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:10:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad241d7680eso20223666b.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747404624; x=1748009424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvhUAmHxxya3XxEpcJUm7yM6bKTjcAcAmm2Sfbsdn1s=;
 b=pOKJoX+j+ljdG45P27b3Q3vuT9DOTeOlxOrF0KaHoD2h12roHgN/zWCKDrXOZ/Daoo
 N7J/i97twHnndNP1ThOppqwe3ScDnopH4WjNMRKLmYc/hnMfi2Nckfe8M5usLBSretOx
 Cayk3peWfm3p/FpNhFZWyIm3V9+AQufDQgymgGAnZpwLfSXU/XEdTsOrIXNhsEx4eMix
 tJicllbtaMXAdU/5uyxRUUBadwO3FGlxx9E2aJCbCc1dZLretfs3IrN/qtZ6fzNIwUDl
 zp6bUoYOuR1dt93vbbqKq3PcFSY3OTwA8Xsa1zTtkvknakftNTBtpmX01sFuLxIv9p4+
 UZUQ==
X-Gm-Message-State: AOJu0YxNLHwZlNdawGz07zOBaACN1rvgKsMDlYtC0T5Zx8qYxOO9Qnza
 cgBhdk8xI/2H+LjayPGFfzbZ4owT/f8KZIui9jqjC1gQMi59P9LVFPcvwGc7zAB0x/LCDXbaSee
 tpuuBWpQ=
X-Gm-Gg: ASbGnctoyC5s2fuvjC1H56XprorkrsJuxz5Z4hnXmozz6t8KvSRkW4J2xP/9gvTzzGB
 5nrbBBvpzyI1uYcRSzBETLOEgtnyz+fKPgwZvEUf7SRJII8KDG107UerdbCGc+fg/ti8Hm1bJfv
 nn1UqJi6vbEQQuxLGhSdgAeF4yg0JTABAWBIDar41hbklceOBzpSgqjuT0/Lr0h3NumWRuDyHl0
 4mUH5u9lrv+Jef652qeaizxboknTZTOjh7YAFRfIUQvaFEH8OnFlLdGdz9IuIdU2LiOGuY/XnIi
 zeddQZnKSpEqVbrXIpPmtgX0fTIiosDRNzYCu6lJAcoDJ7oMObY1JrWArnMzf4T8DcW/DZftPCP
 6F/dnzKMyrHCdnxVGw+aaUfesBkc2J9Y8AdfnbiphJozTgtskOTP5yW9n2DiRpxBkD3ZaSD3VG9
 F1nwQC4u9ngu48mjQL2eUR
X-Google-Smtp-Source: AGHT+IEXDR3hov3MhzMGcR4Llzx+XEakDWlUPI5geySQ5r++56jumVDAsmKiSyDWmvOFg2JOFw4XdQ==
X-Received: by 2002:a17:907:2cf6:b0:ac3:5ef0:4dec with SMTP id
 a640c23a62f3a-ad52d58e47fmr111292066b.12.1747404623448; 
 Fri, 16 May 2025 07:10:23 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06d533sm167027166b.45.2025.05.16.07.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 07:10:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 16:10:20 +0200
Message-ID: <20250516141021.600390-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747404624; x=1748009424;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VvhUAmHxxya3XxEpcJUm7yM6bKTjcAcAmm2Sfbsdn1s=;
 b=U8uU2uvF33kJYEx25wvbxDE/CmQb4bsth7xuPy/qfQHZnSvgcD+2G43kOZSkMLoZzQ
 rInoIqpQE6cZYNZgQdgUZDhGZJ5pI0BCKA/Wjj5yZ+F8SWZDOx3loPhT6Y8rgnckpKwK
 4+hBAyJ9W9TMLYgjfRRgGqjEYQ5BrkT4xrcpA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=U8uU2uvF
Subject: [Buildroot] [PATCH v4 1/2] package/mender-update-modules: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Contains community supported Update Modules. An Update Module is an extension
to the Mender client for supporting a new type of software update, such as a
package manager, container, bootloader or even updates of nearby
microcontrollers. An Update Module can be tailored to a specific device or
environment (e.g. update a proprietary bootloader), or be more
general-purpose (e.g. install a set of .rpm packages.).

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3:
  - Remove incorrect dependencies and simply depend on mender (Thomas)
  - Fix indent formatting in mender-update-modules.mk (Thomas)

V3 -> v4:
  - Fix the commit message.
  - Add JQ to the podman module.
  - Add a link in the help section for the reboot module.

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/mender-update-modules/Config.in       | 183 ++++++++++++++++++
 .../mender-update-modules.hash                |   3 +
 .../mender-update-modules.mk                  |  67 +++++++
 5 files changed, 255 insertions(+)
 create mode 100644 package/mender-update-modules/Config.in
 create mode 100644 package/mender-update-modules/mender-update-modules.hash
 create mode 100644 package/mender-update-modules/mender-update-modules.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16b15c2238..de9097b7b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -43,6 +43,7 @@ F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
 F:	package/libutempter/
+F:	package/mender-update-modules/
 F:	package/tllist/
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index a9074ac405..8d6b9f5834 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2878,6 +2878,7 @@ menu "System tools"
 	source "package/mender/Config.in"
 	source "package/mender-connect/Config.in"
 	source "package/mender-grubenv/Config.in"
+	source "package/mender-update-modules/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/moby-buildkit/Config.in"
 	source "package/mokutil/Config.in"
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
new file mode 100644
index 0000000000..8181cfe91b
--- /dev/null
+++ b/package/mender-update-modules/Config.in
@@ -0,0 +1,183 @@
+config BR2_PACKAGE_MENDER_UPDATE_MODULES
+	bool "mender-update-modules"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_MENDER
+	select BR2_PACKAGE_HOST_MENDER_ARTIFACT
+	help
+	  community supported Update Modules. An Update Module is an
+	  extension to the Mender client for supporting a new type of
+	  software update, such as a package manager, container,
+	  bootloader or even updates of nearby microcontrollers.
+	  An Update Module can be tailored to a specific device or
+	  environment (e.g. update a proprietary bootloader), or be
+	  more general-purpose (e.g. install a set of .deb packages.).
+
+	  https://github.com/mendersoftware/mender-update-modules
+
+if BR2_PACKAGE_MENDER_UPDATE_MODULES
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU
+	bool "DFU"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_DFU_UTIL
+	help
+	  The DFU Update Module is able to update peripheral devices
+	  connected to the device running Mender.
+	  Example use-cases:
+	    - Deploy firmware updates to peripheral devices using the
+	      USB Device Firmware Update (DFU) protocol
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/dfu
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIR_OVERLAY
+	bool "dir-overlay"
+	help
+	  The Directory Overlay Update Module installs a user defined
+	  file tree structure into a given destination directory in the
+	  target.
+
+	  Before the deploy into the destination folder on the device,
+	  the Update Module will take a backup copy of the current
+	  contents, allowing restore of it using the rollback mechanism
+	  of the Mender client if something goes wrong. The Update
+	  Module will also delete the current installed content that was
+	  previously installed using the same module, this means that
+	  each deployment is self contained and there is no residues
+	  left on the system from the previous deployment.
+
+	  Example use-cases:
+	    - Deploy root filesystem overlays
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/dir-overlay
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY
+	bool "dirty"
+	help
+	  The dirty Update Module: modify your device state without
+	  installing an artifact
+	  Example use-cases:
+	    - You have a specific action on the device that you want to
+	      run multiple times
+
+	    - You want to avoid re-creating artifacts just for the sake
+	      of a new version/name
+
+	    - You don't want the artifact the show up in the list of
+	      installed artifacts
+
+	    - The module will always fail the update process, which
+	      means it can never be marked as installed. So it can be
+	      attempted any number of times without having to recreate
+	      newly versioned artifacts.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/dirty
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
+	bool "ipk"
+	select BR2_PACKAGE_OPKG
+	help
+	  The IPK Update Module allows opkg-based packages to be
+	  installed on a device
+
+	  Example use-cases:
+	    - Deploy any ipk package
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/ipk
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
+	bool "podman"
+	depends on BR2_USE_MMU  # podman
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # podman
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # podman
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
+	depends on BR2_USE_WCHAR  # podman
+	select BR2_PACKAGE_JQ # runtime
+	select BR2_PACKAGE_PODMAN
+	help
+	  The Podman Update Module handles the Podman container images
+	  that shall be running on the target device. A deployment with
+	  this module will stop all currently running Podman containers
+	  on the device and start new containers based on the list of
+	  Podman images provided in the Mender Artifact.
+
+	  In case of any unforeseen error during the process, the module
+	  will trigger the rollback mechanism of the Mender client to
+	  restore the previously running Podman containers.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
+
+comment "podman support needs a toolchain w/ headers >= 3.17, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
+	bool "reboot"
+	help
+	  The reboot Update Module: reboot your device remotely.
+
+	  Example use-cases:
+	    - Something went wrong and you have to reboot your device
+	      remotely, and all access to the device you have is Mender.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/reboot
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
+	bool "rootfs version check"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  The rootfs-version-check Update Module implements a full image
+	  update with additional checks to protect against replay
+	  attacks.
+
+	  This is functionally equivalent to the built-in full image
+	  update with an extra check to ensure the artifact name
+	  follows a specific format and that installing "older" images
+	  is rejected. For this reference implementaton, we simply use
+	  a numeric identifier and ensure that it is larger than the
+	  version installed. For actual device fleet use, you may need
+	  to customize this based on your artifact naming scheme.
+
+	  Example use-cases:
+	    - Deploy root filesystem updates and ensure only newer
+	      artifacts are installed
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/rootfs-version-check
+
+comment "rootfs version check needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
+	bool "swupdate"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # swupdate
+	select BR2_PACKAGE_JQ # runtime
+	select BR2_PACKAGE_SWUPDATE
+	help
+	  The SWU Update Module allows deploying an SWUpdate-based
+	  artifact to the device.
+
+	  Example use-cases:
+	    - Extend an existing platform using SWUpdate with OTA.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/swu
+
+comment "swupdate support needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS
+
+endif
+
+comment "mender-update-modules needs mender"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_MENDER
diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
new file mode 100644
index 0000000000..ec879f46a1
--- /dev/null
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
+sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
new file mode 100644
index 0000000000..90c076ea96
--- /dev/null
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# mender-update-modules
+#
+################################################################################
+
+MENDER_UPDATE_MODULES_VERSION = d8c4683e6660af6c65069e10ee4b8ee50ec1af46
+MENDER_UPDATE_MODULES_SITE = $(call github,mendersoftware,mender-update-modules,$(MENDER_UPDATE_MODULES_VERSION))
+MENDER_UPDATE_MODULES_LICENSE = Apache-2.0
+MENDER_UPDATE_MODULES_LICENSE_FILES = LICENSE
+MENDER_UPDATE_MODULES_DEPENDENCIES = host-mender-artifact mender
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
+MENDER_UPDATE_MODULES_MODULES += dfu
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIR_OVERLAY),y)
+MENDER_UPDATE_MODULES_MODULES += dir-overlay
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)
+MENDER_UPDATE_MODULES_MODULES += dirty
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
+MENDER_UPDATE_MODULES_MODULES += ipk
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN),y)
+MENDER_UPDATE_MODULES_MODULES += podman
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT),y)
+MENDER_UPDATE_MODULES_MODULES += reboot
+define MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
+	$(INSTALL) -D -m 0755 $(@D)/reboot/reboot-gen \
+		$(HOST_DIR)/bin/reboot-artifact-gen
+endef
+MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_REBOOT_GEN
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK),y)
+MENDER_UPDATE_MODULES_DEPENDENCIES += python3
+MENDER_UPDATE_MODULES_MODULES += rootfs-version-check
+define MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
+	$(INSTALL) -D -m 0755 $(@D)/rootfs-version-check/mender-compare-versions \
+		$(TARGET_DIR)/usr/bin/mender-compare-versions
+endef
+MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
+endif
+
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU),y)
+MENDER_UPDATE_MODULES_MODULES += swu
+endif
+
+define MENDER_UPDATE_MODULES_INSTALL_TARGET_CMDS
+	$(foreach f,$(MENDER_UPDATE_MODULES_MODULES), \
+		$(INSTALL) -D -m 0775 $(@D)/$(f)/module/$(f) \
+			$(TARGET_DIR)/usr/share/mender/modules/v3/$(f); \
+		if [ -d $(@D)/$(f)/module-artifact-gen ]; then \
+			$(INSTALL) -D -m 0775 $(@D)/$(f)/module-artifact-gen/$(f)-artifact-gen \
+				$(HOST_DIR)/bin/$(f)-artifact-gen; \
+		fi; \
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
