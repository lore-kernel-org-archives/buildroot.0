Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08113CCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 13:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B650740A2B;
	Sun, 26 Oct 2025 13:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MD4FlnS4Hd_8; Sun, 26 Oct 2025 13:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C23CA40A56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C23CA40A56;
	Sun, 26 Oct 2025 13:41:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DFDE15F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A4DA403AD
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6Z9vzCAWG8T for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 13:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42F2D40084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42F2D40084
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42F2D40084
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:41:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b6d3340dc2aso849443666b.0
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 06:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761486079; x=1762090879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lr2VJMOJyUfLYlf0iogKIJf0+4f7NSopejRH5cAC/Jk=;
 b=JHRAjpH/a3Fkf2u8d597Eg5jUknd+5LXPrf06QgGALmjRcc0MTEWK4SxBRuDhv1HRC
 TpmjD3iZe/Sl5fqbgEJ+M+eyH2G+pTIKXj25vlQvIcgVd4SRP2ZCmCw/poJg1r+uo6FC
 N3xvD/3KS1estfcN6EZebDcbNn1IU7CFb7q6/3DzzhEI2m8uj14H5Jhy/CJxkS7iMfMp
 q8Ysk58mba5XkcFX1FDoqH9rjtksiC0oqrs5sFySFle7q9Iv+n49BVg9Jweu3pyQ7VnU
 0Ug5jX/TchdWBVtTmgv79qCDrrE9i8TMzZjZ3t9wbTDhmqxrth5BbBMEUjCwaoWV9T/L
 ytlw==
X-Gm-Message-State: AOJu0Yy2wBN3xolEPmOkLTHNF++tvtYtOW/xnwtlYo2056l6BeR2uSUj
 1LQDHvA7d8VZx8C6+bjz54v6x3C+OrOzY2MtS4hxAalGT1aw8cyyjreTJs3r3cZ0X26xuw9JWxK
 oTgLf
X-Gm-Gg: ASbGnctVxgoAS6Ri27OEd0AwwFnEM270+TB8gAmQEbT0LzluuFvFgk+1w6rbsuBSz8U
 0+STBuN0T2hoZ8OwD72bPuXuXm72IwIVBRI5eesL7awuKQgDVTl3nhxyWf8zlI0cJxDIlvjjO6a
 /BiCGkp/zj9SGchLV6JlK93GtmrsB1TUl3z+WkbWTHKlapqze8jdSqNDF46WHPOpVbGIWxIVkos
 MOKCkhJCeWZCWxTflFhaTph349orZ/yWXG88e7O2j4jPHQ2DZ7NuSijgVb0CE/m9y2sFR6OvVRw
 i0WlvvHrk8fT5zXLGkK/Me5tY44AvfV9Ke+FuBoFPNykR4DUb+xsW0JnNpbh6dG0TrK3QGKdAKx
 O50ByrefND/jYYsbVTdUiW+/CIV15tACPxpGPXMz3M32s729H0loniDa9N+Hn0Y0AjgqXxFN3zU
 GmBhePEJlm8ptff9Olc/fD7lUglr6bErGGkOCuyiAE/DkfyMPEJz6CgPdDPpGcFjv3jzaYknWNP
 //jYw9Fd1UYEOr4gePsh2u29V2TkMMCKL4weauH5a5tb7IJAA==
X-Google-Smtp-Source: AGHT+IEoA5RuHuzcLznHLa8Uw2KcVLDVPYq/CHoylneryNxNomSR2J0qbSzd/r/iXKe2da36aIlrXQ==
X-Received: by 2002:a17:906:ef08:b0:b50:94d1:8395 with SMTP id
 a640c23a62f3a-b6d6bacdb0amr930258366b.9.1761486078565; 
 Sun, 26 Oct 2025 06:41:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-58-41-5.retail.telecomitalia.it. [82.58.41.5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6da1e2226fsm73336466b.20.2025.10.26.06.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 06:41:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, James Knight <james.knight@collins.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 26 Oct 2025 14:41:14 +0100
Message-ID: <20251026134114.1238670-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761486079; x=1762090879;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lr2VJMOJyUfLYlf0iogKIJf0+4f7NSopejRH5cAC/Jk=;
 b=pUsD4pNOvmah2ZE8SOTjiJDVDqyEQlV3/WxsuEO8FL93dGgzaiyPVTbTZg+gbj666K
 9ioVfxTVDPv8kv7DrdeqwdHrMWtVrq4QSk0ZHPNWVnjPUmNjiW3c+o8lNl679i+3zRVi
 zRREjkjwVY4JsRrT41wwxadUPYHLVlQTWPgjQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pUsD4pNO
Subject: [Buildroot] [PATCH] package/atkmm: bump to version 2.36.3
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

Release notes:
https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.3.news

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/atkmm/atkmm.hash | 4 ++--
 package/atkmm/atkmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index 08cf86b3df9d..4c14da7a3592 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.2.sha256sum
-sha256  6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079  atkmm-2.36.2.tar.xz
+# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.3.sha256sum
+sha256  6ec264eaa0c4de0adb7202c600170bde9a7fbe4d466bfbe940eaf7faaa6c5974  atkmm-2.36.3.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index ec63d8ecbcf3..a5e0303b73af 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATKMM_VERSION_MAJOR = 2.36
-ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
+ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).3
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
