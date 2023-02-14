Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C6C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 09:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08B961098;
	Tue, 14 Feb 2023 09:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08B961098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivxowarOJekv; Tue, 14 Feb 2023 09:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AF8A60D64;
	Tue, 14 Feb 2023 09:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AF8A60D64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 250011BF2EA
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 09:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F303181BCB
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 09:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F303181BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ua7Wnw9_HzeG for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 09:11:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86EF181B6D
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86EF181B6D
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 09:11:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hx15so38343878ejc.11
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 01:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l0F7PwLQQYRlCC9UrwP0RJDo266GGBuv6S/Q0vdiUKU=;
 b=1HjUoJqzujoXFC3WeYm8HG1Pde2r1FMCsncBQjnoasr71wJ5dzj0q6/BgrMASBXZgF
 0J0d9GUCWhqJ2LMLRUPljvqRzYhvgK/GqzOhDo2wpzG4bT2mDwL2+fMCL4QJlwFvko6M
 s58fqTFDm/u7uhznH+JnZIQ2InojragTQNPKk6rLqm7Msokq4FuD2/HUGyLSoMVBm0Iy
 XZWG4b1bVUa6RKXPxjH2sZ3ISQUS/T8T69J9pA6f9rruKO2AyM3FFl79YURlMsL2OK1+
 O0q2n+oUUOLTfTIvmwUBTgSOXvYTTIpk0VD2ICFtsg7+60e/cOI224YZcV1DaWWosBcI
 MilQ==
X-Gm-Message-State: AO0yUKX/mh9ZURejWte7vETN5KIwR7gyKTvE15XuFCRBLWsgkOsB6uH8
 pKP+eRzC/5D9+p5WbdrTP68KjlVX2jJU/A==
X-Google-Smtp-Source: AK7set9YKrIqfLMmnnarrfP4HT64EiDUQ1KDiRkW1lW4HUoI+UtPjg0WvmzuyP1VdJX9e7yWLTI3fQ==
X-Received: by 2002:a17:907:11c6:b0:7bd:43e9:d3ab with SMTP id
 va6-20020a17090711c600b007bd43e9d3abmr2345898ejb.52.1676365914071; 
 Tue, 14 Feb 2023 01:11:54 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 kg12-20020a17090776ec00b008710789d85fsm7927383ejc.156.2023.02.14.01.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:11:53 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 10:11:42 +0100
Message-Id: <20230214091141.12503-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l0F7PwLQQYRlCC9UrwP0RJDo266GGBuv6S/Q0vdiUKU=;
 b=VQyUYSUM0EwS1JdhTwm+3vZ/EEEk1lsodQ6QHziUW6DiUSm4g60fI6HL0P9xBbgojs
 105iq92/mjKGvq4WmvqlYOzbMhbJs+WMuj3/3CuY0Rhl04kz5CpFm/FCxZPIOVj69Lx6
 5CVZXzUZ3mg3mqeQO87QxMNAUJwWj1EkpgUfzsfQmakArHLraeiNkQx2Q/t2zcuY2j7j
 MAQzQA3epBn0AX47TRoStbnFPeOPe4lVtLYl+0eYDnkvUSBjsSVITXUXmtxXk4wxWW14
 eB9SauAv5gxVsruurV4OKwI2kw5vFek+QX4s1DlkQHFZ7uwCqhiDLYCDft6bch11gM6X
 Y/7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VQyUYSUM
Subject: [Buildroot] [PATCH] package/wireless-regdb: bump version to
 2023.02.13
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
Cc: Dimitrios Siganos <dimitris@siganos.org>,
 Heiko Thiery <heiko.thiery@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 91fcb320d2..36451f839d 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f  wireless-regdb-2022.02.18.tar.xz
+sha256  fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73  wireless-regdb-2023.02.13.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 35a8c6686d..68fbe35b8b 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2022.02.18
+WIRELESS_REGDB_VERSION = 2023.02.13
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
