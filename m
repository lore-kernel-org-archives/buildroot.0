Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CC3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 13:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34498405B5;
	Sun, 26 Jun 2022 13:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34498405B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUHA7OAntdpB; Sun, 26 Jun 2022 13:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71AA840BBF;
	Sun, 26 Jun 2022 13:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71AA840BBF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 696E01BF3DD
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 13:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 510694189B
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 13:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 510694189B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlouTGBv0c6M for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 13:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDAC41896
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EDAC41896
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 13:42:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s1so9440976wra.9
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 06:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4oZlkJ7DEbQFxj9DZ+6a3PibzvR3+lCjZUNatmpIHk=;
 b=wfS2RLCBZFGQnvvGMo4xIgw8pK5o2x3Xc6x+1/TVUZjpuE2G9Skuc1FzhiN9IjV2pK
 C0Jaw9NU1y4X6qbuetE9Dd4vbJl/N6bM8rINNXYBqJhZcJ0DYjNgTH51jU5ciKkPrABe
 DHUB5XHTCPYUF5KYzaQ4Zv+aIa7p4sRyjp8ddR0VbfsMYydteJpGR6Bajb3IOmsmxVTt
 xmGX9q0gE+dJlEMh7dxMJ1p7DnTbt0twkfnAHNRVraeFrooivTiOE6RA3EvvARZ35/tB
 ioCuhcpzu9NStZcsOvsSTrzyM3odRwnlPxWfsTz+CqQ7lbfWW+4xMRawEiKBSMh1vgk+
 QQ6w==
X-Gm-Message-State: AJIora/DIth3s4faUIfkt7klozDuF5J2jNhcybDRpssbPW4/pDnJ51Ot
 WT3URKyctOP8v0rbOX3fb6y/k51T+QHPODJH
X-Google-Smtp-Source: AGRyM1uj/kKFe+SrK8G5YzsD4qgn4ZHU4UXLjLOfbPorb8cyjfKhVCtZH93V35cm24mrZ5giSzDQZg==
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id
 n5-20020a056000170500b0021bbcff39d3mr7055686wrc.502.1656250918014; 
 Sun, 26 Jun 2022 06:41:58 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d43cf000000b0021badf3cb26sm9259741wrr.63.2022.06.26.06.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 06:41:57 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 15:41:42 +0200
Message-Id: <20220626134142.9304-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4oZlkJ7DEbQFxj9DZ+6a3PibzvR3+lCjZUNatmpIHk=;
 b=Rj76FvNy4nQAocxan78KCHl/ucQu4ya3LTopURG/EKujadlbhMEhkyvDH77kzNWBQU
 0walCS/tMI5UW9xhtHPYsRFeKDXl0FpjBcH5UmfC8G5wA8g7Jp8sPc6AOhKVPLAiH9vQ
 6O4E1UCrLOS47lwrFeb1BxpB7YFVFbS68SlweN3kIiBZteywWkS4DDEgYaCjM3a1/EHN
 iSOKjyz2v72CkQDj2amt5ipcZhxDrtLNVmY8Yr6PArRLHvu6BaD+1iNbcWLM8AkfyUd7
 mqjaILawpwZgcO0qfPEjlIUeEpgOBy9hn7VgQSyglgNevzSXysSuTV68eC4MhgVSJvzR
 +Xdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rj76FvNy
Subject: [Buildroot] [PATCH v1 1/1] package/nvidia-driver: bump verstion to
 515.48.07
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/nvidia-driver/nvidia-driver.hash |  6 +++---
 package/nvidia-driver/nvidia-driver.mk   | 24 +++++++-----------------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 7f2248d0f9..06cf292c58 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
-sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
-sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
+sha256  e28764cc5b13c32e76370513daeafc05c289b77ee0511552450f1a00e31ae1e3  NVIDIA-Linux-x86_64-515.48.07.run
+sha256  9ec1515cb214261ae4081a6fc9489800b5fef41c6a8d669e84e4ab1de7f3dc14  NVIDIA-Linux-x86_64-515.48.07-no-compat32.run
+sha256  bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 54c2aa46d8..d12fa543bd 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.132
+NVIDIA_DRIVER_VERSION = 515.48.07
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
@@ -42,7 +42,7 @@ NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
 # So we only install the legacy library for now.
 NVIDIA_DRIVER_LIBS_GL = \
 	libGLX.so.0 \
-	libGL.so.$(NVIDIA_DRIVER_VERSION) \
+	libGL.so.1.7.0 \
 	libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_EGL = \
@@ -57,11 +57,13 @@ NVIDIA_DRIVER_LIBS_GLES = \
 	libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS_MISC = \
+	libnvidia-allocator.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-cfg.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-egl-wayland.so.1.0.2 \
+	libnvidia-egl-wayland.so.1.1.9 \
 	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
-	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
+	libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
 	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
 	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
 
@@ -71,30 +73,19 @@ NVIDIA_DRIVER_LIBS += \
 	$(NVIDIA_DRIVER_LIBS_GLES) \
 	$(NVIDIA_DRIVER_LIBS_MISC)
 
-# Install the gl.pc file
-define NVIDIA_DRIVER_INSTALL_GL_DEV
-	$(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:__GENERATED_BY__:Buildroot:' $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
-	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
-	$(INSTALL) -D -m 0644 package/nvidia-driver/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-endef
-
 # Those libraries are 'private' libraries requiring an agreement with
 # NVidia to develop code for those libs. There seems to be no restriction
 # on using those libraries (e.g. if the user has such an agreement, or
 # wants to run a third-party program developed under such an agreement).
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
 NVIDIA_DRIVER_LIBS += \
-	libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
 endif
 
 # We refer to the destination path; the origin file has no directory component
 NVIDIA_DRIVER_LIBS += \
 	nvidia_drv.so:xorg/modules/drivers/ \
-	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
+	libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
 
 # libglx needs a symlink according to the driver README. It has no SONAME
 define NVIDIA_DRIVER_SYMLINK_LIBGLX
@@ -109,7 +100,6 @@ NVIDIA_DRIVER_LIBS += \
 	libcuda.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
