Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B44ACCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 111B240B8D;
	Wed, 22 Oct 2025 16:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49LBZFlCQQMI; Wed, 22 Oct 2025 16:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAE44095B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AAE44095B;
	Wed, 22 Oct 2025 16:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 284D143F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F0E4095B
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5DY5VjL_-33 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F09CC40889
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09CC40889
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F09CC40889
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:39:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b457d93c155so1082310466b.1
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761151186; x=1761755986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6bpwzvIAJv2Vmuy8Tm5didtyuClIly5x+RqW/bdb+Y=;
 b=NzqRIfRWYN8/krv3CVCuU9rBqCdfFSwIBAvbywrDlxr+6yZu8oN7JamRbKEj0Sxg4W
 Uk8ft9TuEtDpyK1wZtlJm9dfQ2MMhzx8vraWC62+os4LuEkvzbR0r5eeUsGzVfXrUyK+
 CcUZmMmlSnwgY3Mw/Xn56wb+I8ypZrAZvvQ7YN7KbNPp9SYNBBgbpK19M22E/aJsgTs5
 vU+UZv8v7zVc5clt6mEjpTQyp02kij9aGAi2CP6eKI328sqP//DzSUy0LBK68hBWJNpl
 SVpCj+G8pf3Yc/2t0kXO042P4r3jGJhdP8D3X+bqs6VK557HDmIMe+wtvAAbpoVx6k+q
 sVNA==
X-Gm-Message-State: AOJu0YyTWd9OZ7k3xnY3oSgRkOEHbdm03++G5eh8bznksim9yyUQIpN6
 zd/EuzLXoTrhXRdyxTVoE7dAmSMA1qpKHI4/lKDyuIdXDvWx5sX8qRpPmN0i+hgP9DgobvPmDKI
 N4Cjw
X-Gm-Gg: ASbGncvUjuPHW55NNTzyg3Meb3EcqstLn7ebLOhetKGGT7uQJLOW6OePZzKXr1vujCQ
 YbTb1CeIEuVHPsBiFYWEx7jy+kb7x1ifxPAqt+vjOd5ChUIXTAjPw+l1ZhDPw7fMkZH2yz3L4q2
 qIeEnxvmWii6Q+q5PU/3qee53ry6nwM+enZYqksnLMDaecmTE9middLBBO4pFZCEWXWQet2zIPM
 DthgQBQlPjfZmZtqedSHSPde0OtS6RcaifmFUXxvvTsPNl4BhG65Sg5twIgDjRT78lXlryaXJ0T
 8ZOkW4jhdcYe77IQtYShG+MA+Uki4R9UsHof0dZAjnsyoscyTIYuk7NdPxwcuMIotSlZhFRipxR
 RE39dpyrestmSbOlQE52GbPYJ86ccvvpEW9EM1O4ui9MgCyAPk1QpD61VRsVQxR9POAt3SJ3hX1
 6FdcMfp3UlaUhMShfz3bbJG+csaW6g15iKdQNqFqyn0TkpugKF
X-Google-Smtp-Source: AGHT+IHu2D1N2gXeT9FJEQmg0zb/0Q5V+TVBGNqsChBnPfwZLp0+3zsZhgFxlj3s9KgGW2JdKlfs4A==
X-Received: by 2002:a17:907:6d02:b0:b4a:d0cf:8748 with SMTP id
 a640c23a62f3a-b647254f6a7mr2452180166b.13.1761151185843; 
 Wed, 22 Oct 2025 09:39:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb525f48sm1385233466b.60.2025.10.22.09.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:39:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:39:42 +0200
Message-ID: <20251022163942.21604-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761151186; x=1761755986;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T6bpwzvIAJv2Vmuy8Tm5didtyuClIly5x+RqW/bdb+Y=;
 b=Ob5vWJkgZehA6ALsX9RgOifb5cYGBVLL7fx0HbutndHgWrPU8KOryvaDzuff3VgJr6
 NGgVpBHUvUdVXOM44wQ+Tow7nuYA80067AIAhcc/NMxf8vSOYHjPeN+F0D/ZlhwPRdb/
 9+Nsb4Ubkwa4IGv/CsxaEQ4qrXbttGms1QoX4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ob5vWJkg
Subject: [Buildroot] [PATCH 1/1] package/libevdev: bump to version 1.13.5
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes since 1.13.2:
https://lists.freedesktop.org/archives/input-tools/2024-May/001588.html
https://lists.freedesktop.org/archives/input-tools/2024-September/001589.html
https://lists.freedesktop.org/archives/input-tools/2025-March/001592.html
https://lists.freedesktop.org/archives/input-tools/2025-October/001593.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libevdev/libevdev.hash | 6 +++---
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index acaedfad56b9..3fe609d78a8e 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2023-May/001585.html
-sha256  06a77bf2ac5c993305882bc1641017f5bec1592d6d1b64787bad492ab34f2f36  libevdev-1.13.1.tar.xz
-sha512  9b75bad4bc13948854c8dff7a7a46aca6c06d1410ccb000f881bf76055ccac040595c3b24fb1a574be875b5c262eb86820b9ec3383752641bc2047135e5a412f  libevdev-1.13.1.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2025-October/001593.html
+sha256  89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987  libevdev-1.13.5.tar.xz
+sha512  2ca066235c9d6729e965e2df1df192285b3d41a20aeb2bc4eb21d14dc469198d5270d1cd900dee0b6cf1bdf9efd3c47ec310bfbd9e4965b3bcc3ef440efba604  libevdev-1.13.5.tar.xz
 
 # Hash for license files:
 sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index b0cf6c9ba8ac..24bd1609da43 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.13.1
+LIBEVDEV_VERSION = 1.13.5
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
