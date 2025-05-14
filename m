Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07338C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 18:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDDB83419;
	Wed, 14 May 2025 18:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4blHpTwN8-B; Wed, 14 May 2025 18:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D5683337
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D5683337;
	Wed, 14 May 2025 18:30:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8330A153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 18:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6912241F69
 for <buildroot@buildroot.org>; Wed, 14 May 2025 18:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EB2YQucWus6 for <buildroot@buildroot.org>;
 Wed, 14 May 2025 18:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 898C941F3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898C941F3C
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 898C941F3C
 for <buildroot@buildroot.org>; Wed, 14 May 2025 18:30:47 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3da79204277so486975ab.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 11:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747247446; x=1747852246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/iVLHfgFOpB9bubXYCSr6EIoTzmpdppUd4ZKwLYisA=;
 b=hmndNsff9k98m5NogD+m0QjtNnu2iPKWDvF4WJ72wcV/GWleNruvhU6xhMuk0W8Dkp
 Ha6+NKa5a7u2rn/qHciBBZHZ7JbWDrhnvroAPtX9rIn3o3WyUGQ8bvLc37+pLq5FDO5n
 6apdjsdrutEJ/Awc2+02dJDzbm3W5pE/8vNjv5AQNPPLhUrMDsDLM/4rGARSVe04PDEf
 2xen+jsVHWnj/+NariGw5sDJZ+Mck5Jmo3Ydp7e7uGoszK6ddPcgAhkz6HQDlZ9z5OLK
 dYtYFmlw47NMColD5O0T1XEPqned08NUxz7BStPHY+0n0BwlFs2zukxHF7z3dPkNYsyz
 K5YA==
X-Gm-Message-State: AOJu0YwxBTUozKfWCi1NCm5j9zxryucCVrq4MCbci2SA7tdcA3RSMxsi
 ULzaOTpOAzRGBYPP/JVpaexefXqs03/BFJa5x3tV59nslbCyNj4dsUhF/j82
X-Gm-Gg: ASbGncsmDF9sEgVuoyM2zJJb8w1AhwP7aaKJ0exp1u9V1F8PJI4OY+KDZmp5HVHaod7
 c2cpj/kf5brql4O5KxMqu4dTcZ1LdZq6903DqoXlD2wzJYM8qM7f/R4Q+r+ZxpD0MKCob2di1dM
 0UG0iYOwCGz1MtxwDcp08+kVEBTUFo94vL1W+uzV/G4qB1hcKw2jz9XskAvL8MYZbVbAEAq2YgL
 cyJHg6+bcweo7ylZLeRGcvyGhgRXWK+Fvw0KQV/4A9kHrTEuh+FNmht0QYIi8PUG6nRxxkFFEuC
 Qs9aLUI9lokkevAZA6TxS0MP/QKAJDa9c3SAkXWwIl/EYSYyy3zWV8atGFZOmOPk6L4m2NFNHPT
 UirPSps4BR4rSKqsUqk3ouxRqoi3SXQ==
X-Google-Smtp-Source: AGHT+IHVrUzyjguHS09LkScW2VXO5FJlpAlRUl7GTmMTKNGMgCYZcJZWgs4U290z6uEixRr0zergeA==
X-Received: by 2002:a05:6e02:1aa7:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3db6f7ea216mr63392465ab.18.1747247435910; 
 Wed, 14 May 2025 11:30:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa2e3b8983sm2418986173.103.2025.05.14.11.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 11:30:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 May 2025 12:30:30 -0600
Message-Id: <20250514183030.669645-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747247446; x=1747852246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/iVLHfgFOpB9bubXYCSr6EIoTzmpdppUd4ZKwLYisA=;
 b=gfB3p+2QxTQ5sGQnbFKEP7rWYAfTOIxXlftTJFEe6kNZyawXTnivsaRXVz0lLCmJY7
 x1zqXQsC2mCDGppgO7AvbYq7avx28dqn8fD94u3+SmkqQtoKjynxxlnEsfevC6zLui2F
 XtmA1M9dUIyleslM8+RZv+UTaWzfwfkGI+ME/KnmhStuooeo3k0wk4VihTZ9w+RqeF52
 4kyE33TKOeszcph4HHaxw5RgLAcfejQEOMR267+E4aWi4DegtaGkupaKiI2dJjQzA9vY
 DlAbH6RnHNzuVpCR8a1h9fKCLfPrzBb0oefds5vGwXht1BMyD6jXA3IRacYgIrmhWipy
 lSzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gfB3p+2Q
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump to version 3.1.0
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

Migrate from old sourceforge download location to github.

License hash changed due to year update:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/a927b489e22dffa309f3f617005c0cebaf8fc00c

Readme hash changed due to various minor tweaks:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/94c64ead85b4af254df089f16c10253598b0705e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 9 +++------
 package/jpeg-turbo/jpeg-turbo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index a929ae4dcb..821e78438b 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,4 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.5/
-sha1  edab071e7c5bc12f98a2a7ae499bd6b312770849  libjpeg-turbo-2.1.5.tar.gz
-md5  1c6e9f8550a82c6d4cd30b370c22a5fd  libjpeg-turbo-2.1.5.tar.gz
 # Locally computed
-sha256  bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf  libjpeg-turbo-2.1.5.tar.gz
-sha256  60c756742db3ad1913304e8b13f0e86e22e51adb50cc0b3333c163f7e45ceec1  LICENSE.md
-sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
+sha256  9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93  libjpeg-turbo-3.1.0.tar.gz
+sha256  96f5b328adbb78eeaaec6980d73fd558cb1e4d62560ed615646bc3cf5e532430  LICENSE.md
+sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 5e806156e8..df76e4d92a 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.5
+JPEG_TURBO_VERSION = 3.1.0
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
-JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
+JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
 JPEG_TURBO_LICENSE_FILES = LICENSE.md README.ijg
 JPEG_TURBO_CPE_ID_VENDOR = libjpeg-turbo
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
