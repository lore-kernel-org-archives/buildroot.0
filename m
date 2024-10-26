Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2601FD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C432E403CC;
	Sat, 26 Oct 2024 22:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOtsVyXYa6HD; Sat, 26 Oct 2024 22:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B14540291
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B14540291;
	Sat, 26 Oct 2024 22:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A061B5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8889B811D0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqbg6QSjKEKf for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E282811CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E282811CF
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E282811CF
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:49:39 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83ac4dacaf9so117322239f.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729982978; x=1730587778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQUScXuVINGGK/NO1lUQLu9CXsNiWkWe6+vImbtF1GI=;
 b=CbJJbH+WO5uH58wX9KDmFBouJJH9e3y8Xji8BBMw50XXhTSiNUgM0eC0a7YsTvC3Ks
 G3WybSs3q6cX8d5AT9ujk7oI01DxVcIonCKmvahT2nHVwKROhReEsj69VmHknydx4WK4
 UgteyrfqdEg4EiAwz/+N2vn73oVEHkAnGnZO8LnpIG5H9yG5MPCYidQxHKafyxY8Yqyc
 ziHmskBFaNfCbHrRISsKjpnkl2lCF1HrS0w6I/vFZ70Fa5T5UhUStqjzZa8SDwkGH4jh
 Q2mQWGwwUmMj8IhJcWfWBGBtbLJgRD+227f+xHvmUPpzVKtbAHTkkxBTIWLpFjxnLsNr
 CFQQ==
X-Gm-Message-State: AOJu0YzkE1ZzYWzQzlde6cDNYqL01a9/S0kgp3Y2y2o/aZPu64kDXJqZ
 rsIcLJg6jnU6LVYcouagLB6tNeos3Y2aqwOI1eyOmmW98EGc0EIBaTCNaw==
X-Google-Smtp-Source: AGHT+IGEj87D4I6EP44Zd/hBo2hTCe3SbI12xGBmvNh8ZuU6cJP9uxrFZB/ag9lhsWkxCQ8kv4WIEA==
X-Received: by 2002:a05:6602:6d16:b0:83a:639b:bc44 with SMTP id
 ca18e2360f4ac-83b1c3c44edmr211419839f.3.1729982978294; 
 Sat, 26 Oct 2024 15:49:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137f523dsm80115539f.26.2024.10.26.15.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:49:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:49:36 -0600
Message-Id: <20241026224936.3846306-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729982978; x=1730587778; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TQUScXuVINGGK/NO1lUQLu9CXsNiWkWe6+vImbtF1GI=;
 b=IAmyJYEA8CD+4KrpiB1aykwmZFooHsFQKOWNAUnJsLeJs/9ltrIZQTnnQ3BY0UsnSh
 tjWgheXGrXFVq3Alxao9UkQ8LTYERouv3f5y+y7VFmnY/TdyEXVLB2XRe57HTskGvj05
 OgKeItt8tEC14xLjlufVI+soaCciq7mhPejgYzkFWSvDtCxeChTgoWY4P1W/DoQg0SA9
 MX9NkoxRt73UHskHjNsxwcmgDXS5Hwvasv4R5i31FM+Wx/GywnWYqmw0HTExRPKyEg9m
 XsM/a1u+sMSBZBPTs2qEfF9gHgH1RAkbbh4vA31ECcSGDcyMcRdpztRDvE9aoSDyrD/z
 ayVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IAmyJYEA
Subject: [Buildroot] [PATCH 1/1] package/python-pudb: bump to version
 2024.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Migrate from setuptools to hatch build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index dd67b9fd81..9918f3e041 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  8452e5d114a58a63b6c7781452980171  pudb-2024.1.2.tar.gz
-sha256  adc9b00042ba8367117df0a6c0dc62fa9609abd21c3bf8e5b73d620907c5b43e  pudb-2024.1.2.tar.gz
+md5  dc73886506e57c8ba2116e5cbe112fb8  pudb-2024.1.3.tar.gz
+sha256  264f239e0538e52e83d3d020143100b3171cae17227674bb1b9f8b075f34849c  pudb-2024.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index cad1bf00bf..4dedda0bc2 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2024.1.2
+PYTHON_PUDB_VERSION = 2024.1.3
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/54/70/fc7d81b7ac439d5e21c8c2b51e15cdc6632b720b02219057fe098a80e766
-PYTHON_PUDB_SETUP_TYPE = setuptools
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/36/27/fb087bdf2cd9c8e56d0347b863ce5995967c15a3e2a0b9245c7a8f6f1598
+PYTHON_PUDB_SETUP_TYPE = hatch
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
