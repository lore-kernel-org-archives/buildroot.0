Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552CACD4F48
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 02:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26EDE61B4E;
	Sat, 16 May 2026 02:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tx8eQDF1sO1D; Sat, 16 May 2026 02:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D69761B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778897010;
	bh=IXAWkFT0VVhsDUvsW8R8hpPSLCyzJfgJg4t9j/njve4=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0GDLjcafE1d7povVOuFjVGhKYlDGSggCYkrRH/vNpRcH2Ak5Eq+KAq3V6hZzDyR8
	 10lHaruqYLyYvPf4GzoabtHc0V5YYvmxE1rC+p3GpKPOEDbKjd8D7sh9tNx9Qf9eIo
	 1bc4p1WWp5wbHEkHpFEB1qeBbQaJwrIIHy/4UWDJzCMQwPPhmsMbeUbTxRQ/ZH1rbJ
	 6PxFKOG+5V2hLzHEvsIFY6pzrrWRH979UZdvmeLAWfQb9NaioYtbWuf7qm99Va5WFq
	 aY8GH46qva3qxAWbF9FsGhTxUnE9A9WkmQeVop0SR6SHPaWinVFi39zXV6IsH4q687
	 eQ3kjnOMo27YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D69761B4F;
	Sat, 16 May 2026 02:03:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6974D45B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358664208C
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDqj0DxZGDew for <buildroot@buildroot.org>;
 Sat, 16 May 2026 02:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03F2442081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03F2442081
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03F2442081
 for <buildroot@buildroot.org>; Sat, 16 May 2026 02:03:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2ba928852a5so3530735ad.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778897007; x=1779501807;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xY+kCeTMdKjO2rCyT2XEf2jikcBPtInc3B5HMfXKlcA=;
 b=pSdT+v/bTJb5RsoC24ZyxTK74Ynm0tH1iJ63Ggw6Hl54UhNYA69oQD8wZRG2ePkwcC
 iOd/OkY3vgKabAIs2SPhVb3mmqjBXxHgQvho+n4nG4I/kAwA6cOtGA7GCGSqk7kaV/9+
 C90u7FuzleTQwQiv6CfT9nCdmByzQwR14T/k/vpJhup4eic7nOHsJuYACUOzcfuxEp31
 9dLKKPJhDyg3/nSRub6FdjdrqHgXk+R8DTIOdtXXu85wYGGrAZXgqQqLtOknQQHn2/5Z
 /bRkK/XcYRHUwWPi7HezNwLyYMDI/ElUnbthhgr432L+l1BkI+7gifjz1BlzcepN8ayp
 kNBA==
X-Gm-Message-State: AOJu0YxCaT6WDpn+N1RQoBlTCELGmJ9jc0GrUY4T5ynuisZ5qMlqZMx5
 OWyxCgF3YIHcSawXz45g6DThdAw/UHqWvx1lxmzkNNTmzgFXU1/eJFOi
X-Gm-Gg: Acq92OELxBXJ8gfyUEKo7Od8fi2eFUKBBcLjzQl8JxTDtSAAnYPHvZRK1Bmp4jnzn5y
 JBVhYKmmWGsLjSLjMaK0cqH7bosbP9JwPDcmjd8fGj1gzimBkoZ9m5e9uIUZiTyKnWVBIR5SX4z
 Nhv8I128nwbkSJRYPnz6GrodQoBjLKqSMyS/Y+k/55h6Yc6Xq0bu+HHf8qn9tI8grRBBwn27AXX
 QUobrUEtGV/RLkKtRpi8lrX8HUcfY2MftfyHPHfPi8aUrZE647SnEzHhcXAupeDOlMpIUAEZ8UE
 DnUAbtrvY5ujTbkcdXwwYHLOgifWEj6yyIGwuHZ6q6VLHyzG6SFgSyY/auAedHYzrtodd5ABBNG
 bznJDS/TILxCM9gy0DXbQoo4GFxmY0UPvpTpZXDk2zsVCuZ/BISNL2dtw5TxUcTTnNvzbsFdrNe
 0Ucy7WOcc/V7FxTxi0QEMl1r+A
X-Received: by 2002:a17:902:7206:b0:2b7:aa20:3c61 with SMTP id
 d9443c01a7336-2bd7e8cb16bmr47304965ad.33.1778897007270; 
 Fri, 15 May 2026 19:03:27 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c16ac4asm68201375ad.33.2026.05.15.19.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 19:03:26 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 19:03:12 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v7-3-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
In-Reply-To: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778897001; l=2353;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=rNy9yclWSSK8yZctjMKOBcSbSJ9mu/XMTTgB80vkjl4=;
 b=tHJw8Wq4SL3F526LPd9AL8bfAz0d46tjv9Gnz4O+z1mF7aiVsPXMGjM0troIMZ7X//Jwqxyqp
 m0uxYC6bkyEBByS9ycfYAp5KjHGFmiNGIE1c/CNogUnOpiPg0DJc8/G
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778897007; x=1779501807; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xY+kCeTMdKjO2rCyT2XEf2jikcBPtInc3B5HMfXKlcA=;
 b=SWmdK+Fd9Aedhnj8vHYrBuZ1gp394MC/rXjvqxVe++s1Nv2GZuFI8bQbpGBCDM4qnC
 Qbq4FtZ0vZwuaLeK3oXbcsbgq7yTuzcHHEy/mfd1gTyjJ+34A9eCSCaDhFR+n4/c8r1b
 7XfcP6Vo0+HlNjE5uorQS2gktv+63mvnHsZdvwdlgCRxFDZI9t8TlI5tLgQaMQAJJ5pE
 XHRtbf8rW5QFel3x+IxNke19Cr9FPu9F5/guQNRcGIhojTV0KcflP+qeC/6YunjEuvSV
 cMljb1b37FaXxZEa+IQnCyUCEunL8k6E5li7hMPrVEaipFUGDwnU9aRHitkEqLLGw2n8
 A9DQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SWmdK+Fd
Subject: [Buildroot] [PATCH v7 3/8] package/libepoxy: remove gl/egl
 dependency
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
