Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9304AE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63047606E9;
	Sat, 11 Jan 2025 15:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0IlnDqZO_Xu; Sat, 11 Jan 2025 15:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F1060701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88F1060701;
	Sat, 11 Jan 2025 15:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE22E940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8B1E4013D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLc-7hrsIvCk for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 93B6D400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B6D400B9
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93B6D400B9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:29:22 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844ef6275c5so96521539f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736609361; x=1737214161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iXPzM7Hi+H2kZZQ9eOvyZuxeZCxIU6WcZoB4f/wbU7c=;
 b=toIEaM12dtTeWF/+116kJqm3kV8RxUIyRNyUE7h/bSIhgM+/VGIe5zDSdAJds+DKV5
 raR+jXfWSFZEZcPVAgIxQzn7lEDtAaAKC3SH6LaQvaXX3HRHdvUzmu/iWT5hv4CV0Rin
 vQ393B0hgoJud+JZPsef+FyNBk2o4cS/V9JpVWp2X9qjpgb/lCWvlj+LpSL9huhEGwc3
 hoTweDmGGFo7ACmk3kCF0tVFbC6tgIGe7BYtyj1Gg0taeWux4HfZ9krlpS5/4FWaFVaY
 IEABnM7RczUoRfnEUyRxipuCdFbgAa7CTok3gJBr9NNxzYLyjFm29esxOWCyFDbL5Nq6
 5XKA==
X-Gm-Message-State: AOJu0YzFMpEdWcUD2fF6QJ/6UtDM2tq0Cfxt8COkz/7GafLlqbzJ4Yti
 eKXZwhXYNPuv4ydRFyxXNJQ4y7ijwu2SmPQtkObF8xpYgad73IjZq9z5WaeDPsg=
X-Gm-Gg: ASbGncugXw6oefXaMUY/vt1fDwagx9CGiayZylPsTd7YnNrikx/kIZkeZdHiRxXHsea
 xVDjttFcinNFu31M9ZkiZRpSMFdNgwW0YDzwIVD5u7cqLTHyCrYSvcQqQSWryUNqaLhMEIdY9/b
 dS7cfD2rjkXZeJ1A0kR7Hh/NZhYWySqKNVd5aVqeaLK8zm83/fJETGqkAysAM4KvX7xPAHbWoee
 uoMTk7UJIv4qcbcIg855brnu6LcOtUn1f1j/V6GXcY322GIg/X35fNcVMJS3m6Z94WzYg5GMywz
 xEEUx1vehCSljm5BjAwn7dlPsKmfZSo=
X-Google-Smtp-Source: AGHT+IEQrTOimDA5OjrOQPDyl/Czq9G3od9oFh6+kUWS9YQsBmKmBfGnM+r+WaEf+p9ETOqsCEqX9g==
X-Received: by 2002:a05:6602:4742:b0:82d:9b0:ecb7 with SMTP id
 ca18e2360f4ac-84ce00537acmr1408903239f.3.1736609361219; 
 Sat, 11 Jan 2025 07:29:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb5c075sm150765139f.30.2025.01.11.07.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:29:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:29:19 -0700
Message-Id: <20250111152919.2840946-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736609361; x=1737214161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iXPzM7Hi+H2kZZQ9eOvyZuxeZCxIU6WcZoB4f/wbU7c=;
 b=a+7sNlfvHuYduPm8H16e/Xq2DhFocbzU3CIgcjbmr9X3H7ElBB2GGSb4p8at4uvrP7
 8baKQ2fTe4gFE/LEkQA7pkDaRyd+b9PcNheGsJPM3fk0tAJu3tzNZ523UKkLg8Bf79PR
 mLPYkMm73SappvX3lFvgmFccU/LkBbJ+k4kN0r/cjUnP32pU9PNXjtwzpKKhW8ODliil
 Tlb7FgtJ8H9rbiLh056L5au5UnQGZPUowEV+VHbmk2TPTiRKAE6vxKV1RAbTl6qVjbHy
 EB0iUKUHe2MMNh9wEuUGdi3H64gljBGKV+YXMzplXOZWUv9fM+/rOIts6pZEDUtv+n/O
 5fIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a+7sNlfv
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.5.0
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
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index fa24c1ec66..95558f0477 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  ff4e54e91e32484b189b1e28758ec8c7  pycares-4.4.0.tar.gz
-sha256  f47579d508f2f56eddd16ce72045782ad3b1b3b678098699e2b6a1b30733e1c2  pycares-4.4.0.tar.gz
+md5  5824db5d38e1aa13a412e2b8bbe52160  pycares-4.5.0.tar.gz
+sha256  025b6c2ffea4e9fb8f9a097381c2fecb24aff23fbd6906e70da22ec9ba60e19d  pycares-4.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index fe6916445d..31153434ef 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.4.0
+PYTHON_PYCARES_VERSION = 4.5.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/1b/8f/daf60bbc06f4a3cd1cfb0ab807057151287df6f5c78f2e0d298acc9193ac
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/d7/b1/94daaa50b6d2fa14c6b4981ca24fa4e7aa33a7519962c76170072ffb06ee
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
