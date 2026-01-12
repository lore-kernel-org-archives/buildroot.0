Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E97D25048
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0EC480E77;
	Mon, 12 Jan 2026 08:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXyHyBxscvgE; Mon, 12 Jan 2026 08:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D3880F59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205685;
	bh=0m7LbKqG0BSQ8WQJnSCBOPccpQ2RnQ6zg6W3cU++IVs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UP6KiHuGN9ibDzztdiTS0t9sWEB8mdkg1cfgsJbXSCceZ+qBCvf0NPT9XdTErUrhu
	 1jiynGjOIffHb65Cd/Zj5bTGaMNOsAqY1ampMOQVUKHNL0WfKWiWiGFMXLNE9nkYle
	 6qbCHiOUsyBQpNhKcRzqQoLYPoeS4f1uIKv3/wTlpFWzWGWzZcM4I0wZYRkTDwIXqs
	 fWU9F0wBXjOyhyHTDstANEfZJ1wv9SlpQRnOzAsyWFfOtn5La1AvEMsSBzNqJEnieo
	 NjIsTFk6aB6og4WYS7J7teAppsMG1baxDjr2SvrtM2jyGM2ibljtwtQ1f1sud4Yr/4
	 0WsmCxTZ6HhyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D3880F59;
	Mon, 12 Jan 2026 08:14:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DAD9618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C15EC84453
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JquuhdXKoubE for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0D2480E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D2480E77
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0D2480E77
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1718A4C3CA0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-2WPT
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:15 +0100
Message-ID: <20260112080419.2516889-100-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205133;
 bh=nRqgN9gIC3X7LEJK2KaBrUuURhVtIkLmmJ/S5OSxEbs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=f1yibpvamlJbIyZ+tf6RcEapc0aZVeZvjB4Ms5Xlegqz/j3REb4PHt/zkHsEv2ZN+
 h5w14IHA0EeS0ewvPpvI3+4Uis9XWjiRas8Di81g+6YICWGPI7U3DAjzWZYHWbIJ1s
 b23Cgo+o6nnL8L2McvvYpzneJK9SeNtCLc390VHVt5XBXdKPtpCAWgGdWaVlMDfeMb
 kaoh1aeigiUwjlWSKt96q2HZvl3JbK37uKo+hR+1iyAYPN5wJJzcJjlcuQFVe2dMI9
 Fmwoo83B+sLHkMB4ynxstQFkX0n/byiw41snaunKjcIzkOzlBFgYOj2vkpB5p06ur5
 n/y4xxoEin/2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=f1yibpva
Subject: [Buildroot] [PATCH 100/104]
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
