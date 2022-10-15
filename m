Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E40C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 20:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F9D160D6E;
	Sat, 15 Oct 2022 20:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9D160D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWdcIjGdhQ1p; Sat, 15 Oct 2022 20:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1CE60ADF;
	Sat, 15 Oct 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF1CE60ADF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEA81BF593
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B5C860ADF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B5C860ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bA8hugziwCtQ for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 20:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E48360A68
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E48360A68
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 20:55:11 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id d14so4168583ilf.2
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 13:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H4XCrh6AF2pccwTxlYkYmMEB3dDJYUfF1FAMtXYzN3g=;
 b=03Pvk0N8NtdgPDONvJCQdL8uzQheCtPO7QNSzae5aiVycp9F2bAQlHX1ymF/ueMu8e
 5nu0CyjTWOMKPsYYHXC9XNTkLA6LTUTOZ2CWnHGmEpmmKAxA2gb1Lk+RaN+NxeUQW4yV
 //fXR/y1EX7dysw8y+PdfwzdyuS7ZRfDdmpmhEf3GShPQrQAmM1ISD2pe654FKwcP8kH
 o0h7dH8x6pVeSSMGOTZR7t3c+4r5DYkErof+uM0aKyXtZ0lexNT6xeIWUKxJGlyAzXtC
 UAutmHKf+riIfxWry6n9NZ3jhTWrLuIFuCzJXID8kFXjJKnkWVLYwhxMeiQ8RyTMrQ7k
 6jFw==
X-Gm-Message-State: ACrzQf0KZe4ciFwhgfocqdDs9m2Eg8gBayy3LOaNnZPgLZ4SJunN6F0p
 F5Puf9mhl1iPHRtbeonGwsGk+3JxXMFEDg==
X-Google-Smtp-Source: AMsMyM729Us0jAtdYUsVZYLcTrTm50cjRSm1LLvxqnhz3DNCg4mJL7fsh4zZ/4oaoLxG/yDdJ2LCYw==
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr1829622ile.202.1665867309959; 
 Sat, 15 Oct 2022 13:55:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x11-20020a02ac8b000000b0035a196d1e56sm2579136jan.69.2022.10.15.13.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 13:55:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 14:55:06 -0600
Message-Id: <20221015205506.3903346-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H4XCrh6AF2pccwTxlYkYmMEB3dDJYUfF1FAMtXYzN3g=;
 b=oCF4p2VGVNETfoMQolaHrxl4bcPx2XJIJzNin5DBucyolt5N0z6FOT/gvJq9B1sD80
 3GuCzXm0I71oHep9j7q5KIjX9U6U/N/1uMzpeyKo+9iMjvItDNMEa7q7V/CKsbxDQ+Rv
 KiZ49zmVU7323WPeM23jcCQ2xGnUCW1AMthOnl7UKu0IUmE6aLbdjQdkU6c515GUsUki
 CKSy+icTXkiePJxajfX/+sIg/uQuv3QZNMWCDZpeye8N2zMTKofhLfbPLdlZFC3sZMpB
 7dS/8tX8dnEty9+A/tvOG0269wQrvjjMV3BW7AWgq+zLHxcJn27jfdQ/NvucF/t4Fb0Y
 l65g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oCF4p2VG
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 11.0.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ncy-on-screenshooter-client-protocol.patch | 38 -------------------
 package/weston/Config.in                      | 14 +++++++
 package/weston/weston.hash                    |  6 +--
 package/weston/weston.mk                      | 28 +++++---------
 4 files changed, 26 insertions(+), 60 deletions(-)
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
index 3b4e932b7d..20ca826324 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -42,6 +42,14 @@ config BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
 	bool "headless"
 	select BR2_PACKAGE_WESTON_HEADLESS
 
+config BR2_PACKAGE_WESTON_DEFAULT_RDP
+	bool "rdp"
+	depends on BR2_USE_MMU # freerdp, libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_WCHAR # freerdp
+	depends on BR2_INSTALL_LIBSTDCPP # freerdp
+	select BR2_PACKAGE_WESTON_RDP
+
 config BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
 	bool "wayland (nested)"
 	select BR2_PACKAGE_WESTON_WAYLAND
@@ -60,6 +68,7 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 	string
 	default "drm"      if BR2_PACKAGE_WESTON_DEFAULT_DRM
 	default "headless" if BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
+	default "rdp"      if BR2_PACKAGE_WESTON_DEFAULT_RDP
 	default "wayland"  if BR2_PACKAGE_WESTON_DEFAULT_WAYLAND
 	default "x11"      if BR2_PACKAGE_WESTON_DEFAULT_X11
 
@@ -74,6 +83,7 @@ config BR2_PACKAGE_WESTON_RDP
 	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_INSTALL_LIBSTDCPP # freerdp
 	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_FREERDP_SERVER
 	help
 	  This enables the RDP backend, which allows accessing weston
 	  through the network with any RDP-compliant client.
@@ -143,6 +153,10 @@ config BR2_PACKAGE_WESTON_SHELL_KIOSK
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
index d58ca1ef70..88061c2bca 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042260.html
-sha256  8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115  weston-10.0.1.tar.xz
-sha512  688d843096a95b463161b98e85ca3443b31ba2ee49fc8d456a2780cc96f576e9d097054e9f361997a66e9cc8373cf29e406a742dae3884b3b50b26acf1710c8c  weston-10.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-September/042410.html
+sha256  a6138d4dc9554560ac304312df456019f4be025ec79130f05fb5f2e41c091e1d  weston-11.0.0.tar.xz
+sha512  71554dc870e9c6832fdfb8f0e8dbcd7ad01c3827041c2f7fe4b7679df33b242fd00e7f0c8728d1aeecc648f8296a9d3fc502a66c91ec662f03086d9a28aab3ea  weston-11.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5e71473640..59b977721a 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 10.0.1
+WESTON_VERSION = 11.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
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
