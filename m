Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAC8C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0E060FCD;
	Thu, 15 Feb 2024 14:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQKruaBinQzf; Thu, 15 Feb 2024 14:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5101460F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5101460F9B;
	Thu, 15 Feb 2024 14:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 002271BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1F2781826
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egllnvtoF2T5 for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC7DE817B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC7DE817B1
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC7DE817B1
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:35 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-607e54b6cf5so2021077b3.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007074; x=1708611874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wEwzdL9lN5BKjeete4TD2hIVdbXb7ojhwXVem0aKkCA=;
 b=wtrhZ7FhP7V5tQPsAbG6cSYM74GakaCKQgQ8g4psB6AAeS3CeeXSVzx19Rmeu0mZbm
 EjPi3FnsrfHhILdRzfLeWaKUgfOD4RhoyxbWIktcoBTuSKH4CMGAP5e8ORijzJ4IDKx9
 mJ7NoSiBygF9QlQwZB4N3d8xH3u4rnBCOeL2GovYXXiTgqpSFqSdhIOMlsVKujyvJgnM
 FHWBdNNHGLCJjiY1df3fNBgzhrZS4awGrALpCzZYRekIqpREMeyqb1WhxJzio6hZaTUx
 ijdmJ+K4s73ra9pgaY4v15EKRlKWwIjrFZWWNIu3+yj6Z+EeWyAPoktwpo7p7YVR0Qa8
 92/Q==
X-Gm-Message-State: AOJu0YziSSui+ZiA2D4cvqPJK3EucFXJMhMRgWA9dlMZQWSpaZPmqysA
 oeSJSd6OmokvAemJm6Gs1hZ+8Fc31ATTtBZYTgnLvaDtWTBPEBSs+O1OOF14IlQ=
X-Google-Smtp-Source: AGHT+IE9JNT4ISr6XMgYy6Z2XKD+TbJwsfmPBEGY0U18mAypVA0hZ1EvMPxqJDHXp6j1jN9YRi1Zeg==
X-Received: by 2002:a0d:ea43:0:b0:604:9729:6b4d with SMTP id
 t64-20020a0dea43000000b0060497296b4dmr1309931ywe.4.1708007074372; 
 Thu, 15 Feb 2024 06:24:34 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:33 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:09 -0400
Message-Id: <20240215142413.451505-4-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007074; x=1708611874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wEwzdL9lN5BKjeete4TD2hIVdbXb7ojhwXVem0aKkCA=;
 b=BZU2MZGfVA9dksCfItlls1K560IFReUXz9+sa792Mb/cCoHyGRWOjyg2XpFkOXsBg5
 sm9gbmZ461g9UuYgEeydgcLPdjxAHbQj0HGc9ELAE7LFyoziGidapNiv/LkyTwRZG0It
 nmEgi5+RVHZJh1n1CEiRCMBVDrORMi7ckvCJLdg7i1zNzWY6bY2k1yNSGroph/xW0t3k
 m9VUktqqvLjHOxkga7u5JzsbkmB6em7kW+As4ADA7gmNpbFp5GdlVu2pBlhkPf4n+/gO
 d8a1Uj5QE56hwmObQZBqvmG10cm2pRLgMLo8b/kxMcFBKIuLb+faDVkOVj5xMyMfU2Bw
 ujUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BZU2MZGf
Subject: [Buildroot] [PATCH] package/libolm: bump to version 3.2.16
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
https://gitlab.matrix.org/matrix-org/olm/-/blob/master/CHANGELOG.rst

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libolm/libolm.hash | 2 +-
 package/libolm/libolm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
index 044bb24f06..a95115d2fe 100644
--- a/package/libolm/libolm.hash
+++ b/package/libolm/libolm.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  614c0e4dc4721f57e56c3385bd8def2f71c6631f928a480efd0b4bd8e5435df9  olm-3.2.9.tar.gz
+sha256  1e90f9891009965fd064be747616da46b232086fe270b77605ec9bda34272a68  olm-3.2.16.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 6f06686555..5c8bcd1f59 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOLM_VERSION = 3.2.9
+LIBOLM_VERSION = 3.2.16
 LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
