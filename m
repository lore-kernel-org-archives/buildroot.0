Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24482C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA064241A;
	Thu, 21 Dec 2023 15:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA064241A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Eon4BqhOeKg; Thu, 21 Dec 2023 15:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04370423F2;
	Thu, 21 Dec 2023 15:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04370423F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F011B1BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C88B083D2E
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88B083D2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kroD-a_BcNzL for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:03 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 485D781393
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 485D781393
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d93278bfbeso558795b3a.3
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172962; x=1703777762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQdbDr+xmV78oBIaeY8kmAFk5hIwaNM5gMY6axF8lP0=;
 b=TDOFf85UDgfAPkUCbN8SsJoM/MS6OvR17v5rYbVaAVJz+TEwUXfwbDP8qaZMI2nDV6
 kwGcY74EgIt81tG+dY169us0RTas8uuW5eCyesbdZwjIDL2i2+q90Upcr4L+xeCQXL9K
 uOrQe5O9QF0/kvA6crxYuD5zT+ej3j0Q48PVIE/IUZjZZyvLNuoy+vvHJMypIdUeShjB
 IrKMABCIanTPpCIzly7loSi1DFAYpvKJKNPfojmjkrO4LO7zzJD8AX300PfCX+RdhMyo
 F7S/hCTiz9YhgydzJ+5eafYepWnrjEUn5Ejw1UgZhnyU12sXKyVlsg/aavoBYCZhIg6C
 craA==
X-Gm-Message-State: AOJu0YybkdPfStLoMAvcueMKGXA/2TmfoJNxJRIJrHKoNWesA521R4kT
 cVu+P99O5HC5bQD8B5yqk32eEMJc3o427GSuamk=
X-Google-Smtp-Source: AGHT+IG2tQqF7+TG/mqf3M4fbZfIjCtH8wzK5jfyTArenE2dCVamcKUG+ztdHxsj7ISbSrI6xq1FBQ==
X-Received: by 2002:a05:6a20:6a1c:b0:194:d37d:990c with SMTP id
 p28-20020a056a206a1c00b00194d37d990cmr1224601pzk.73.1703172961689; 
 Thu, 21 Dec 2023 07:36:01 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 ei4-20020a056a0080c400b006d7692df9d1sm1803542pfb.140.2023.12.21.07.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:01 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:35:44 -0700
Message-ID: <20231221153553.237317-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172962; x=1703777762;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PQdbDr+xmV78oBIaeY8kmAFk5hIwaNM5gMY6axF8lP0=;
 b=PpZmTwa/lyXKGjRMCLliTXl88iE9f8iwyK7f3Kpj2rtBOwoLUZlDSC4VzGAGlie5sD
 yzywTxFTxDIiAzj3ILoNnWKEYRbpyhpBqkxmW+Hmp5SP8NfIt37fYNJAPSMup1u4IV9m
 lTKmTzQruTdqRADAXv7M1TKQObOlaTJ0y7Rrs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PpZmTwa/
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
