Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA2FC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 070EC80B7F;
	Tue, 23 Jul 2024 20:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dj0f4CPdsPI; Tue, 23 Jul 2024 20:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D7981378
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D7981378;
	Tue, 23 Jul 2024 20:24:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 687C81BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 555D140182
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAyV6Y8bY_yK for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4737040191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4737040191
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4737040191
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:24:40 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5d5846f7985so1136968eaf.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721766279; x=1722371079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cMwGptwJBrd8w4hH/8CXFkayVaYnf3rKu1fHcBJVr1c=;
 b=ZpFKyUcKI1fm6cvDmQnJBalzvl5sSX38ScxmVzE+KRZwuYaZoFO9s9HJlM9VJILPGL
 073vZ/So8DnFXoz7cgmLg5PEl387YXZ3Qu4Qw4tsA7B2KrLLrMeYtrzsMlbT/COc6yBq
 JbvgoE7chYRAvwuzBfnh4YYBpVxyPoPO+8cXKjktU+/YJjHQh0QeLOrHJ1kaqkf4/bJX
 kKkH5dwv0fEx5GfJGiLX4+zbU/oc50aV0WYAUYDDiaN8xaUWfnQkgcOuApXP3FHM6xDy
 H1Dg+rhFZW8nLD4VXqUBy+vsDgoSPmq1Iz+3HQweFTnsFWxrsMg4zCzjgf1WRrAMvt7F
 cx3A==
X-Gm-Message-State: AOJu0Yz2fRIsfV0J3R5ZgBHpX+TokXVz8Nj+8CQzqe1S7X98t7tWjtck
 4IxpU+7fLSP/PgL4K50kMA3v4IMJloJoFFmemQyeWw8P6vA2n06FoZLYHWyD
X-Google-Smtp-Source: AGHT+IFmrekQjKCo0Lea6jNfjvCeGZSDlBapdMolzl/6xiquqeeP2Z5/4OVD8QqDNlBYV0F3QgcrDA==
X-Received: by 2002:a05:6820:1f14:b0:5cc:b033:a55b with SMTP id
 006d021491bc7-5d5a00d9e55mr132843eaf.5.1721766279082; 
 Tue, 23 Jul 2024 13:24:39 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5d59ee648e7sm49552eaf.20.2024.07.23.13.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 13:24:38 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 14:24:23 -0600
Message-Id: <20240723202423.955779-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721766279; x=1722371079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cMwGptwJBrd8w4hH/8CXFkayVaYnf3rKu1fHcBJVr1c=;
 b=k24CdNMHtaN+gSNDEUtoYRztupKJRSRgsUOFsHPQRj8p6HnBskmRO9rrL5ysARz42B
 01U9djG8T820K/bozjUqFY1asb4Z3UJU+oGSjkZ9VrkD0ASD0h5wnPU6RfuPXGtQu86t
 dBRHp0Zj6LkX/7vCuS1pVXjCaYtBRoRWkHBycgFX/0qhI1xV0NKn8epwzbuCk5xDflcl
 aDyAKZ65KpXv2E1V8GQrhb+mFCmHg/5BLMMYGuLRv8NGSwC8rjp3T0Fb3nwGgXE8DGA3
 OpFS0N1AsOoFqYatXh3v/2Z/934Vpc+8SiHFuaiABZiX8V08Jmwvx7un0IIR5/4Sqc0n
 bJUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k24CdNMH
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2024.07.04
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, Bernd Kuhls <bernd@kuhls.net>,
 Lance Fredrickson <lancethepants@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lance Fredrickson <lancethepants@gmail.com>

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 71f92aaf91..ca11551579 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  26d4c2a727cc59239b84735aad856b7c7d0b04e30aa5c235c4f7f47f5f053491  wireless-regdb-2023.09.01.tar.xz
+sha256  9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb  wireless-regdb-2024.07.04.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 5c8ef96398..b1ec4cb97e 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2023.09.01
+WIRELESS_REGDB_VERSION = 2024.07.04
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
