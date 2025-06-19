Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6DCC7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 00:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEED040C34;
	Thu, 19 Jun 2025 00:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGdwLovo2WWS; Thu, 19 Jun 2025 00:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E193340C1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E193340C1B;
	Thu, 19 Jun 2025 00:59:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D35C3181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C587C60B86
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2eaep36Ao-r for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E19AF60A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E19AF60A93
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E19AF60A93
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:34 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2360ff7ac1bso1899635ad.3
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 17:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750294774; x=1750899574;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JnBAGnqLsmeqpTce4qYVk2LH+X1/mgigJqxvBKzO/Y=;
 b=IgUi3FGChw1kIWgMOcvzu1FBSf5rkEvhh4LnmNH7Lm4qCg1i2d7CD3Tf2AJTLEftTL
 +NuDB+XXOuSNPgukuc+OgKkVimAaFRu36aEjM22Y7LSsCn+7AEXn6ib9zAXIQ0Bqf7mW
 T/RGLRFOuVWUzJzry6pzCFmnz5F3JMRdzfP3Bz2s9G1exJVFo+mdVrd4hiXF3Vbs2tlo
 Sch6PZT0O1EYhzXVsmO3/hASakUmmd929Pe3nZQvXkLgmF3PmMWtx4VtywdOH7aMft4y
 /CsoDXut2zet6gpGRf3ZFXTxsh6oXJUP8JNZzOAH1hARw34cAdbfzAOQPxvH363GdEre
 nQUw==
X-Gm-Message-State: AOJu0YzpzDK1DsRk8Sn8V2EmK2bR4AHUC735oaEYpQuN2qPn7JvMixw0
 hK9xhPrrdO8IEN25pQzw8tGjKD4tpCX21572BBs3FQ84YIPtggkDzkWAXDWJHGq6
X-Gm-Gg: ASbGncvnME4fn9cPmexxrLEiMDTjHjRTATZJw5rpOcqkMGjdbxXearVtaVYM9TrCcnw
 rw8ezqh2Bd/ekp40NqbxL4YjmTy/d5avYmur4ft3R2f820XbhtE3wwkCt4d1GxVl6XumdyGRPfL
 uYzu1Z9yYoaS7oGwUSUHMkfaaG3H9HHJVg9T8hlpbzk0elbGgAPnOPXbk9LUudbl/JUZTODodoK
 CjD1MaXhJLQua0a8zs6vdc/I+vK07b69OJ6BPhgouUgwHmT2aXVknwv55+TkFK/bpo8rU0/qcNH
 lc6FeSnDQUi17FnUf3C5YDiDzDmsKrJ5CTD37JFqObOPuDLBgx7MM0ZB698flQ==
X-Google-Smtp-Source: AGHT+IFl+qcPgZ+dO1Ti6iwjEYhN03wN8tGNBujjRxE0EVR1YQeD0hYIHvO6W32gGfOuv+oDgLEMkQ==
X-Received: by 2002:a17:903:1b05:b0:223:653e:eb09 with SMTP id
 d9443c01a7336-2366afc34a9mr259371015ad.7.1750294773987; 
 Wed, 18 Jun 2025 17:59:33 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb87ddsm107884165ad.177.2025.06.18.17.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 17:59:33 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Jun 2025 17:59:31 -0700
MIME-Version: 1.0
Message-Id: <20250618-virglrenderer-upstream-v1-2-57525ac8406e@gmail.com>
References: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
In-Reply-To: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750294774; x=1750899574; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6JnBAGnqLsmeqpTce4qYVk2LH+X1/mgigJqxvBKzO/Y=;
 b=kykpy8BkR1ijVwqqNk2odWSle2rvbbgWJgH8t4t5HIqpJqo8UnPF1F5z5Js8b9pjU/
 sNsKuZ1lCzhLTvDGiP0axyJDLHE1w/fmcTdi9vG/3XmT7QYzGataBBpRWWSBIkykkq2M
 fon3Lu0MZ8InB+206hDIR0SXqt6gLmeCnvB/UURBasJFNeHclPxYdM+0vi/XloNhdIDM
 k3gpCJK3h7bD+urY5qj3bWMuy9cfM5TYiE8rTQqnCNgygN1pgL+Fw/zR5gjGDNe5MwKl
 T1u07azM337mKcJZv6IXO4L7rr/zM7dcfQvvUCdhbtc11B4lOuQYTx7xn9SjFLd1/5rL
 M4Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kykpy8Bk
