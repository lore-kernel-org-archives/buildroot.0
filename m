Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0298BC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 19:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE82D8407F;
	Sat, 18 Jan 2025 19:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FW7ehXlhSEqU; Sat, 18 Jan 2025 19:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11D8846D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11D8846D1;
	Sat, 18 Jan 2025 19:21:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 046D52F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2D626074A
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwOXk9-Rnzyy for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 19:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E7706078B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E7706078B
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E7706078B
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 19:21:34 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ee8e8e29f6so4381392a91.0
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737228094; x=1737832894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NAvBq+EWH+AD9nBZR8iuCY/S11/hHyse8b3inR1nWAA=;
 b=jciwGmZPRT7w9xdSZiiF63xFJeIp3DDKWYmxMoYt+ODO5bwHAtjkU4AP9+mpF5UwX9
 b0cp6cfwsQmN57JgYjq+GvIdqlybB7J3ZlpVemHfY8ks5Nd79TP/1oCUP7LaIuLBPv/5
 JkZYoQT52nuZVXi1IkrXnZZjZeN7umGR5bEXtpG0ex64GTnYmWsS+LGOURVLT/7gOosi
 JS+OLIZ38MrvMLaHvfW/rgNhYT78/qd4tICRcxEoIDIt1/CqKsjCaURtXAExFxlIchv7
 0yb0lBfaYfsM4Xy26oUciJTIayhiY64fh7dCXsetoUbyIYh8oSmYnOr1uFjan4JdIAsV
 sK6g==
X-Gm-Message-State: AOJu0YzdayVfDpQ8qavDSnr03MH1O/taEjpi3yak6ZnYIB0hjNKYsJNs
 PGFOV4cGYKI4mRMPSYCk3gwcJiX/rvTu2aUS+GR6QiyNOv16QSA/7BvdueOw
X-Gm-Gg: ASbGnctdSGel28jvpCHvgg4FLKg+uah74buEAd9lywI/+GGuiRndWUV2rYQAfL0lDbt
 kLP9E1qE/ayxse6ClV5LPWdz1EK4ACbkMuyi3iKJp1Ch1mjaQ3iZOxIqNmPxu0K1cNcW4jBqZda
 mgGu7+KKgEEWZG87UNMIxUQnQ9XTdE3oDYEcnOutcD2Kpea34XP2iM5DGP9yZucuxsK331AD59b
 T6PUfur6eKTTV0e0Fwipmawr8xjLbHz1tFN7YL0BJBHC6+JCptKv4u44aEemsB1hGQCBnx0cww1
 YyY/qBSL1uIbzlgBa84v9Z261vpMug7gad0GDsh5l+lUkmQ5W3pPLA==
X-Google-Smtp-Source: AGHT+IHMXfVNxuQPC3TX1IW1r5UWbSCIsbZZ8c8soQs/oHo/VxUqthRDVvrrOPVOWhG6Az+XNTRDuQ==
X-Received: by 2002:a17:90b:540b:b0:2ee:ba0c:1726 with SMTP id
 98e67ed59e1d1-2f782d9a1c9mr9253780a91.34.1737228093654; 
 Sat, 18 Jan 2025 11:21:33 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f77614c15bsm4513852a91.16.2025.01.18.11.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 11:21:33 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 18 Jan 2025 11:21:30 -0800
Message-Id: <20250118192130.904096-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737228094; x=1737832894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NAvBq+EWH+AD9nBZR8iuCY/S11/hHyse8b3inR1nWAA=;
 b=W2VM/RkWmd/d+D1u53a1WLNZkYZ1kg6fwfbQZIubevtRPyb4JiuA/4JMzoBrLldRXC
 /xVGO+xuUyqUrj2lXYGnN2iDfj3lJi2jC2XamjMO2Ln+xre/5eCVr2MSVidc0G7MJBsp
 xGeH7prHYFBAtOeUcO2n3wnpjJeUifYV6XY8+6Ahrbyz97DS7R96TqPCdbnsXd/eFEtE
 Zrx3jdnatzG2BCY6bRwVSYrSqqlOq1K4UolZYDHxxqRXacL25OjVWdrvPdVy4H8Nn5zR
 ME2LYCVZMKas2GbXQQG6KTs437a11a0xr51ra7YCt39WfVOjkdbr0oUrLfaN864OBBEq
 HGIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W2VM/RkW
Subject: [Buildroot] [PATCH 1/1] package/lsof: bump to version 4.99.4
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
https://github.com/lsof-org/lsof/releases/tag/4.99.4

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 90d8aede92..e8e2aac1cd 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b9c56468b927d9691ab168c0b1e9f8f1f835694a35ff898c549d383bd8d09bd4  lsof-4.99.3.tar.gz
+sha256  90d02ae35cd14341bfb04ce80e0030767476b0fc414a0acb115d49e79b13d56c  lsof-4.99.4.tar.gz
 sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index cb4e987bd5..fb2309ae7b 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.99.3
+LSOF_VERSION = 4.99.4
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 LSOF_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
