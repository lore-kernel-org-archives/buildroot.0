Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A460D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443DE60707;
	Sun,  7 Dec 2025 14:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZBUutkpaUnR; Sun,  7 Dec 2025 14:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FCF860701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118906;
	bh=mZoSkmIVegY9H1xT6MNq7JB5Q2L9mpw+H5pMRLjYmWw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GdDEHph3uYzj8saVqJXP1+Nt5wa4q1XJUTXt1JQ4xfy2UiOXD1y4JJB1A14dK7Eem
	 EHrzZwWlSrcHKdwMS1bPNSW/5g8VRuYDIep83wJM0Ap7ahO+slzgdiQvf9iNUFZPEc
	 p2nCpoI8Flv6le6/zetj/VoKeKXBu9VxzxuQAE3AsOXOqSAiiytsVnw6XtJwEaTk6i
	 EFfqp5dhWKlMuoRb2MTL5yw8IPEG4WhB3BoifWru3a/s9SgwKDlBX4hH2eyMzYiTb+
	 gx3+LwWUWLPQMsfLeBkxbG5ElklAj1753SZv/sioPng6VZPU4nso6sHy6EURwX9j//
	 zFXfQMeIo8SUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FCF860701;
	Sun,  7 Dec 2025 14:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DCC52CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FD33821FB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dV82AFIAZHzW for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFC65812E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC65812E6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFC65812E6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:48:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 532D6A4C1009;
 Sun,  7 Dec 2025 15:43:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyI-00000000416-3FVv;
 Sun, 07 Dec 2025 14:42:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:38 +0100
Message-ID: <20251207144243.3696572-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118580;
 bh=zcceM5wBDxkDb8EjYPZRF2ecg8lphkB5NV0NLCHEJSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vfixspBhFQfzH7w2Z8qNDmzpF7T5Schv+tL16zcBUzwLjH4vo3cm7WnTBrhS6o59R
 ar1hyX9PN1sIFMKFAjO9iCjyxo5psj92ZFoNzcln2nJqoH9lco2tgYWe0uQnbPIBug
 CZHBn7poSEkLwgD4e9rVf+A11V60veroFhqFUuxCTmteaUf5KxxOxu3JGM2G9b7RuH
 T43EFN7zROBlndNvqS/YveLXjBQc0O21PEu4pfShJvmmVOB9KGO+xb80yHYDvKix+q
 CREtHoY1wO0UA+FoOngECS0CgIFE37ZHfmU6GNyQuMy0I2uKFEU+E6rMO9SCD5w+2a
 oDxNvr39TU1EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vfixspBh
Subject: [Buildroot] [PATCH/next 29/33]
 package/x11r7/xdriver_xf86-video-nouveau: bump version to 1.0.18
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2024-November/003552.html

Removed patch which is included in this release.

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...au-fixup-driver-for-new-X-server-ABI.patch | 68 -------------------
 .../xdriver_xf86-video-nouveau.hash           |  6 +-
 .../xdriver_xf86-video-nouveau.mk             |  4 +-
 4 files changed, 5 insertions(+), 74 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index dc70113fd1..d77a3366d7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1103,7 +1103,6 @@ package/x11r7/xdriver_xf86-video-imx/0004-Make-video-API-forward-and-backward-co
 package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch b/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
deleted file mode 100644
index 96be4909e7..0000000000
--- a/package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From e80e73ced69b15662103d0fd6837db4ce6c6eb5b Mon Sep 17 00:00:00 2001
-From: Dave Airlie <airlied@redhat.com>
-Date: Mon, 13 Jul 2020 09:20:15 +1000
-Subject: [PATCH] nouveau: fixup driver for new X server ABI
-
-Downloaded from upstream commit
-https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/commit/e80e73ced69b15662103d0fd6837db4ce6c6eb5b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/compat-api.h  | 4 ++++
- src/nouveau_exa.c | 2 +-
- src/nv_driver.c   | 6 +++---
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index fde2f4b..8a1fcf9 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -102,4 +102,8 @@
- 
- #endif
- 
-+#if ABI_VIDEODRV_VERSION < SET_ABI_VERSION(25, 2)
-+#define secondary_dst slave_dst
-+#endif
-+
- #endif
-diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
-index 55df6f8..db3b112 100644
---- a/src/nouveau_exa.c
-+++ b/src/nouveau_exa.c
-@@ -157,7 +157,7 @@ nouveau_exa_destroy_pixmap(ScreenPtr pScreen, void *priv)
- 
- #ifdef NOUVEAU_PIXMAP_SHARING
- static Bool
--nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr slave, void **handle_p)
-+nouveau_exa_share_pixmap_backing(PixmapPtr ppix, ScreenPtr secondary, void **handle_p)
- {
- 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
- 	struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
-diff --git a/src/nv_driver.c b/src/nv_driver.c
-index e72a6b6..f9ab4af 100644
---- a/src/nv_driver.c
-+++ b/src/nv_driver.c
-@@ -559,16 +559,16 @@ redisplay_dirty(ScreenPtr screen, PixmapDirtyUpdatePtr dirty)
- {
- 	RegionRec pixregion;
- 
--	PixmapRegionInit(&pixregion, dirty->slave_dst);
-+	PixmapRegionInit(&pixregion, dirty->secondary_dst);
- 
--	DamageRegionAppend(&dirty->slave_dst->drawable, &pixregion);
-+	DamageRegionAppend(&dirty->secondary_dst->drawable, &pixregion);
- #ifdef HAS_DIRTYTRACKING_ROTATION
- 	PixmapSyncDirtyHelper(dirty);
- #else
- 	PixmapSyncDirtyHelper(dirty, &pixregion);
- #endif
- 
--	DamageRegionProcessPending(&dirty->slave_dst->drawable);
-+	DamageRegionProcessPending(&dirty->secondary_dst->drawable);
- 	RegionUninit(&pixregion);
- }
- 
--- 
-GitLab
-
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
index 336f29be46..0888eaa3a5 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/nouveau/2021-January/037766.html
-sha256  499322e27a55c8183166bf2dd1e47d085eb834143e0d7036baba8427b90c156b  xf86-video-nouveau-1.0.17.tar.bz2
-sha512  adba58ba5298d1a5b3f9f8540f9ef2cb2e10e47bba8e374103ec2e1f92e915f5f4393ed0021168cd649646e12315135a1efcdf77e8fb1648e1295914d87279b2  xf86-video-nouveau-1.0.17.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-November/003552.html
+sha256  e82ad38e64326b733cc5b892d56f6eb63b07e8920f5ebf05864af080b2c32bfd  xf86-video-nouveau-1.0.18.tar.xz
+sha512  1330fa72f76a6fdc13e7bfa932627091d2735ddb277f6a24d4fefa79fad5f354c6bb661093f26b33770275deca435c3b018f451a6e6254fe35892c59c13e28dc  xf86-video-nouveau-1.0.18.tar.xz
 
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index e63bc611bf..47bf682176 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.17
-XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.18
+XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
