Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3E8C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 16:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8CB60759;
	Sun, 14 Jan 2024 16:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA8CB60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umiE9pO1q8QZ; Sun, 14 Jan 2024 16:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25F6260706;
	Sun, 14 Jan 2024 16:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F6260706
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB5F1BF41F
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D67460706
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D67460706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTlcFt3oA4_w for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 16:52:45 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C40C60701
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 16:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C40C60701
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3367601a301so6908817f8f.2
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705251163; x=1705855963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/0YqayIu2B3vR45R3oqMjIATRZeMrPi6t2r9HEe7Nok=;
 b=oXMX/hNxAeIN7T1L/wYEg5xUJe/G7qt8xDT9WglwIJvtpkOAKlEMZLH4Hdc4ehv3/r
 sYlwPUDps+g3YWpzlBe3FZt9j+Cpa0kNeNUWaFbGOu+NrvOptHO8JivK2bc5DnlsiOYi
 6+inaEITRCj+hzw9/a7tEzH+KiIVG9ZYZi1CqF3GqIwwTDDW91adtzjVcjBGYK9aVgFv
 8z2gJjsJuv6WX0E8wmcyWI53xo4GKdeTdtAzd0gMabFSMdwxThYLi5Ojh4B0Ht+VynDi
 KMJ1npPTaD5/OkZ6nTDOzLNm4uz8TPW/omSgy0JrssFsASzT4NVEFjYwdtxvrEEjth2c
 yJzw==
X-Gm-Message-State: AOJu0YylbDjYqsgkqPmdEOix8vMJJwqIpsyJvY+PpuuFaHIu0g8Vs1xa
 2xPsmdn6mLWtrIZ9aIA5Zx4gVNEthF0=
X-Google-Smtp-Source: AGHT+IGozJGgRSn+l9UBDfdFCBjBTe6txKLXkU7fV3VBT8qAs36TWoR7rNP2zKBqx1Ur2PT57qAJlQ==
X-Received: by 2002:a5d:6545:0:b0:337:492d:4184 with SMTP id
 z5-20020a5d6545000000b00337492d4184mr1580846wrv.139.1705251162594; 
 Sun, 14 Jan 2024 08:52:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b0033642a9a1eesm9547888wrs.21.2024.01.14.08.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 08:52:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 17:52:40 +0100
Message-ID: <20240114165240.1591850-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705251163; x=1705855963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/0YqayIu2B3vR45R3oqMjIATRZeMrPi6t2r9HEe7Nok=;
 b=hzUm2UzOT7uxyTgpoqmRsDxH1MeCroy7QfbJlLEE6d+EdPiW6g/wixmC/5KOCBIxY+
 WBJgRVZVVBIV55WecpSLhBpWt/sX5p5baRTBbZ3/sTYIJ+TFoIkx0wL9Q9SbtnveA9KE
 zu0cwLyNjB490OYPSIJxXbmbt3748RUZ+jdpaudsXC8WxNCKNb+sVl2I2yWEUhOsJ3oX
 d9AXqEnWg0SGA2YwfKuJorJbQu2UL3a0ZHEKj9kX9Wr2avZJPrMBBCzluVLoubk3CGGK
 7tTIXERh36gY2DyvlqYH1i6lVbcQuBTbor+ogkkEdnvdS8MAQi834FusEwm0hX8AiGej
 8eYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hzUm2UzO
Subject: [Buildroot] [PATCH 1/1] package/micropython: add
 MICROPYTHON_CPE_ID_VENDOR
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:micropython:micropython is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/853A709B-B8CB-4E8C-BF5E-6621C3A1D994

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/micropython/micropython.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 3d356c51d8..6e0af59f06 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -13,6 +13,7 @@ MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
+MICROPYTHON_CPE_ID_VENDOR = micropython
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
