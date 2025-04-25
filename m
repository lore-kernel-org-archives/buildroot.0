Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9D5C369D3
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 17:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CD982136;
	Fri, 25 Apr 2025 17:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPwAQ28BuWXA; Fri, 25 Apr 2025 17:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E86682140
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E86682140;
	Fri, 25 Apr 2025 17:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAE75159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 17:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CFE440441
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 17:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQZyykOXOn_w for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 17:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B26F0400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26F0400C7
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B26F0400C7
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 17:18:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso2441737f8f.1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 10:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745601486; x=1746206286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H52K4YkseRxLcwtRCPdrJxeYreT4hV824IwRBiFnc/s=;
 b=uPyEWvUVty+O3ExuRitlwuMO3aHlydbOo5zwh2sm17mY0Koq3lWw9vBiTw/4SKFi85
 dxeg3xj/MM0nbvDed0WpE1m1X8LvD9Tbd6ABy0JAy7LGWN8/m68LP8qKsHlY8aaVZ7ar
 R0ZwRi26fvlPaNWvrshcdB5NgWIiGOG7yj3k0Er87KgwhPL1HB1FF75bT3mZWCs36qDx
 S/jkl+VZDtWqZtlLq0XFrKqDnTpv+E/KOV31qR+7g86VtrHttxGKVPVEV4pdBj2vIAI9
 IQ02zxIMseKFwj9bFk5WApmY8GJ6TuUUKPUKiRHvMfqzQISv/ZKwnNh3JeWbEMEYIecM
 RwGg==
X-Gm-Message-State: AOJu0YyGDm4nx1kcyHVzvNHKonbYMbX7z1SuxAP6gUNXdOhPsDZ52x8j
 OL/ds0HDd1nu/8OmcuZzA1b3saHTzT5aC6bEMTzjqNHuJ2sRbWM3ueTEEQ==
X-Gm-Gg: ASbGnctEPzGqlJfyqgVX0yxaft06qzbC+ojSF4OI+h9khxEcIi7txp6WGaURCrZIzos
 c6Xy4edRQEze9xrbdWh2A8xAgWZM+KsDeU4yYlk2VMEwewqjdZHvXAMAZUdQhGzm6UbPki5YnI4
 D/WP/djlQdhJpKZNpyjl3komWjS7MmPPIKCwElLQbAxYMPjNd+EQz18UEV34RklTLT9cn8WmrS/
 0dWcffaIC6s/4/VxHd2wL3CvuTl/EG4wi7Aa8PXIfPenkIOWCK1suzjW0hK7zdGbwNanK9Ai+gW
 OYG2KRFkzVDgikpr+9NAumiz74zbSnHkyepRZUOEBHdlDA6LT3e8RyTDQw==
X-Google-Smtp-Source: AGHT+IE1U9OQ24RJlnIiKCOc4bRAxbfnoTaDCqAZnHFoZy/fvzIHdJpj1MwTRSm3jvfhu0XXD9g+vg==
X-Received: by 2002:a05:6000:2505:b0:39c:30d8:32a4 with SMTP id
 ffacd0b85a97d-3a06d6dd524mr6110649f8f.26.1745601486311; 
 Fri, 25 Apr 2025 10:18:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e0414sm64154795e9.40.2025.04.25.10.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 10:18:05 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 25 Apr 2025 19:17:33 +0000
Message-ID: <20250425191733.457872-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745601486; x=1746206286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H52K4YkseRxLcwtRCPdrJxeYreT4hV824IwRBiFnc/s=;
 b=nUXK4Tg0tDOLPIbiK6mBbdzRN5kcBwi5YQH0cX+DzDFNijPKRs+MEqzTDy9H4FIc5+
 CNhNkzVOtEx25xnD32KD8AoJYt9A7hLbfeJAREr8EmwsguSoZz9+f+pgEBWVCHwfokgj
 HJUFHSTKlZxgrPAwR39UvdcgefCECTW2vCh2Kqe9DJv5kAbBXxPviVR0uP4QW/2U+G2E
 C/YizUuGn97Oq6ztUNyfZydm6lKeTRoOnWoS9zipQZNiiPuksQgNraKlCLiVdQW9aSsF
 bgEUVQR9V+jYOVvHvSgtEWTiOU+GDYD+j35uO6eHEuD3HfsVNfXtqb7Uj//aTMe88wkL
 rRHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nUXK4Tg0
Subject: [Buildroot] [PATCH v1 1/1] package/shadow: bump to version 4.17.4
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

Changelog: [1].

[1]: https://github.com/shadow-maint/shadow/releases/tag/4.17.4

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 6e7fdb4603..985d8eced0 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
-# Verified from https://github.com/shadow-maint/shadow/releases/download/4.17.3/shadow-4.17.3.tar.xz.asc
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.17.4/shadow-4.17.4.tar.xz.asc
 # with key 66D0387DB85D320F8408166DB175CFA98F192AF2
-sha256  09e896c7b01c97ba4be2d6be332c55a3e478b4893cd3c3466d8224e622bd4943  shadow-4.17.3.tar.xz
+sha256  554801054694ff7d8a7abdf0d6ece34e2f16e111673cc01b8c9ee1278451181e  shadow-4.17.4.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index c598ad88fd..41b0122f62 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.17.3
+SHADOW_VERSION = 4.17.4
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
