Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB355D24470
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 17:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB9E60A88;
	Fri, 11 Oct 2024 17:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NObUalYW0OGo; Fri, 11 Oct 2024 17:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96ECF60AA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96ECF60AA1;
	Fri, 11 Oct 2024 17:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E13361BF37C
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDB5E8179B
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKOO8JVXT6ay for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 17:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F0F881747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F0F881747
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F0F881747
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 17:50:02 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-836d2437852so72899139f.1
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 10:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728669001; x=1729273801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bl2a6iFdvtqDtcki52oHQx6g555swik99YSPIrIrlok=;
 b=WyNxQPSNazmlq8MSoXYM5MuP3/sfnFXT6g3OgjGDHt7BBKgylqm0fQtekT0DjAzfX1
 l3tO+q3Uv8RLozTIyg3biU/fJmDrEAaPV5ugd5dehdXFGFV/4iSoa3DQ26NUdM8k9Xrs
 MUZBi/TO/Q2SbxkPJLG7iIp8IHxLD9atXy9P1cdJoEsK9EvDAmhSkK7s04aNzcL2/J/G
 eGVwglBciku0UtKqzDdvZsvm0yXbHQasOznIQLSjCO7b1SXjiDYi72CqYJcuQUhUVxiI
 t/oFpmz9tLgUreXVSdj0b3Z7S9PA7IKFDE0/WHCXR8tSt1gpEZ7tUgoj299fnu+z0x3+
 y8Rw==
X-Gm-Message-State: AOJu0YzOvWiwGz9CsMiHAydiKEeDz6ZOsrHb7NpZNv/vf4xQquW2fZ/3
 rpswbm6rLsX9VnVqgpm4CqEFCZ9HqEQBEkjhGTW3dy5PC//dNC6ds9ZlcPyb
X-Google-Smtp-Source: AGHT+IGkK48QPdPlnNA/2tI8nF5icOGqa8B77+hNV2QdcX4LwkMRdbZobAsuMI78ChkykJXcui/wAg==
X-Received: by 2002:a05:6602:26d2:b0:82a:4480:badc with SMTP id
 ca18e2360f4ac-8379477a6b5mr477423939f.10.1728669001244; 
 Fri, 11 Oct 2024 10:50:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbad9d4803sm728166173.60.2024.10.11.10.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 10:50:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 11:49:59 -0600
Message-Id: <20241011174959.2765520-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728669001; x=1729273801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bl2a6iFdvtqDtcki52oHQx6g555swik99YSPIrIrlok=;
 b=i+PXnNcAdobIZlvIVSXaY0uNUbVoBWYWWlmoSASe7Bu2+srAVRx8/6bUpg9irl2/m+
 qY95NWiWDf5j8lP6Lt8w7JVlnfAwvRiiDkjIlzckDsib8MDG0c/X1Zs3Nj6CAcka4FPs
 Kkr8oSuZc9p29ZvOcr3FKxiHPmbnVGxkuZNrd81hl5G97K440ZU/6WsjG3UO+MNFm/jx
 LyLIF5wYY+6cVDRwMmOtkGTafOvOj7qL9aXVv6dmE+NycDi7LW/TJTZHty3RvSjmexLD
 exYdjWrdHS3hnlH+v7Hoz8hIihW8hJ76pf9HK3cKkyy3kzta8FDQcVMyuaI6lX8KOxPj
 UMFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i+PXnNcA
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: bump to version
 1.2.5
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
index 5f7585af6a..4b09dd132b 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  ebc06d059f3c4ed4c4a5b952f55ae239  bsdiff4-1.2.4.tar.gz
-sha256  1d7129a8121860731e8cce2901d3183e14aec70244f64e8f74563275dc388067  bsdiff4-1.2.4.tar.gz
+md5  6fae66687d99305e2bf15887c9f80cf9  bsdiff4-1.2.5.tar.gz
+sha256  cdd83f820ecb8f1ef67a4e5f0b152c61d327caf7abf35aa9a763413915b21368  bsdiff4-1.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 71d212fb28..2b48bdb646 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.4
+PYTHON_BSDIFF4_VERSION = 1.2.5
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/58/b2/ccf01309dda2c08e0600027bc0f5a99534c91f2f8728b5009fc363df6c2c
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/43/49/262497fc308aa998d7431130cb8526b16aa43f2cca500d0182fb68689d99
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
