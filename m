Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF3CC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 13:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39197606B4;
	Sat, 17 May 2025 13:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYOh2lQXW48x; Sat, 17 May 2025 13:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C60D60C2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C60D60C2B;
	Sat, 17 May 2025 13:04:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 465F91DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BEFB40B9B
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2IE0fCjJZiC for <buildroot@buildroot.org>;
 Sat, 17 May 2025 13:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=kanakshilledar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7327540B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7327540B8D
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7327540B8D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:04:35 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-30e7ee5fe74so286197a91.3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 06:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747487074; x=1748091874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y/Mt5nGjtwuB2wraH/vmQawF2/i9XezCVw6eOQXKaoo=;
 b=rtKCNt+f5xnf5HaH9KOwtsgU0tbWBbjK7dyJyFwMMhnFZRAk9FXtE9uMTUfrTyMPao
 7Qdgf/TAYkMvJCYHs51/SVpMcKygjfryBon4fd9RwqcRLTCxdorqy6abwu1FLu0jRzFS
 raY5PxiLo5QgvWj+wyZoKFI9s9vBWRvJYiwg/IesgC8amlKiUiiv8zoCEVNyJfA0kz2I
 b/4+i3bd+CNqDAyuL6S6OfCEHYPx/v0r4rtchV9mapZKbKbvDHrV3Ut0ZiPBDS4x9dJF
 4sB1BtilSmfrhNV3s/VparoLnyeVNGgPm5erC15MSEi9oOLxA3LYoatb/8DSFjvATIph
 bWqA==
X-Gm-Message-State: AOJu0YwGrOmULFJUwzbjlFfQ2E6PZnySoGFfqY96L7feiLtPmV2DuzDW
 U/RQ0YENM/oNAIz10rWU00CH4LTcLEVduI/ouspYZNOu0hDwR7oAXr+HvKa1fW9j
X-Gm-Gg: ASbGncti/PIsvunCqtxrUraw6BaPWsTmsWxKg+ne3ZqskmHxAXcrXiPV2pDrZpdTARe
 HsGA6D0aRNj8KrJWk9RYucIvhHyLA5SiubHRT+M3n9MV2WPxUQJ+Zij5opABbqDp4vfUYw2KM5H
 87tM/iZFiOi6XypIQI3ytCTL+PS1KsLeslrdFiBBqHk0n6UhFaiFDwjL8snmRyXmGsacWwMwctW
 GSg0EzsFZ77pnzDkw9013A0kufaRF6VDIyWzSqPzNAnQLpjDAaj57UKxvdkRPvkkSeWcMW5kRRN
 pCCjGbnTp9t66ZNmbw/Y+wuE0ZyasPqAatT4XcJMn98bEGrSqm0vp9gyPvN38rHW17NOsw==
X-Google-Smtp-Source: AGHT+IF3AG1rbKmDYrIoWWJ5s0Bvb2RbU3rFNWnuQoTTxTGw+6czBaFUHfaGkLHlluJLid0gY4Kj+Q==
X-Received: by 2002:a05:6a20:3d0f:b0:1f3:2cf5:c964 with SMTP id
 adf61e73a8af0-216219bd5d4mr3414785637.6.1747487074187; 
 Sat, 17 May 2025 06:04:34 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:57af:86c5:cb76:59da:cf54:bd07])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-30e9239aaeesm2172095a91.15.2025.05.17.06.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 06:04:33 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
X-Google-Original-From: Kanak Shilledar <kanakshilledar111@protonmail.com>
To: buildroot@buildroot.org
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
 Kanak Shilledar <kanakshilledar111@protonmail.com>
Date: Sat, 17 May 2025 18:34:24 +0530
Message-ID: <20250517130424.588257-1-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747487074; x=1748091874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y/Mt5nGjtwuB2wraH/vmQawF2/i9XezCVw6eOQXKaoo=;
 b=ZsCiCiP47x5ye3krefx6BaV5WZfp0E+hdlf00UbZzVF+QNIiquICpDGUy1xOE/PECS
 HA2uB8+AvkdJEzK2Ryfv9HG9IsRYoq33q6WdV//g39C7qyCyV0EkrqdGjbBxwQp06hOK
 u1Q9pIZJ0dzMjPTTvqLi6C68AwiMe/3rz9O6Bvy93oGio0181NCJbXRKISUoPZLvXR4v
 LOGyFDOntGORTpahepRYIyCsMOvV+C3U9qcN+rN1gMUuhbEO2zMxHPkD9bld+bCXgwQb
 0SrFF4KZghE/K15USjo/zSEE4/H2X4rAiJ70y3uL+swQuu0RMwv92w5bLEd8hQ0ELFNr
 SXTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZsCiCiP4
Subject: [Buildroot] [PATCH 1/1] package/spieed-lpi4abin: upgrade to newer
 version
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

upgrade the package to the newest version.
changed the commit hash.

Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
---
 package/sipeed-lpi4abin/sipeed-lpi4abin.hash | 2 +-
 package/sipeed-lpi4abin/sipeed-lpi4abin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
index 9d66be164b..7281f38cd2 100644
--- a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a1c608a7b0cc641d39666a07d8bb1a73ded35385316989c3e8182d968ed89b3e  sipeed-lpi4abin-44ec4e1cc82141963842ec45db0d1617f9f07e75-git4.tar.gz
+sha256  c0c2daed3c56ba30a26d81986dfa041101c58db994372d601f126cab8fa01013  sipeed-lpi4abin-725756411ecc20f2c2dbc5ea6b8e5aacc6f83aad-git4.tar.gz
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
index f2338576d8..59ef9ff918 100644
--- a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIPEED_LPI4ABIN_VERSION = 44ec4e1cc82141963842ec45db0d1617f9f07e75
+SIPEED_LPI4ABIN_VERSION = 725756411ecc20f2c2dbc5ea6b8e5aacc6f83aad
 SIPEED_LPI4ABIN_SITE = https://github.com/revyos/th1520-boot-firmware.git
 SIPEED_LPI4ABIN_SITE_METHOD = git
 SIPEED_LPI4ABIN_LICENSE = PROPRIETARY
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
