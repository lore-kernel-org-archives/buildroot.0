Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1FBCD1284
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 06:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BEDA400AB;
	Sun, 31 Mar 2024 06:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7gRtVQ_NJSu; Sun, 31 Mar 2024 06:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4095B40166
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4095B40166;
	Sun, 31 Mar 2024 06:59:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B017C1BF2B7
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 06:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA966607D8
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 06:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfFjIMwY1BkA for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 06:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3BF96069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BF96069B
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3BF96069B
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 06:59:36 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1dde26f7e1dso25368905ad.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 23:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711868375; x=1712473175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OktQn2nzQiKEbq6TZ8je+wXEjGGO9oW2gf4CsGObjyQ=;
 b=htXrh6tx2hZXRzyn9IEraYuxpqb98Vu56MfKmIeOboksVgUTu+IRRER1w6SUfApM8F
 fnvvBKIPJyYAfbK4QGaBAg/ZS+LR2S+bvGtFxSmHYNgAb+xPMDNWMP7vtwv0geCz7grj
 d3WIMBYLtllkkV5bnRu9BWrmRbPXW+04+Gw+5Eo1GLtEZ+/+FqVt8SJ6YHHafBtVvqa+
 0rzO9LZtFDNoln/PqZCltACLFipovu1289bTNPY2Hlr/a4ORNn3gco/6ecNioR/wLPLT
 lYdL+g6lHMWhxSwXtJH4ocU7lG/8IGfUrBVqtpp59OoD+JnweUwqqNRHRYWFOouBGk/Q
 mx3Q==
X-Gm-Message-State: AOJu0YxFHWRhIfCNHsmrZYHbHX7z/vHbEg3m7gwReFABjFLNXoa4tHtL
 A27zt1gHbLVzZQmXRZXo/G23CrScoHKtVEFZ28ZPtmvuCxUaSzudbwb+j+wGttvtMy7XMpgkOez
 a
X-Google-Smtp-Source: AGHT+IHQy26ExspOSA+0Pky5FHmpK6LdG7vsHuUI6eh1kfQdFnnNorueeKTYik+KrKVC/BP/ar41bw==
X-Received: by 2002:a17:902:d482:b0:1e0:1f1d:bd3c with SMTP id
 c2-20020a170902d48200b001e01f1dbd3cmr6974776plg.46.1711868375380; 
 Sat, 30 Mar 2024 23:59:35 -0700 (PDT)
Received: from localhost.localdomain ([185.169.0.251])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a170902e84200b001e2057469d7sm6307640plg.9.2024.03.30.23.59.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 30 Mar 2024 23:59:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 23:59:31 -0700
Message-ID: <20240331065931.12195-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1711868375; x=1712473175; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OktQn2nzQiKEbq6TZ8je+wXEjGGO9oW2gf4CsGObjyQ=;
 b=ih7C90/UI8xpPfdOEp5YXlLztbHPk1LJA4Yhr8Tt+MGaQpgNyYg9nhd0otPh4yJA64
 phvuAEfxw/GYGTRnraXePRZL1oFmFvSiXTGrEXc4BWgE9NU+UXYFwE0v8OuTueTXYqQp
 gFF1vAoaGMyt459qdypIpFUpc+woponW/bPocvC17rlgwrP2cD3eFiyvK1yEavCoVerx
 2GVuN5exxvj63/N3ObUfn5RW6qYeZ1hkC19NaQCsk0UV2tVLZx5m+c8juwREgZxmJOMZ
 MXxFgrFeV6XDyNAOWLc39weWGMGrNTy3u55NbfoJBOMCBdJ9f7GAK6c8Fvy3647L9tEV
 gXwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ih7C90/U
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.14
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updates containerd to v1.7.14.

Highlights

    Fix various timing issues with docker pusher
    Register imagePullThroughput and count with MiB
    Move high volume event logs to Trace level

Container Runtime Interface (CRI)

    Handle pod transition states gracefully while listing pod stats

Runtime

    Update runc-shim to process exec exits before init

https://github.com/containerd/containerd/releases/tag/1.7.14

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 25dc7ff55d..193003e5a3 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ae2b914bff0ddbb9b29d5fc689a51e1ce89ea4edfc4df9ae10517c6f5d2d5aaf  containerd-1.7.13.tar.gz
+sha256  ae55b25fb04b45dfbbde8280b034783a48ae7c40350d17fd272be5cbf0284cf1  containerd-1.7.14.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 9bf51c93ae..81875f763c 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.13
+CONTAINERD_VERSION = 1.7.14
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
