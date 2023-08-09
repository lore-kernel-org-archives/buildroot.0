Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCDAC001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C6A60AE9;
	Wed,  9 Aug 2023 20:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C6A60AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGkJEdpWEXXJ; Wed,  9 Aug 2023 20:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC29960F27;
	Wed,  9 Aug 2023 20:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC29960F27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 276821BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F246160E4D
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F246160E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jV5bXqGjEYm5 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:55:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 024FD60757
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 024FD60757
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2C8C913F85A;
 Wed,  9 Aug 2023 22:54:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 22:54:34 +0200
Message-ID: <20230809205434.312601-3-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809205434.312601-1-ju.o@free.fr>
References: <20230809205434.312601-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691614502;
 bh=pOiIyqfyvBTLFCoMW1F+LszRAUnXacBLuA9c5Fhxxak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f/ITOFa/tX5oS1dIYYkgepOcjguF0C/2RttheuhUwkFsnelThSngchfWrVZoPKMW0
 VEsU6EHNtP2HxGiSRhMT1VHH4CwqvEYrTBVtpEJqs3rZyKZ+ZJwcJ/sJgmFKRxr23Z
 5UWJI87hgurZs+tJJ1C0S0sW3YnyTbSwDJa6FSbjTWmxLsuxVA/o5sxy35F5jhR4bN
 mKibHUCN/geUq+3wuH/Q6RLh5ZzqqgPBdC+ztRYEQAcZWE8jsH8sSuLLA/E3rKGoJj
 ERzl+1Znu3QYfDqmiTMak5JuhQxTGtIgBlwGNg+ygP1uujrEP5uKuA6Zh8+52Nj+k8
 0YMHTKQ7cCY9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f/ITOFa/
Subject: [Buildroot] [PATCH next 3/3] package/kmscube: add optional
 gstreamer support
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kmscube has a gstreamer video texture input since:
https://gitlab.freedesktop.org/mesa/kmscube/-/commit/961c85f6eb42e4445513044c9944c83a0d9cb324

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kmscube/Config.in  | 14 ++++++++++++++
 package/kmscube/kmscube.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index 7379675609..f68f38b7a8 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -11,6 +11,20 @@ config BR2_PACKAGE_KMSCUBE
 
 	  https://cgit.freedesktop.org/mesa/kmscube/
 
+if BR2_PACKAGE_KMSCUBE
+
+config BR2_PACKAGE_KMSCUBE_GSTREAMER
+	bool "Enable gstreamer video support"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GSTREAMER1
+
+endif
+
 comment "kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread support"
 	depends on \
 		!BR2_PACKAGE_HAS_LIBEGL || \
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index a47df74f7b..eeb22061fb 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -10,6 +10,13 @@ KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
 KMSCUBE_DEPENDENCIES = host-pkgconf libdrm libegl libgbm libgles
 
+ifeq ($(BR2_PACKAGE_KMSCUBE_GSTREAMER),y)
+KMSCUBE_DEPENDENCIES += gst1-plugins-base gstreamer1 libglib2
+KMSCUBE_CONF_OPTS += -Dgstreamer=enabled
+else
+KMSCUBE_CONF_OPTS += -Dgstreamer=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 KMSCUBE_DEPENDENCIES += libpng
 # libpng is automatically detected in meson, there is no build
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
