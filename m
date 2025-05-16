Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB47C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 12:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41ACC40784;
	Fri, 16 May 2025 12:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRWN1GiroYY7; Fri, 16 May 2025 12:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D614078E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D614078E;
	Fri, 16 May 2025 12:53:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7607185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B85C94067B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6easEM02JSr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 12:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 268FA4044F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 268FA4044F
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 268FA4044F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 12:53:38 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad22bac1050so26653466b.2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 05:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747400016; x=1748004816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yL24dSFV/rndvadpzBQtJQB3DUR7/0c0D0lwNwBz68E=;
 b=oZcCGhisuZEbMcue+OJUMhBLGXIxw4g6cuhy599uM4cOQu60+/ZGdgzTG+4ascYt6i
 ColS5s64YOSOJrYRa2bTEcjux++1Stdwk46UV8KGS0svv4pEHMWwUf9j6CqbPODimwfq
 ht7VeQkHnpOfoDZ4NM9sifaivVHX/Xe6OrDcGldrCuBZYv7XRV+A7jrMS9eA17TUt0GW
 C3kn86FMoy7xV4t2sDrhu4n44gBlVVjWwEOW/AQwErSHVagKRFMqsgwKV9VReTwAv5AR
 3YXKfsnqhuPXr0Vh5zNFSfMXkwtOih/1npArjjnzyqicC/eTOtbuveH40D+KL/vKybse
 W8DQ==
X-Gm-Message-State: AOJu0YzohyevTCucxwluEouZPMzqrBI5DvR0GgR+LLf5p6kolOsPcP3o
 LOz5ANnMlIlX1W2d69PH0xau5tEJ2OhnXeJwbTF8z1PHM4P8bXI1lG42MIqlxyMHnIbwKkA8PsD
 IKiFgz94=
X-Gm-Gg: ASbGncsaR3kikbx6nq39oCSLzdcGFYhB9oyO22jE4Ugk7dj8k5lRjcOnwQSm2Yynl67
 WIUYXS3dCy07Tv+DmxLgtrnGro2Z84l9UdMimixBc2anJiudXOQ5qTCb4bsOvgA30BaThE8GK/V
 In5lhgSG6yupRd0bUAxaUTmtQwW/JBH6TdnUL6umTnbvBa28cngtDTsEfC/6fFpw4QJ6945DWjz
 LqBmOpDf8/iDJDMT+Uwo0SyT6EWplofi25GToouZn9mMruxgxvE277FQ6d4C6/TKtoLiwQRXyoV
 Fu7AgSCr6W6QswfGryHGSOspl5eZ9EmfRwm2gSfNB14gr0UyfJAnLBmqLzbi9twfE/9YNiXOdyz
 QDFoVy/uqUXPTiHQjJNtReuy6CqlSdkSswL6WttyiicCD+2BX7fNir/rZaSJ+VUj9+mGjIh25ao
 itsjypdOIbdvo3K0a7Jxp7IS+IrX5cAGc=
X-Google-Smtp-Source: AGHT+IGM0HMb7worN2Ik6aqoRaBwOoXbHyp/RTuXKms6dudI6j9kXj8LJDfp4ebzf5OIyW+xBKnzNA==
X-Received: by 2002:a17:907:1df2:b0:ace:cc22:b1f8 with SMTP id
 a640c23a62f3a-ad52d4b362cmr98929266b.4.1747400015583; 
 Fri, 16 May 2025 05:53:35 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca5basm154206366b.161.2025.05.16.05.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 05:53:35 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 14:53:31 +0200
Message-ID: <20250516125333.3681798-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516125333.3681798-1-adam.duskett@amarulasolutions.com>
References: <20250516125333.3681798-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747400016; x=1748004816;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yL24dSFV/rndvadpzBQtJQB3DUR7/0c0D0lwNwBz68E=;
 b=OJPBCMrt+4sAPQnV/Vo/LfJRQmrBR5Gsgm0YKquloJbfiAoxQ/IqSuqO3bIP+evz9G
 ++JxGZH5qh1yjatGv/KyYpBo9O/zYFArC6bGqayJpyguF4wRl8Y0WE7Bott/OFZJhOjH
 WCEdA8IS+6/HNh04dzHsIxnymkcJgt8Cq+bJc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OJPBCMrt
Subject: [Buildroot] [PATCH v3 2/3] package/mender-update-modules: enable
 docker, rpm, and script modules
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

Starting with mender 5.x, the docker, rpm and script modules provided by
the mender package now reside in the mender-update-modules repository.

Even though the mender package provided by Buildroot is not updated yet to 5.x,
it is best to enable the modules here to help facilitate the future update of
the mender package to 5.x, and to ensure that any future modifications or bug
fixes to these modules are easy to apply by simply bumping the upstream package
version.

Script is enabled by default to preserve the existing behavior of the mender
package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3:
  - Remove incorrect dependencies and simply depend on mender (Thomas)
  - Fix indent formatting in mender-update-modules.mk (Thomas)
  
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/mender-update-modules/Config.in       | 180 ++++++++++++++++++
 .../mender-update-modules.hash                |   3 +
 .../mender-update-modules.mk                  |  67 +++++++
 5 files changed, 252 insertions(+)
 create mode 100644 package/mender-update-modules/Config.in
 create mode 100644 package/mender-update-modules/mender-update-modules.hash
 create mode 100644 package/mender-update-modules/mender-update-modules.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4d14aa875..4d92703113 100644
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
index 0000000000..f5bd85fa98
--- /dev/null
+++ b/package/mender-update-modules/Config.in
@@ -0,0 +1,180 @@
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
