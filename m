Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD16C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 18:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22ECD81465;
	Sun,  9 Feb 2025 18:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOlRSZ6H8qXX; Sun,  9 Feb 2025 18:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F098148B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F098148B;
	Sun,  9 Feb 2025 18:38:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D6DC2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 650308144C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyLvTWj_3zEO for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 18:38:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.43;
 helo=mail-wr1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A60F81366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A60F81366
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A60F81366
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 18:38:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so1780213f8f.2
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 10:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739126312; x=1739731112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Ag7qPaG6OgQ7r7ugyt6m5Px7P19vsHnsCyk8q5IuRo=;
 b=a42HDiU+ZkoS5oaZcZw3K6R22pkVCe8kcahvoL0EbvZcklX8dTeRHvpxOohGgeORJT
 /WMDg2xZjnAGVqCEHOeUtwkq8aQBBeiW8wOc1T/8seeaF2qzEIh53Ph0S2IN0zFapODe
 G/FJalbA/z7iFVzSwgUl2zKw1D6w6qf6MgYapJhaWWkRgWiKylzVIqrOm6mAMood6GC6
 uTz+EH9lHtKtPJFYTKu0HAyW2LByXdM/gjTzXBoEpXFcDZC0UA1jlXzZttoLIoz2Th04
 jCwKBDrMlZJai4O0PovlNCtZcD22gDXowCdghtnSkhXXzN8eR+C6/mV4OpA54jANrM19
 PRxA==
X-Gm-Message-State: AOJu0YyYjVPDiSEN7EKnpnUhb0iaVo7ZODKz1nmFxtjF+KytIlaej5O9
 s9w94raC8VCo3dp1Yqkr8zkbNJRKtk0r9gAhSCg+8vr9K8asEdaLsxWvR+IKXBE=
X-Gm-Gg: ASbGncsEYTJvA41FXcmnB+Df4fsdKvR4AgdM50VOUsN8b+qeVKB25RHsEj3Qioqn90N
 YEsWkRy1fv9c9PL/MIN4gtYhx0tOSEdQ2MgTWa/rPn03YYkI4cAQ+3MFHGqwJG6GC/FhI9R/J4e
 AFcZKhGwATGhfWbu3BkUlCXG7rBloPP6Fc2tjElHvzTfRY+XNnJjOVDIQzaLhPfv9VhJ+9S14Wo
 WIHZ96v4DRmzVZIfuI7LeeqrZd3AXDn8iAJjYDDTzGV6wB4aurRUjiuYoTHmxu3k5quESnJYLWY
 WHZ/t5TbNeyDOpxEj1TAYPvY7wxbdprQ
X-Google-Smtp-Source: AGHT+IE9jvJKOw4oZkpJA0WIdMtBxsUfSwXeOiMoCCOEzFJh7LKmybY+ak0xbcQyFGQ746OEF8+3dA==
X-Received: by 2002:a05:6000:1888:b0:38d:cab2:9218 with SMTP id
 ffacd0b85a97d-38dcab29523mr7001915f8f.15.1739126311689; 
 Sun, 09 Feb 2025 10:38:31 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:73cb:c4ab:d8a8:3a91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390da70fbesm158562675e9.24.2025.02.09.10.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 10:38:31 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun,  9 Feb 2025 19:38:28 +0100
Message-ID: <20250209183828.148265-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/seatd: bump to 0.9.1
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

Announcement:
 - https://git.sr.ht/~kennylevinsen/seatd/refs/0.9.1
 - https://git.sr.ht/~kennylevinsen/seatd/refs/0.9.0

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/seatd/seatd.hash | 2 +-
 package/seatd/seatd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index e1db897d44..ce70480d50 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  a562a44ee33ccb20954a1c1ec9a90ecb2db7a07ad6b18d0ac904328efbcf65a0  0.8.0.tar.gz
+sha256  819979c922a0be258aed133d93920bce6a3d3565a60588d6d372ce9db2712cd3  0.9.1.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 27f3c8646f..69be691cf6 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.8.0
+SEATD_VERSION = 0.9.1
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
