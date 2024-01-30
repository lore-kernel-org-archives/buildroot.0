Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E3FC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1705882437;
	Tue, 30 Jan 2024 22:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1705882437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_jSyRbFp2Cc; Tue, 30 Jan 2024 22:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6286381DCB;
	Tue, 30 Jan 2024 22:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6286381DCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BBBE1BF275
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2488A60F45
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2488A60F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3Xm1YNw3pvm for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:21:45 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64B4D60F00
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64B4D60F00
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e775695c6so39969425e9.3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 14:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706653302; x=1707258102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FKzBdDysiu/2+T1PFrUeMzvUnJaLGlpoyLEYEWtZLYY=;
 b=b373Xux6VuuWlZ1cbcZ+dJt846gaqZv1+2SjQ8iL+LDD3/8wcILjuPclY61h1IrG38
 DFD5EafUq0Vk+R2ctbpt97l7Kg5ASqjrXlr8ZQUVOxXrtEYK9Oo4Bp6ZaJQbkxGYfBOz
 kW+P4nWzapFPCLYUvjbYrpWtrg/AA7lTpHY+aOz4v5MbIfRlBb6yBiV3Gr2v9FtW4Tug
 kcOqSs9DhhrF+9TEHV7undNqprSOulvjRKL/NouUG4t29FR6YyKlBQmRry0p5ZK7idjU
 9rUxGLiT6DSu7/U5iHk87SVKpUbKaSYcvnSvEdMN00V5YnPPBjSjtvx4b36azueS8Zzw
 RGcg==
X-Gm-Message-State: AOJu0Ywx5ENPewp9dVjeR1p9Ev6prTz8QrISlEnb7gn3HO5s5aB5JnBJ
 /H4MXkvrbx9DGL4F8/2iW8awfB12NJ+C8A29WmzY4jcuU4q38FjqGa5nqS8hx/g=
X-Google-Smtp-Source: AGHT+IFYiSNmR0HHBNT0VA+nTGEcyK9maJb9vVa5yrWAKGpDvGmmAJ4vhtnfmU3WGKKLohaElEdFsQ==
X-Received: by 2002:a05:600c:3d0b:b0:40e:70c0:5054 with SMTP id
 bh11-20020a05600c3d0b00b0040e70c05054mr10177538wmb.2.1706653302223; 
 Tue, 30 Jan 2024 14:21:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b0040fb01d61a3sm1203041wmo.18.2024.01.30.14.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 14:21:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 23:21:38 +0100
Message-ID: <20240130222138.136539-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706653302; x=1707258102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FKzBdDysiu/2+T1PFrUeMzvUnJaLGlpoyLEYEWtZLYY=;
 b=aGYZQrBRiSashyfjelvqWh5r0ktYjcj12erPr9zBlPtrcF4lc4p8y6hF5JRZyOI9tF
 Ryh3IsPz59+QjniLQScRH3BoXzwY0lqhX9j7QXPUaE6nynMti9ZvuBzzowBFy8yMpaZy
 a2TtY+VCQ7lrm0KHcBL14VNVJCxbaG+bFceq5WHvuttfZMZ06/J7BhNidSlLe7aNdID+
 Ym+2UQ0NA5YxZ8SZwTba92/UwoG43QoiVU5DsZXK32Xqz01Zzt4JeL3R+7E0X0aEWmFS
 WI2AH0MPgaDrYSjBoVBrvDnXHfonTDmsaGKIkzvhWxnKxGKk6LwHcaKOABN6NCh0Dy1b
 n/ZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aGYZQrBR
Subject: [Buildroot] [PATCH 1/1] package/axel: fix openssl build
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
Cc: Ismael Luceno <ismael@iodev.co.uk>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace --with-ssl by --with-ssl=openssl to avoid the following build
failure raised since bump to version 2.17.12 in commit
50ba0b0a40187b695740a2fce2d2f3ed7cbf58c5 and
https://github.com/axel-download-accelerator/axel/commit/21ccacd0c3bb415c550d590cd64aaa9bf08997a8:

configure: error: Invalid argument: --with-ssl=yes

While at it, also add wolfssl support available since
https://github.com/axel-download-accelerator/axel/commit/0759374239acaeac4105f4851cfabc28433f3bcd

Fixes:
 - http://autobuild.buildroot.org/results/a8c00442bc296353c75e393896abe9883b093a57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/axel/axel.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index b3896e86e3..d3a2f4d42c 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -19,8 +19,11 @@ AXEL_CONF_OPTS = \
 	CFLAGS="$(TARGET_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-AXEL_CONF_OPTS += --with-ssl
+AXEL_CONF_OPTS += --with-ssl=openssl
 AXEL_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
+AXEL_CONF_OPTS += --with-ssl=wolfssl
+AXEL_DEPENDENCIES += wolfssl
 else
 AXEL_CONF_OPTS += --without-ssl
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
