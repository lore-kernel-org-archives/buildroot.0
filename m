Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D17CD4F3D
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E718284A06;
	Sat, 16 May 2026 01:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86Vn5DJs2XNI; Sat, 16 May 2026 01:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0861B84A08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895840;
	bh=IXAWkFT0VVhsDUvsW8R8hpPSLCyzJfgJg4t9j/njve4=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6pKJt7YWAinKVvc3MZO8Rfje8++oTA9OhjB0cErVq54hbmNBHMRADevCGLzd1jZV
	 1HLqwuiYAfFfZrp2jb+kFLFYiR7nT7G7+VAKpu0JqIbuBwvrOynLDf1rREt+4OLwXY
	 yHtb/SKUnWEaQWvIbRFqKJ6W1kxxtTROhhWYcKWgbc2Fmq4wi2ZJ7KoVjQBHWtebSs
	 +3ck6E4QBCmWMAy8CyNbvP26ehYpEXSbDmTnC1EIooiW4vMYIdOh0oN4ufNDxN3npH
	 6BLLAsSnb3vPz5fxw4CcX7GWqnQKT8rvEYMK7bsCzSgU1D0ybRQwxZgDcjSElsPLWb
	 QN1tiHqBCTXGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0861B84A08;
	Sat, 16 May 2026 01:44:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E991282
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25032849EE
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtUWKyp5LWWo for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42E948496C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E948496C
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42E948496C
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:55 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-836ebdeb969so197013b3a.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895834; x=1779500634;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xY+kCeTMdKjO2rCyT2XEf2jikcBPtInc3B5HMfXKlcA=;
 b=efihucDneryJ8KzfGvB7vInyHMd01LIbpA05lWTSG326MBmoIdkX4gDdBSkpaqHJZ/
 iGyJewI+1Cvmv/tbYxv4di9MG4sNFaNkDFwP5zl0GYD+376UNUAu24JEoh0Opje4AZxA
 nE4pLRofi18ON5YSEyHaTP7j7DIQXzyhfzsRGNJ5kmqqy0s9iRM+QrZuzlzW/buPDedP
 Cp9L8RJ+KQtmsF+UQaELUDbdHZigGlH3XH200TFWjiWsC47C6tjlULU0YL4jSn8dfkYR
 FB68BYk7LAXoqQ+K4Z4LPgaoSN60QdyggyA9X9eQoyui76zLozFtSASa3VEJb4kIa2th
 vSyQ==
X-Gm-Message-State: AOJu0Yyhrx5AHiMoPCLcEM19epxZ8rd9ee3Tdoms/4c0MgH2k0IhB6tG
 56ZD4oTMm1q56Ng6Nh5m189YgIQC2cyNg6oggRnIrfSqBecLyUrsL3d9
X-Gm-Gg: Acq92OHQrb86TkTV0gvNR/tMIT/TZOUZc8+hFlDQo5Dnftqaf3sE1JMGulY7fMx1ViD
 0zD1Nc5qm920VI9wIOqPnSIQlgFdYcArLEZ4DirQ7Kx2ziPTh2N+5fMQsTUqv7RnrkZwm3Y/D21
 OM5b9svYN8zYVPK1ahNXHfa0Jjd228Y3GeXR687vDAJUNy1I4724riNm0T+hXpY1vK3qanmSxZs
 OBkP5Q5NJGKmBKqIcgEnr8dUmmeBYqilsac87Dt7kgSgeBFzPADWdLKhmutrHSnMtQBr/VQpjzO
 1NyGes0MJXKFk6m3JvkkQBuErU/hZQgB6vGqhcMu7yDjdViwqsdPbXz4lTSA6aEjQDys0/FD6Pg
 nLCwUhsQbYUlvYb1wCIAG13+ITi+vuMaJI3w1kGJWBIcLXYf547zF+Z6oNPn1Wq9+5eMmana3TI
 twhQPAsubyoO5rLRsczuXes3f4
X-Received: by 2002:a05:6a00:2e85:b0:82c:8c6a:682b with SMTP id
 d2e1a72fcca58-83f33c24190mr6884904b3a.19.1778895834481; 
 Fri, 15 May 2026 18:43:54 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:53 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:34 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-3-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=2353;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=rNy9yclWSSK8yZctjMKOBcSbSJ9mu/XMTTgB80vkjl4=;
 b=qhIFEsJ+FSCbybqOKIG0IRJQOCSP0T9F+M3V0QijvkuwMAqfCPMQTvb4+2sUS6U/Z1CQfSvyb
 440uhIEVP4mBLFtl1QVF4nItUMSqL1St9Tj3Lbz9A7WJhGPXQIoRgqq
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895834; x=1779500634; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xY+kCeTMdKjO2rCyT2XEf2jikcBPtInc3B5HMfXKlcA=;
 b=NgIdma+4Hb0snrVBwFEP4PkUImFbB+QuFuivbdkNumTdtLhfpcgf8/22UFPptFOcJJ
 /IpeT1kl7lqq/wBkIUuH+cw6DaD3g5rLBScgz/+jY2+GZxNF29ifDjQAcFp2U4zE7fI2
 xDYBczzXVkA+7gQAdnrVsQaj9JWeiyZzhw0qf2ad/EpdCvksSA4sxGDhbCCncstkd5y6
 Ab17tQMSv1EGIN0KdpkYoRvdqPum/e51DAoCI3cwnN6vqDBwYvcw4B0K6XIJuHAEoQoI
 3DpxEbsUhteOPp0Zq7weeG6gdfKx3cn5VheSWgID9K5/2LvE3BAHKIOWug0qfsBbNl5t
 ZRSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NgIdma+4
Subject: [Buildroot] [PATCH v6 3/8] package/libepoxy: remove gl/egl
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
