Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EC7C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2FE260655;
	Fri, 16 May 2025 07:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-KNqak3lHjo; Fri, 16 May 2025 07:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3388560AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3388560AFD;
	Fri, 16 May 2025 07:56:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E63441C7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB7C983C54
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9o5ZJJ-wZXRW for <buildroot@buildroot.org>;
 Fri, 16 May 2025 07:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0245583C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0245583C4F
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0245583C4F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:56:01 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54fcffd6b9dso2077285e87.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 00:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747382160; x=1747986960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bMw7ufgi5p4FaWXiEFQba6r4MDEO8FC0XWQKbVs5EH8=;
 b=V2NA75zVicnX4hpqx+uviRDvtzNaVcP/mNnhhSvMywtK1ADK3Kw2LGB3S8SZWNBgyB
 NfuhT3n4T001oLeldVo4bnMDcAquy4GT6A9CQNRMdbYBjDXtsnR37GYVf8LnXnc7sdAj
 9bCt6nR4gXFQ7tjrjCxXyxv033XGHuaYDc7znoTWu6EoobN66Ucw2escrU+LBoTuwK08
 B7INvPCJShDJdF0f7bzZcF0lwJiaOgmXFz5dODVmHy0Sg+GYlfj3LyXDLmaUpJNNp/hB
 +njpu0LL7Nr4OzHq+zcdT2ZC5OHH+5M+VmwI5ILVFCqV+HixVZ7EN2jed2skvZJjq27R
 Qgdw==
X-Gm-Message-State: AOJu0YwxWOY69Lp9w1QudFK0FtxgYNkH7BzgWsjELGU2gf/DYcELw88m
 xvJ0/dqmXu8uynZheAHPXg5BwMF/dua/NJl/BYEfmslQ8hdqshzhmthszMp/+Q==
X-Gm-Gg: ASbGncsfMi8p1w34cV5yTykAP9ZBkQRhZMltI2F9i2XcvNNPzMOIsW8XL6IfgHscgWN
 kVFU3wNk1mGoVGdZGJggs+S4P+RUCUTPtvE0sfv7yLbOrEtrlhfZy1oBN9rowOrkmsnfd079B53
 TRle+L1xqcu6LoJton/nrm839YvvqYZ5MLiPqwJZ4yPHbHBTorEX1b0Ru/cJBlmvpoRWtbIEi/Z
 +FQEQErxvmGQ35C1bPMu8nVBip73Q7Zo06B2SJsKKCxiVMoVF3OcK++F4GOghJTEI92Nu14BHYX
 yp/nXygbePx1UeJYhKwQfSvDWFDpFKJcFAiTYYyRf3WvnvWMME0/bq6eHqHNWUUZmeq+J6rq2tG
 h8XctsA==
X-Google-Smtp-Source: AGHT+IE55HrRfXMFR/+jmMQC297WLkVBoeWfiXbxdccLnrZEGdKncCHMJD1KVTVqm4MzlREU67T3RQ==
X-Received: by 2002:a05:6512:460d:b0:550:e4a2:e0e0 with SMTP id
 2adb3069b0e04-550e72455c5mr664277e87.44.1747382159299; 
 Fri, 16 May 2025 00:55:59 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f31497sm311448e87.82.2025.05.16.00.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:55:58 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 16 May 2025 09:55:50 +0200
Message-ID: <20250516075553.3942690-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747382160; x=1747986960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bMw7ufgi5p4FaWXiEFQba6r4MDEO8FC0XWQKbVs5EH8=;
 b=GEZkZsxuNRCTl9ns+InkfLhE42EHKnL09C6xoeFQHqMiCA1mp6QZffwUSZSqKNboGi
 baxJfju4p1FxogYUafU8RI2vsAW2bosTgahIa9RCnm8Ilh6qycDifETn9cxJjg4PDE/3
 XrUcICQ3gbizFBOF5/IVYWAXi1NLLRMy+j7SFSyNfp1YpxPxnK8dfL/9CM18KHbePehg
 pFGjMTr/7yfPUfaVWV/QbtChC81aRGrUIwbraf31Sm1Iho+cyRMz4ZoKyGyzUZavnE59
 H+agHYpX7wjbdTjgzdeS0DyoPWbcMC0YZ4fWERZVisUBvCc0SWxbvwJTRrHy4Wy9d0Dn
 uygQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GEZkZsxu
Subject: [Buildroot] [PATCH 1/2] package/dlib: bump version to 19.24.9
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/dlib/dlib.hash | 2 +-
 package/dlib/dlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
index af206386b8..350f30dc26 100644
--- a/package/dlib/dlib.hash
+++ b/package/dlib/dlib.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6  dlib-19.24.6.tar.gz
+sha256  65ff8debc3ffea84430bdd4992982082caf505404e16d986b7493c00f96f44e9  dlib-19.24.9.tar.gz
 
 # Hashes for license files
 sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  dlib/external/libjpeg/README
diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
index 4eb0002775..0c93130d34 100644
--- a/package/dlib/dlib.mk
+++ b/package/dlib/dlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DLIB_VERSION = 19.24.6
+DLIB_VERSION = 19.24.9
 DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
 DLIB_CMAKE_BACKEND = ninja
 DLIB_INSTALL_STAGING = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
