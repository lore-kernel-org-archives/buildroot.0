Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D657CA0FFA
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DE5418A1;
	Tue,  5 Sep 2023 18:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DE5418A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTm-51BKuhkZ; Tue,  5 Sep 2023 18:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 797CB418D2;
	Tue,  5 Sep 2023 18:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 797CB418D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4FE21BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4E960BEC
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB4E960BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDclKssAa_zL for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:29 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA8E160BDD
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA8E160BDD
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso17913855ad.1
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937189; x=1694541989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ydkTNrwBsm9ve9CWhkAWsqJ2vdUpifP19l7GiTC6jL4=;
 b=d36U0uY+F6LgAooKdSRKhl2NVGkDPs7otC4J1or+1sVCvZktH9qeyn+0L7lwYPWaaH
 lkiY8O2CQ9T30Ga+Vq432KbR2jvN7YqHnR0x3zMWpbyEoTnaNqQe7z6EgoEkoxJ8n+Vd
 j5jYV2X3KND8vMe9mx+bgRy6V9TFgjNUgyGXYhPOKbzb+aS4X6pIFaLiebqacsvi2qRV
 qnWoIcTww0P0DlXtB54La+2iIGtUGkTYgn6DhMh2egfgIOD4MUF8Kustfk+PX8T9rVxB
 e7c8mgx7hxxvgE8zJXozAI9KGjdKEzAXVkOzi1S5gru7S0Sl16KYnARV9EsZLpubM2fJ
 GHPg==
X-Gm-Message-State: AOJu0YxE4usZyypClQCy/UV03zI3OBEQo76Is+qdYR9ps+ZUp15fhc99
 KXwFL+JmwCH37QJSotWZU2ppV1wWckk=
X-Google-Smtp-Source: AGHT+IFR4Lf4S+8RI3nSBczuQauZUpXwk3PmvTz+tT6MhymcFf948LmT/pmT6jBSnQws7jZywR18tg==
X-Received: by 2002:a17:902:d48e:b0:1bd:ccee:8f26 with SMTP id
 c14-20020a170902d48e00b001bdccee8f26mr13327068plg.15.1693937188802; 
 Tue, 05 Sep 2023 11:06:28 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:27 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:08 -0600
Message-Id: <20230905180610.1610778-8-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937189; x=1694541989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydkTNrwBsm9ve9CWhkAWsqJ2vdUpifP19l7GiTC6jL4=;
 b=jjhx8cYERs0REaVC8Wl8NH+nfOgvzjeXdiNDa8L08J8HDUFS+9aWacw1WXgP25HwOV
 D4GvracSsbnhB03GcxHV2qxPK81sd6WVA8W86yTlP+I3YzMxe6xwAnd/xqXG/g7LbAi2
 1pCAHSfI4I/PCJL9xZFSh881zJRPA/Tpqfv2Yl+vPiGyL/YM7QNljpSNvjJy8C24quXY
 srMeouRXnmgKhdrB34ADC7OBwlvzo1f3oocxv5DqqDXdFdZlJ5EqC+904izDEpws+Qm7
 hjSdyqSLkbn9eMqMUimNsMBIYl5+3HH61n9esL/bMmZFqXwYH8RR/2LPfSzC5yPs8dQB
 FdOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jjhx8cYE
Subject: [Buildroot] [PATCH 08/10] package/php-ssh2: bump version to 1.4
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 package/php-ssh2/php-ssh2.hash | 2 +-
 package/php-ssh2/php-ssh2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
index 3fbb0b24c8..69e0b92071 100644
--- a/package/php-ssh2/php-ssh2.hash
+++ b/package/php-ssh2/php-ssh2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9093a1f8d24dc65836027b0e239c50de8d5eaebf8396bc3331fdd38c5d69afd9  ssh2-1.3.1.tgz
+sha256  988b52e0315bb5ed725050cb02de89b541034b7be6b94623dcb2baa33f811d87  ssh2-1.4.tgz
 sha256  ac7c56f1e416ce6e60abcf26269395128bc9e5a2e4f3293e5dcc124aac606508  LICENSE
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
index b79ac04179..e7955a2c07 100644
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_SSH2_VERSION = 1.3.1
+PHP_SSH2_VERSION = 1.4
 PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
 PHP_SSH2_SITE = https://pecl.php.net/get
 PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
