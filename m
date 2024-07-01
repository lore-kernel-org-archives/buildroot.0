Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABCFC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7878E60AD0;
	Mon,  1 Jul 2024 19:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyL79RMxlMwO; Mon,  1 Jul 2024 19:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B1AA60AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B1AA60AD1;
	Mon,  1 Jul 2024 19:40:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 153E21BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0328B60AD1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQqfZioJ4BU6 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F248A60AD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F248A60AD0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F248A60AD0
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:40:36 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7f3d37d6bfdso100310039f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 12:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719862836; x=1720467636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uO4eVyRsgFgz8DscAufqNv6kadkDiuniZmu9rbKEfeE=;
 b=vFH1LusIpuU926S62SEBFy/hyurHENUVwnlzZJCN76379471aX/0bNI6xlpX1t60HU
 yudKlSUz5fXRnnUOO/F4fmU40oH4rWGmt3PUJWvn4nVVeGr2PlWbJTTQSDiu0xT7grks
 sS2x1eT77BAF7CRjCoXZD5bffUnSAlFnlQxEWPed9lZxz2eDimZWs0I6xmcWvmGSw35m
 k8pQNrRZWCDSRc71r23KQtwX7801d1KhUWECYH35IYVHScLKuKjBrJjfoddrtbawSq+9
 SKgLVPQThG2feQWYOe7C3yXP/f3QrWwdDeRd1Kbk+BmT/gImLPCjLUc7xFRneNlbU3MI
 vOiw==
X-Gm-Message-State: AOJu0Yx/GqFIm4Il9TH6V5lipLmD8hNZKfqiQ0KNYGMh+dycnctt15Ip
 2H/bSppq45mrHr8DxLhyVK0NIOML6nrtjBqy1GOmcFjOoP/gEkUylxGAMQ==
X-Google-Smtp-Source: AGHT+IF09508oM2v2+6eQStG2uFmV4cNXz9o8DCUCr+U8xGAs9s8IiWoldMo5rau4gdHRif11iZz7A==
X-Received: by 2002:a05:6602:178e:b0:7eb:eeba:5e83 with SMTP id
 ca18e2360f4ac-7f62eeab155mr276164639f.9.1719862835607; 
 Mon, 01 Jul 2024 12:40:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7f61ce88113sm217336139f.7.2024.07.01.12.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:40:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 13:40:29 -0600
Message-Id: <20240701194029.1789343-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719862836; x=1720467636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uO4eVyRsgFgz8DscAufqNv6kadkDiuniZmu9rbKEfeE=;
 b=auwADiFAfwcU1aOrisU4u3chO6fmDzZ+K0Eu/MhllnPtLt/QyPTQ3YmDCcW5eLpcdZ
 TQbw9pU2GiY0vfn5pkNuQkgpm1X41jNpMcTlcAOJWjudrZ0a/4BRH/35qz3/B6XW4U6U
 30g8K0Kb9cmqYuaFsQvJ6VQtVSj9p0O3sk01O73b2kGV59Xv/VXNm66J6CeOqpUqU1re
 FYZkrNoX9g1AGdBx/Drq7n9SgSHP9Hq6hAoayjbbpkiIhmqwtK2nAB9iAZYTZPEH8s9+
 Kiw3xZiOSCkarsk1mWDSQJZpUdAXQsTXob0m/d4PAySj2GejdyvE7R6EjmvJyom3OV5V
 LuGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=auwADiFA
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.8.0
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 75ecb23053..caac7f8957 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  4651fb3374d2a0d74442c2cc780770d0  pydantic-2.5.3.tar.gz
-sha256  b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a  pydantic-2.5.3.tar.gz
+md5  38edaad5e8687f1b238577ee05a4c968  pydantic-2.8.0.tar.gz
+sha256  d970ffb9d030b710795878940bd0489842c638e7252fc4a19c3ae2f7da4d6141  pydantic-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 0cce5a153f..4c2becc9c9 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.5.3
+PYTHON_PYDANTIC_VERSION = 2.8.0
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/aa/3f/56142232152145ecbee663d70a19a45d078180633321efb3847d2562b490
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8b/7b/23dc30fba5793d7be3307f33bebb36e08f78f8af9c03fce608833f01bebd
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
