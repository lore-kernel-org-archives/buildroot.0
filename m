Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C85C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F9D6059C;
	Wed, 10 Jul 2024 09:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofOuXqPxAuLo; Wed, 10 Jul 2024 09:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D41E1605CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D41E1605CF;
	Wed, 10 Jul 2024 09:09:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1981BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86E0880BEC
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxR1Mm19kzH3 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:09:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10BDE80B9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10BDE80B9C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10BDE80B9C
 for <buildroot@busybox.net>; Wed, 10 Jul 2024 09:09:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3678fbf4a91so3077123f8f.1
 for <buildroot@busybox.net>; Wed, 10 Jul 2024 02:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720602539; x=1721207339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJJj1xRoIHyQJLfeTk14YFJ1AVpuDBr7jr343bkoXyA=;
 b=oXJyAtYt/iURSdJdQpS/BDSHB30ZuqO893osdGcpMcaObzWe1MCT968UBksMlIJkXI
 ZM/tZpsqqHEgm2zwcLBphMv8jZsWFeY9jgPAh7bGZHp1XYf9TSoTrHZe4zNWD1CaJboa
 kWnVdiwxkg1i8+5XzCKo19l5d+chBrg3NjpRxqI/Grthsrq43cQmYLFy+5TuUvCpx0/0
 XvzAFzYWz+gj2gp/4oaO/qJgn/wU05zJuIP0bIp3FFH7xClGEppv746E2CuIkHRrQY9K
 6DISeInhSdLxb7Be1jDhYx8xHQtE19MgHI4SS2mOVojJ5vO22mfFD014iOySE/PX6ARD
 JTqA==
X-Gm-Message-State: AOJu0Yzj3H2HX5sTVV7KAcRf2Mhh/GHVQHKwSSeRY1bJEAjRCpVmTgs4
 BLlVOArV9aJjhWAmkIifFPVGu6l1DEyCQVVfLziB3dkQAmy3y6Qpvlz0kWt2kqRkOrdsQ+ht7rT
 6Rg==
X-Google-Smtp-Source: AGHT+IHEVFm3yJukIfKyRhGhc8LRJJAr7VrMPczYRFZM2ijdoGED3jjnXDca5yxEy5F3SgKUBrh3GQ==
X-Received: by 2002:adf:ea85:0:b0:367:96a0:c4b7 with SMTP id
 ffacd0b85a97d-367cead891cmr3587609f8f.62.1720602538701; 
 Wed, 10 Jul 2024 02:08:58 -0700 (PDT)
Received: from vm-2404.. ([37.66.35.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde8425asm4749792f8f.26.2024.07.10.02.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 02:08:58 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 10 Jul 2024 11:08:47 +0200
Message-ID: <20240710090848.2697402-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1720602539; x=1721207339; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XJJj1xRoIHyQJLfeTk14YFJ1AVpuDBr7jr343bkoXyA=;
 b=kjpoio3zH8Yo30qDeRdU40/dCwCeiJPIyKCu668MreIof/VqBezk40B6RGJ5qwv6X7
 EISUC9mTJlpWzRT25cIq9hsgk8n5yRg/pAh7V1hJByKKQDWWks78hdYUsO2CC3vhGJad
 +G3e7XWPuAJMw2+iXbTexYe3SZUTPsUo7XbIP3yYbFjfhFNsgHOGBnOAhD/2d8SzzSsP
 kFqihPMg6zFobb6dl1/WhNAlxwBKsOdOe+siLa3VgMBan8LsEB+TiLwuTExrRit8Kw67
 I2heC17mVWNoPxoQXNO9ZM2CYKwkoFYlZdFg0G2Fr8jo1CudZ7fwfLQ0vf+RBb9ca0Ge
 D0XA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=kjpoio3z
Subject: [Buildroot] [PATCH 1/2] package/lua-livr: bump to version 0.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
    -Copyright (C) 2018-2023 Francois Perrad.
    +Copyright (C) 2018-2024 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-livr/lua-livr.hash | 4 ++--
 package/lua-livr/lua-livr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index 314f1d2bf..50e4d3c6a 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  531c4d56e2ef7906a6075e61fafee9ea265dc1a62698b966f5fc2f3abda23084  lua-livr-0.3.0-1.src.rock
-sha256  c6c2ca8e29b8e3b0558b046ffcbd4a5c31800bdca4520002ed4af76985f82d7d  lua-LIVR-0.3.0/COPYRIGHT
+sha256  7f00fc561c5913bb53a21ec21f060118d9795c65a0d7a37903e311bdedcfff2a  lua-livr-0.4.0-1.src.rock
+sha256  6840bae0e48c559cc6aa765d7744d920f8a05f608c4d1223fde8e6b8e7c48c5d  lua-LIVR-0.4.0/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
index fb835a1f9..56600c80b 100644
--- a/package/lua-livr/lua-livr.mk
+++ b/package/lua-livr/lua-livr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_VERSION = 0.3.0-1
+LUA_LIVR_VERSION = 0.4.0-1
 LUA_LIVR_NAME_UPSTREAM = lua-LIVR
 LUA_LIVR_LICENSE = MIT
 LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
