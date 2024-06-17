Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7040BC27C6E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 07:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159AB4091C;
	Mon, 17 Jun 2024 07:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nA8SiO3FidMl; Mon, 17 Jun 2024 07:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C2740889
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C2740889;
	Mon, 17 Jun 2024 07:55:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB2D1BF2A6
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 07:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 357D840889
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 07:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-JqRJMVeLmD for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 07:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=titouanchristophe@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF58F4094D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF58F4094D
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF58F4094D
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 07:55:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so565254666b.0
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 00:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718610943; x=1719215743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HlxN2717TF36JyZov25/3imFtA6yCI1rwd3vL6XRc90=;
 b=uGbTDHlcRBk3DvPMIbsNR4nuojDiI439gsFVLVmu40ugZ5L89EvLhPDfGnPH3W/Zeu
 DczYokWHEYmHKNIiZYZQPMr4gA4953h9dSzCVl6BXoImFsStDvibj/CJGkcPeiWVxRfT
 WQITgHPUS2oWzuc0DaOSKLO/kWfIigP9+AsyzDVop1ITRMNIG1+t1HKLaF52lD7Vfd2p
 fD/PQBo5veD+lNDP4vzdqTsI6NDj1xPICJIAvP5dHqATeUmg4gz38TPwlqsBx0Ub4PFC
 Oi4m1E+iMzqWWDg+BSg+NjuwwlhCdieSXqC37CwmZ4CAlDIddYQh11ssBCrsc02HA+H5
 CzBA==
X-Gm-Message-State: AOJu0YxMWdXqs+hY5zj9x7+lR/RdPI/b8lWGNYL0NTWKOVz6oNlsrxwf
 1Sxy1b1MrPUe4iwjFarGAefHgYnjMXc6z6GeE9n5VTXtBIeJ+7I4NAHONA==
X-Google-Smtp-Source: AGHT+IFtRrOlqaZwk7plf4S3PQAqzo6l9jiKzs3PRtAmQZjE4vtrPb9mCRreQcJtkx/nH4H3Rjdemw==
X-Received: by 2002:a17:907:c00f:b0:a6f:6721:b065 with SMTP id
 a640c23a62f3a-a6f6721b7cfmr857874666b.32.1718610942283; 
 Mon, 17 Jun 2024 00:55:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:63d3:7700:b737:23f:c590:d252])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da3fd8sm486654466b.42.2024.06.17.00.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 00:55:41 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 09:55:38 +0200
Message-ID: <20240617075538.938635-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718610943; x=1719215743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HlxN2717TF36JyZov25/3imFtA6yCI1rwd3vL6XRc90=;
 b=PADTEoXBLWnPjmU5v0gV+g4Xdas6OAAbg6itbl1jKJa6O7BAT14OoSUoWXvfl544vl
 MD9wh4cdLuL9qCz9bJiSNzmy9XVJn6adRZmJwOR9qvEtuACuuHyov1lHjj6+/2ry/lKT
 UxHi+pd14wBdCqQQTyRXXeKjarFES8rJ/5iqQHQOpRM8k4qE6nP7Hj34smYM9NXboDnh
 04NMF1eRZTQPd+a8o11c/RPFKpIj7+Q0ZBHLfIo54nXa1M30IQhD4m+EWBLk7014jY1v
 PJt4NPpppjEJo5nxb7jMnFf7EagNTfPIfyy4JHqJMx92yS7qkqG6TmxslrUq3zpO47po
 mwWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PADTEoXB
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v7.2.5
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From the release notes:
================================================================================
Redis 7.2.5    Released Thu 16 May 2024 12:00:00 IST
================================================================================

Upgrade urgency MODERATE: Program an upgrade of the server, but it's not urgent.

Bug fixes
=========

* A single shard cluster leaves failed replicas in CLUSTER SLOTS instead of removing them (#12824)
* Crash in LSET command when replacing small items and exceeding 4GB (#12955)
* Blocking commands timeout is reset due to re-processing command (#13004)
* Conversion of numbers in Lua args to redis args can fail. Bug introduced in 7.2.0 (#13115)

Bug fixes in CLI tools
======================

* redis-cli: --count (for --scan, --bigkeys, etc) was ignored unless --pattern was also used (#13092)
* redis-check-aof: incorrectly considering data in manifest format as MP-AOF (#12958)

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 378b930374..5c3a5ea4d8 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  8d104c26a154b29fd67d6568b4f375212212ad41e0c2caa3d66480e78dbd3b59  redis-7.2.4.tar.gz
+sha256  5981179706f8391f03be91d951acafaeda91af7fac56beffb2701963103e423d  redis-7.2.5.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 2680b11b74..852bf31ca0 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.4
+REDIS_VERSION = 7.2.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
