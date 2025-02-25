Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DDCC021BC
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 13:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 024D140C11;
	Tue, 25 Feb 2025 13:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpNKz_guSY2M; Tue, 25 Feb 2025 13:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 382B140B8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382B140B8B;
	Tue, 25 Feb 2025 13:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7A2F2019
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1C9740237
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwtZnjcAwyv6 for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 13:38:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C622F4100B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C622F4100B
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C622F4100B
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:38:33 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab7d8953b48so90030766b.2
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 05:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740490711; x=1741095511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ET2l+8tWztS6RxVaRbBCNUFaEjsHUYgIKZ8zzHUrA0I=;
 b=I3c2yUC9qoM7tSgHfFlxgxQucJVfMrZHH+Og4+g6bUUtXMbQkS/g+oZtWX0cbwywkY
 OO03VMmnBe0S1Biv9Bl+ZeidTtjNxaHLcW//1lZn/B+rP3/1H1N9wmrjI2i3j27U74he
 WZEDZm1ziKkLxMelVMs9n6+KX2CQypG6A93HTvqG2dikFBEOVhomeoyVqHwlqCMR1+bw
 WHFbcBWTBaWnYdbBeQYMBy8t2GtRrCQfZQo8bH39ThLoqkByO09Z+DM/OZ4iTAm/YB01
 CVgCzdybAeUCnT5Lxxxnh5KJle3wS4aKCvxG0mCipkeeMlb4swwcYb1hlaBoGjJXfY5f
 mEdg==
X-Gm-Message-State: AOJu0YyCD4M03wpJtW0RubhTCTud2qBFjCtrBf/FXoQKa1QSZw7KaXHK
 HMFL+HOHzNlRO3235E85VzkfoU8AkL9+ul+DnPuFMELowB/YztwMdWYEGPOsoFLJ7T7PuBH6hn+
 lkGBcsA==
X-Gm-Gg: ASbGncsMB1L10drjYgR6UguAZxpJNutTLGftwsCmS8/Z98Dk49QV3yQTCoMjhlh39Sg
 KOlCztNUcOyaaM3V0hEkCzwhbttZuKKf5/CJrb9/pVqB2Jp0UwZ8xoSRSO3g9dSgXk8H3gfPgS5
 cJKq5YLTcEsbCTetpIYjT+kC033QvOXD6+OqecyduTk0Vbu4TbT0f6F48yYL3yXNWGoDdZPRtNY
 xv6lVqgCbliwR3UQeY5rjmYEHVuhXKrHatvFITHG+yw1Wm1wq8lzpgifj6d6vq2hv+0CP0LCpLl
 ExgVHsRgk14jZycJzIFxBIXfLsJyhQ96v0U13nopgEYi+dufNOF+naODo2rIlfaMa4RFa1b8TdC
 U2K5CzwEO0Tf8UJFT0u9/SPJzBBLUqjfPS2sAs+mdjnXN62mN0faftubPkdW8PJQFtqI=
X-Google-Smtp-Source: AGHT+IGxepIQhu7Ij7TvLLCl2iIeQPFESnP4n6Ra9edTpFD7wnQ7+x97W2PLvABWu+yOGn84dQXIbA==
X-Received: by 2002:a17:906:f5a9:b0:ab7:63fa:e33a with SMTP id
 a640c23a62f3a-abc096d0bdamr623988866b.0.1740490711223; 
 Tue, 25 Feb 2025 05:38:31 -0800 (PST)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed2010fbasm143775966b.105.2025.02.25.05.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 05:38:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 25 Feb 2025 14:38:28 +0100
Message-ID: <20250225133829.2888663-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740490711; x=1741095511;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ET2l+8tWztS6RxVaRbBCNUFaEjsHUYgIKZ8zzHUrA0I=;
 b=f08iw3+ISHNkBvKGx+NP1cP3DJ9IEOREuZIOgeEe+3WfTGV/EOa+utv06Vf1rmzOIb
 0/sYgh2I/QkBBtMi4r1dyeB3726GD7aOgsTx3SYbJjpGNjztF3yua7Vjhy7CLKx2Hlrt
 0220y1dDILwg557e1pzCO6feOYqFiaBI6UDlM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=f08iw3+I
Subject: [Buildroot] [PATCH 1/2] package/mender-update-modules: new package
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
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/mender-update-modules/Config.in       | 156 ++++++++++++++++++
 .../mender-update-modules.hash                |   3 +
 .../mender-update-modules.mk                  |  63 +++++++
 5 files changed, 224 insertions(+)
 create mode 100644 package/mender-update-modules/Config.in
 create mode 100644 package/mender-update-modules/mender-update-modules.hash
 create mode 100644 package/mender-update-modules/mender-update-modules.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c07837e431..7681a7c9d5 100644
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
index 4a81a62ec4..1cf88863af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2852,6 +2852,7 @@ menu "System tools"
 	source "package/mender/Config.in"
 	source "package/mender-connect/Config.in"
 	source "package/mender-grubenv/Config.in"
+	source "package/mender-update-modules/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/moby-buildkit/Config.in"
 	source "package/mokutil/Config.in"
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
new file mode 100644
index 0000000000..5386049f6f
--- /dev/null
+++ b/package/mender-update-modules/Config.in
@@ -0,0 +1,156 @@
+config BR2_PACKAGE_MENDER_UPDATE_MODULES
+	bool "mender-update-modules"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-log
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-log
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_HOST_MENDER_ARTIFACT
+	select BR2_PACKAGE_MENDER
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
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
+	bool "reboot"
+	help
+	  The reboot Update Module: reboot your device remotely.
+
+	  Example use-cases:
+	    - Something went wrong and you have to reboot your device
+	      remotely, and all access to the device you have is Mender.
+
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
+	bool "rootfs version check"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3
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
+	select BR2_PACKAGE_JQ
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
+comment "mender-update-modules needs a toolchain w/ C++, NPTL, wchar, not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
new file mode 100644
index 0000000000..3565239e09
--- /dev/null
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  433279210d1f2c429ff9bcb595ef3c0d9c9a46a1daa397196edc6758b7a822aa  mender-update-modules-662b237b9a09ddadbe82daeac4181be3e0cfbd4a.tar.gz
+sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
new file mode 100644
index 0000000000..f16e219c6e
--- /dev/null
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# mender-update-modules
+#
+################################################################################
+
+MENDER_UPDATE_MODULES_VERSION = 662b237b9a09ddadbe82daeac4181be3e0cfbd4a
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
+	$(INSTALL) -D -m 0775 $(@D)/$(f)/module/$(f) \
+		$(TARGET_DIR)/usr/share/mender/modules/v3/$(f); \
+	if [ -d $(@D)/$(f)/module-artifact-gen ]; then \
+		$(INSTALL) -D -m 0775 $(@D)/$(f)/module-artifact-gen/$(f)-artifact-gen \
+			$(HOST_DIR)/bin/$(f)-artifact-gen; \
+	fi; \
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
