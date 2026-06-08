Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82AECD8C9D
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 02:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC7C760646;
	Mon,  8 Jun 2026 02:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C78gicfpbNp6; Mon,  8 Jun 2026 02:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD6E60B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780884382;
	bh=DbxJPCXQ6tH/oiSwjUJGDWQXUBjcF1J0MaM3gJyO8xE=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a43PRbUtzqAEwtOytHYIPXn7wBbioslwcvavN8i4mv0FAlRMwnvrSyGA7llv2voKq
	 jX54ABvVQ/Bo8RKm4Z9xRNBdwBLoCyHjv3+ZK0WRDK8F/+TzJlwEaDdIwzWd8ycsG5
	 nytwfHKE2n8oiWFkmwjbi+xMSMRnpTnsg7pvyzSPf8W2+BWd1W28yXW7mBn6eqgsMe
	 7L/Tl0hxtMYgAhDwffvcncXxX2+nrkhj0uzzLDliyNG8YbrCb34T3A5ZAZRdqqtyPW
	 snfunzrJNdnl6S/kSxX30f/qjZlYIdVhM4vRUWGOLJ0usjWzK2ydicktsV5uC8jTAE
	 KObVhA1R1KqcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD6E60B65;
	Mon,  8 Jun 2026 02:06:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 002B8EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE02608E6
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcBNPzKHimP0 for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 02:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B03E660646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03E660646
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B03E660646
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 02:06:18 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-36b900f350fso3485059a91.0
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 19:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780884378; x=1781489178;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sfCNgwsGmeV21f4At2KwgXmpwZ0/vRCi2ZosWZjcJew=;
 b=T81Vm9D8y0eTO4k4SSfWP3BDeCUshH3wKggbkEU5YlFD/AUZz9WpNMWqOFjnK4DsxW
 MJj8PclNcWR6GGWSyLWYXdROIDELowGZACuFxHDS4zqgRnu8n/bx+M0/nKN6L7vaVYHV
 ss1rO/H4QsjCnr6Hc74PVBmKIvhTlWv0VX2K6jpAG2/8zLWJvvd54O8ZSnP8m45OK2NT
 c6q3PkYb+KXrcK881zkIj9lmezbQa0vuTP7ZP0iLyHaQ2IiptNhDFLdljqcKD2sMm6Ly
 KYu2sLVPoK+GMwmNhKcRGnbhSjBWYW5JKZUFXv/XzDOIrpowsYClTSHlYhEjC+3pisFm
 A2pQ==
X-Gm-Message-State: AOJu0YyC4qkWiZT2TukDd2cv0P+jAB15FeZCB82JIAnOaJpVBK8Dlnon
 023MhdxTxzqolkJCnfz0jyltz4VRUen5NgHqbi4tCqyUpd+qarK1tJtE
X-Gm-Gg: Acq92OFCdZkW5l5G6RH7nkpig1jtnKAsCNJ0O8ZBmmlHNDs19VB0Nln5eaQ1N9YlmFU
 haoTWM9+9AG7e7ZzVHNQUA23Pxcq8L3c0a8oQROdKmWBO4oFOJQfSz1FFq0lgKZ0g7yZ8S5E8KM
 J5NTZE0uMY9NkZ+DehnAOPkMD6OKRhp1EA0tQXZTY+72M4ePCa2xnhA55d5ZpYQdaAW3JCEZTVp
 Bns0AebJfTkpvuitqzqhyZ7w8HZd1zCt4AFJe/YzbpP+MGB8Je7ZKXeLEqSIqqUayYLr9mZegH3
 rnlQbsWCbaFjX01WrbQssCHbudi7Gttj1epfB+sboBB6nyD1GDdydfCIgNDL3vPYCOzUqYwgfCr
 z4gIQpXHivh2aYXLYUF1PbKxiONjmN4NwAtJdS2UC6P/j6rDeW2YqrjaiI03WCMrIsUlXWhwzzl
 Wcpa7uuUgKJC0U/EEzu32RTfRa2/GFxXH2a60+riw=
