Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42049C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBEF440AAE;
	Sun,  5 Nov 2023 20:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBEF440AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrAvy-UBOZUt; Sun,  5 Nov 2023 20:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9F9C40A71;
	Sun,  5 Nov 2023 20:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9F9C40A71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F22DF1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 071E2418A6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 071E2418A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VccswzhdPQTx for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:31 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 324A5418A8
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 324A5418A8
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1cc0e78ec92so23585865ad.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215990; x=1699820790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iE8gUsMknHVjMEWhvW42GvPFDGBMvIR4o9Yl9T5jvKQ=;
 b=j6zhxrQe16WLy2MUSRUz0T/gGIk/gqOHqcLQ6Wu2C76pBMy1GCtNb9zWRKifvv2LO0
 uPztt43BLZ91AvfvdepBfSbDvuhpewO2Wzgskj62Z18FM2L+y9EWegd6zmpVdlcgrE0K
 tjOMYf8EQqqjYNT/adh3iyqZj8rPird7A5V3iJkIWT2WX1GLL1x5laHuaoSk1GnmGnUQ
 WHr1G7Ah0MFuwG02JfLvfeUBEkhKcWmo4k9oBNN67Ryql/xFuaZEcvbwDu0EEsAbzslH
 w93jXChsKbfsSruzHw5qB+vrEvQzDvVMW1es3fGtr491av5I1Oqnh/nR4QPfmulbNUAb
 iG8g==
X-Gm-Message-State: AOJu0YyGNZWRGfN/OyvfFzw21SlwlbbGfX6+lqh6fvIgc+OVe8Sk/BV7
 LCeFnyET/N4VarzItKifoMSWyw0NCMZkSzHrv/uC1d5Q05M=
X-Google-Smtp-Source: AGHT+IFZINz3j/Ej7M2KUNfgsPtemCSvM1oB1qD5FVFZYDci1aJd0XqkRwBYjdDYc1QEFrXkyXpi3w==
X-Received: by 2002:a17:903:2310:b0:1c1:e7b2:27ad with SMTP id
 d16-20020a170903231000b001c1e7b227admr26515837plh.60.1699215989849; 
 Sun, 05 Nov 2023 12:26:29 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:52 -0700
Message-ID: <20231105202555.359391-21-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215990; x=1699820790;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iE8gUsMknHVjMEWhvW42GvPFDGBMvIR4o9Yl9T5jvKQ=;
 b=UYgNCdUnvfTPnU9Iqz00RzllxtE2Ore5igVrvAMniZ9TPJeBtoCW0fwEFIiWmCBnd2
 iyhR+Pq9g6kVrI5sqnst3YHeDSc7q7tdf8ineQXP84Qwu2aJLEmYu0ESTDL0+rprIM2x
 +w0vYmbWlf4QA/57kF4U8ggp+D6Oh+uVuEBFc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UYgNCdUn
Subject: [Buildroot] [PATCH v2 21/24] package/scons: bump version to 4.5.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update License hash due to a year change: 2019 -> 2021
- Install the packages to the site-packages directory, or else packages using
  scons to build fail with import errors.

Tested with benejson, gpsd, and mongodb.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2:
  - Add a line in the log about updating the license hash
  - Fix installation paths.

 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index a72fbaee5a..48b5077b2e 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb  scons-3.1.2.tar.gz
-sha256  72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6  LICENSE.txt
+sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
+sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 6b75d3ddca..ffd6abf609 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-SCONS_VERSION = 3.1.2
+SCONS_VERSION = 4.5.2
+SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
-SCONS_LICENSE_FILES = LICENSE.txt
-SCONS_SETUP_TYPE = distutils
+SCONS_LICENSE_FILES = LICENSE
+SCONS_SETUP_TYPE = setuptools
 
 HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
+	--install-lib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
 $(eval $(host-python-package))
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
