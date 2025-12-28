Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8207AD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 12:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73B5040581;
	Sun, 28 Dec 2025 12:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HX1W_UxZd7Lh; Sun, 28 Dec 2025 12:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0BD4056C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766925804;
	bh=b0QT6FFylVE48gb1e8FhY4nLMz6dlHno/LjU50Jq1Nw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MfXKd5Nad+iUSiktQmcuL8NxfjTnnk201uwYOSq/IYEg7MZedCrVpf7C+yeg2P7Un
	 lIicbNyzD/vVRo5gg/r33lQ0FUGQoZMJftbizkrf3gjz7hYWa61q/ERLAAZKiIsPz7
	 5hrnMegvOP8ih0s+CONdBbfGyFi786jLuTxxjE2hIMZWxtJgQP6Hrk1gonB+GgYvd9
	 AfMbeq15nbF71aneqd1Sdna6fkwbUL52S5Fa8MqDvXsiK25sLaEvzQMMJyddm9sWLf
	 LtkgKaIGJvPpgIo/oKvR96NQimkl7DCAfAHgjRsvni3GHs0qUyKZwjKSBLSmGA4+Sv
	 aQYJ8ecHMedow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E0BD4056C;
	Sun, 28 Dec 2025 12:43:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A0D71E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 12:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4858D810DA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 12:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGkJar8YN69W for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 12:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39062810D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39062810D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39062810D6
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 12:43:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7ED3EA4C0EBC;
 Sun, 28 Dec 2025 13:43:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZq7B-000000001yQ-3ndg;
 Sun, 28 Dec 2025 12:43:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 28 Dec 2025 13:43:18 +0100
Message-ID: <20251228124318.3450440-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766925798;
 bh=+AEVab+rWMuEyo2Df26mKT9q/JnpCKrDxfrj+ib8nGg=;
 h=From:To:Cc:Subject:Date:From;
 b=QRDoCNh20Nu+0TFXXWPmdTCxwPWtgvnuQxqdwrcsgFBMNvnuBCXtOWKerk5CLIFn7
 7M1zpd3DYbj5PScrZrWCdZppjnf2Utb30Nc+su+AmOH4q4T7+C8NkYr2G6A2gCl83X
 9AsHCekDW3tQdOXQCwVESpgs7n7yRLr64yI6Wk2nqCRaXZKUwSAdRUQfoifF38Cjq6
 tVZjvb98DBc3whoVabm/ILD/WzgzJVKtQHKBYequb8eVZWnUSedXJXzhHO6HTUOO3q
 kekEF48iS5wHPlO2AksSQ2tQ9XCdu+zbuJVxwFV5cZh+k+S5Vb21U1nST3/j4V1M8g
 ptDqW602pOMDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QRDoCNh2
Subject: [Buildroot] [PATCH v2 1/1] package/piglit: bump version
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

Added X11-related configure options due to upstream commit:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/d958b70d1fc5c2ee039363d862b14ca498a50e82

Added configure options to fix build errors without libdrm and with
libegl/libgles enabled but without X11.
These build errors were not seen before due to other build errors
unfixed since the bump of python3 to 3.10 with buildroot commit
25b1fc2898d68ddf2674b14c738045875fc5a2dc:
https://patchwork.ozlabs.org/project/buildroot/patch/20230723074303.603364-1-bernd@kuhls.net/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
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
index 4d17405d10..360bddd40e 100644
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
+ifeq ($(BR2_PACKAGE_HAS_LIBDRM),y)
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
