Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB0CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04D7A60E1B;
	Sun,  5 Nov 2023 02:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D7A60E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WE-oY4TTi2s; Sun,  5 Nov 2023 02:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4445960E24;
	Sun,  5 Nov 2023 02:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4445960E24
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14F711BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E152B41828
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E152B41828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsWsyrGUzJkp for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:26:15 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB605416C7
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB605416C7
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7a9857c14c5so118974539f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699151173; x=1699755973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPbAzQxXQS45igbW9FmyLZFsLcersMBBwTgvJnEn23E=;
 b=sOcaohyI12pKlWeNTirpG9Po++kpyLVX42S8DNV1X6hjwVpbCjO2S4lrhtKiLrjE/P
 63sTU0y/rt2YYzLX6MBExDRmTXAYC3wSul5p7YgAd/uN3ckiFdKcGzDZMTWbUvAtnXFl
 gup5QHQ2aDX7xHP0Um/D268yZtg20HClP9VyW90hGsEOR0BC89wJRFbls3IR0zfABIvq
 Rpcm5Fr3bkWGTeld2Eekx/v30t/SCzeBxCinENw/RfUPnaChwgfc3/MB6xrl5oLESraq
 1fYBiYPQmraCTT5isnnW6XsHjTAdIHYWut0k6U72OSeYoD1j9u/2+gVs/va6+KkDnv2X
 XXtA==
X-Gm-Message-State: AOJu0YzhamBAryfqnv6ulYo28/Qck30/cLVV6hkOJkfOXh0H+GkKY4gm
 r8dv+k0X9ryGx2VN9Dcp9tcF9zM76Y4=
X-Google-Smtp-Source: AGHT+IG9uZJ544DC97fMtRjMdpl0eq/7XR13AEpGa1J5iDsjl/3hwwSb1QbbeBbL3NeIi3N5CjsPUQ==
X-Received: by 2002:a05:6602:1684:b0:7a9:8dfb:3ed0 with SMTP id
 s4-20020a056602168400b007a98dfb3ed0mr33473598iow.14.1699151173433; 
 Sat, 04 Nov 2023 19:26:13 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 e15-20020a02a78f000000b0042b4b55f46fsm1318346jaj.117.2023.11.04.19.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:26:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:26:11 -0600
Message-Id: <20231105022611.2753419-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699151173; x=1699755973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YPbAzQxXQS45igbW9FmyLZFsLcersMBBwTgvJnEn23E=;
 b=jUfsL9M/Pf9ldhBxYxZRGRBs2HiyBWASY9HJEHEESijC6WUGEkzWdrGxwJyY/bJrxQ
 nAPB1mEe3T/1nK+lc7b5gZcHI1YTDWU1ETQZZGsRTXqXQ/IAX1r3gQzmD/2zNtpdfh6J
 W9bJugP0yh1OR2mtApijTUMgZhdMbFVbNye3U76YMR6tawGWPVJm9ruDE5ibbTjinFgm
 4iH+inh3YdoA4hJALUo1IxkIso7qBp/3apmSYR7uz11oUhMhJjvUxo33b52odODCPagT
 2rMTTSi150P3ee4lCJPDjK3oGOpggnfQZ9cPHSb6ozQruzFkWZPADKcfuE/MI1Ol1dQq
 jK7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jUfsL9M/
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: bump to version
 1.2.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index f053922ac0..5f7585af6a 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  67cf87c5d66fe389949a314849f68863  bsdiff4-1.2.3.tar.gz
-sha256  1b95ce93b9f306846f6c91c9d0e3eb6590a4c85ac2bbe72b5f60d9db82ad2a1c  bsdiff4-1.2.3.tar.gz
+md5  ebc06d059f3c4ed4c4a5b952f55ae239  bsdiff4-1.2.4.tar.gz
+sha256  1d7129a8121860731e8cce2901d3183e14aec70244f64e8f74563275dc388067  bsdiff4-1.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 05fe1bef25..71d212fb28 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.3
+PYTHON_BSDIFF4_VERSION = 1.2.4
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/a8/0e/a677b62d35e3a9d074eafb5b16b569d5d6870a6ead02e8c830e4d4e73db7
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/58/b2/ccf01309dda2c08e0600027bc0f5a99534c91f2f8728b5009fc363df6c2c
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
