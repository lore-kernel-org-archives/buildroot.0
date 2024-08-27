Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0989BC5321D
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 01:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF0A607C3;
	Tue, 27 Aug 2024 01:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc_unWlaExsW; Tue, 27 Aug 2024 01:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578E6607BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 578E6607BE;
	Tue, 27 Aug 2024 01:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA2021BF281
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 01:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D407A40167
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 01:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJd0crRyvi2w for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 01:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFEE8400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFEE8400D7
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFEE8400D7
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 01:59:49 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7094468d392so4060815a34.0
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 18:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724723988; x=1725328788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vtPi8VFuyZJswmxAK3JGS/dnYknZSkim1TasuOVnakQ=;
 b=XbKYKX4E6qhdDpwHr/i7DHtyqmY/37FRYf02JWPQii5iai0Tbx6o/MyWBkzo7zUdEt
 +WebmhPt/PRUbCRaxKostykLLe76mDFLC2fn+n9XqHUyibotV0eafLelrLJRE/FORIJu
 1nSJ/31at6Oh+9mnqd0Qz3Tf5ObIqLGhVzdlJvr5e2/xadvgZTCevhc4/FVhmyDfIBZp
 GHBB+rm1q7L6MwWqg1/ufU9tQIh+HHR846wAMegz2GqK4kklP9inZjge4KepTgFj/CS4
 QeYUgtL4Qs8YnLBYlAlJjVWGFq5/z+ri/ggE2dug4ZibH9Uqoabtv3wyyIfSfUnNHfHy
 8aVw==
X-Gm-Message-State: AOJu0YyxlYnCcuRQS2hmeV2+b4a0x0eeDBbhGzjJ5Q1Sqth9bub+xuG4
 Br+a3ho37Rjyl3/28s6KY5SryxgnxZXQd7H6lXEftgMh889iA6uoyfaFpA==
X-Google-Smtp-Source: AGHT+IH9ZCO4+2ysyi4JlID6Jns2ebZjyrxLUe6q+dpkkDeXh61guAWAWYH3PlhuhCf5mpvuqotLBQ==
X-Received: by 2002:a05:6830:720d:b0:70f:3dd0:316c with SMTP id
 46e09a7af769-70f3dd03473mr6199486a34.27.1724723987931; 
 Mon, 26 Aug 2024 18:59:47 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9acc3977sm8296723a12.30.2024.08.26.18.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 18:59:47 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 09:59:40 +0800
Message-Id: <20240827015942.157139-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724723988; x=1725328788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vtPi8VFuyZJswmxAK3JGS/dnYknZSkim1TasuOVnakQ=;
 b=auW0DRc6GXIglcOCInay9S1RPDAQ6NhulKo7rGLUkh589JMi1HKGkWUFXs+blMTQkC
 lCVqVAxHgU1WSgVmhy9FV25AJa3No57LaPXaBW8g4jjYVUOXInUT8zNepc6RjXbT6c3r
 n7ODVc35QLmJzYZKtzsVSLdoPEuBmXFPrPeAxSKWegxyDgYdA3DAAv2GpgEJ1KNGr5dd
 FpVcBlHDG4KqjvPOwJLHfGaw7UcR3BIWcBwyDiyZOZXWY+AD88S4rx4/xqXyTjASXKYg
 lzA+ftE0UosvmfN/V2cnlaZo4PBdJYfyGkzz/+ukzqk5WZ0+gRuZzyQy2lAiiX5rOCoY
 R1Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=auW0DRc6
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.16.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/timescale/timescaledb/blob/2.16.1/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index ba81c74c7e..c7116028e7 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ff2019f734566f73af0a8041db50f7f1d0ad6967f7e2e7d796d388cd38c0b5bb  timescaledb-2.15.0.tar.gz
+sha256  c1d27da11d0db3b947ed0cbf63d230427a532fd808600dea9ec3afc4ab5d730b  timescaledb-2.16.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index d6c8164234..37c7258a56 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.15.0
+TIMESCALEDB_VERSION = 2.16.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
