Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702E7CCD199
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 16:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B95D84586;
	Mon, 20 Oct 2025 16:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9QivSGUWpEh; Mon, 20 Oct 2025 16:51:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5BD84592
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C5BD84592;
	Mon, 20 Oct 2025 16:51:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ED5D43F
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 056A961538
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwXYLqoWIwSh for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 16:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1817661531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1817661531
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1817661531
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:50:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so150173366b.1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 09:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760979058; x=1761583858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7Fpk+Lr0IQIFb5RX2U179W+uplSwEUpwgIF47CIeSM=;
 b=qypX+bafo4Zw/mzNi092Q5lIeLp2ISkTmXTeWYd2utSOgr4C+BsSluo597PljET/o/
 /wesQvvJY1qf+zFTveN06xWDriH40zI+PyUMzn2XfafBIz4E7ruU2DCdyj+YJX6GbpxI
 rJBN68AvRZiFYrUMLPzuB/usr6AoK7CVEUnTq1zcX4AD7ZGHGksUaxVv3tU1RkijxWaY
 yVF7AVehLBICH6LFAbu1fIuvfyK1EPdTqvsC+9m4yv4H+4z3D1ghlACL6MltSfHbLnJc
 6pQexohQcXGl9nvOSZzbMjNm7L8sZ6Qm+1VVKEdeS+HsqjaCSZH8ZdVVbZ0/NMKtIcgL
 YQjQ==
X-Gm-Message-State: AOJu0Yzf+tAQf5Brw+ExbyFrbL90qWxFjNWWUjVB5RZmot6yccW3Itq+
 YrJYl+2ybYWsRVN46vz3r7Hw+0SkpMKfszTrJzCu5Y0J56xMtgfFDCm59mbaJVCuhTrUlFC8Gpt
 jAiGK
X-Gm-Gg: ASbGncvMQYRau59lRY7lTgWGi/w95Qns7QvHBuCHg6auduNvLAR1mOYiIICRH9/ncDh
 RQwYUa4wTn7GXUVqZ/O7yMu0Ox5eq2H4cMp1mZGQnSJJpO/cI2Ehtl5hSahVsFiBf7Q97eth9X6
 fr0xL09fVVNJwc+Ls+C8CQvBvavDOQAGXPrZWS42nIMY+s5JAVPvJEzXw6oEktUsNpEjpDw5yzn
 FPEOa91KQPTUo5wNm6Y+TIsyjnTRe++zh4PJMKrszAzWYUeToFvwwK14arIKTHiZFxT6JBJvX4i
 Z2mBs0xOC3FwsoVwUDDtiCoXN/f9cZWe3K2HOdV972ZAKR/vtQoFlai/qeza2BDhP5giCM+2I0f
 NBsHHFzTX8VdARHUeJ8hK1uLV/ofcttlJtwSK8JWuR+WhzY1ssnKLi1JATMgb3/3EfGoSNDws/D
 nOBrOae99ni3TBEXImcvfI3eIAIwnrFubm5Qg3gs8=
X-Google-Smtp-Source: AGHT+IHcJ+Bdi/DSYFntg5kEIwaYmwSRmrYdIBDox3PvZ6TFDY9i7EJtOxgX/2OAUl6ibz/oZH9o0w==
X-Received: by 2002:a17:907:c086:b0:b5f:c3df:dedc with SMTP id
 a640c23a62f3a-b6051dc3619mr2055338866b.2.1760979058000; 
 Mon, 20 Oct 2025 09:50:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.40.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebe4a5ecsm838391366b.81.2025.10.20.09.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 09:50:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 20 Oct 2025 18:50:50 +0200
Message-ID: <20251020165050.1712817-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760979058; x=1761583858;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n7Fpk+Lr0IQIFb5RX2U179W+uplSwEUpwgIF47CIeSM=;
 b=eGeXv9t22sr5C2l7CAi2Bbz0qzWlXhNm2NgVruOaLPUpHZfY5dm0Z77w1YtMXLFMSe
 IU1o67WH3PWgRMSp6t0W++BilXUVMs+pcVYsAzew3UFmWHS7M2XXDm3RBLco0Yre6Iws
 I0KZFvT3DFehJ3rStW1i04ctOSe+S9TGs9Bns=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eGeXv9t2
Subject: [Buildroot] [PATCH 1/1] package/libbsd: bump version to 0.12.2
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
https://archive.hadrons.org/software/libbsd/libbsd-0.11.8.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.12.0.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.12.1.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.12.2.announce

Update hash of license file, which has changed due to:
- Copyright year updates.
- Switch arc4random(3bsd) man page from OpenBSD to NetBSD. This gets
  rid of the last BSD-4-clause licensed file in the project.
- Remove written-by attribution.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libbsd/libbsd.hash | 6 +++---
 package/libbsd/libbsd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 8b1af4475838..7d3ada6e6ad4 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,5 +1,5 @@
 # From https://archive.hadrons.org/software/libbsd/libbsd-0.11.7.announce
-sha256  9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261  libbsd-0.11.7.tar.xz
-sha512  51fda4724f41dd8a4628afd58c21236a7588d9045e337e06eeabf83805a9aaaa53705441ca901ad11f1c65f18e881523bdc97721a7d3d6a5cced27f2450d09a2  libbsd-0.11.7.tar.xz
+sha256  b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a14731014  libbsd-0.12.2.tar.xz
+sha512  ce43e4f0486d5f00d4a8119ee863eaaa2f968cae4aa3d622976bb31ad601dfc565afacef7ebade5eba33fff1c329b5296c6387c008d1e1805d878431038f8b21  libbsd-0.12.2.tar.xz
 # Locally computed
-sha256  7aab3a07716d31ca72e66c1073ef8a0fa0be0daa5df7c3b2cc0c668589142336  COPYING
+sha256  978426553ab7b9cfb4503d98e578a77b8c3142c099100aa9791fd21be5a95f97  COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 27937c46116e..497212d2fff8 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.11.7
+LIBBSD_VERSION = 0.12.2
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
