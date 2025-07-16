Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BE2C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 05:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9948683D24;
	Wed, 16 Jul 2025 05:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1V_uANn4hDSh; Wed, 16 Jul 2025 05:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85B983D16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85B983D16;
	Wed, 16 Jul 2025 05:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67E471514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 05:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59116407EF
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 05:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hoO3NqaO8Ww for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 05:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C77C400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C77C400D7
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C77C400D7
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 05:59:50 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae0dd7ac1f5so1211980366b.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752645588; x=1753250388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Zwybs6aFfmG6EdwQD+pDkl+v+nFupzy4kdJV3Km02A=;
 b=WtASL5UbC5xrggbAwSawJ/errB72mZqRH2YkTpG+Rv4rpl3XXkr74CXfbGEHTXPBeV
 79s/9V0kSFHjseUhTYy0b2/W6HPFhSnm/QbDNxH9vlTkI1aycEKpTeiovayvbQBa+ELS
 ieC7M77TtBwWpVcuMSmyLXGp3mx6OXY42rwpTSQq26fcIlm09F4sXlNjCZjganmnONb5
 EGJ8XpLK8VJShVXmCJhu9FfSGe7WTEoB+fqPQqswZeCjXkK/4BVI0JQHpi7cV6kS1K36
 FYiADiQHu0Bb6cFmAOw2AGBVZzv8EpwB/hk/17hGF8aH6OsyNTNBxsuP839E3fXodTxo
 WfbQ==
X-Gm-Message-State: AOJu0YwUERffWke11Lsq5A31cNqYp/XY177lZw3KXzHJxfeNYujsW2hW
 iC9ryfHxlFIdFYc9ycToYegzVbiPjAInbbGQ4g8KndxQ2HVHd65Slkp/dJxbymy5d7JEUG9IOZT
 i/z/7
X-Gm-Gg: ASbGnctoN6ZtPttQBLUjH8MDFkkKWw2DaGCCIKghz4iUEo3V8w1gH5y5brHDJKbUki1
 +vzLDGQb+X09wajS5aQ9TliWFWpTHoA/Bv6Rqa3ayz93RbI+BwhMRNxrmBydnjNvjU/F66LAifU
 Mb535yJBYfxZUu9CT+edBenojJBdfuTfqApla22YQrTDzzl5lshLfxh+vTXdK10TfhMZX6FPwe3
 yte4iMy1kS5s4UQa1Nj0zFyEa9flC2TCeJGQEl35WbVpCGGpp6AD80GyXU+mBT5P64QqlFjS1w7
 T4cSIZIChWiPz9XkwoJaVCfBFOY1qu4gK5LYlyH2j7mlIReW2dSv1GXnxl9i1OehgcPGjdfOs3x
 aAmIKTY1yCTeXmCNnOIVlCQbomCslvhbIzZOAj0VAm7wDPoQ/rpS22AXuK2pAgjKXsyY/pTncJe
 tEQeHQfpfkUKiL3jaWxTe45/QfRVnsGkjQLzZlQSfCR9bFcWdiW3fuIYqNNv0=
X-Google-Smtp-Source: AGHT+IHTf2zUafNo4FmSX9izTtsJgaxnKt7IpwWhvF9cNY6LcIas5OSRp1uAJ+fskChOi6d+0RLFtQ==
X-Received: by 2002:a17:907:f1dd:b0:ae3:635c:53c1 with SMTP id
 a640c23a62f3a-ae9c9b96a77mr190793566b.54.1752645586928; 
 Tue, 15 Jul 2025 22:59:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e91dd3sm1116288266b.28.2025.07.15.22.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 22:59:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Wed, 16 Jul 2025 07:59:41 +0200
Message-ID: <20250716055941.1323148-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752645588; x=1753250388;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Zwybs6aFfmG6EdwQD+pDkl+v+nFupzy4kdJV3Km02A=;
 b=hh8vj7gC2zhgJSqxIXwiF/BxjdVFUP4ldeaai3hXvlEszv++dO3kE2kVxW44NAseqp
 fMfkHP3spg8v5JcoIejhjcrwL422/sfEVAdl61Nn2Pe9kjMd/aB9jrHfLEidv/hab85F
 t+lAZ7oqKUtFWIm2bcMm9vo2gvz1lYZ8N11lg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hh8vj7gC
Subject: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version 7.14.12
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
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v7.14.12

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 package/ufs-utils/ufs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index f67534cd1e8d..89053996ab3b 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  07d80ddd2dcfbe5e844515648c494fab33790be5450d150b88e3612da9b1895b  ufs-utils-7.14.11.tar.gz
+sha256  96cd578722830bc7d8a418d528a3067c0b80ad437f66c3333ebc238fe52436a2  ufs-utils-7.14.12.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
index cafc825fab55..1de7615a924e 100644
--- a/package/ufs-utils/ufs-utils.mk
+++ b/package/ufs-utils/ufs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFS_UTILS_VERSION = 7.14.11
+UFS_UTILS_VERSION = 7.14.12
 UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
 UFS_UTILS_LICENSE = GPL-2.0
 UFS_UTILS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