Subject: [Buildroot] [PATCH 2/3] package/virglrenderer: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add virglrenderer, an optional dependency of QEMU, which facilitates
acceleration of rendering and optionally video decode through
virtio-gpu.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/virglrenderer/Config.in          | 46 ++++++++++++++++++++++++++++++++
 package/virglrenderer/virglrenderer.hash |  5 ++++
 package/virglrenderer/virglrenderer.mk   | 36 +++++++++++++++++++++++++
 5 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e31f6b515578acb2fa199d31d9f6af5551a9830..21d2593b47883ea7bf8dbbd7bc5861f04359ecb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1775,6 +1775,7 @@ F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
+F:	package/virglrenderer/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index 10f6856dea5dfcc457bd2ce0145ebd5a3f5a2e25..ab082dcd3e2b9edc0c3dd0bbf11e8abae9578548 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1804,6 +1804,7 @@ menu "Graphics"
 	source "package/stb/Config.in"
 	source "package/tiff/Config.in"
 	source "package/unclutter-xfixes/Config.in"
+	source "package/virglrenderer/Config.in"
 	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..e81fbf732286a8d87a1f1070a73905fb6633d7dd
--- /dev/null
+++ b/package/virglrenderer/Config.in
@@ -0,0 +1,46 @@
+config BR2_PACKAGE_VIRGLRENDERER
+	bool "virglrenderer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_USE_MMU # libdrm
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBDRM
+	help
+	  VirGL is a virtual 3D GPU for use inside QEMU
+	  virtual machines, that allows the guest operating
+	  system to use the capabilities of the host GPU to
+	  accelerate 3D rendering.
+
+	  https://docs.mesa3d.org/drivers/virgl.html
+
+if BR2_PACKAGE_VIRGLRENDERER
+
+config BR2_PACKAGE_VIRGLRENDERER_VENUS
+	bool "venus"
+	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader
+	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
+	select BR2_PACKAGE_VULKAN_HEADERS
+	select BR2_PACKAGE_VULKAN_LOADER
+	help
+	  Venus is a virtio-gpu protocol for Vulkan command
+	  serialization.
+
+	  Say 'y' if you want to run applications with Vulkan
+	  acceleration in virtualized guests.
+
+	  https://docs.mesa3d.org/drivers/venus.html
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_AMDGPU
+	bool
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	depends on BR2_PACKAGE_USE_MMU # libdrm-amdgpu
+	select BR2_PACKAGE_LIBDRM_AMDGPU
+
+config BR2_PACKAGE_VIRGLRENDERER_DRM_MSM
+	bool
+	default y if BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be # libdrm-freedreno
+	select BR2_PACKAGE_LIBDRM_FREEDRENO
+
+endif
diff --git a/package/virglrenderer/virglrenderer.hash b/package/virglrenderer/virglrenderer.hash
new file mode 100644
index 0000000000000000000000000000000000000000..8b6ab7adef84c9aac07eb18c55b734add067c0d2
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  1fc34ffbf2a4f5cf161228f13242e28283bd818901d7daf0027e6ae5fcaeaf9b  virglrenderer-1.1.1.tar.gz
+
+# License
+sha256  3b32caf16e2402c2aff2b716858713f3e1feded85c25e71bf829816ee5009402  COPYING
diff --git a/package/virglrenderer/virglrenderer.mk b/package/virglrenderer/virglrenderer.mk
new file mode 100644
index 0000000000000000000000000000000000000000..710a8dcd63a584c4c71b48b9d0b45db1c4c49f07
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# virglrenderer
+#
+################################################################################
+
+VIRGLRENDERER_VERSION = 1.1.1
+VIRGLRENDERER_SITE = https://gitlab.freedesktop.org/virgl/virglrenderer/-/archive/$(VIRGLRENDERER_VERSION)
+VIRGLRENDERER_LICENSE = MIT
+VIRGLRENDERER_LICENSE_FILES = COPYING
+VIRGLRENDERER_INSTALL_STAGING = YES
+VIRGLRENDERER_DEPENDENCIES = \
+	libepoxy \
+	libdrm \
+	libegl \
+	host-pkgconf
+VIRGLRENDERER_CPE_ID_VALID = YES
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_VENUS),y)
+VIRGLRENDERER_CONF_OPTS += -Dvenus=true
+VIRGLRENDERER_DEPENDENCIES += vulkan-loader
+endif
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_DRM_AMDGPU),y)
+VIRGLRENDERER_DRM_BACKENDS += amdgpu-experimental
+endif
+
+ifeq ($(BR2_PACKAGE_VIRGLRENDERER_DRM_MSM),y)
+VIRGLRENDERER_DRM_BACKENDS += msm
+endif
+
+ifneq ($(VIRGLRENDERER_DRM_BACKENDS),)
+VIRGLRENDERER_CONF_OPTS += -Ddrm-renderers=$(VIRGLRENDERER_DRM_BACKENDS)
+endif
+
+$(eval $(meson-package))

-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
