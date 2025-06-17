Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07BAC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 13:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A76960D89;
	Tue, 17 Jun 2025 13:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wg7ggiEhYkoL; Tue, 17 Jun 2025 13:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927AD6087C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927AD6087C;
	Tue, 17 Jun 2025 13:12:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7375151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D4B060760
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvIkbj22uShJ for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 13:12:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 738186087C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 738186087C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 738186087C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 13:12:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so3249819f8f.2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 06:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750165973; x=1750770773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VwV/G8Lbhwh9XSe4Z6/E3mJ8/MkW8yJDQN9shChnvR4=;
 b=uQiAzWCnLYlJ13AWz65mYnCerLLmuVB1vhx4JqU0gLjz6MgcDNSjVZLEPPS9/dU+8O
 OSAqtBA2zPgEFvT6/82DbRu9EBSUUikA6y9aXNr7cIInqR+SX2iuXQj5+NgqgVBDEKjA
 2ifRbSlXGo8PPhngxOR9HK3y1lb3M8sEaGVskL83QGjNakcrztSRjNOm356y/UX6PP8q
 Zmt5B5dhZlLDYRn7zQ6DAb6I0Z1FoJeTyEN4WQLVjNveoinN8t2RZ1nc4i/Uw61Cyklv
 EZx40jxjWe3onRUDmTmsZuy9k5w+Mno7MYuK4L3IXtfxGmPL9gdaEk+uUXU0Q5CFOd4n
 Kljg==
X-Gm-Message-State: AOJu0YxNt//fKEMY/mqx7J8Pvf93Or27MBUolkcWMDx+fiEQyeKdRDMC
 4cFIphJK04TXqey8NdMpsIY/nswkHZsDKF+d9huSTAxOOy3r86JIx7/S00KVGnUcSYTvtX/HW8+
 jYugm
X-Gm-Gg: ASbGncttpilzDu79C2b48Pm7EMZBwIwLjNh4/y46JHlQXF3+bjmQeXlMvxEH91ZorBf
 rDhTDbI5Fy+yA8W6Og40Ppr6BeVbOpPHk6JkN5VCM8jXmYRqgRdHWh7hkOp6X1CdECiI+4OIEYK
 wJZ399y5eFIr+i48pWraLs6OUxf8qCZvooPvB2fZoWxchyWDxOr1QvWpFWZLDzT12FSwwP4w7If
 S9Ls5pSTKznlAtLWZjcQFYZ8gT2Et2xCl5Up5dw1hJwvmiwC1AvEY6ivOanYXRKfySXXkpFNAtg
 78sqIyGKB6WUT4h5HY0ETfICiLbzTkQgXAFSe6LBWfSxxJXtXwJt+2ncH43vS+zGGRJ78tiJ5h8
 5RSdkSmefYeRuMsRaQ5ca2qMVMg==
X-Google-Smtp-Source: AGHT+IEswzegsEQAj2/4IghxSWhBoFz+6hbx4KWuLlcGUGnsd2UgpM/OA+IHLTsWV42BamjXfUfQ8w==
X-Received: by 2002:a05:6000:4284:b0:3a4:da87:3a73 with SMTP id
 ffacd0b85a97d-3a572e8cd82mr10104038f8f.42.1750165973185; 
 Tue, 17 Jun 2025 06:12:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.93])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e172b03sm175202435e9.36.2025.06.17.06.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 06:12:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 17 Jun 2025 15:12:49 +0200
Message-ID: <20250617131250.1005533-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1750165973; x=1750770773;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VwV/G8Lbhwh9XSe4Z6/E3mJ8/MkW8yJDQN9shChnvR4=;
 b=i4w7LBDAdo/HcMEX1uu3GkYAcwq2U2aOMDCdw8xFYjIwd9aC6GCLGIoFqI5xGKP5+q
 8Ftqh4YWzAt6eNgxadtVbWCO+BG0sOpLkP5KtaLXrQxJCkNqpbALXkX6uFt7lE04g6sT
 snG0uCv8EapwD+/yrfX6sbGzy+sihxDDGBQfU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=i4w7LBDA
Subject: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version 6.14.11
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
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v6.14.11

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 package/ufs-utils/ufs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index f825bf5af7c9..39cf6516c6df 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e79c879a80936c497fd41a61b6da5e34fb848625453e3ca9e0f6e2398f3609bf  ufs-utils-6.13.11.tar.gz
+sha256  b46f1dbd3688d3b72009c54ae789dd60ea386546cd433325c05970208d36c8a3  ufs-utils-6.14.11.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
index 60fb2f56ea26..672041a119d3 100644
--- a/package/ufs-utils/ufs-utils.mk
+++ b/package/ufs-utils/ufs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFS_UTILS_VERSION = 6.13.11
+UFS_UTILS_VERSION = 6.14.11
 UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
 UFS_UTILS_LICENSE = GPL-2.0
 UFS_UTILS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
