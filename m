Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0DFCAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F1181189;
	Tue, 16 Sep 2025 01:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fb0h9ylQFQRR; Tue, 16 Sep 2025 01:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F1BA8120B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1BA8120B;
	Tue, 16 Sep 2025 01:41:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D81A199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F5E160C28
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGALgmrXNRpI for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CB6A60B96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CB6A60B96
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CB6A60B96
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:41:26 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-423fb9a534cso15367155ab.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757986885; x=1758591685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KpeYyfG/oBqMk/wt7f9lYo8hPJ1bn4zP9AxsY9Yei/A=;
 b=mXM4nyV+88A56m2e8oOJ6pIm7bTbMSIbc0VqcT6cUnyXvQUi/o27YDc00P0YLz2HyZ
 eAA1DrqsjAd9qwa6f2w/h//gVmttWuHj8g/9mCcLK/GMpEJ7tGLDqSkL6GandpO6ZPRK
 Kk4xCXWYymE1YJHlULwb1dg4Q0c+GyYZFTwsEVov8BFtG0vccxSGT0QW2BuM3t38mFSn
 G327KVQJkgtbaBPFazPsNXsuSpOUEQtGLRHb+jEUpOrxtO/7OM0JUI73jC0YWfjRBzqN
 CJkvpHimtARXHqgZDt8cIQ5H+9If9cL3zfBVBHsenj3VdHj9TNeHWeLKg+ZfSsBglsnr
 XP7g==
X-Gm-Message-State: AOJu0YzquEjr5vcOFigpDfWk8belfj55NMB7vEXxw+iS5g5eAj4s+Ssp
 z7DhkN/keXMKHSn/Xzaef0JpWO4/S+z2z52ZBMc5xYiVl0DCSgNO/hPKX+e4lg==
X-Gm-Gg: ASbGncsjQa+duGukVAKFUysRVoHkUjoXtY4caiCHdYYryHc8HOw5V+OsdzYKTWI2D3I
 hZ2XfxLvWL7uRZwX+CB07eUXDsXaYDURIOnczlSxc1bxWrX4UFRVc6ZV87FiJAnTxRqJgTGg3vM
 omtISz4AVJRCv7c9v8CtxtVwFfRKk8lil3HTEhS4a6WK3rnM24yDFwz/pV4eYvskJoGTsm9xrh+
 4zAicvJM0NIU/1/ujssq/ZyVE5opwOPuYoiEmNj9Ffmlq00otkRVDlYzyknx2kLwC3h11LlbUXx
 fz9bXToaSMVRezCzdKERYncjL1JcVvBJwl8oXPcClz3plwVLErrhvViDkQTQaotqwSUZLACj9GZ
 tI3I10+PTQ5kqKSMHEHSWUeJwZmC4foBkuFQtf1bWF2NiwXFQJVdER4O6PrR/UZmlDAno/pbSKn
 hRnM7N4k6Xu6c=
X-Google-Smtp-Source: AGHT+IGpNsBP0eN0NuvoLIwGazk3TIy4pPHJY5+9h2iAjX9PCeqaOZC7sizvkGA0MVKwWdf2jlMiAA==
X-Received: by 2002:a92:cd8c:0:b0:424:162:82ef with SMTP id
 e9e14a558f8ab-42401628981mr56798215ab.28.1757986885054; 
 Mon, 15 Sep 2025 18:41:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41dfb14c391sm63579865ab.41.2025.09.15.18.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:41:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:41:23 -0600
Message-ID: <20250916014123.2601723-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757986885; x=1758591685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KpeYyfG/oBqMk/wt7f9lYo8hPJ1bn4zP9AxsY9Yei/A=;
 b=kh0k89hozr5ViNjx3iDsWyEnbC9rW3P/bcxWrncq82rP7lieuUP/nYTzGAYHhKwQyF
 c2Ia8Mv+Rs+mEvFjhQI7hd6y7EOTR8qx7wvjJ5D/2I71AmL1WZ0Uy3tIA7ChWNC+kzjD
 nA8uKv8ry+luJF+eKGUKUK+znsF8Fae0oStWK/nY3+wcaLW7uJe3bklQl0GDm4gLP7of
 hwaaTE+NzYqCemM5Ub7QKaLzcVHO3RQdDm5TTHfFQqIMysvXF49HAQ+R0SMHmwG4OpHU
 gTz3rVxKuZy5Lj7+06Porz3E1G9fkOapMzXtjc9QflSv9BuZd5j4aSUbzq+E3EkM+Sx9
 5G4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kh0k89ho
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to version
 1.3.0
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
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index e4e6a8f181..a259fd2d5e 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  f80cc64db8e7fd8f8403a5e8a0562d4d  build-1.2.2.tar.gz
-sha256  119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c  build-1.2.2.tar.gz
+md5  48f7fbc11051430eab3c1abe216bed7a  build-1.3.0.tar.gz
+sha256  698edd0ea270bde950f53aed21f3a0135672206f3911e0176261a31e0e07b397  build-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index 9404f08302..45ae7818c4 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 1.2.2
+PYTHON_PYPA_BUILD_VERSION = 1.3.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/dd/bb/4a1b7e3a7520e310cf7bfece43788071604e1ccf693a7f0c4638c59068d6
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/25/1c/23e33405a7c9eac261dff640926b8b5adaed6a6eb3e1767d441ed611d0c0
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
