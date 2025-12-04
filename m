Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972E0D1BDF9
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E45960C1F;
	Thu,  4 Dec 2025 04:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_xcPRvMDB72; Thu,  4 Dec 2025 04:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7783A60C23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764822616;
	bh=RPEdmja0TQRSpclmG4vpOhTgFgnzeDJ7FvwExpdSmbc=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7cVdJhhBMrleEXz+NIgA1wi2lX093InF0v2EQa72mJR+sWLRk1O4LbFAIyP/3nVg
	 Qu48Ba7ApKi3sik4ESwIdKCiFKzAXm/6upFSumzVXU+aknb0XUjeORlmC8B3o/bVr7
	 nqjrzCICdl11lKwGjRjbuKJJS6A5mMoOR3jbCQL/QOwp/ucseYKJp4pkdmjpi/hn4N
	 9laj3rOR/QF7m2oYYyLhC9NavZ/2rl/UtamUsqdeZodqBjpMefTQJAkow0TCn6emI0
	 tntVDV9i1SdN0wP0MAKDfn8keAkNkig1eUxIr2o3CbbnGRVPugKfQWf4Fgtx4vBXFx
	 O17/U20lNCwkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7783A60C23;
	Thu,  4 Dec 2025 04:30:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9445FD3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E13401ED
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VcC1jMybiGe for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 04:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7D60401DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7D60401DE
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7D60401DE
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 04:30:13 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-29d7b019e0eso6233155ad.2
 for <buildroot@buildroot.org>; Wed, 03 Dec 2025 20:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764822612; x=1765427412;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BhuYInsFAa5OjWHluCv0Zk093+MExUKbmNfzIW0ky0M=;
 b=fhplzOghpdX7A19DbjLvOwd1Qs9NuVypaq8YOyIexT2ppQoQGtm5OvTdp3BEN7RoLF
 Am082enVsJawn9c2+2t0WDC7yt6M9NtQdv18LP4+z0/avL5IvHEUIWQ4i7Vn07KAC9/F
 gobsdZYQSJkw38MCWgKnRcqUGLuHHUIdZz7JOfePHk+5TZmBC7TfOqMrCiXXVbEHeabp
 DAdcs2CaszytmLF2djXlXDyt1nBNAqYhorfvh+UEH7lv9WLrUK8H5T8H3cCU0ODg0z3D
 VpO5r2zhd3yCgwqJGADe7dCeqzaPcbJPN6AbU7Rd/7NLcPU3xV/sDJsUD0p6Mn2HjA2c
 xveg==
X-Gm-Message-State: AOJu0YwyERVzKgFix8vPl1hpEvpWbtgs8YiW+zAs302Fu8ObQwSzRk10
 jy/xa596beUiQrvJEYx1qQd7ugrcMjSShRswI3Lyn8Ah4PbCwhtGY0qeHfuIFQZuO9Y=
X-Gm-Gg: ASbGncti8WC1/i054ycMMRlngrADg80SIZJqQNSPritzAX4iIEtvb1wnHuUd7I9TUZC
 HFqBSKzceXr025ve3dmsCZ2o71vTWk+a/Fmm7lsRTl3sVf+Dhkw33NQ6CW47dFQy7hB3MtZouwB
 V0Wf7B7zVl92kJUbQG/HbkFNv18gK/StunwRGCV6KTmj6N45/Hiy8IdASJyzPJx1YyeBicmcPrH
 RNpFBh82HUWO3L8NZHUZo8zCiYP2vXCXkiKuDKPG4SJGVLZu2vOaEsU/Shn5ILeiTmsBFpKjnak
 OcdhZcgz7mfgJ3n32aeyd8c29961WsGwlkZ5xzM3eleji/Dy23Bo685//bmn1RGPyYtvcJwFIhR
 +lsbT8lHJFznblo9k4M1p00HQ/zeFkJfYxx1rpOlyH4bNITqTYDb3yV8fqj3V3cCo4nHrXxgucL
 iNDNP0b1htovg=
X-Google-Smtp-Source: AGHT+IGyPFcfRMHVZXpyv2s4KqnRGedh2GjwI78cQHnuL/L78ONJXeVbpITivbQZiGDXkxeO9CHYgA==
X-Received: by 2002:a17:902:d4d0:b0:29d:9db2:f833 with SMTP id
 d9443c01a7336-29d9db2fcdfmr23995095ad.25.1764822612592; 
 Wed, 03 Dec 2025 20:30:12 -0800 (PST)
