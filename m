Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D50C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 08:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A68D481B7B;
	Mon,  7 Aug 2023 08:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A68D481B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLY_wd-JWEDM; Mon,  7 Aug 2023 08:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED45981A33;
	Mon,  7 Aug 2023 08:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED45981A33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49E911BF852
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D9E6401E3
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D9E6401E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2C10seQ1rds for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 08:13:11 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6053940276
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 08:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6053940276
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe463420fbso6429567e87.3
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 01:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691395989; x=1692000789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kG2UcOTOqnnFdNv2UgZxiFCEsgNJmleWp6GL49MxxjY=;
 b=leAzxL9bKz+NaSrWMCwkvXQcL2I9qgkmJkeN9RcBrK//Br8ebuW08OvUXLDWytEWke
 W2NTzz0HXa5MntH9r1aQiWlUhz+iuSC7Bma9bUBGeL9/GEy0TgYyNNzsvH0HzrBdXqu2
 6gIh6E15TfTEttwIuoOdf9P/K9KxMFuBQI0lTE6DKHFV1AEmSOkDk4C51RmoD2C/JVr2
 ns+AY1vfnecNFZ/Hn2lLtGBQ7L0nTXS7Bwp6axlaBp7FkqK6l5QmAsKOf+qJ8LfwAvEM
 U9Tzg20qj7sDasQn2QWgUIZIyM7KeSXMWR50oVQkMgbdD0aHsvGRVnfxLLrItWIlJujp
 cK+g==
X-Gm-Message-State: AOJu0YzTfWpjEuQO9ial8h46042F8jEFQUiGnLpl+o/2/kNkFzQqqHp3
 hAK1Cz3eaahsaRuQIUi+hhWn8Efpj+X+KaBD
X-Google-Smtp-Source: AGHT+IE2lZhMsqFQBdeP0KJxRRtIkKdTwchRgYngBLGV0nvJ2EYXxmQScqJ8WwqiCy5LPuxAY8kakA==
X-Received: by 2002:a05:6512:324d:b0:4f8:6833:b13c with SMTP id
 c13-20020a056512324d00b004f86833b13cmr4647403lfr.14.1691395988579; 
 Mon, 07 Aug 2023 01:13:08 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 t10-20020ac2548a000000b004fb78959218sm1395141lfk.200.2023.08.07.01.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 01:13:08 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 10:15:04 +0200
Message-Id: <20230807081504.4167712-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691395989; x=1692000789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kG2UcOTOqnnFdNv2UgZxiFCEsgNJmleWp6GL49MxxjY=;
 b=f0bd21zTM/cQpfXd118/7SU3td3NSbN/GKHwDHN7ekqcfpV0qTVwyBX29NpwEzSfe1
 lw85J72O88MgAk4irvwiifQfS/GnFXoDlA6nqPg2ncvzw0AXQJLBp9XyYZJpYNLmrAR0
 Xs0TYh6p48w48gwxUK/VxmHsVY2Q8AYo/ozB2X4wWaLh2/wI83ydF8xXGBNkZcqwYKcu
 5TtVOY1VlRSvLycqrVVQTq/7iL1uw8xT4Yc+NnRptNTka5n0jONBojmyXGxTOK2//j3y
 4YeJMyNiOmX3ov7oM3uAsOCOn2+cQTtMBI+uSvWxgbptuGSGPSLUdBsd+W+2MVGusLZj
 1bug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=f0bd21zT
Subject: [Buildroot] [PATCH] package/libcamera-apps: bump to version 1.2.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 97fcef7ddf..1437a0e8fa 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49ace5382a0a9f8b05d20077fc0900b801fff83dae6ca9e3caa94dae16dbef27  libcamera-apps-1.2.0.tar.gz
+sha256  e6b74a0ba10a962f1930199d7dd828c8d9ee370dfe1fdfd8ae2638df744f1344  libcamera-apps-1.2.1.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 022e6055b5..2a217f095f 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.2.0
+LIBCAMERA_APPS_VERSION = 1.2.1
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
