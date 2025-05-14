Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE13C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 20:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE4840DBE;
	Wed, 14 May 2025 20:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gK1Rz6UnnjrC; Wed, 14 May 2025 20:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 648D040DAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 648D040DAE;
	Wed, 14 May 2025 20:11:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EF4813D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 20:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A9582EF0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 20:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVSMSUbdMALY for <buildroot@buildroot.org>;
 Wed, 14 May 2025 20:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A50F82EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A50F82EAD
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A50F82EAD
 for <buildroot@buildroot.org>; Wed, 14 May 2025 20:11:02 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3da73df6c4eso1559285ab.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747253462; x=1747858262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1h2WVn2zoD9LsKkRX3r7FoZq4qjTwfeDU2MecPQSLqE=;
 b=npNCNid/FnQ1EM8maS9c45JZQHkzT/uwbBvnmkTlbrzUYuDU/CMfxjqInlziB1CYQh
 wfMkjTXnkUpEVVa0lD99wuHBSBixtJ7KrgthhMEtZDnkRWg310Se7RW1G40E7sF5NOZa
 UULETJXOpDqLsrsmyp8JV4XfRtum4GgL5WH9owBQCuAxLpkVe/HmCuxKuRtcrMbr96PR
 Mog5ta51kgLixFOijJ7ukINaiyUrGLyOC8qTxqCMTAWcLNIzvKo5gOFgFf4PkAyEcJMZ
 xwtrYgknIFxxQM4VDmqXAAlV1cTjX2pqxy211z2WXtWD41KDwq6d1aZpU1Uq45jLmx7Q
 l2pw==
X-Gm-Message-State: AOJu0YyNBvoYjuHdWsqJx7RDiB7qlefEmPdaJ2jDlwfztJSwF6KqTBLK
 y/obmOLJBPZ9ZQYc8diTRBII1zyqmy0OnjD0Af4dSdh6dSRt9bnDhZmK1dEe
X-Gm-Gg: ASbGncu/5rxQyFGNrevH9cdZOyq1ov9lFD3JwZ1/Eit/Z5NoujcfHx7r3LG8bUNEVry
 vdH9IJoSzxyHF8Ka+esFlrAtPMVzZurqYf9ftbWpVBDrZYKzcIa2rOlq16S31SRxpbg15pHyORZ
 ukTXSyREeKEjZKCTukgM5GCPfRDJjGbsmFymV8hG7i8x8/LYD5hc1GEZ3/3TFHA20wMJYVPwEx7
 pYWsUQ0tNfyuVo+6/8OagECJ+TQe4SYx2WC54RWCvNxAPFo9bIrL3sC77vL581tCVhaoenpvfqv
 BpxbMG6EpMiipmHEXa8BjdUrTmSwDvyI7BnfQNT7Hvx/5D6hbNMQ0nfNzkUkvkfK9IfsAYgG+oS
 6O5x/S4QQvZJGUXaCGpf2cm12csctpg==
X-Google-Smtp-Source: AGHT+IHGO/hpkIhBNU4ssuD99HN6AGLY8RBKWkQy9BTe3a3AaktfaXQNh+huKov6VdQkEv8GxL+TsA==
X-Received: by 2002:a05:6e02:1aa7:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3db6f7ea216mr68114185ab.18.1747253461839; 
 Wed, 14 May 2025 13:11:01 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa2253982fsm2769158173.70.2025.05.14.13.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 13:11:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 May 2025 14:11:00 -0600
Message-Id: <20250514201100.686370-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747253462; x=1747858262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1h2WVn2zoD9LsKkRX3r7FoZq4qjTwfeDU2MecPQSLqE=;
 b=AvDAh72IU18RITIstSzCaDDORwbDbq7YoitZKJr2P4bNa1u+uqUgJGcMLcproEYJiD
 Sz8utuJH9jTsQ5aPEQv5SMW4v4+7LF9wiDefwBGD9MFnutBjXAfkUHfjyE4Z47J/45NC
 fmJjEosPgpVU8VWEpVp9Ke70tA7tBb2hk9QpNZQFgsHkgUOOPiCxl2DjB/LYg7yE3v9j
 ZCUmBrStkZ/oJUrxc2ON6pbvm19qTeT93TPE/gdpXTy+XLuhj18cKitsmiQ0IrTflVQ1
 ZYhWxlmpCgvsPPDCrpR7PxUlwKQxCMudAUkenrcQL5664afVJ6GfIkPHYUB18GVHH0Q1
 PtJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AvDAh72I
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: fix cmake 4
 compatibility
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

Add a patch fixing cmake 4 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...Update-cmake_minimum_required-to-3.5.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch

diff --git a/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..a9e53e3f4b
--- /dev/null
+++ b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,39 @@
+From 3437c8317aa16f0896a6c6088fa906793adc400e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 14 May 2025 14:03:38 -0600
+Subject: [PATCH] Update cmake_minimum_required to 3.5
+
+This supports compilation with cmake-4.0.0.
+
+Fixes:
+CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://patchwork.ozlabs.org/project/swupdate/patch/20250514200704.685224-1-james.hilliard1@gmail.com/
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 796d7bc..0a11730 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ #
+ # SPDX-License-Identifier:     LGPL-2.1-or-later
+ 
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ project (libubootenv C)
+ 
+ # The version number.
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
