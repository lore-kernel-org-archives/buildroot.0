Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26528CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 15:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF69C40A8D;
	Sat,  4 Oct 2025 15:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kNheXQ_7F1G; Sat,  4 Oct 2025 15:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB39A40ECB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB39A40ECB;
	Sat,  4 Oct 2025 15:12:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA81F226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 15:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B072940AF0
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 15:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZABiDqwj6NCM for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 15:12:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE0A540A8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE0A540A8D
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE0A540A8D
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 15:12:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b472842981fso463879266b.1
 for <buildroot@buildroot.org>; Sat, 04 Oct 2025 08:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759590764; x=1760195564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0qY1ZBN21hc3wB7Pi2eNWm1NpX5uVOgDT+gbGAWE8Vs=;
 b=sM7o5LlyvgjTkwFapGyORc9Vlu1prjQdCedGB8fQAY/2Wr6phRrVcXvD7FE4I36Z3l
 8mWAFO4dn7n9YQcKYA269fJNJhsehazMFdBTDyGBJFOw1jsXmFDwTGWo47O49GUITMd6
 C7yVGHcww8Rn1yAptAafhLjaU47CiKM+j9MCEL1arzeJos/Jh1T4HDvtoWPXgT8ad2Fi
 A3kb6vfplCd0yr2lozpnSgYXoqY62sMnhBHjF31Fh+tqpuWUKpCx/YfER+o20WTKn9SA
 nMi3G2X1e4WLYKFlny03GBeVvb64oEs9YRjJfD/jcSR8SUm/ICs3Yp4EudnqU+lFannz
 QU1Q==
X-Gm-Message-State: AOJu0YwJytNzQ/UFyXr3dSVpnp4xko7o1H7P3RFB0CzlGzboNkp2GY91
 ah25m1815RhVr3TObV9NJaHJrucCGXDze8Q6Caq4kxvkFzAvwPOIK15Zp0I+IDbHWrvp6nC+ShR
 x6fB+70I=
X-Gm-Gg: ASbGncttHl13dihsAICJualS7zy0IWPu/OBdDw7aL6BAGB+92wGnlWYGKcjWEzeY9Gu
 365E/NQmzORzOZQphrGb223GZnqdjtlL3ssiYuH01UuqvJiaoiMNcZhI890Q52pztBGcvTcU2fr
 mggzhEy5HvuSEh58fWNEhsWYWq1ocHmbeny0VT7/K77CamFlSxzQ5/GSh5ZXhjTJFDzTT1ymXp6
 z79RXShib/Jh6K4YEoRhyHrTD1f2D28BS3mOyc8Xvt1Q9eDpNhPlqr9ypFhyAdWGTMVyQsWDq6t
 gYb5nZ0WMxWMamaBV+J8ZHNUK4WJHbOjUkBnY6C1hR/L/EfTQbUPWjLydQqOWRefxa6XrwKg+oV
 SgQl8qwVETdbURj9ti0RG8rvey7Ed+uHk/mV0vKoA91Q7zcL9pjrFSZbgd8FFk57If7ql544bbb
 VLtw7oShUfCP3zXrC6jFXLcpz3A+9PZww415cQIBxaYzGATN/fENdKT+fu62ZT7cr4sZptu7z0H
 d0seC7t5O7anx1ZzV9SICb6FA==
X-Google-Smtp-Source: AGHT+IFMmNFLyvyUI3txY40UZ1y1xpMg4N6kEK4gl1yVcGvUpkMt+Np9pO/cenTCcoJDVV8JcXJ8qA==
X-Received: by 2002:a17:907:da2:b0:b3c:e14c:e24 with SMTP id
 a640c23a62f3a-b49c13757a6mr857241366b.13.1759590764095; 
 Sat, 04 Oct 2025 08:12:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4e613sm695949466b.81.2025.10.04.08.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 08:12:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  4 Oct 2025 17:12:40 +0200
Message-ID: <20251004151240.1509713-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759590764; x=1760195564;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0qY1ZBN21hc3wB7Pi2eNWm1NpX5uVOgDT+gbGAWE8Vs=;
 b=WBTkIt4LASlqNnCsyhzeEe/2SunMtwZxQKNEeLdc8joLJYkV0KvxswztzSRNhiSlrQ
 rF5pKMrmb0s1Pe65areLr6x02XimUlFpDfVDyq+XXMP8MXEizLbupTzBvYDE9XGt3X3T
 m52VS/r0WtAUtUc75tx7bfFbBzluX3PeXMZJc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WBTkIt4L
Subject: [Buildroot] [PATCH 1/1] package/fcft: bump to version 3.3.2
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
https://codeberg.org/dnkl/fcft/src/branch/master/CHANGELOG.md#3-3-2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index d95111d4fa42..f5a499edcc45 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f18bf79562e06d41741690cd1e07a02eb2600ae39eb5752eef8a698f603a482c  3.3.1.tar.gz
+sha256  79e52aaafc0b57fa2b68ed6127de13e98318050399a939691b8ca30d44d48591  3.3.2.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index 5fe38b5bb24d..b9ce43b45455 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FCFT_VERSION = 3.3.1
+FCFT_VERSION = 3.3.2
 FCFT_SOURCE = $(FCFT_VERSION).tar.gz
 FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
 FCFT_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
