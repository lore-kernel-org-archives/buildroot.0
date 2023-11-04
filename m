Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344B3C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AAD60D7B;
	Sat,  4 Nov 2023 23:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AAD60D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDDfOVY-XIML; Sat,  4 Nov 2023 23:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD4660C17;
	Sat,  4 Nov 2023 23:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAD4660C17
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E26FE1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D3E821DE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D3E821DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPkL4UC9N_SX for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:49:23 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B797E821DA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B797E821DA
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-357cf6725acso12810155ab.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699141762; x=1699746562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZCB9ExXUbZZ7CbVX53Q8KMRSmWCUd7hDulY6pJsQ8jc=;
 b=P88fF+8nQSYmYVuiyvpPYI0lwRxBWA822nSkGOIR6ErBVdp97VT1Iu2dtBW0fKSe5c
 u3hGBnIkPk5Dgal49WnsVBvJ+rkOya9F353CZ6rWPt4yW4m1Ve3SU2FLJzf9n+bghw6u
 5Esj6iVGf0TABpzCf9W0lFYQyq5i4dlKcK4+fn5jdst2LpeoTgKlFkS7sZbFftgg2+gg
 zaOw0FinQFBSpIPtrFFIZtTvZpA+KBNoOh9Gag5d2Z4gGNVE0+dAtEei5B+4Isd2nbg2
 Cz3DLDdz4l3+5iSUMfZIBSS52lP3hDBaGurrXK3hvRI8zJYIIc6PKBknkil2rNh430cp
 LcuA==
X-Gm-Message-State: AOJu0Yy6mjvOvEu7dNYxOw3NtXppxXHAVm7AqPluhldwSnnwz5Rt62bD
 ZThYN6VnL7jgPvGYGiOechK9TCT/2rU=
X-Google-Smtp-Source: AGHT+IE93wFpG7j0uFTedY80K1egJt6bqQt6fEa/MGgfV8xWv/DjHEk+WkuY/PhA51hmQBeNMEQNfQ==
X-Received: by 2002:a92:c24f:0:b0:358:1b:f8fa with SMTP id
 k15-20020a92c24f000000b00358001bf8famr29304219ilo.32.1699141762370; 
 Sat, 04 Nov 2023 16:49:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 fo7-20020a056638648700b0043a180a7a94sm1333521jab.121.2023.11.04.16.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:49:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:49:00 -0600
Message-Id: <20231104234900.2686730-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699141762; x=1699746562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZCB9ExXUbZZ7CbVX53Q8KMRSmWCUd7hDulY6pJsQ8jc=;
 b=J4UJsb6ez0CPj1D0DUWZTnSiBf0/M6u+y32J2vPIwl2f8Macx6FjR2cOW+BDtjrde+
 tvThCZJ944GVcrR4ZgqH92pQFmlPvcxhSU5rsyamZTJKoHNHuq85y894mDFbir25u1SN
 OuVzii6v4sA0aJBMhi+/qSoz8YLs/QQdB3opP7cwysAaQf3HanGDWyszCXZpTpUhydbQ
 JqQDEuh8qPQdbZWJbyST17rY6GiZZiP/7JqUKfc9Y1C69BFEcRj9dhc+quBmQotS869R
 7bP3B1mp4JxJITYkwtrUmZDB6UuheK73v9b4Qmt1VWB+gN7dzYrvz6YwUeRoaf2DMQqa
 nyRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J4UJsb6e
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.12.1
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
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index c84c46c84c..df1f4fba02 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  de9d9f92a49a5e3ae5a978018927f474  alembic-1.10.2.tar.gz
-sha256  457eafbdc0769d855c2c92cbafe6b7f319f916c80cf4ed02b8f394f38b51b89d  alembic-1.10.2.tar.gz
+md5  642d563af853b317f018026f3edd5dba  alembic-1.12.1.tar.gz
+sha256  bca5877e9678b454706347bc10b97cb7d67f300320fa5c3a94423e8266e2823f  alembic-1.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 4f605b8f60..fd41e0df66 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.10.2
+PYTHON_ALEMBIC_VERSION = 1.12.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/d6/02/66ed327f944f3f85423096c438d7d290da5af21a7aecf9e5b9f09d9e34b2
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/44/b4/253fe31261d9f5d603d89bd9e6fba1625494a6d761d319902dfe4db59016
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