Received: from wash.local ([50.47.123.62]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae49c8absm4968325ad.16.2025.12.03.20.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 20:30:11 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 03 Dec 2025 20:29:54 -0800
MIME-Version: 1.0
Message-Id: <20251203-virglrenderer-v2-v2-1-2846fc1a579a@gmail.com>
References: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
In-Reply-To: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764822610; l=4425;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=XTlEGavQnYWWSYj95KNGOC8xtCv0YdmiTy7qXYcHfH4=;
 b=q/cpPWiS47q2MLTjMMVwfT1Y5tdKI95Igs8z9JIosuCPr5Eco6D1d/bDyHPzz40tGoY8jCvgX
 ggJ5fJ6pGSuCAc+re531GNkAXjFn8TPk3+zd2mBWFIuPhTQlly2PiRB
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764822612; x=1765427412; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BhuYInsFAa5OjWHluCv0Zk093+MExUKbmNfzIW0ky0M=;
 b=Jd//11ShsSoZUypL7fSgO4bO7wq8rvFqXrVIkHBu/Jx6Psi3nZ8Um3tjGKaUnmsxBk
 +j0STRX62DtMSvnjBGwVYaHX+knRrw/8Ne1HXF5PxlbRmvJEQoGz6DxAGFwrdMIcQdxe
 H7FBXABlqtOE95fAN3IeGE2DzLZGIckjGsyjEE+8C8PRTPj252+8IdnPEnvndCqU1MLM
 FD2PQ9WdJjdMoHXj0ai2RUk67ZDGxIM5UXjylc+f0hfKBEQYfrJMoV2DmEWQLgxwneh+
 TTf7DieW2PSj8D6/JPIivKhwI4wJzN+MjVQ4hWy8y5IfUlMfo7Gl8b80/4Cot79KVXiJ
 8Daw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jd//11Sh
Subject: [Buildroot] [PATCH RESEND v2 1/2] package/virglrenderer: new package
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

Add virglrenderer, an optional dependency of QEMU, which facilitates
acceleration of rendering and optionally video decode through
virtio-gpu.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/virglrenderer/Config.in          | 33 +++++++++++++++++++++++++++++
 package/virglrenderer/virglrenderer.hash |  5 +++++
 package/virglrenderer/virglrenderer.mk   | 36 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fb8eedb5cf..9ae46884c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1787,6 +1787,7 @@ F:	package/python-xlib/
 F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
+F:	package/virglrenderer/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index 1c4dcf2c75..f7cfffae0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1807,6 +1807,7 @@ menu "Graphics"
 	source "package/stb/Config.in"
 	source "package/tiff/Config.in"
 	source "package/unclutter-xfixes/Config.in"
+	source "package/virglrenderer/Config.in"
 	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
new file mode 100644
index 0000000000..8f594849f6
--- /dev/null
+++ b/package/virglrenderer/Config.in
@@ -0,0 +1,33 @@
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
+endif
diff --git a/package/virglrenderer/virglrenderer.hash b/package/virglrenderer/virglrenderer.hash
new file mode 100644
index 0000000000..4df8e3a181
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  8bae92909021ea87e2087ae96df322f90140c414bd5f38810af3f3e5146a567b  virglrenderer-1.2.0.tar.gz
+
+# License
+sha256  3b32caf16e2402c2aff2b716858713f3e1feded85c25e71bf829816ee5009402  COPYING
diff --git a/package/virglrenderer/virglrenderer.mk b/package/virglrenderer/virglrenderer.mk
new file mode 100644
index 0000000000..2e25a7475b
--- /dev/null
+++ b/package/virglrenderer/virglrenderer.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# virglrenderer
+#
+################################################################################
+
+VIRGLRENDERER_VERSION = 1.2.0
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
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
+VIRGLRENDERER_DRM_BACKENDS += amdgpu-experimental
+endif
+
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+VIRGLRENDERER_DRM_BACKENDS += msm
+endif
+
+ifneq ($(VIRGLRENDERER_DRM_BACKENDS),)
+VIRGLRENDERER_CONF_OPTS += -Ddrm-renderers=$(VIRGLRENDERER_DRM_BACKENDS)
+endif
+
+$(eval $(meson-package))

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