X-Received: by 2002:a17:90a:e185:b0:36b:95f7:564e with SMTP id
 98e67ed59e1d1-370ee344778mr14044749a91.2.1780884377995; 
 Sun, 07 Jun 2026 19:06:17 -0700 (PDT)
Received: from wash-34.local ([50.47.124.161])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6d109dcdsm15500399a91.9.2026.06.07.19.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:06:17 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 07 Jun 2026 19:06:06 -0700
MIME-Version: 1.0
Message-Id: <20260607-b4-virglrenderer-v1-3-15cd736c623c@gmail.com>
References: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
In-Reply-To: <20260607-b4-virglrenderer-v1-0-15cd736c623c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780884375; l=2402;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=YPW23pKqgNb2UauAQFyS3kxfpm3Y0+J+sxC3sQBjjfY=;
 b=h90YpZLFBhSXA2FW0pxn3qV08JdOhwV3CiOBF97HA3U42GnqGJHtXSpXtNcFcsW3RHUuppNVK
 g9ZYno0xZZsCPkR7vNsShdL8xNFSoevm3zhd6H0YlEBV+55O40pt+kB
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780884378; x=1781489178; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sfCNgwsGmeV21f4At2KwgXmpwZ0/vRCi2ZosWZjcJew=;
 b=VLcu4H1hs+x4MafEMQf3CkDTihi0bd62r0Cw3DrdNA+4LG69KxdsN8jt7bxWjzEDP4
 aWIoEfvIJLoAmNgDGtX8ovbcZxx+IO5PYDD6D2V5fXdQ9Y8HKRKrkXpYXbsoWjlWtUJT
 Q+6QG4lKFYXQUTbdemq1JWIaENffWB7k9DyHVJQGRGY4wTzIa3toAYb4N3GZuhI8dcOk
 A/XzKE9WCf/roFxgb54BAXImXy8Iv/TaJVmvZ7tdImxDT8CrCWLbm6Vg9nnpRCFf5J5w
 q5SJD5rdvJKCRWG3fKwDRLRqJuwU+VQHAro6nesb8yl8sEfsZqaem0GKwrhXiCgnTj8/
 ZnNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VLcu4H1h
Subject: [Buildroot] [PATCH 3/7] package/libepoxy: remove gl/egl dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libepoxy is a library for handling OpenGL function pointer management.

It has backends for egl/glx, which may at one point have been mandatory
to enable, but the library now builds with none of the above enabled
features, as seen below.

  libepoxy 1.5.10

    User defined options
      Cross files            : /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//buildroot-build/cross-compilation.conf
      b_pie                  : false
      b_staticpic            : true
      buildtype              : release
      build.cmake_prefix_path: /home/joseph/br-test-pkg/arm-aarch64/host/lib/cmake
      default_library        : shared
      docs                   : false
      egl                    : no
      glx                    : no
      libdir                 : lib
      build.pkg_config_path  : /home/joseph/br-test-pkg/arm-aarch64/host/lib/pkgconfig
      prefix                 : /usr
      strip                  : false
      tests                  : false
      x11                    : false

Removing these dependencies allows for some applications that require it
as a build dependency, but otherwise can run headless or without GL, to
build and function, using other graphics APIs or display pipelines.

Weston, for example, can still use Vulkan and DRM when linked to
libepoxy without GL/EGL/X11 support.

Acked-by: Arnout Vanecappelle <arnout@rnout.be>
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/libepoxy/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 9da190b895..4b23497d46 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
-	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
 	  management for you.
 
-	  https://github.com/anholt/libepoxy
+	  It can be built without EGL or GLX support for packages
+	  that use libepoxy as a mandatory dependency but do not need
+	  OpenGL entry points at runtime.
 
-comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
+	  https://github.com/anholt/libepoxy

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
