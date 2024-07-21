Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8387EC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 11:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEFA4027D;
	Sun, 21 Jul 2024 11:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk6s54UCZ1lU; Sun, 21 Jul 2024 11:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C99614034F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C99614034F;
	Sun, 21 Jul 2024 11:51:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9F331BF2CC
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 11:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7BDF605FE
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 11:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-y5EBz3duFc for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 11:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8189F605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8189F605E3
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8189F605E3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 11:51:20 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a1fcb611baso2425320a12.1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 04:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721562678; x=1722167478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Vtj1V3/6OInyv3YQlQi9F0SdrFz58n4jJl1hjiDL/k=;
 b=SbTql7L5FZ6SczPkVLBgcvH8bCU5SbflCsF+ZeieWJ1zI5cv0A3vLuqU89nEjXfBJZ
 MqNRBRYBXjLgDaGD6WymQKACQb4lgYR+5r2nfxMZln3m3IOmA+aovIYcp+X2qiRGImUt
 7lt4SUY2VP5W2Rlz8Q5uRHBSb+Rg5t1o2V3oAbv/eAoB0TA6RHhEvhscG7ZGtNo/uj/Q
 QcPKX5nV5i9N2cjOVEqOI5RLLQ40nUFliohAMsC7vzlq2uBpDWVasHNOXK636NL3oiUc
 1z/3TNxrweJf3SdVNc9DTR/ru7f1ssJxUuORdwbCmFieX2IHs9SxPVBe0ERjKNkCw6pi
 az/g==
X-Gm-Message-State: AOJu0YzRP1Fjo2iV15K98NmWJGyuhp8AvArStDjpV1pWU0jfnKRuVxhT
 SYNrdhZYlC1ZEEAKsAITPpHbYZ77z+iJyZXn57xzQVFLTWUoGNUIS1u80g==
X-Google-Smtp-Source: AGHT+IGlXsCB05fzqYqhID+DhKeFbPmiSEQ7gkbxbIvNI0PkTRJzY4jAuQ+ksY+Ak5aCQ/LpQwoJ+w==
X-Received: by 2002:a17:907:d18:b0:a72:8c15:c73e with SMTP id
 a640c23a62f3a-a7a4c2a32famr217994066b.55.1721562677826; 
 Sun, 21 Jul 2024 04:51:17 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-265b-b2a3-bdc4-dd7f.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:265b:b2a3:bdc4:dd7f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8bf079sm283491066b.104.2024.07.21.04.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 04:51:17 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 13:51:12 +0200
Message-Id: <20240721115112.2041723-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721562678; x=1722167478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Vtj1V3/6OInyv3YQlQi9F0SdrFz58n4jJl1hjiDL/k=;
 b=TnhslX0kFvHIwJqitMt8jpnv3G5WdrMYW+JTDso0ODNmOn2O8fpERMGHpN5BZYtEzf
 B3dauhv8ocLIA3HBeopjO4Rc4YT22VRlErjdPSMn+g5h6tMHExuNAn7BZWjUfSrmKFXk
 Wjfg4VBBR5aee90fzIZw5CC3qyg1jVXh11C0uIJIkU6sdP5XIjFkSJV0+zmBSEi2eXx4
 T6aTXJOZFgmVo9AkHaTpkQfscLbcqJrN/+xagvwpliFRdbmA1CybYa5j8cYH6ZxGMPUI
 oPEWECYRVe+xVtEsGQsvC/qORiPPeQK6ExTqgYIlKp3mt8wn5UgdRIiaE1arLuJ5CLP9
 kVqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TnhslX0k
Subject: [Buildroot] [PATCH 1/1] package/mxt-app: bump to version 1.38
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/atmel-maxtouch/mxt-app/releases/tag/v1.38

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/mxt-app/mxt-app.hash | 2 +-
 package/mxt-app/mxt-app.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
index b7851cea37..2f5ea814d8 100644
--- a/package/mxt-app/mxt-app.hash
+++ b/package/mxt-app/mxt-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722  mxt-app-1.36.tar.gz
+sha256  38fdf7954d2184d122f6f1b1493fba1955c0e3c7dfd5196dbc3d536afc9c672a  mxt-app-1.38.tar.gz
 sha256  3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c  LICENSE
diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
index 3da1458978..4921803e4c 100644
--- a/package/mxt-app/mxt-app.mk
+++ b/package/mxt-app/mxt-app.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXT_APP_VERSION = 1.36
+MXT_APP_VERSION = 1.38
 MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
 MXT_APP_LICENSE = BSD-2-Clause
 MXT_APP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
