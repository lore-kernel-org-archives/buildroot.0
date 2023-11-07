Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71537C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 16:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 003894222A;
	Tue,  7 Nov 2023 16:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 003894222A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8bnx1HabIxX; Tue,  7 Nov 2023 16:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0D8942224;
	Tue,  7 Nov 2023 16:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D8942224
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D019C1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 16:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A90C4613DD
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 16:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90C4613DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddWjnPfz64YX for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 16:18:27 +0000 (UTC)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D916B613CE
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 16:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D916B613CE
Received: by mail-il1-x141.google.com with SMTP id
 e9e14a558f8ab-3594149e3a1so19704455ab.1
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 08:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699373905; x=1699978705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1v+oQK0cFgBq3KOA8zcaVppyZ4ot9+1RYMshT7bd3U=;
 b=PAW3Mg9srmPjLWzYHlScxPOUuBPi1m7v1DGwzS0KVRN36fpy+25PKpzsFWd1h+jF6V
 mHsWnNT30cl+PU+UmU7J/z9L7Hx0XunTc/JyW/d2c8zHYyrKAQxZ25a7oipP4tfc3f1U
 u5Fl1curHYhz8MLsnmG0y9JF5ykJ6f5gQuBxVFIG1uvFhoVrtlXBy+Lr6+TiTkeSI60o
 6yzfwyIxeVuiAdLgVU02U+l0dEb3VXlwoiE42QJIumAveK3IIh064UiPkrxtAFQL1eRw
 smegBFLRaSYG+gTlVR7zWSZbdnm6dHb03ok+t1fwoQJsogEd+bNEhj9VkP9tnYD9+RSo
 HPAw==
X-Gm-Message-State: AOJu0YwxBqzRBB40EsohvGM2j291/AbawnErPQD4KAi5c48bNKCh6Feh
 e7LQYyagmU4tfLRHLWqs8hN613NeL5md5ssJmYB6tj8F18g=
X-Google-Smtp-Source: AGHT+IEbb78ZxomemYZFyYVYpiUB/AQVYpCX5Y7inP0Zi6gf9GM7Hi553tvWCvey8s9duJ+xCLtMGQ==
X-Received: by 2002:a05:6e02:1487:b0:359:506f:c0e4 with SMTP id
 n7-20020a056e02148700b00359506fc0e4mr3873076ilk.17.1699373905050; 
 Tue, 07 Nov 2023 08:18:25 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a655a8a000000b005b6c1972c99sm1437794pgt.7.2023.11.07.08.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 08:18:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 09:18:18 -0700
Message-ID: <20231107161820.123508-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107161820.123508-1-adam.duskett@amarulasolutions.com>
References: <20231107161820.123508-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699373905; x=1699978705;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1v+oQK0cFgBq3KOA8zcaVppyZ4ot9+1RYMshT7bd3U=;
 b=qpJCdEPcmXXjX/pVh++t+PTZPECh0Dp4qMNYaT4ucxpmwumZ4e5EejBnaAfb7ecl1g
 sfUUulz7FPrkTlsWvfF2W+J82B0VDwV5X7Z7+r5uZH9KJFZlH+HLv1lEtE3V2/w5uadx
 yzIqgOn77eqaSx4Ue+dgX/YTTzMK/bJMcPVo8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qpJCdEPc
Subject: [Buildroot] [PATCH 2/3] package/glibmm: bump version to 2.78.0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Lang <dalang@gmx.at>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.com>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index ee50ccdb01..8536b20a93 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.sha256sum
-sha256  8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2  glibmm-2.76.0.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.78/glibmm-2.78.0.sha256sum
+sha256  5d2e872564996f02a06d8bbac3677e7c394af8b00dd1526aebd47af842a3ef50  glibmm-2.78.0.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index da95329a3d..c2238e2f30 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.76
+GLIBMM_VERSION_MAJOR = 2.78
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
