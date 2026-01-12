Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D788AD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B062260C1E;
	Mon, 12 Jan 2026 08:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reAhQknsMjYS; Mon, 12 Jan 2026 08:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B568B61543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207172;
	bh=0m7LbKqG0BSQ8WQJnSCBOPccpQ2RnQ6zg6W3cU++IVs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1w+lV3BvoVRSYQzpo+58nyEyyTQqp+kPJMKHRDuMxjD4e+7Hr+q02FzrcCvyPRoz
	 bDe7ySND2lmPoYGS7hmCga/Mj0FwcOlgDHU25q5UzEbsT19LDlD4FU1MpX5khO6heh
	 BrguXVodvsudhPTsatJcy3yMFgNBnbXjA7PmdA4oClU9lIWMtU4u38gE2mPfjiOcO2
	 npjl2TuKPmYYSgWe84rFlmgUqBH+FqkDfS7e13OwX3fTZ1tCw+thobSz2OdRFISeYa
	 8vC+mSFlSbpKMQRAcD0erZzhrJrGkDp9mgydi0ah4t2g6z+cEieh+mJPh4eG7VJbQa
	 YtGfODaGiT0Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B568B61543;
	Mon, 12 Jan 2026 08:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B1221CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DF204157A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w51TVPlLbMo7 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A01C4157E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A01C4157E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A01C4157E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57D01A4C3D34
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-1tBg
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:47 +0100
Message-ID: <20260112082950.2528445-99-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206638;
 bh=nRqgN9gIC3X7LEJK2KaBrUuURhVtIkLmmJ/S5OSxEbs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lACxKiWSIPyu2xv6+j8bOeVTXHoy7saZ1aNUATEaFO6L0oGLfEVMB8OaK75rGGTlr
 ZABfWIkVRAMrTymZjE62ZZW/whexdhe+xUvJkXZ9vxtNZxUaRoJibmlNlnfzdj/7rB
 sK7/2RlLUYRFCldiiSl3DdPAnku9TZVrdilrCQA4/gMp0c31CwJ57Nrv+DesxJjwgf
 M79rLwTzdI3lveR1yae3LPu+V2boC2yxdL4ZvoWntEXDL/Efm0jrzcrf8YwLZmQqCn
 OJO7tR0P0nXLxdGbEzCx7MYBPjwldsVhe2Rh/wEwTFKH/vr4Z17aDtY9U3zQpLYj3D
 4CsUVd2QRnhhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lACxKiWS
Subject: [Buildroot] [PATCH 099/102]
 package/x11r7/xdriver_xf86-video-amdgpu: bump version to 25.0.0
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

https://lists.freedesktop.org/archives/amd-gfx/2025-July/127936.html

Switched build system to meson after autotools removal.

Added optional dependency to udev provided by meson build system.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-amdgpu.hash               |  6 +++---
 .../xdriver_xf86-video-amdgpu.mk                 | 16 ++++++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
index 962cb0e16b..e69a7baab4 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003334.html
-sha256  4f04f0ea66f3ced0dcc58f617409860163a19c4e8c285cfb5285f36ba09cc061  xf86-video-amdgpu-23.0.0.tar.xz
-sha512  bf26f147629a34e84a0ae8435119e170b9c95edafcab1995b63bb8f55abef32f2efbf4536eb070e64b2ae1460424b1b27a4206cb9836d33ddc6dfbee404f718b  xf86-video-amdgpu-23.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/amd-gfx/2025-July/127936.html
+sha256  7653cead024a6820ed1139958503278d78b4b3f80befcacf54ce87a5199b0ce2  xf86-video-amdgpu-25.0.0.tar.xz
+sha512  d143294fead7073c14100299ccab20d1f5eab8b7e36c1770b12aaade958211e1961f4353dc47123c3b9af9f7a911d913def71d25b83dab3dee1d289043869891  xf86-video-amdgpu-25.0.0.tar.xz
 # Locally computed
 sha256  58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 84f8e39ddd..688f09c7a1 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 23.0.0
+XDRIVER_XF86_VIDEO_AMDGPU_VERSION = 25.0.0
 XDRIVER_XF86_VIDEO_AMDGPU_SOURCE = xf86-video-amdgpu-$(XDRIVER_XF86_VIDEO_AMDGPU_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_AMDGPU_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
@@ -17,12 +17,16 @@ XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
 	xserver_xorg-server
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
-XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --enable-glamor
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dglamor=enabled
 else
-XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += --disable-glamor
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dglamor=disabled
 endif
 
-# xdriver_xf86-video-amdgpu requires O_CLOEXEC
-XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dudev=enabled
+XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES += udev
+else
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS += -Dudev=disabled
+endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
