Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF321088E65
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 02:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9232B83FBF;
	Thu, 19 Mar 2026 02:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd2ZqUj0lKMz; Thu, 19 Mar 2026 02:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC3483E3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773887373;
	bh=or0fA5V9f0JByJZjK3eSRjsp7L4VpK+YvdAPDBnEI6k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GtRYtBH3OcQVR8C03bBoNrT/mJeuF04yNZBHDsF9CQXRM0DtrZ5XnNc1q1SI61NH2
	 rAeicoBHtM00TaZmnydtCP8n2znghriJECnwpqaaxIv+4WUd81/OlgXWk4YvT0XQ/n
	 mifHw8e1otGnqNokwix6MYcaEn2SGFF8D+yjCK4vNYXM/diLr1K9/bFIFd8/t5CG4f
	 OJfIQp0Uq3I7WUDq+DCBkRaEVvXsWdHPmR/Rpn5vlFwRurdSDdl1m2ehArK3V2jO/p
	 M8QUFG6IqBN3Rv0ndjDjThc1gG/50tTXQOI9sdYODX7SlRHZSinaXMPCti0Jt3jCes
	 uRln6DzfVTUoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CC3483E3C;
	Thu, 19 Mar 2026 02:29:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 439BB1BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 02:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EEC083E3C
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 02:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buH2YHDKSQOY for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 02:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C4E583DB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4E583DB8
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C4E583DB8
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 02:29:31 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-899ed41208fso9127376d6.1
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 19:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773887369; x=1774492169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOe/mYat21QFKgYyIZGDazmwEnZYYIrRD5pCIwVH768=;
 b=LGjrlp8y2PgkFGXbXvoo/U1I3DlR4eGARO4+NCqgaS/vG8zFNK770U3ci8L2nr+TDj
 yKGuZWSsF505+eqVo6CKbWOxHy4gykzb/5lST/JyyP6u/c/AaDOE4OBfpfe0yC7Fss14
 wtuAVmax8efGGq8PSesZ+8Dgbc1g4S13dUwl6hZjh1EG6g2RMgiFVnmwufM7i1GkbZQR
 h3DxPgmD9fpPQt0BwGJbe7C07lR8j+g1bJlHlX6S0QtAdBU6QYHXWT5rMaGVPZlfiWzP
 UdD2Wkw60tJK2CsW5vXDWi4LIHyL/XjW8YyTcgD+G9SWMTqvH3jKIKovaAyNQ4bZkCUb
 t7jw==
X-Gm-Message-State: AOJu0YyxTBO4ybGikuJOoXv29NwH8bSwAquA7SJMjay6yikhciQHEnaC
 /cZ6DoZAuT3ORyic69RCtqWXQGJiuGxk2XAGuRblGga5r9torl86vqhWz1BYMMCY
X-Gm-Gg: ATEYQzwsORrzUMN2Ik00K3CHI8H8aMdkBA68UxtUzESS1QwEoYfkOlnkcUjbCNSF+Ty
 cKMwUuTmfeNhDE1sXGh0zQsu8NySMD+++Re5noOcR6HEFf4gRBIoQO7VCyhxm0/Tu6VKFniLtvw
 MU2nvL3wfvwPAhI40Y17/M2LQufXfqzUJXwITroqeTwHzr9nZ8dYB9E6o5uekJ1isVYNKdTW45o
 6oqA3R+zDiBt9zkAmepuoXVcsy9cnw7Qs1Ap9SFJ3R2VQBKCEnzOUNTrYu/udfoDltH/SEolJYh
 BqZcjv1OweDdAgwo+USWD+bFTeHumJEhwtfiNsL5wBQh7RpZEiEKB2qIWOvyWrPJSOZfqLxFcYS
 YBjJrUUwbjnFEEgd/bUGaMKwMKCx4vfvfmSXTDsC2sntwneJIgpJ9rj4tiBGda0HbA9q5fPp4EZ
 +N+r+cScs/p6lU01MpyFPf
X-Received: by 2002:a05:6214:2466:b0:89c:4cb3:4ea1 with SMTP id
 6a1803df08f44-89c6b50cda1mr90493426d6.20.1773887369313; 
 Wed, 18 Mar 2026 19:29:29 -0700 (PDT)
Received: from adicarlo.nyc ([67.245.157.254])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89c6ba0963dsm42191566d6.49.2026.03.18.19.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 19:29:28 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id CE87FA98245;
 Wed, 18 Mar 2026 22:29:27 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id CFE0694; Wed, 18 Mar 2026 22:29:27 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Wed, 18 Mar 2026 22:29:05 -0400
Message-ID: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773887369; x=1774492169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WOe/mYat21QFKgYyIZGDazmwEnZYYIrRD5pCIwVH768=;
 b=DKYNRyra9epFjTzC63WiYdhCv7nH9Fb+h5yn58ImCWd08smCBFV1HtxFLCe8O2MzFE
 otCVvL/lBirGG7eQ6HG+oOIJbTUgoFyWZbNHHNEkNzqHH8XrlCbLK+SaYDl9v3IYFbSx
 nwufXPiQKf/sNx+izlOaIrFZ3lFHwtsSul7CtcQMl7BUWWqOapAEiex/OQgA9y1J4MRR
 7EDTjascF5reaoiCjcd12bxEJyUhzt7ib6uZIz86DoIAgWZD4FDb9LRVmtQwhFHeLiZQ
 BAMpBgiejt0caBwR7BMCUZeZ4E3d2a9VnuYk0TMdfZpe8eVenb3QjmfC8XpdgsrFBpjO
 WD9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DKYNRyra
Subject: [Buildroot] [PATCH 1/2] package/gstreamer1/gst1-plugins-bad:
 decouple drm suppoprt from va, since kvm uses it as well
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

support udev if LIBGUDEV package is selected

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 .../gst1-plugins-bad/gst1-plugins-bad.mk        | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c6fb669e13..c75b84ca3d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -77,7 +77,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
 	-Dunixfd=disabled \
-	-Dudev=disabled \
 	-Duvcgadget=disabled \
 	-Dvulkan=disabled \
 	-Dx11=disabled \
@@ -736,6 +735,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dsrtp=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dudev=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libgudev
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dudev=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_UVCH264),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Duvch264=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libgudev libusb
@@ -746,14 +752,15 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dva=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libva
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dva=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddrm=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
-endif
 else
-GST1_PLUGINS_BAD_CONF_OPTS += \
-	-Ddrm=disabled \
-	-Dva=disabled
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddrm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
