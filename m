Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65BDC369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D5881DF8;
	Tue, 29 Apr 2025 10:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZIS1Qs50diV; Tue, 29 Apr 2025 10:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F2F480E93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F2F480E93;
	Tue, 29 Apr 2025 10:16:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F1AF1E3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8093B60761
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WODVpVxf_oQx for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 10:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3322460645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3322460645
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3322460645
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 10:16:13 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac79fa6e1c2so95059266b.1
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 03:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745921770; x=1746526570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/Qw90kmKPzFaMGmYc7038qBGuVyRqW90cei8IlE6HM=;
 b=ACUrcopxZilvUBijZ+qBldhf6SPgC8D4h5jU6VqSFATk62FkGTfDwue+h+zPGDc+KD
 Kp/FG/8FUHSiZZhH9Gr11jkKN8QeFNsDKSM3MxUqg1ufR6cwW+CI5+HL3jc9k3b+e+8Z
 rpVHQPwWmP4tMonBJ7G3bgdRPZ4GgYIuegra8+P3Tq1o2JGcv364VUUe2rgoFILmqU06
 +CB+x0wGx6zQ/VJYyFvioeuLfyIMlRRALCGeky/1TCTFpKZxw+YYQADfOz/fJsd+LTal
 Qd1BT6Zz6vSgQd3wv2/dSpPwZXUM2ljptrkheOSuI0tVvhGXnCHS4G6wp8Oo6T0hFL9d
 Nqig==
X-Gm-Message-State: AOJu0Yz1i8G6K8sH6XqtzFGsxDgoGM6cp4rwRSYBM+6HY+WRUyrzRE5Y
 2BWYSZBJ/51F+Dn7JShodooDErlynDexw5iU0UPUO7vN10JlkGppym3xXjQMi5ozkKXTx4nTbjY
 b
X-Gm-Gg: ASbGncunDU4spH8/rUBHzTx+DxAOdvRExztYKdD1MxumTLb++RK+VekbVv4DBrIytxa
 KfoT+cPpxQpgalb+27hhc5JZw1SEiQRk8axkeuYA8lTYl4NzQXUVrWkNUJtt5XFLdPhZTQN29eR
 Tn22KHNPLPN9TXhfvLQKSvB39fx4TOwXRBCr2/XTJh/OC7v6Z+UUBfyqegk5lje2OLffaWhEfHR
 v6XaPeTq7rjeszpXSme0t6YeMjGjNG/ZC1imML+aE/IYS300XYFcN3bD0LieR55+pXfJ/JkPrU6
 lvFAZc4ewBu6APELd3s1N1E26F5ID6pXmjBZYVhVV2CfIwBGNRJOYl+p9nQZ1hvIGTd2aD6SKvJ
 f2FUvDUVJ6+TnKvMptW67nTkQAsOkcfselXayG7mV8p5ee6rr8eArVXaFFDxiFD1cIn8bNjKxmR
 CWfWPP
X-Google-Smtp-Source: AGHT+IFHDSQih6NTcVOOeAPW3nr9N3XaKvbMEjZd9HZsY92u20OcRmmXntRYNsig7e/y7YOlBPi9kQ==
X-Received: by 2002:a17:907:743:b0:ac6:b817:10f2 with SMTP id
 a640c23a62f3a-acec69d07c0mr78035366b.7.1745921770155; 
 Tue, 29 Apr 2025 03:16:10 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2001-1c00-8182-4700-3d78-0c42-7f3a-1345.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:3d78:c42:7f3a:1345])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4f8835sm768254166b.67.2025.04.29.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:16:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 29 Apr 2025 12:16:06 +0200
Message-ID: <20250429101607.864604-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429101607.864604-1-adam.duskett@amarulasolutions.com>
References: <20250429101607.864604-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745921770; x=1746526570;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/Qw90kmKPzFaMGmYc7038qBGuVyRqW90cei8IlE6HM=;
 b=L1mXW4i2DOpphBio7YW/UlPy3pBzubX7d/CSzMgF1cqwDUvFgIFKzIjYrqzhQOhjk0
 y0IK/0n27POP3Yr3KB2LJeyPo802zo+lHHUW4M3L/iI0/UKHN0QuDucH3kJIzdG095MQ
 nKnkpL+ynujUaQXRmPfEYnosRyq+5k+rrWGVw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=L1mXW4i2
Subject: [Buildroot] [PATCH v2 2/3] package/mender-update-modules: new
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
v1 -> v2: Bump version, add podman support

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/mender-update-modules/Config.in       | 190 ++++++++++++++++++
 .../mender-update-modules.hash                |   3 +
 .../mender-update-modules.mk                  |  68 +++++++
 5 files changed, 263 insertions(+)
 create mode 100644 package/mender-update-modules/Config.in
 create mode 100644 package/mender-update-modules/mender-update-modules.hash
 create mode 100644 package/mender-update-modules/mender-update-modules.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 15389d530b..4158abf360 100644
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
index 167965d64b..5e9cd8d993 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2875,6 +2875,7 @@ menu "System tools"
 	source "package/mender/Config.in"
 	source "package/mender-connect/Config.in"
 	source "package/mender-grubenv/Config.in"
+	source "package/mender-update-modules/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/moby-buildkit/Config.in"
 	source "package/mokutil/Config.in"
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
new file mode 100644
index 0000000000..b789a0a00c
--- /dev/null
+++ b/package/mender-update-modules/Config.in
@@ -0,0 +1,190 @@
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
+comment "mender-update-modules needs a toolchain w/ C++, NPTL, wchar, not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
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
index 0000000000..b66505060a
--- /dev/null
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -0,0 +1,68 @@
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
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
