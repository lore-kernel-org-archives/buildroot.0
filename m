Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3072C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D1DF42417;
	Thu, 21 Dec 2023 15:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D1DF42417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHZ9_nEXqJZE; Thu, 21 Dec 2023 15:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94BD4423F2;
	Thu, 21 Dec 2023 15:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94BD4423F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5AA81BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E80760F7A
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E80760F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fUQG892_Jo2 for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:24 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6987960DF9
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6987960DF9
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d3536cd414so7761695ad.2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172983; x=1703777783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQdbDr+xmV78oBIaeY8kmAFk5hIwaNM5gMY6axF8lP0=;
 b=CpHtF473EXSEDD5UKGNgvIaPpWe1VD0OvFz98KyIzWdqH30LMofsNqNZPx0eiOVYZl
 a56rXrUpn4yQWJlToN5GKNQdLhlg4Aq4x+bsz/CojnS1d4wl0TP/vyPaUx/e6yvn3Agz
 dCy4A/7v3pDIk376yd0zvySop3TXjkE6ocG4yVhZZgShfFKRRhM0tqzb1C+JpMl6d40N
 7VSs8raxK/ssT20K8N9TezdyaXN7xarTVhecxfsvtFNHbNJHF9kZwdIuqkUv/zEe63o8
 TUY24q3o0SiTSRwozMelx75NInex8rf8JwZKS4ktKYyGkjIPGh2v9A9mbsgEcePnGcoD
 hrxQ==
X-Gm-Message-State: AOJu0Yxq6+F1Ow2+1ZThQxH1tu7aMJZgUlnI9baZt3nILUSQ4e/iTC9s
 XPSUniwuMMk/JloMR5mS0cHs6ID7nOQVsqkjprw=
X-Google-Smtp-Source: AGHT+IEP6WdiHIPjn8CiEfcKgLF3Z4AKLAPMfO7NvTKPb82EcCILhGzpzBEKKwdiD9C15RY+COzvMA==
X-Received: by 2002:a17:902:d511:b0:1d0:6ffd:9e13 with SMTP id
 b17-20020a170902d51100b001d06ffd9e13mr23956280plg.101.1703172983203; 
 Thu, 21 Dec 2023 07:36:23 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:22 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:10 -0700
Message-ID: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172983; x=1703777783;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PQdbDr+xmV78oBIaeY8kmAFk5hIwaNM5gMY6axF8lP0=;
 b=a54nHaiExL2fP+qSCDJhYM7inNtyiT6vmZGIRFxpa+3u3ZTD0mk3kfmn2qqy5uLHUy
 0KMaXRQJz4T/J251NQWltDYBAyU/imSFgas9ibQV2O8/kwh5DloUKJXkD00wcfFuSnZ6
 Ct+0MhJiAQWWXWoc80alJoXOTy4Cuuh9oijrQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=a54nHaiE
Subject: [Buildroot] [PATCH v4 01/10] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As per backend/drm/meson.build:1-7

hwdata = dependency('hwdata', required: false, native: true)
if hwdata.found()
	hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
	pnp_ids = files(hwdata_dir / 'pnp.ids')
else
	pnp_ids = files('/usr/share/hwdata/pnp.ids')
endif

On a build in a fresh debian container with a minimal config

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WLROOTS=y

The build fails as neither hwdata nor the pnp.ids are found.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v3 -> v4: Add a more comprehensive commit with a minimal defconfig.

 package/wlroots/Config.in  | 2 ++
 package/wlroots/wlroots.mk | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index fb23e9069c..7622a3033b 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_WLROOTS
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index b478e57abb..bb5c8f497d 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -13,6 +13,7 @@ WLROOTS_INSTALL_STAGING = YES
 WLROOTS_DEPENDENCIES = \
 	host-pkgconf \
 	host-wayland \
+	hwdata \
 	libinput \
 	libxkbcommon \
 	libegl \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
