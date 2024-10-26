Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCB9D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F86D4033B;
	Sat, 26 Oct 2024 22:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3om8JN1nKuyU; Sat, 26 Oct 2024 22:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1725C4033D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1725C4033D;
	Sat, 26 Oct 2024 22:14:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38AA25C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 188D94033D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPuYQ3onmtZ7 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC8154033B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC8154033B
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC8154033B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:14:53 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a4e30bffe3so8005655ab.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729980892; x=1730585692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bssVVbxOCw04Eyr1Szo+ae/tbWxct9ML9VD9pNqVNYs=;
 b=K0AnWr4Nk3AtFL0VThuKdLFIwvizZ6Tkkqlxwc4Sbt1DojCgNQFawofVnc5YXyIhhp
 G1ZrJ7q3dxMBFJPW+3OdVvd5r0fqnYw99XkpcVVwFgOdgwhoCiNgQJ3llwYBPBmbWcwZ
 /pabsgapUNQ2HBT2C0mg44N0eBrTmkALd2rC5rYsnqwGJjT17RVVz04XGIuINJoASEOt
 gn1ghoH/2K2vvPGapbKsJFphwOkjUKCjgsYnc3tqu4d/eeKYbVLA2FGKE2J+qcadB+fX
 MjS/Ig3zIutMhLJbdvsVCimJaaESpSkqUH8uM36L2uOjE9yc5O1yBDmshsLwjqzRaeE4
 /vtQ==
X-Gm-Message-State: AOJu0YwI8JUbeVuZvFlelspWE0cNxHQORaGx7ZJJYLvmSxhbHIxtD7xg
 TBi0En8B4744FwowfQz8T5xHLpSOrAimkEU/E/hKxfNcXkxGXocpd89YHg==
X-Google-Smtp-Source: AGHT+IG8IgkhIqcAqmB75DGD94Si+H9FtAzsk2VcEyVs0Y/Js2+DJvpjFg2qASn8Blk2t6/E+xuoCA==
X-Received: by 2002:a05:6e02:1568:b0:3a1:a163:ba64 with SMTP id
 e9e14a558f8ab-3a4ed264feemr30950095ab.3.1729980892206; 
 Sat, 26 Oct 2024 15:14:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72617608sm918901173.65.2024.10.26.15.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:14:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:14:50 -0600
Message-Id: <20241026221450.3786172-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729980892; x=1730585692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bssVVbxOCw04Eyr1Szo+ae/tbWxct9ML9VD9pNqVNYs=;
 b=mmHZjdL9YtGWxQeRAX4sYBkzaqR6HMISQ+CJego2A8lGQ2VRI6TzOl80lPCWxa9QXn
 Jo2dinPSUWY5oA6ae37MQIAGiQtV/8LuDl9JmhE4LrKgr6jzOIVf7X4x4ZsdoUWL5Msn
 ededvnVK2bxvR1x72benUesY76SQn4kooCIERJ9Pt8PiONDtyzG4Kxb4M7GDK7AscuXU
 YqSQ0S51ZO0hrWzh+MKyYIZ0IbDsSOIWgefX7AjmYffUt85eOyBe6QWdfTdgscDqBW86
 5A1o0/E5WG5vFklvwSK/K8h4vekzKfETv7bW/Kf/ICYH3ElXJY4Y7Uy+wiqRoim+ZXv0
 t9Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mmHZjdL9
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 11.0.0
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate build opts to new format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash |  4 +--
 package/python-pillow/python-pillow.mk   | 38 ++++++++++++------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 91626319b2..0ef6ebc820 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  869758b3c5f5d8c15ffda4c8011b78d6  pillow-10.4.0.tar.gz
-sha256  166c1cd4d24309b30d61f79f4a9114b7b2313d7450912277855ff5dfd7cd4a06  pillow-10.4.0.tar.gz
+md5  22912b3db645a51ab4b4ff036b559ca8  pillow-11.0.0.tar.gz
+sha256  72bacbaf24ac003fea9bff9837d1eedb6088758d41e100c1552930151f677739  pillow-11.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 62e87951c9..e87c817c68 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.4.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/cd/74/ad3d526f3bf7b6d3f408b73fde271ec69dfac8b81341a318ce825f2b3812
+PYTHON_PILLOW_VERSION = 11.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/a5/26/0d95c04c868f6bdb0c447e3ee2de5564411845e36a858cfd63766bc7b563
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
@@ -14,60 +14,60 @@ PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 
 PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
-PYTHON_PILLOW_BUILD_OPTS = -C--build-option=build_ext -C--build-option=--disable-platform-guessing
+PYTHON_PILLOW_BUILD_OPTS = -Cplatform-guessing=disable
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 PYTHON_PILLOW_DEPENDENCIES += freetype
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -Cfreetype=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-freetype
+PYTHON_PILLOW_BUILD_OPTS += -Cfreetype=disable
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += jpeg
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg=disable
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 PYTHON_PILLOW_DEPENDENCIES += lcms2
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -Clcms=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-lcms
+PYTHON_PILLOW_BUILD_OPTS += -Clcms=disable
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 PYTHON_PILLOW_DEPENDENCIES += libxcb
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -Cxcb=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-xcb
+PYTHON_PILLOW_BUILD_OPTS += -Cxcb=disable
 endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += openjpeg
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg2000=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg2000
+PYTHON_PILLOW_BUILD_OPTS += -Cjpeg2000=disable
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 PYTHON_PILLOW_DEPENDENCIES += tiff
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -Ctiff=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-tiff
+PYTHON_PILLOW_BUILD_OPTS += -Ctiff=disable
 endif
 
 ifeq ($(BR2_PACKAGE_WEBP),y)
 PYTHON_PILLOW_DEPENDENCIES += webp
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webp
+PYTHON_PILLOW_BUILD_OPTS += -Cwebp=enable
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=disable
 endif
 else
-PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-webp -C--build-option=--disable-webpmux
+PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable -Cwebpmux=disable
 endif
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
