Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44406C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CBC980E32;
	Fri, 24 Jan 2025 20:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEd10sq3POmk; Fri, 24 Jan 2025 20:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23CAF81F78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23CAF81F78;
	Fri, 24 Jan 2025 20:26:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41062944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20D9781F77
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-sKu7rco_Qt for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:26:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCFAD80E32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCFAD80E32
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCFAD80E32
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:26:01 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3cfc934af74so10389985ab.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737750360; x=1738355160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tPKGiLwn+vpYqS6AMSmgkmGUqN7N1H++nGsnkSHHLcw=;
 b=K5vJ3OrW48B3GuRnyWuETUH59SFoEESbCQimifA96dMHuEmj2gQpwCS8toyvanRxoX
 /V3/WJGU9cAEktt9IwGEMb/nJkGyHXYqI6xUElMeiZbHDKPL0+KT/ne/Am2MhfgLVdi6
 y/obMsD8lWNwxyGKoINIptuLtM8VkGmaXvyE+V3x9NK24FRqzftsxRs7jtp+GJdJQvU6
 ifPtkVLE8lQtwFf+0gCIXHafML6YFpwpo0uf0lWajbNA6k5jK3md56HNxSgsrXs3O25M
 pauzrZvJcm+P1kUe0TRzABjZRQM7YOiG6K8s1hGEHb8QVV4ltdeisX79JTmmMm5Y8bBU
 9WeQ==
X-Gm-Message-State: AOJu0YxrE5+eq6xWKXbHGTebD+A/8AP2jMKoj8PiGp3V9HrIMBkDie1d
 zVbJdbYRO54qunNdc9rQYtqdgtl8S6RJ7GtVWsdMUkl18GKN5yPYqrq3spEr
X-Gm-Gg: ASbGncuNcWYK+Kh+Lmw9g/bij6itb/g6WbK5OdkmjcNumBqEnZYic4nKPbop4AUvg2M
 Rjx7p/sMdFmfFZfSgBNAcJjpjZCEhQ5/im2fhhGVX8gPIHdsj7gaRq2Mwv6+TNr88o/ikjc0/dV
 DWfUHH1su8J1Mq+AdKrDHeEE1UhBWLbDGRCd1Ml9pETMW1XJDugIb5xtW2Rvx2UxC9aW4LoDnES
 klOqXgb0lumhmTTk3dSeGqjBmIYebHXF3SqYGR9WhRSi9bRnOvM1y41o1LjWdNu1riYMQDJ3EfI
 IJ1YO97wFSmWnAWPz5XEpCRtJiuODNxPxFk8s541PcNGTS/v6Ck2Vho=
X-Google-Smtp-Source: AGHT+IHSGAotygBrYpcYDrDv+HJjjLH3n6d1FSVliQ/sJLFhV9GJyg6tldb5VNH514zWD7xwmdqcHQ==
X-Received: by 2002:a05:6e02:460d:b0:3cf:a0fc:5388 with SMTP id
 e9e14a558f8ab-3cfa0fc5ae8mr167183015ab.19.1737750360383; 
 Fri, 24 Jan 2025 12:26:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74337a1sm8699665ab.19.2025.01.24.12.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:25:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:25:58 -0700
Message-Id: <20250124202558.3852689-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737750360; x=1738355160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tPKGiLwn+vpYqS6AMSmgkmGUqN7N1H++nGsnkSHHLcw=;
 b=UnveItuEkD+Che8LcIP6SJCXt71u1YH1xEkRwnXz4jzF62Ks0mku9DwEe+QvXFsRWT
 GqVZvIT8oa+WhX8eUzkVhH7HgAC5NDW6nVj2lUtNvc9RH2HfXZU9IL2Kmwap8Z+ITm0V
 n1pVuYd6xpxEg/s1ae954f5nE9zU8s/phdgY0j8/M8v4UC4elzqo5CP9ZLc6v0y5xVtG
 24b9LzoUzolDUY6frfRZrzK9OC6LPrhwvcT0pnfCcXRwCMDwKgzCj92p6sSQm0jOY1vq
 HyAQLCCQtO+Ow5hdHTlU/B+4rJFMIRlCmQhaU6vh8uAH0wxoa1A6ZvBH8UMax1FvOpIa
 L3pQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UnveItuE
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to version
 0.11.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 030a7c0962..bb17d0f18a 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  cc2ee5c0de564fe24f26490597a9a8a5  s3transfer-0.10.4.tar.gz
-sha256  29edc09801743c21eb5ecbc617a152df41d3c287f67b615f73e5f750583666a7  s3transfer-0.10.4.tar.gz
+md5  b0d1e6875220ce4b1b3db6d6c15b9ebd  s3transfer-0.11.2.tar.gz
+sha256  3b39185cb72f5acc77db1a58b6e25b977f28d20496b6e58d6813d75f464d632f  s3transfer-0.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 1f7b38a35a..c61553b1c2 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.10.4
+PYTHON_S3TRANSFER_VERSION = 0.11.2
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/c0/0a/1cdbabf9edd0ea7747efdf6c9ab4e7061b085aa7f9bfc36bb1601563b069
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/62/45/2323b5928f86fd29f9afdcef4659f68fa73eaa5356912b774227f5cf46b5
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
