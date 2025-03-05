Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F664C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 08:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ADE640880;
	Wed,  5 Mar 2025 08:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ey7NcAncWARA; Wed,  5 Mar 2025 08:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EE0F40941
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE0F40941;
	Wed,  5 Mar 2025 08:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1F96E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 08:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CCF0607E6
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 08:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBNFF0cf2uKI for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 08:56:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 808DB605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808DB605B7
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 808DB605B7
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 08:56:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3608796f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Mar 2025 00:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741164981; x=1741769781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPCqzvkkagGIzkNe+rtWn7Pp9M6TuI+QcCMsCdhR9oY=;
 b=biW3ClgCJyHDXr9SYRWcw9ydzg1UrCheUTL5lk9IhqptMwKmZ1qqTItp9aXutniKBW
 A9Eej8fsVGZ09OS6W/3mqzpAeshaizwYDhadwZ0J6sFwLmEzbbh9yUc5GzVgeUtcnbPe
 Hm39vTACETahzBT5jzJkjPnKRfHcXM2kywdfmZ1Wc29j+WKwNmtLsC6Kd3ENutYbdIKc
 WqQHtCKaXhvykoMNJoMbfAXLi0cSKeHONzy30rilut7TLM8FxfEv+hFkaQsUYH/+GPOD
 L1A83V5CPjDVx5wuIsnblhg978+l0NNV9qbnuDhd6pcMLIQoKSpRgopNif+imsmAP5x8
 lDWQ==
X-Gm-Message-State: AOJu0YzWYWKwGTy6mtxtTuB29W3My3O4zqQSKnWyqficmTIp8b5kSCuu
 BAQ6XwyYqbtCyEyKWD6jBNdn1VOetozUhXO+hpSRLAOUXYtC+nHvvL/EnQ==
X-Gm-Gg: ASbGncvTA5GkC9qxja3YKKc4IjCmxZeXy+DWUcfgajhHZbFOIVLD0henNUvD9GNmAI+
 rDSxb1PT9EYPHcnrPFz8DVHFw1+wb/QulAWav/vRHaLJ1QixiM4hCQ4ofDNoNv5/7mrEymlnUEO
 IYSMRr7QV2Z8ZvC2zp+e3TIt7DhOP2w9otsJUJr87X8MvfP7siJ9oCHLJn4g8qMEO9VbOJOpZsy
 4CbMiUO0/doTpBo3ZmMfUTp3hR95kfvatpmDjTu152KWvfOVIWfevJt26JNOdMdxYLyUxI8Q417
 3Bi6HzZz0xrC1rwPbt6eOgNl/8XdSrOfL95hZ71/PTTJgi7tDv+bHMFwpVzY/6Xel3Bq2RKYN41
 GaTs6b0v45oC/+4OnXe/JvIVNJn9r5Q==
X-Google-Smtp-Source: AGHT+IFAN8j3Vtc1Dey7CsI80LnS/VlPa04cSHKDC/CUNRb7uIX4LufUMa4/53dp/865vOsvLRZ6iw==
X-Received: by 2002:a5d:588e:0:b0:390:f738:246b with SMTP id
 ffacd0b85a97d-3911f740424mr1671079f8f.15.1741164980701; 
 Wed, 05 Mar 2025 00:56:20 -0800 (PST)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c328sm11061205e9.5.2025.03.05.00.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 00:56:20 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Wed,  5 Mar 2025 09:56:17 +0100
Message-ID: <20250305085617.911367-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741164981; x=1741769781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WPCqzvkkagGIzkNe+rtWn7Pp9M6TuI+QcCMsCdhR9oY=;
 b=hu6OnqaoD+oYDLWZtfTTpA+QQMkd9lUYwJdh9cklCiMjuudxmIfz+YTb3vPr40dZ0D
 92lgyJhaSqNdZBtvtefwxH4xdC+SjwcGgpj7WV4fJWX/F7tzaTemRua3d+tk2AfSpQik
 +5i2cufMTmHrDWPCMsW7VK9AObKNi54I0KQn0DZovr0yf3Tcw/csYbit5CP/touAkUzi
 dRnCyTW9iH/r41asbkVG+0/uuQDL8eJFui89tSdJ0Bm/V+sZRwpkDjTNnQaqf7DUb1Ce
 QxD4au7rDV1Tx43CBFA2Zkv7QURLcNdpCUQ7/1/IWlXkMEpHcoo8vUV7YjQzznzMlvu5
 2/3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hu6Onqao
Subject: [Buildroot] [PATCH] utils/generate-cyclonedx: add support for
 certifi ssl context
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1000)>

Allow to fix this by e.g. using `make host-python-certifi`.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 utils/generate-cyclonedx | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 33e06ea86aa..183ddf60fbd 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -18,6 +18,14 @@ import urllib.request
 import subprocess
 import sys
 
+try:
+    import certifi
+    import ssl
+
+    ssl_context = ssl.create_default_context(cafile=certifi.where())
+except ModuleNotFoundError:
+    ssl_context = None
+
 CYCLONEDX_VERSION = "1.6"
 SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
 
@@ -39,7 +47,9 @@ SPDX_LICENSES = []
 if not SPDX_SCHEMA_PATH.exists():
     # Download the CycloneDX SPDX schema JSON, and cache it locally
     cyclonedxpath.mkdir(parents=True, exist_ok=True)
-    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
+    with (urllib.request.urlopen(SPDX_SCHEMA_URL, context=ssl_context) as resp,
+          open(SPDX_SCHEMA_PATH, "wb") as fp):
+        fp.write(resp.read())
 
 try:
     with SPDX_SCHEMA_PATH.open() as f:
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
