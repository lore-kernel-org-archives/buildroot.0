Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EE4C3ABD9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F3060B19;
	Wed, 14 May 2025 13:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87orDgrVQTK6; Wed, 14 May 2025 13:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF626610DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF626610DB;
	Wed, 14 May 2025 13:43:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0226B153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC98640BFF
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rbMqvthlvUG for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3F4740C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F4740C0B
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3F4740C0B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:26 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad22ac7cdc4so89163766b.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747230204; x=1747835004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1pcO3KzlvWaYNNhULJQfCS7CpwPtc71FRung++bSjc=;
 b=luH9UmcxFnogec6oUl26vXiPTAgmW9fTf6RTQK2VIzcjPtUxzMHDL/hGj/g+WFlgZT
 VDIYzt6rZXxXH87mvDoZXGp4g2YndabhRyJs65Nz6n5XJPFKfqJiE0X1ZoESytk8cgDC
 4TD9NJCFcOOhZ9OfPS8oQNmZsfq7ph9FUgNur+d6BvybeaO0AGA/8lmovt9V7bf7IPZ4
 cd7dZH0JKX9H+/we7y6LsNOjr+AzzhA1FMiBH0gRLmPhR6pK7V84DQk9zlHuPJu2rLFu
 x14F4XgbZyKv4KpHQcL1sRzewwr3N8q3VJU0DpBpat5yompg8E0zbEEunDQy5Vx0DKbI
 4jGQ==
X-Gm-Message-State: AOJu0YyuLWdcg5LgD+i1aOXvyRnmiyUw6q4PPKWN2ySZSYCMoJF7D8m+
 WBz09v/EG0rNbdplB4k4r/bldMeOYmszlkS0Zzq0QMjDR5vcqBuPTQW0yt4kmcMB+pFIF8Xhjud
 k
X-Gm-Gg: ASbGncurupH0QHS/TbXjhV60x4Iawqhy7aHja6fAOcj+Sf4RUAC1cUODZpL3s5H4cAC
 +GbJLrJ21AGl+fKRY250rKjZHpXbadY9ksFPNDl03sCu7xVBHDueuxLsmRui36PHx2cHc/dpC8D
 TgMONabvxLm+sC9K8bk4YEk15MnuW41hkEtN2vEBIJkesX7Ij1Y1S/9FoFlrS9sdTZ2DGD7y35b
 gRrRr/D8sZ573A85bz1SRATpxIebKo918KIN5iihv+cC0BhyKzU9rNCl34K74aBF5chXNcIRm7W
 jgw4p4T1clt7avvzqI/6RGIyYx5SishOLtuZsNth/VrMXwAIhvQAmWC4WTbkYBpm52W1aP1YL0P
 504amSKgY7OaiEmscw2FfGItt+Wx69IcQzvly8Ej1oVzYYNbxh6KftgUitLNY9FKKkcxb+aUds7
 RbVpApoJRdtAnl2EscoR3AgaGoBWFtqwo=
X-Google-Smtp-Source: AGHT+IH/N+OggU5sl422YQ39v7YWCgz6UlRPFzcHyLvjEcnvZVE6Hbhn5Q/HkAbWi3RfA5HW1kA6lQ==
X-Received: by 2002:a17:907:75c2:b0:ad5:29e:7526 with SMTP id
 a640c23a62f3a-ad5029e7574mr49157766b.16.1747230204181; 
 Wed, 14 May 2025 06:43:24 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm934783866b.131.2025.05.14.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:43:23 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 15:43:14 +0200
Message-ID: <20250514134314.2405052-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
References: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747230204; x=1747835004;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1pcO3KzlvWaYNNhULJQfCS7CpwPtc71FRung++bSjc=;
 b=bBw/5nzYWplm3LTUQAeiM2BtYCqv6mryVY4jCkMAvjY+irjoBJRz6JkGv9Sq+lEqn8
 rVpMGeXQ/K/CMbuVUGPINs0+AJYCv5z3NRmU/JmaWfUPCmTBqe62hkD8AUbHbBq+Rp3h
 PtZ9/FIUh/d8/kdCRtW1elcThbaT8XoDZLFo4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bBw/5nzY
Subject: [Buildroot] [PATCH 6/6] package/foot: bump version to 1.22.3
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

  - Requires libxkbcommon >= 1.8.0 as of commit 34d3f466
  - Drop upstream 0001-box-drawings-handle-architecture-with-soft-float.patch

Tested by building an image with sway and opening foot with win + return.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...-handle-architecture-with-soft-float.patch | 42 -------------------
 package/foot/foot.hash                        |  2 +-
 package/foot/foot.mk                          |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch

diff --git a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
deleted file mode 100644
index 1120fa44c1..0000000000
--- a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9443ac7e2937bb4f26cf44c73bb8150860c5df45 Mon Sep 17 00:00:00 2001
-From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
-Date: Tue, 4 Feb 2025 09:48:13 +0100
-Subject: [PATCH] box-drawings: handle architecture with soft-float
-
-Currently, architecture using soft-floats doesn't support instructions
-FE_INVALID, FE_DIVBYZERO, FE_OVERFLOW and FE_UNDERFLOW and so building
-on those architectures results with a build error.
-As the sqrt math function should set errno to EDOM if an error occurs,
-fetestexcept shouldn't be mandatory.
-
-This commit removes the float environment error handling.
-
-Upstream: https://codeberg.org/dnkl/foot/commit/9443ac7e2937bb4f26cf44c73bb8150860c5df45
-Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
----
- box-drawing.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/box-drawing.c b/box-drawing.c
-index 1c613051..421ff54d 100644
---- a/box-drawing.c
-+++ b/box-drawing.c
-@@ -1462,14 +1462,12 @@ draw_box_drawings_light_arc(struct buf *buf, char32_t wc)
-      */
-     for (double i = y_min*16; i <= y_max*16; i++) {
-         errno = 0;
--        feclearexcept(FE_ALL_EXCEPT);
- 
-         double y = i / 16.;
-         double x = circle_hemisphere * sqrt(c_r2 - (y - c_y) * (y - c_y)) + c_x;
- 
-         /* See math_error(7) */
--        if (errno != 0 ||
--            fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW))
-+        if (errno != 0)
-         {
-             continue;
-         }
--- 
-2.48.1
-
diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index 9a4335f2c6..a48fe74b22 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ff81bca86178ef326588176f8bdf817bb3e0fbc891d026960144f69c8a74eb4d  foot-1.16.2-git4.tar.gz
+sha256  1ae0f56a375342a88e94ee540b87dc77147737b24a21f77c92c84fed788e2942  foot-1.22.3-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index e300d04d0a..a09b61d717 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.16.2
+FOOT_VERSION = 1.22.3
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
