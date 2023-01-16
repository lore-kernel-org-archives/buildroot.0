Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F1CC46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 07:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 121A481379;
	Mon, 16 Jan 2023 07:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 121A481379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwVF1_lfBDrp; Mon, 16 Jan 2023 07:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE0781349;
	Mon, 16 Jan 2023 07:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE0781349
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DADD1BF30A
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 07:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC11060743
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 07:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC11060743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pa7q5i2zh2da for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 07:08:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42A66061B
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C42A66061B
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 07:08:54 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id f20so29050604lja.4
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 23:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPiJ2DbE4fOsz0ffcJgYIFSEe5OMIlGXu9Jcd+6UCqE=;
 b=7v8b2JlR08qoiXbaLIUr2pCOUB25b5r766KIoFnKROQKpoEgsgQKL7gmHiZMWbLh7n
 hBbifxy8XM5DFi312tG6bCqOF41i0rzdp4Lwq5E+ax1QwyFgmiRlQ3U6nOXq5GVewG+Y
 ETO4/XO38SX8pNwNDwvroxTcONAYDmQ0JqS8JQPWeSqDGiYw/bZ23c6HvuLl8EtHzaeS
 Iq4VYyfphi8dPDo8wptbwtceeiVdg0ilRSESnYDRqXVJLjl38wo24h5sPFpvG8uLdZUB
 7DdG68TfBUZFoe93KRsByGNh+G5jEUdfiwwW6JqP7QbE/a8/AFDd3Pl64LUI3gx/jKUD
 h+7g==
X-Gm-Message-State: AFqh2krJGH8+ea+pOi5D5Q8pCgOUvBwBDsFSChuq/4ig1DuE/SGkC9dy
 FBFC6srHXeZsRD6tofSIO3l3L0hX85Y=
X-Google-Smtp-Source: AMrXdXvjj3fZE0SfKs+SwHYcPmBQpk9e9W8WxhC56SknALSM9EAALfNor4QCIOl48jNwhURdIZLHyQ==
X-Received: by 2002:a2e:9c09:0:b0:27f:db12:cb6 with SMTP id
 s9-20020a2e9c09000000b0027fdb120cb6mr16884208lji.9.1673852932228; 
 Sun, 15 Jan 2023 23:08:52 -0800 (PST)
Received: from luthien.lan ([98.128.186.92]) by smtp.gmail.com with ESMTPSA id
 p8-20020a2eb988000000b0028b926fbb59sm61678ljp.92.2023.01.15.23.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:08:51 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 08:08:38 +0100
Message-Id: <20230116070838.4011964-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NPiJ2DbE4fOsz0ffcJgYIFSEe5OMIlGXu9Jcd+6UCqE=;
 b=O7zFcm/TkXlc+IA8RBPRcKDb4U4l1RNuCfc9HbiKhGac8KuW98yvW5FAzbJgCmfSlN
 eexPF8exILZRF4gG1Vmlf7UFDrDZAuf2SgK2k3QIdCtN3W09t+eAWdT3I1bSZg0allA9
 JAvZOMWJVKoV0s5wVckSl0A5xjArI/sV+/X8UMv//lx8Mg6T/cIV2km3QTahudQgamTE
 5nxx/RP13GY7qJnaPF0h/JtfCThntSnQx5wfZHgXtjnJjwFcf8lk1f1uim+z/sfbzXCL
 ZXi1c8IGRmSFS9npzxYxJ4E93hMOHTzGK2rDmpMHCrK3cikHCQ/uSNS/EihaDmPC+tvb
 id3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O7zFcm/T
Subject: [Buildroot] [PATCH 1/1] package/frr: bump to version 8.4.2
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Vadim Kochan <vadim4j@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes since 8.3.1:

 - https://frrouting.org/release/8.4
 - https://frrouting.org/release/8.4.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 87ade19c16..836f130b93 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b0430d01f8da2d780ac5e41de2cf4e53abff0ed06a0cc75d745f4b1f29e5b9e  frr-8.3.1.tar.gz
+sha256  8a6b0e0fa1e89493ba84cf176674e55c7a814821fd02a7188095b76c37c3935f  frr-8.4.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 72c46ba4aa..abae784c40 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.3.1
+FRR_VERSION = 8.4.2
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
