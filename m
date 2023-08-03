Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3233BC00528
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 20:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FDE56143B;
	Thu,  3 Aug 2023 20:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FDE56143B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_K7R11Qv2t0; Thu,  3 Aug 2023 20:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D01F6141B;
	Thu,  3 Aug 2023 20:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D01F6141B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C29041BF33E
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B6280E87
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 20:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B6280E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vr8t6qzyY_Lp for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 20:15:53 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7705820DB
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 20:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7705820DB
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0EEB913F85F;
 Thu,  3 Aug 2023 22:15:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 22:15:26 +0200
Message-ID: <20230803201527.19108-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803201527.19108-1-ju.o@free.fr>
References: <20230803201527.19108-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691093751;
 bh=lv+yuJs1mRkLf/GYhcbOfChx2ZVA22M9QPioVtPQuL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NNWTUmKsspm7ip5PXx78TnoMB4YRh0vi0brD+Fi+vMRTozJZKbVKc8+xOBb/PGGd+
 URj5V0zGq8hR5d7jbCER5LAbfPsYcGPjxLyiRiZ6xzpXq6XdQkbNonpjYk6nRdS6QX
 G8z87Rm14Y7vf/GKVazwtarJ/QUI4cCxsbwb8Wna6SHSi/ymqifDxyEEywo8lFK0o0
 DUC/zq+kb6MV24V191nBwKW8sVHVoQ+EhV7pGHQUoe8gu4ZSMm7jiGmy7j0V4xdEaf
 gEHqvI7qfNnOjRtQm4tuazhry8qID3tWvli2fzzO5gjj2e+1Iy2j3iBtlaYFfK5tTe
 FaBHyHzzRKw7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NNWTUmKs
Subject: [Buildroot] [PATCH 2/2] package/weston: introduce _SIMPLE_CLIENTS
 package option
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit "package/weston: fix the configuration of simple-clients"
fixed the configuration of Weston simple-clients by always enabling all
supported applications.

Since it is not desirable to always have all those applications
installed on target, this commit introduces a new package Kconfig
option to control this.

Since there is already a BR2_PACKAGE_WESTON_DEMO_CLIENTS option present,
this commit also update the Kconfig "help" entries, to clarify the
difference between those "demo clients" and "simple clients". Those
clients groups are directly coming from the upstream package (and are
directly mapped to Meson configure options).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/weston/Config.in | 24 ++++++++++++++++++++++++
 package/weston/weston.mk |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 1a7c27a715..db6a78ee8a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -174,6 +174,18 @@ config BR2_PACKAGE_WESTON_SCREENSHARE
 	bool "screenshare"
 	default y
 
+config BR2_PACKAGE_WESTON_SIMPLE_CLIENTS
+	bool "simple clients"
+	help
+	  Simple clients includes application such as:
+	  damage, dmabuf-feedback, dmabuf-egl, dmabuf-v4l, egl
+
+	  In the target filesystem, simple client program binaries are
+	  prefixed with "weston-simple-".
+
+	  Note: Weston has two sets of clients. See also the weston
+	  "demo clients" option.
+
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
@@ -188,6 +200,18 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	help
 	  This enables the installation of Weston's demo clients.
 
+	  Demo clients includes application such as:
+	  clickdot, confine, content_protection, dnd, editor,
+	  eventdemo, flower, fullscreen, image, multi-resource,
+	  presentation-shm, resizor, scaler, smoke, stacking,
+	  subsurfaces, tablet, transformed...
+
+	  In the target filesystem, demo client program binaries are
+	  prefixed with "weston-".
+
+	  Note: Weston has two sets of clients. See also the weston
+	  "simple clients" option.
+
 comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5f8d915d5a..0974159a9f 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -22,6 +22,7 @@ WESTON_CONF_OPTS = \
 	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
+ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
 WESTON_SIMPLE_CLIENTS = \
 	damage \
 	dmabuf-egl \
@@ -37,6 +38,9 @@ WESTON_SIMPLE_CLIENTS += dmabuf-v4l
 endif
 
 WESTON_CONF_OPTS += -Dsimple-clients=$(subst $(space),$(comma),$(strip $(WESTON_SIMPLE_CLIENTS)))
+else
+WESTON_CONF_OPTS += -Dsimple-clients=
+endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
