Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5BDC25B6B
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 21:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A703C4057F;
	Wed, 25 Oct 2023 21:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A703C4057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUIgWelcebpD; Wed, 25 Oct 2023 21:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A53B94059D;
	Wed, 25 Oct 2023 21:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A53B94059D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9DB1BF476
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 21:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5429960C05
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 21:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5429960C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9GcLHoxThfZ for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 21:29:39 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91E2060C02
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 21:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E2060C02
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9be3b66f254so34447166b.3
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 14:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698269377; x=1698874177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g3VtoW8ADcupARsi3D0r97o1qv8IxmVJouuNCcVBuv8=;
 b=ea4bQdZZemUf24KBGiuTw4ODaFKTjBz92BkSnEfBZxrrFTAWue+xagiIULlnQwu72+
 245gwTJmGs+p4B5qbv6gfVINiGFdIbxx20DWoy0UE/njDSavswqDvZV+ERzkk9KxEtsQ
 1RWLksOv/8ujC7lPwrRkhGx5bgD3okUutt3ap6RW3vON7SNg69TgGXKZ7MbMh4UgQ6XK
 Vcrr6L2y9aIeTjzorvtoYrECpF421FbgkgdpaCb2Kua10VhPAsFwx8RbwXXadztJDNHE
 ucL07DcdKzug/1ZSgxqVd807vAUYAHyjsYUgAiX1kWdeG0vnOXz2aT+CwLjRpvq7QfI5
 zqFw==
X-Gm-Message-State: AOJu0YyiGJI3asClMG65+383nN/D0/HI8jHSU2NcHTUvCH+KX84RNB8D
 LkoF1sRs5vMTLMVqBBjkcB4FWo99VmK5MQ==
X-Google-Smtp-Source: AGHT+IEppsa5/aauMnaLR0/2Tsj8ELVVkvl0DSPdUTW5prh9+0vRSRAh1zR33ai1IWuIcioKfiYkzQ==
X-Received: by 2002:a17:906:dc92:b0:9a3:c4f4:12de with SMTP id
 cs18-20020a170906dc9200b009a3c4f412demr12596091ejc.37.1698269377170; 
 Wed, 25 Oct 2023 14:29:37 -0700 (PDT)
Received: from p15.dynamic.ziggo.nl
 (2001-1c00-0f38-4500-3e41-8c79-4e8a-6bec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:f38:4500:3e41:8c79:4e8a:6bec])
 by smtp.gmail.com with ESMTPSA id
 10-20020a17090602ca00b009b2f2451381sm10635003ejk.182.2023.10.25.14.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 14:29:36 -0700 (PDT)
From: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 23:29:24 +0200
Message-Id: <20231025212924.1957581-1-kadir.c.yilmaz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698269377; x=1698874177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g3VtoW8ADcupARsi3D0r97o1qv8IxmVJouuNCcVBuv8=;
 b=hGOvU6DSfFXGkidIogRuVtRMJVQTMhKbZdnLZL7mEKCP23HjdVy6JUNsh8TyG08m18
 4uPmOyW+5ZSXmwlUEvq2oA81tSF2SHkA74MODhQZxN9B+PUvfkP7BlrVn+GXE3tKmH6y
 r0F5Frz5iqwNXbbnZeK4Z1pNX+sm1HPQZD6PzsalWTMx3FQ3iIFqvmM9BJh3ErhsdkLa
 aLqIdFtLF1RuGrJjqdMFotp2MfoMOWuy7hS43qRHoICGEh9TTOvEoDJoIb3yoIKPgKWx
 X0WOms9oj6bxAlWJoLv/qoBa/cgU5XltBGo2pDC9g9Lu1e089UuTEgYbZGJIiXTobgJy
 YXqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hGOvU6DS
Subject: [Buildroot] [PATCH 1/1] package/qt5webengine: don't use system ICU
 libraries
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kadir Yilmaz <kadir.c.yilmaz@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the "-webengine-icu" config option qt5webengine uses icu headers
on the build host. If (for ubuntu) libicu-dev is not installed on the
system, build fails with:

In file included from ../../3rdparty/chromium/v8/src/regexp/gen-regexp-special-case.cc:10:
../../3rdparty/chromium/v8/src/regexp/special-case.h:12:10: fatal error: unicode/uchar.h: No such file or directory
   12 | #include "unicode/uchar.h"
      |          ^~~~~~~~~~~~~~~~~
compilation terminated.

Otherwise, if (for ubuntu) libicu-dev is installed on the system, build
fails later at linking stage.

Using icu bundled with qt solves this problem

Signed-off-by: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
---
 package/qt5/qt5webengine/qt5webengine.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 836ba62189..c028246589 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -87,7 +87,6 @@ QT5WEBENGINE_DEPENDENCIES += \
 QT5WEBENGINE_CONF_OPTS += \
 	-webengine-embedded-build \
 	-webengine-ffmpeg \
-	-webengine-icu \
 	-webengine-opus \
 	-webengine-webchannel \
 	-webengine-webp \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
