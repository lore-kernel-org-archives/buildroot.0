Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3551AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 15:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D8F2813BC;
	Wed, 14 Dec 2022 15:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D8F2813BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxHjIPsG1ACL; Wed, 14 Dec 2022 15:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECC6B813B7;
	Wed, 14 Dec 2022 15:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC6B813B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43AC91BF3C9
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 15:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC6B813B7
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 15:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC6B813B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sy4V5XtCIm9f for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 15:20:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA2381372
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FA2381372
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 15:20:04 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id i83so3531521ioa.11
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 07:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=50dsFA+yKqEVRr3HIMnlIfZ4SA0HG9hwhuMe/2Eom4E=;
 b=rpouEDkeqNoMNaEdFqFqkOW8fLSD128FQSY/s5FBiJa31FL6lRHUKjS5DbXe9Bu/al
 zBSzjiV3kxaVNdE8ZeRD0OPJaNKJxpf+f/CbwsJHTnPyZ6V26+Wex58IHe0ZMJBj1v5X
 8Glv/ZcxOTrFR0rEy+261F/tk3G/nguzEgtVwKQRtlASGhefw/kOuV2pWpmiqDfJvvJp
 jBRovZC1cZCx1CJ4equAYREJ22lEMdYfQNirtFrsVlyuniV7ecsl5JdPXzy6uvAVTJYB
 uAWUcnqFB9M/IgITzG4jAc9q9/wWc30KSp7KuFpU0AbbLvaXxNi1j2sWnqdzdvfXLEe3
 QBFg==
X-Gm-Message-State: ANoB5plnj6F3UCSEDL7zoTznK1Irfg/zxzMyhRKkh0W7rL4BM4Bx+w9L
 JW0HW91XaCTEKNUtVTIKgZ9cY+HkbK3cLwBU
X-Google-Smtp-Source: AA0mqf4K9mymvfFkzsahviXgNVxs6YwAiy19bBZ4CtS9Buy0IMByXguPUErejjo6OKKUXqvgxy7fNA==
X-Received: by 2002:a05:6602:2289:b0:6e2:dc1e:527b with SMTP id
 d9-20020a056602228900b006e2dc1e527bmr2199295iod.19.1671031203074; 
 Wed, 14 Dec 2022 07:20:03 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 m205-20020a6b3fd6000000b006e005dc3670sm6482310ioa.39.2022.12.14.07.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 07:20:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 08:19:58 -0700
Message-Id: <20221214151958.3419333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=50dsFA+yKqEVRr3HIMnlIfZ4SA0HG9hwhuMe/2Eom4E=;
 b=BWADIOWCkQt7F1Fb2OW8gVGBzk8j+AKkC1kIF6zHJbFcDnTZEMYtBntJ8Gpp2TfOSn
 ZM2aRQr44c7zD98Gf7PrDq0arkYghuIhi3z/FvgnarzLux/O+K//73kOQGmmh/8y9TGg
 Viii7djekAkbGJt83hoP1ekXAVtyRgueQr1WKpNuST2djE9MnqmJ/KEDXqxL+dX4jc50
 qJDloB1Jk+aCqUg/MFE8AgCDaXhoDNwgAzeFBhuuykS0GUG0fG6L9dOme6uwEJBDn+hc
 5hMzfBJXc7Sm41BTrtKu2mFPhLD2a/fSfPCthsXFRS9H0bMsu85dpgT26kO7TafOFF4m
 XSbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BWADIOWC
Subject: [Buildroot] [PATCH v2 1/1] package/weston: bump to version 11.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Drop no longer supported weston-launch.

Drop no longer supported color-management-colord config option.

Remove duplicate backend-headless config option.

Add new libgbm requirement for renderer-gl.

Add new freerdp server requirement for backend-rdp.

Add support for new screenshare feature.

Add support for new rdp as backend default feature.

Ensure we have at least one launcher by selecting seatd if
launcher-logind dependencies are not selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - bump to version 11.0.1
  - propagate freerdp-server dependencies to weston-rdp
  - ensure we have at least one launcher enabled
---
 ...ncy-on-screenshooter-client-protocol.patch | 38 -------------------
 package/weston/Config.in                      | 22 ++++++++++-
 package/weston/weston.hash                    |  6 +--
 package/weston/weston.mk                      | 30 +++++----------
 4 files changed, 33 insertions(+), 63 deletions(-)
 delete mode 100644 package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch

