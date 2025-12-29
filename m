Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826AAE92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53AD9808A8;
	Mon, 29 Dec 2025 18:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69uk50EBAtew; Mon, 29 Dec 2025 18:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E91EF807E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031548;
	bh=D3AzcWgZhz9Xg7PXaEkbiKVzWUeM+/8vhKRPp20T8Wg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pqJFfxSIYQnZ7chj83N0nkw8mw4IgDfWCgOH4RoVvIhJGxK9MrmuNP88rJDLX7z7m
	 dISyF8DNUoX/4nlfLVFxStFL443mERihemGAF4aqJ5n3KjIOTnnFWfix2LMzpIQRq/
	 kOU/p94qD1LBIiojRcVsY8pdW4x8b/BhoUhONrXshew9aGUy+tMR/4nBQNpxKCNkGL
	 xNg62nIiG7vd2sCkBnw48+XyaHx5gfQNFr6InSoEBczIX9IBDTKgBLQvSjEhhGzT+o
	 Vcq/Xzu9QAs6pGzbFSt4jB7F7Cttd8fv/S4/tLQrAvOn+pPfcZe5PiTf0gObkP2lPC
	 hFEF8JNLkKszg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91EF807E5;
	Mon, 29 Dec 2025 18:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D785B177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA50B402C0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkrZ0s6HOpPv for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF9E0401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF9E0401FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF9E0401FB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:05:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9259FA4C141F;
 Mon, 29 Dec 2025 19:02:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53188)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHZL-000000002sF-47Z2;
 Mon, 29 Dec 2025 18:02:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Mon, 29 Dec 2025 19:02:12 +0100
Message-ID: <20251229180212.3550356-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031332;
 bh=OrvaELMcvpmpCH7cT6fGcqX1h6dJ5BvSdFPWCHj3up4=;
 h=From:To:Cc:Subject:Date:From;
 b=vou6FSorcsvDd2diG7XgVdg+2uZPvvxWk6ej2C9n8O7nMckHSwOdNlCkoL1eUiQLV
 rr/lBgsQKcVkEP97TjnhBad+QZM52un4KwoGzhL0RcAUED1RoNY7VEpLoAkiO8DLcz
 tqCUtJSNs4377BFYo+iYjk+76+SYYNRhtpCImpR62Z/No4VRvkWMq55blaavsrawgV
 ehtUZxDsIyWSxOj9d/k2Uh1su3lw/OSFN3sxrf44HQxzKRvrDmheBk4gnC7z4nDsQL
 TC7Izw3U5g/rut1HGrsLbJg/ODBIiUbitcYU6NFyIzH4oYb/9I8incq9cOouL80FIJ
 aeArO9NZ3LRPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vou6FSor
Subject: [Buildroot] [PATCH v3 1/1] package/piglit: bump version
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

Disabled vulkan tests added by upstream commit:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: fixed libdrm dependency (Julien)
v2: added more build fixes (Julien)
    bumped version to current HEAD

 package/piglit/piglit.hash |  2 +-
 package/piglit/piglit.mk   | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 2c0b6aa52a..a778401253 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ba4d1839038905f3833e9ab23b385913e08d552533dd222cc203c79c10e09918  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git4.tar.gz
+sha256  0553524e1bfce646771560805cbe523204c59dcee20dc58bb9baa87134a50ea1  piglit-62d499d63d2b8b29a67efd9d93ed9b6a94d4950e-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 4d17405d10..619f29204f 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
+PIGLIT_VERSION = 62d499d63d2b8b29a67efd9d93ed9b6a94d4950e
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
@@ -29,16 +29,27 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
 PIGLIT_CONF_OPTS += \
 	-DPIGLIT_USE_WAFFLE=ON \
 	-DPIGLIT_BUILD_CL_TESTS=OFF \
+	-DPIGLIT_BUILD_VK_TESTS=OFF \
 	-DPIGLIT_BUILD_WGL_TESTS=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 # libxcb for xcb-dri2
+PIGLIT_CONF_OPTS += -DPIGLIT_USE_X11=ON
 PIGLIT_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXext \
 	xorgproto \
 	$(if $(BR2_PACKAGE_LIBXCB),libxcb)
+else
+PIGLIT_CONF_OPTS += -DPIGLIT_USE_X11=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBXCB),yy)
+PIGLIT_DEPENDENCIES += libdrm
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_DMA_BUF_TESTS=ON
+else
+PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_DMA_BUF_TESTS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
@@ -54,7 +65,7 @@ else
 PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLX_TESTS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 PIGLIT_DEPENDENCIES += libegl
 PIGLIT_CONF_OPTS += -DPIGLIT_BUILD_GLES1_TESTS=ON \
 	-DPIGLIT_BUILD_GLES2_TESTS=ON \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
