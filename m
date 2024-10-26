Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2DBD10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9235740BC3;
	Sat, 26 Oct 2024 05:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEaZq6lbJRfj; Sat, 26 Oct 2024 05:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58EEF40BD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58EEF40BD3;
	Sat, 26 Oct 2024 05:15:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A42765C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84A89606C8
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWkyTzoVSgtu for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B13FC60631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B13FC60631
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B13FC60631
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:15:19 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7d916b6a73aso1627441a12.1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729919719; x=1730524519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h1GjcVV9Nw/4t7TTSNgS8d0JAySCQXpdAvGBMsW/8ms=;
 b=cA911iRBgBM0e5Sj1IqAbmxpdNkKUSrVKWL+oP9dPRGjUWmb/7amLVMCfAI0Yxhmen
 HvULc3ZuGDG6kgp2ERvn7AijVfeTmdsUoarwvPuDwQCn3B+pNoPZgFl4QbPhYrJF+O11
 M1HZ/cLm7PO2iN1b6zk4JnGCPDSp3VF9W8jrSI2OCSkfx1BLichZ4lG1aO08jDbPhVJ6
 tslw2sxKyoIobvwxLoZscAPSVGA18FY0eUqdhSuhirLGHJazb/sJMODInNmryzTsEtgk
 2S5L2YhPytOjyUOnHIN7h4ktRWaB7yYkwME+QEkorwbn7GmyKOVVN5s5k2V1FQoOPILT
 H7zg==
X-Gm-Message-State: AOJu0Yw/tze8jU1cmdb6cBpHFBW4AkBCPre5jsl9GHg8Nht2W7w7oMNj
 XuSuJ4jFuIArO0L9kYfIPbkY5HngXUejqLQdWmTHNsOIpmHGClasRu6/6N8a3ZYvFnXYoBxgf2M
 Ue3Q=
X-Google-Smtp-Source: AGHT+IEtLxBOTFKmfyfFLrpQG+PF6VPsP8ktAdmIZdCu5dTB578wsxls4wS4WDTF/AjqoVEkbyeUwQ==
X-Received: by 2002:a05:6a21:58d:b0:1d6:e6b1:120f with SMTP id
 adf61e73a8af0-1d9a83d0b04mr2286984637.11.1729919718864; 
 Fri, 25 Oct 2024 22:15:18 -0700 (PDT)
Received: from localhost.localdomain ([192.145.118.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a3d012sm2001554b3a.206.2024.10.25.22.15.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Oct 2024 22:15:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 22:14:58 -0700
Message-ID: <20241026051458.53837-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729919719; x=1730524519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h1GjcVV9Nw/4t7TTSNgS8d0JAySCQXpdAvGBMsW/8ms=;
 b=XLwKlsG6OyRIbcaAr/uQgUGztwIJRiDF9pNHy72fowHHvjat8FRXV+tO2VP9m/oiWb
 4hZ/HZs7MibTX2eo8fe8sxYeMLJQ5oYvujQYzXdHBRdUKAMAo0mIVPJjq84CxwtxsWfL
 4uebQGMhczAbI0eHfn93y6oYUkmDETGehWLHVCZB3NopXmW78RwVVQcP9aUW9SpzadPi
 ASg7bu3AYNgLDYruXdBIGN1+Ev2t1KrysMyC3wxEg+IeXaOAEOCwJudEiFNpmqmkeKKG
 U86XtQlENFEkvN57Ep571yfAEzxAUOzTuCz/KohgLnPchEM6de3GINdbl00G34gD441G
 +OIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=XLwKlsG6
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.23
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Latest minor release.

https://github.com/containerd/containerd/releases/tag/v1.7.23

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 02c19945b0..e3f8434192 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  c4268561e514a2e8322bc8cdd39113d5e164fb31c2cef76f479d683395ea9bd6  containerd-1.7.20-go2.tar.gz
+sha256  393bfde8ca1766a0bca3441e18eddc3f5a5c8d97ef676bde0d6c9903e1b0ec0c  containerd-1.7.23-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index afd03d7d3f..88b53caf51 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.20
+CONTAINERD_VERSION = 1.7.23
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
