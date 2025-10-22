Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB8CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D69761310;
	Wed, 22 Oct 2025 16:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKMMXew05Qbb; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 785C96125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 785C96125B;
	Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0004DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6C0B6121A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTUmuVwMo3A1 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3BEE61205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3BEE61205
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3BEE61205
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:32 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b626a4cd9d6so1401495666b.3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150990; x=1761755790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKKT0WVhtjr+6hH4cc5PAOmsJiYuPjeamlMBFhjBeAs=;
 b=uaAA5ljK6FR/JbPN/sdCfva6hxP44t5wHLiPAkbOsgmSbrRwv5kqbrWWp6jsyQIYmP
 OPbaZUQBmbocGDkg+2NhOWPAoXBPi1jl7ayFwummhuer14Y9l9AQC4668dg6IfXPChHk
 VkCb1oqBKv1ZJ3nlQw+wAa49Avqx7dm4ZpB9pLPqHfW/admARjyPVDnpy+rGLDAuPtjJ
 0QNQUYLhusXTAAHBkX6uxSOohdNes0Tgc8TjysC035C1A+IWZbiOo6AQV0gpkezUY3Fc
 7xHNjJEl/xXAmYuyYTYgWaB+/IlfgsE5FA8bpQvPQiFOOYPQVbxbwsGvbz21j1405khA
 Bidw==
X-Gm-Message-State: AOJu0YzcWJaG1ZA722tdROI41A3s59S4gZwtHMXZ7M//oP3FQN7+XHHa
 Tt57SoA1yzhfB3vi8s1zxyGtK6GwbFi7oKb2SivqESSVAmh8rpTLI9EhDnPtLniOgUogDth2oVp
 8jJ+w
X-Gm-Gg: ASbGncsPLq50JPKPg5cMj5jXisuFaWNmHGhyWd/WE+YMdVytKu5uRczrUPMLylUrsTG
 rxMFHlOuzv0gsoUvQJE53iI7Ll9Nf5Hy25tD6wDNmNImQozDkRhznYrw7on7lQILgkx4B6tBim8
 o4HCU7MFMgM/vyHVSzxbWnGHhIOELonUjT+swD1bJmH8NviYUc+DiSmd9Po3nVUsQzctpdAsj4Q
 qE/Glco4e8aykudxdGzelhg0s6HvRSOHUWZLHH4PoK9bs0joWkfI2ekSMhEzC7/0zWsDqk+ZgQO
 ywC8b/aoj1BE82xgA1XcVPA4OVQEeNskrbedR+YXgDwt5nYHpkvoJrBlBwJYNaDTQDkoOr94r5k
 cRH6T0MgSDzBZWn75nQ4NhA9J2loHykXvm/WbPft2HxTE37dy0oery5RX0O0QUJc78vNwEn0jY9
 j5VY5gqtxWFZCG0z1O5+59Xyb5ihurzGByPFWUHV0a/bfNbTDv
X-Google-Smtp-Source: AGHT+IHXHOCgVe6pVuEtsMTlhITX6wSsKnw9UWAzaiYRo3F19n9UXWt8+fMQokPLFPmrO2uy/n/VOg==
X-Received: by 2002:a17:907:6e87:b0:b3c:193:820e with SMTP id
 a640c23a62f3a-b6472c619c0mr2626557666b.13.1761150990600; 
 Wed, 22 Oct 2025 09:36:30 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da25c9sm1402905666b.11.2025.10.22.09.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:36:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:36:27 +0200
Message-ID: <20251022163627.20002-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150990; x=1761755790;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wKKT0WVhtjr+6hH4cc5PAOmsJiYuPjeamlMBFhjBeAs=;
 b=QclLMBIuhcDrOVm40v5iMJtV+8MxCiEUCYh8XMNPUm2FuGCzI2pKjle3iUSZEZorzS
 jjou1viHZLd9Vxf1tbtswvARvSfTlCArPUNDlOkp/YR/AbuAT/f880KDFiyIrHBu2A+J
 FvPdrmB0Go4K8rlODAGT67tJTyjML6GOZd65E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QclLMBIu
Subject: [Buildroot] [PATCH 1/1] package/libgeotiff: bump to version 1.7.4
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
https://github.com/OSGeo/libgeotiff/releases/tag/1.7.4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libgeotiff/libgeotiff.hash | 2 +-
 package/libgeotiff/libgeotiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 3165994bfddf..e81f15ea0dbc 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ba23a3a35980ed3de916e125c739251f8e3266be07540200125a307d7cf5a704  libgeotiff-1.7.3.tar.gz
+sha256  c598d04fdf2ba25c4352844dafa81dde3f7fd968daa7ad131228cd91e9d3dc47  libgeotiff-1.7.4.tar.gz
 sha256  a822a731a7ac4ba7d8f18fa0dc29db2e68a5dcfc315b46e4a4c8956720d55d93  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 126d61cb1ae8..f6f7832d60d5 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.7.3
+LIBGEOTIFF_VERSION = 1.7.4
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = MIT, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
