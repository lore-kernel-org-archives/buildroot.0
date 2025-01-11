Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AC9E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E4B7607C4;
	Sat, 11 Jan 2025 18:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHuixjeP4md8; Sat, 11 Jan 2025 18:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BEE1607D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BEE1607D6;
	Sat, 11 Jan 2025 18:48:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD8A942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E25340737
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sgZRauGvhcB for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 799C340732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799C340732
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 799C340732
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:48:38 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-844e39439abso92941639f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736621317; x=1737226117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7/7zknEpjJ2tWLYLMwh201OPn8iSrvYQHI9tM79Ek7U=;
 b=r8cyTm6AvhsFZ1iDC2Dbx5iUnqG3KPR7HnRHDAyJrY1VIpDlECcVg1a85nJXAATZ0U
 FwMV+H8ZSCQbbtjyaRZonUGtYd8TLXtZ1hvGz5c5Oevp2jNACZJgNn+TEwz+CSF/bmGF
 AcluzN7a/4QbRnHlFqL7d24/wE5Hc5XGVa+jhkkszbZVJLmVNhe7dAL5LnVc7Tw/LILO
 56FELLHQvC7+fdwebcgagYvgcfJ5J/GIJ90OtzqT/c0VkVjms4+41lw9oeAm/ihk6Pr5
 3YrPgk00Zmb7os5zX5NhSp96Ao+J6Y4musWWEPsL3GlMKWGqWVE/oQH0mCfuNf1/KRN+
 +saA==
X-Gm-Message-State: AOJu0YzcyAyQ6urplN5iNlc3UyU+8/ghZZz6piP3GkhkXnvV5A6ZGTkJ
 HWevvMfGnd2LaoaqJirT6DJOUuMNGXglu/aQESrFrlZhPGUwBUsrh5vBaM5R4qA=
X-Gm-Gg: ASbGnctZ0RxUCXBahvK4fEAiPoLoMcjgph9E/k4FqDC8a1dV3Ajr0rZhUMwKjkkL5AW
 eVclRYkwqpxgfHx316/GhowCLAKNQ/KVMKg/d0DGXIM4dLrQeA79g7jNj2DR/iMXfhM6hbsqEon
 YVRndfRo2fXaPCdV/QLC2SIkMflM6HV3f7SQ2Dj9H5OrkV0ICS0qTShr8WZVeurziUBqaLhIhnx
 POgMpDHeVpvubq5m5oapfJrHqRof4wjuhMw7hacsP7KhAOQ57K2nMV238qJAYZkM1MSfVT6Wu3Y
 946kOctE4gv+JXbvzuUdDt5MEqKEv1s=
X-Google-Smtp-Source: AGHT+IEbarggcALWd2eERQLn/ntYBodYHAtF65AF7SHvOgX3rt0n2KCQozcU/TpPVCR70vERFZe3IA==
X-Received: by 2002:a05:6e02:3f03:b0:3a8:1195:f216 with SMTP id
 e9e14a558f8ab-3ce3a944a2fmr110941035ab.10.1736621317212; 
 Sat, 11 Jan 2025 10:48:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b6292ccsm1671976173.73.2025.01.11.10.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:48:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:48:35 -0700
Message-Id: <20250111184835.2950916-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736621317; x=1737226117; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7/7zknEpjJ2tWLYLMwh201OPn8iSrvYQHI9tM79Ek7U=;
 b=OXFpOS4QNVVPgCdBun00MvzZK2pWWPkG7JM6WJOqNqUQWUkCC00QWlvTIiYfmkHBnc
 L1V1HdMR4YySFrAob6KvEpcbSwNXjk3w8ZsuprEy0Qqahiw/Dg7aTRaxBqHuvtLGr9RH
 +Ib9zpe3/ToqQi3G/CLtt1kJprbB/le6dyhJzjLKOQgSL08OY0TtjTD5uo9akeXHS+dc
 sCdxAplt5qxm2aQIIHAZa8sT0gsdHIfotIusS1UYWv9fb6YVpdTSjLfsByZAX1Jl6Qnk
 W5CCXIEIfG8LlwELGlEgAyZXK9s181LNQXUwuxNq1aNsTY3+XUXmpfcUvXpgdKHscCh1
 muCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OXFpOS4Q
Subject: [Buildroot] [PATCH 1/1] package/python-types-python-dateutil: bump
 to version 2.9.0.20241206
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

Add license file which was previously missing.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-types-python-dateutil.hash                      | 6 ++++--
 .../python-types-python-dateutil.mk                        | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 6143f7bb2d..321e7f56c5 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  986aa3f3706c4b38dfcd141572a4f515  types-python-dateutil-2.9.0.20241003.tar.gz
-sha256  58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719bdbe6f3fb0317446  types-python-dateutil-2.9.0.20241003.tar.gz
+md5  75621f393711ce76bb7a7e46902384db  types_python_dateutil-2.9.0.20241206.tar.gz
+sha256  18f493414c26ffba692a72369fea7a154c502646301ebfe3d56a04b3767284cb  types_python_dateutil-2.9.0.20241206.tar.gz
+# Locally computed sha256 checksums
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index 53d16de74c..f07e327b86 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20241003
-PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types-python-dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/31/f8/f6ee4c803a7beccffee21bb29a71573b39f7037c224843eff53e5308c16e
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20241206
+PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/a9/60/47d92293d9bc521cd2301e423a358abfac0ad409b3a1606d8fbae1321961
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
+PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
