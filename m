Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE163E7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BCA5614D3;
	Thu, 19 Dec 2024 01:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqpKzAue7ZjP; Thu, 19 Dec 2024 01:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70E16148E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A70E16148E;
	Thu, 19 Dec 2024 01:28:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F142C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FF084155E
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaE1_35EUrEk for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 383C641573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 383C641573
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 383C641573
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:28:46 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a816cc9483so1851435ab.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734571725; x=1735176525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWAPADH2TGsAwoH74m/g8mpjOrKuO6RTklvvmCIsiy0=;
 b=MdelylpbBy7LB2fSLiSLA0TTrX+nLYqxm7xi0jYwDy5hKm4pXXkq51el/1NpPyfENo
 ii5qiISRW4bYUpzqoggb5YBX6NFMQJZZsO2b86VJcnv7OTv73I1SrL1z5TLLPUOejQJm
 tqmHVnGYqi/4vTWQqxbaz6QZasgJKGiDrTxIV0XHg9lqLBGyPE/I5VVSHEKqe63t5x6m
 E1P3GOIF0W4BXh6+acBj/uZufEHQAE4LnntW3fW0Scr8HLq1okI7tJIZPMS1a6eT3ohT
 aQBHVp6Qe5Ew9HmbQY4D7v1Ua9YZm23golVkp41uwfiZeIilmTD7WM8+VZeAQnKQUlGi
 zh9w==
X-Gm-Message-State: AOJu0YxZtHMnNriXL4QZOBXGN+DSMOzV+rT6pS7/98AOz2IOqzHMPSFg
 ZlI+oAl2dNGDaDyB15Px28b/GXbix6PQgM+4txR3oImMcPoFBN9eGQwSralNd1o=
X-Gm-Gg: ASbGncsXe/l8upjQp51Bl2E+dCE2RZRFgTap28Eec/tF87sT5OyLH8JGbCLrvs4XxqP
 JqY4HT5q2BXWL4/v5Bl77lRDkjkGmSdm38czK9VR2F+lgwnxTxyv3QAtkFPvsk4OzMlfDr8cjqC
 o+DcNbIshmec8HchL6NHZ4rSnJfCop2rCLWBy2E1Xtjq3WHbjy34RQgFtiUKjggWcV5h/ET2ypY
 e7A2F+yfjRm5vYwMXy+B09e+8GrXuVbaUQM2qmMnrOOARqosfthr/5Th7ijmRyxIGYHObSp1aN1
 /t10q+lFSo6fa4JIT3mR8/PzEiD1ON0KdA==
X-Google-Smtp-Source: AGHT+IEQcRUXx2a4rvGFSDs8XbH9w+rjEP07UoIyHrl8qtP6Hrxxx4vxi/E3oHPVvY4lhJgptv33EQ==
X-Received: by 2002:a05:6e02:2145:b0:3a7:8cc2:9a84 with SMTP id
 e9e14a558f8ab-3bdc0411de8mr51909555ab.5.1734571724932; 
 Wed, 18 Dec 2024 17:28:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf684absm38549173.57.2024.12.18.17.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:28:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:28:43 -0700
Message-Id: <20241219012843.244249-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734571725; x=1735176525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tWAPADH2TGsAwoH74m/g8mpjOrKuO6RTklvvmCIsiy0=;
 b=RZPjn4ATqI+zOcWo405BBemv+OvcTahWXIxEMTFe/7NPettx5v2WzslgE46SCfebNR
 qFhK9C8aaRk/GTua2iMjadHQCfoAHJxJxhPtUZFQFxvmo/EFvkaVSXC+Zlvh2s2rLUD7
 Lg6srbyPy/5Uc3v9DuFlUVgPobEJvHGaoGnCYrMe4SCvhy7oO8KNr5NNnFA0FXQOtNut
 NWmHzcPvZ5PPueW3wuN80ke8N8RPWqrwj5kaMncyhFhIOm4YOIjO/g84JYILYGa13MUq
 EmR2AYlGon8HJm4X931xhPHAYA8F9fsy+I5tQfWI1HXY3sWE5OlyFlK86LJ6G0oyUdFA
 YByg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RZPjn4AT
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2024.12.14
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 6f8e0241b5..bf722c97e8 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  f842fc7a8ef562539e07873475eed593  certifi-2024.8.30.tar.gz
-sha256  bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9  certifi-2024.8.30.tar.gz
+md5  e7e7a03aeed4290cc28cc62975aa0149  certifi-2024.12.14.tar.gz
+sha256  b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db  certifi-2024.12.14.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 7cdd65941a..fe5b4ff690 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2024.8.30
+PYTHON_CERTIFI_VERSION = 2024.12.14
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/b0/ee/9b19140fe824b367c04c5e1b369942dd754c4c5462d5674002f75c4dedc1
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/0f/bd/1d41ee578ce09523c81a15426705dd20969f5abf006d1afe8aeff0dd776a
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