diff --git a/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
deleted file mode 100644
index 927215380e..0000000000
--- a/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2ac6b6b084a877adde64db7faff2ed22eb3ea97a Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniels@collabora.com>
-Date: Tue, 8 Feb 2022 22:39:42 +0000
-Subject: [PATCH] tests: Add dependency on screenshooter client protocol
-
-Given that the test-helper code relies on the screenshooter protocol,
-make sure it's available for us to build, and the dependency ensures we
-build in order.
-
-Fixes: #588
-
-Signed-off-by: Daniel Stone <daniels@collabora.com>
-
-[Retrieved from:
-https://gitlab.freedesktop.org/wayland/weston/-/commit/2ac6b6b084a877adde64db7faff2ed22eb3ea97a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tests/meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 2d464ddcc..222091cd1 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -29,8 +29,9 @@ lib_test_client = static_library(
- 		'weston-test-client-helper.c',
- 		'weston-test-fixture-compositor.c',
- 		weston_test_client_protocol_h,
--		weston_screenshooter_protocol_c,
- 		weston_test_protocol_c,
-+		weston_screenshooter_client_protocol_h,
-+		weston_screenshooter_protocol_c,
- 		viewporter_client_protocol_h,
- 		viewporter_protocol_c,
- 		'color_util.h',
--- 
-GitLab
-
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3b4e932b7d..e6d057f26e 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_SEATD if !BR2_PACKAGE_DBUS || !BR2_PACKAGE_SYSTEMD
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
@@ -42,6 +43,15 @@ config BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
 	bool "headless"
 	select BR2_PACKAGE_WESTON_HEADLESS
 
+config BR2_PACKAGE_WESTON_DEFAULT_RDP
+	bool "rdp"
+	depends on BR2_USE_MMU # freerdp, libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_WCHAR # freerdp
+	depends on BR2_INSTALL_LIBSTDCPP # freerdp
+	depends on BR2_PACKAGE_XORG7 # freerdp-server
+	select BR2_PACKAGE_WESTON_RDP
+
 config BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
 	bool "wayland (nested)"
 	select BR2_PACKAGE_WESTON_WAYLAND
@@ -60,6 +70,7 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 	string
 	default "drm"      if BR2_PACKAGE_WESTON_DEFAULT_DRM
 	default "headless" if BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
+	default "rdp"      if BR2_PACKAGE_WESTON_DEFAULT_RDP
 	default "wayland"  if BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
 	default "x11"      if BR2_PACKAGE_WESTON_DEFAULT_X11
 
@@ -73,7 +84,9 @@ config BR2_PACKAGE_WESTON_RDP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_INSTALL_LIBSTDCPP # freerdp
+	depends on BR2_PACKAGE_XORG7 # freerdp-server
 	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_FREERDP_SERVER
 	help
 	  This enables the RDP backend, which allows accessing weston
 	  through the network with any RDP-compliant client.
@@ -87,10 +100,11 @@ config BR2_PACKAGE_WESTON_RDP
 	  /etc/freerdp/server/ so you may want to change them in a
 	  post-build script or a rootfs overlay.
 
-comment "RDP compositor needs a toolchain w/ wchar, C++"
+comment "RDP compositor needs a toolchain w/ wchar, C++, X.org"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_WESTON_HEADLESS
 	bool "headless (testing) compositor"
@@ -143,6 +157,10 @@ config BR2_PACKAGE_WESTON_SHELL_KIOSK
 	default y
 	select BR2_PACKAGE_WESTON_HAS_SHELL
 
+config BR2_PACKAGE_WESTON_SCREENSHARE
+	bool "screenshare"
+	default y
+
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index d58ca1ef70..44db3155fe 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042260.html
-sha256  8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115  weston-10.0.1.tar.xz
-sha512  688d843096a95b463161b98e85ca3443b31ba2ee49fc8d456a2780cc96f576e9d097054e9f361997a66e9cc8373cf29e406a742dae3884b3b50b26acf1710c8c  weston-10.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-December/042538.html
+sha256  a413f68c252957fc3191c3650823ec356ae8c124ccc0cb440da5cdc4e2cb9e57  weston-11.0.1.tar.xz
+sha512  d451230fc260b45aaaadb5cf0aa360629e45e72e3b3676c6ec040d6c6549dbb57d05683effd962c3b2d61482b47a6c990d12cc736c896b501d982c8c4d34834c  weston-11.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5e71473640..aa028e1953 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WESTON_VERSION = 10.0.1
-WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
+WESTON_VERSION = 11.0.1
+WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/uploads/f5648c818fba5432edc3ea63c4db4813
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
@@ -16,8 +16,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng udev cairo libinput libdrm
 
 WESTON_CONF_OPTS = \
-	-Dbackend-headless=false \
-	-Dcolor-management-colord=false \
 	-Ddoc=false \
 	-Dremoting=false \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
@@ -57,23 +55,9 @@ else
 WESTON_CONF_OPTS += -Dimage-webp=false
 endif
 
-# weston-launch must be u+s root in order to work properly
-ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-define WESTON_PERMISSIONS
-	/usr/bin/weston-launch f 4755 0 0 - - - - -
-endef
-define WESTON_USERS
-	- - weston-launch -1 - - - - Weston launcher group
-endef
-WESTON_CONF_OPTS += -Ddeprecated-weston-launch=true
-WESTON_DEPENDENCIES += linux-pam
-else
-WESTON_CONF_OPTS += -Ddeprecated-weston-launch=false
-endif
-
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 WESTON_CONF_OPTS += -Drenderer-gl=true
-WESTON_DEPENDENCIES += libegl libgles
+WESTON_DEPENDENCIES += libegl libgbm libgles
 ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
 WESTON_CONF_OPTS += -Dpipewire=true
 WESTON_DEPENDENCIES += pipewire
@@ -180,6 +164,12 @@ else
 WESTON_CONF_OPTS += -Dshell-kiosk=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_SCREENSHARE),y)
+WESTON_CONF_OPTS += -Dscreenshare=true
+else
+WESTON_CONF_OPTS += -Dscreenshare=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
 WESTON_CONF_OPTS += -Ddemo-clients=true
 WESTON_DEPENDENCIES += pango
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
