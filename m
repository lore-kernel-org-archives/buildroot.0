Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2695ED2629F
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 00:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B7B60C1F;
	Wed, 21 Jan 2026 00:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPnHTkxEV3wh; Wed, 21 Jan 2026 00:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50C3D60C10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768956476;
	bh=gFT53aG0Edyv7F2i+tUxKPeNYJud/z00r6Z4grs8Ndo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LbAf2OxqeKx7rjJqzJ4SYPZur/CgK3jtvObJv53y/ZqYRg1f0zgZHSZbNieNWd/3C
	 dn4NTFzw1+OuSpRFiOzsRXAZt21ReGbtW0yYo4TMeKgD3V2TSFBA7aI4akJpckCKuu
	 YXPGebyBhIY5Kw061uFx4jGRFrwixqplmPP1YisyFPss9lK5KPs2NSLYcQ28kVStFU
	 CYu0Xqwt01U5JhhLpaGh1Vz+c5UqOlL+f8+4HzNSxUaQMvbbout6SC3mnmOEKsD/rn
	 pZCPX2ObJtUsc/2aj4HbUFUJFGYX8/YcQRto2BUG9MQp05JqXxerC250N2W0aEbx7E
	 JHIumHxbz39wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C3D60C10;
	Wed, 21 Jan 2026 00:47:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3CBD160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 00:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC94060C10
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 00:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fA-vrRGa80r for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 00:47:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AB6060C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB6060C0A
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB6060C0A
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 00:47:53 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-662b678a625so196268eaf.2
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 16:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768956472; x=1769561272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OnMf6Xzn6PQ3oH2v12os8HI9mFakbpkrRNVJbyLd5Jo=;
 b=LcX0VXLCxrF96FXYt+9JDUk9fuXJV+ijQEK+TZTwvVq/zPpvkD9QrNRJzt5PBH3CsA
 QuvsEpsZn1sRY21Jmb4PpC/8XL8l5Gb92dVSt1FmuPNq9zGwQGVukOosmYga4uVEKcwP
 w8H3LevkyNcTpXRrLJ/d4ODCyeVnrcP+sj4mH0iFOiJV66bhnqqCLwoFrx1M6htWI0p+
 6QsTVOxbjLgdAD7fMOlH3L4Q4L5SldvzMU7cuhlTC9MDOHF/mx0AmmlIa3/xzXDJcUCt
 hvOqcdHSAqRHeFzBxziQh5u9YdiHPhNYO50pGByEWjqkONfNul1ZatTnHJ7hI3nfi0a0
 2fnw==
X-Gm-Message-State: AOJu0YztjSKDc1Ilo39zb+Vsj26LabA34yJu2DCcGYx1QHn7EaPFnC32
 CUEhMe9uQQsRnb0Zzu1wSAMyzsCvLIsOWP90/tX2t0Rxs47iXRfys2YcjUTsGGeK
X-Gm-Gg: AY/fxX5TapQIGMMfl8hEMwrSEnDgBO5JBnee3+hnhQjEN9S70aBCKIShY9OtzFMJoMM
 ZTmQI38CVM65ZGJ31GTXlJewuIZBK+znxPxl7CG7Y//+KYhPVLQWO5l8KbMGAd+jbhL13JS52Dl
 rpj8yYO6O2ThVgQG8IbVShME1X/5JMSaplp3pYrsQBFcPTLFGIqYwZu4uHh/xKU9cAX8m/8BHkL
 Pw3tzR5fnXgID2iHXa8A/L8vgWgaT5+d0VZYg5L1I5iSSarJYHZbnPulSGKB79Zyniz72QDXObF
 H7nKqvSXCMNpS30heD23t9Vq+RPNfWQWPgnyblpHvWo//Geu4rj2ICYkTP1KYLYgaMrRRXz6nPh
 B3Pn9GKZqgoVUh4Ntk9mXwJC1QC2Rq9SSNswvgCP4ErR+2Qy5wEaVEKoDanx49zmLhB/hOZG9Ce
 BZhE+rmremIuWcJaZQtyIBNGB2vzi1xV+9S2ZHRK2E+caAPNgw1Ux/9TMPoJsaixyjE3vyQMmM4
 G4hfbyBEOTxcGV5TtAPYNQGovoaZ9mQjJC1KpUNy90BFfj0MY5wOQ==
X-Received: by 2002:a05:6820:2218:b0:661:1b8:dde8 with SMTP id
 006d021491bc7-66117933588mr6697372eaf.15.1768956471948; 
 Tue, 20 Jan 2026 16:47:51 -0800 (PST)
Received: from james-x399.localdomain (97-118-158-110.hlrn.qwest.net.
 [97.118.158.110]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-662b71c09a3sm559906eaf.9.2026.01.20.16.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 16:47:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Jan 2026 17:47:47 -0700
Message-ID: <20260121004747.1348473-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768956472; x=1769561272; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OnMf6Xzn6PQ3oH2v12os8HI9mFakbpkrRNVJbyLd5Jo=;
 b=VKnJZvyCfQOyYHcZL2flF5l8G2CgSyzR/PVC7ocEFkIqKTf9ys8zgwG62IIr600ZFB
 z8fUSnu/EAF14Dd6HxK69W4aFg6LaxcOjkXvWqzx3B8p63wG4yzjqR38b0kkr3vWhZ0k
 dldlRL21CEXVzfzXzpDCo8VGxhqZcdHR50khihwVVdUaa/6Y5idZatFISfCzjjqelEI8
 MOUf0pY2wnkOtEYRF0rNdrIVgkJbZRCHYmfm5SVA/UD3Scl8BhmublAxrYnX60OIFqo8
 m0njtjqPeD1WRAmXNMEsRhpVmYClKX/qSqjm4uFZtBiApC++M/HT/kSBfb694cT4ySXn
 zjYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VKnJZvyC
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version 0.3.7
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

Drop Update cmake_minimum_required to 3.5 patch which is now upstream.

Rebase do not force the build of a shared library patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...xt-do-not-force-the-build-of-a-share.patch | 12 +++--
 ...Update-cmake_minimum_required-to-3.5.patch | 53 -------------------
 package/libubootenv/libubootenv.hash          |  2 +-
 package/libubootenv/libubootenv.mk            |  2 +-
 4 files changed, 9 insertions(+), 60 deletions(-)
 delete mode 100644 package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch

diff --git a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
index 9c5438f30e..24935bb1d9 100644
--- a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
+++ b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
@@ -1,4 +1,4 @@
-From 5448ca9d92f7fa197060323a82a5f060ce7c31e7 Mon Sep 17 00:00:00 2001
+From 5ccdd0f15ca3fc1c57b517bf325d572a5398e3cd Mon Sep 17 00:00:00 2001
 From: Pierre-Jean Texier <pjtexier@koncepto.io>
 Date: Wed, 22 May 2019 10:26:27 +0200
 Subject: [PATCH] src/CMakeLists.txt: do not force the build of a shared
@@ -26,10 +26,10 @@ Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 4b71bc5..0b515f4 100644
+index 3370232..efa9840 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -15,17 +15,15 @@ SET(include_HEADERS
+@@ -19,11 +19,9 @@ SET(include_HEADERS
  
  include(GNUInstallDirs) # for the CMAKE_INSTALL_LIBDIR variable
  
@@ -40,7 +40,9 @@ index 4b71bc5..0b515f4 100644
 -ADD_LIBRARY(ubootenv_static STATIC ${libubootenv_SOURCES} ${include_HEADERS})
 -SET_TARGET_PROPERTIES(ubootenv_static PROPERTIES OUTPUT_NAME ubootenv)
  add_executable(fw_printenv fw_printenv.c)
- target_link_libraries(ubootenv z yaml)
+ target_link_libraries(ubootenv z)
+ if (NOT NO_YML_SUPPORT)
+@@ -33,7 +31,7 @@ endif(NOT NO_YML_SUPPORT)
  target_link_libraries(fw_printenv ubootenv)
  add_custom_target(fw_setenv ALL ${CMAKE_COMMAND} -E create_symlink fw_printenv fw_setenv)
  
@@ -50,5 +52,5 @@ index 4b71bc5..0b515f4 100644
  install (TARGETS fw_printenv DESTINATION ${CMAKE_INSTALL_BINDIR})
  install (PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
 -- 
-2.30.2
+2.43.0
 
diff --git a/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch b/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
deleted file mode 100644
index 531623bc53..0000000000
--- a/package/libubootenv/0002-Update-cmake_minimum_required-to-3.5.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 87581f45d442903af8a9f331b11052bdd836c7f6 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 14 May 2025 14:03:38 -0600
-Subject: [PATCH] Update cmake_minimum_required to 3.5
-
-This supports compilation with cmake-4.0.0.
-
-Fixes:
-CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-  to tell CMake that the project requires at least <min> but has been updated
-  to work with policies introduced by <max> or earlier.
-
-  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://patchwork.ozlabs.org/project/swupdate/patch/20250514201740.686772-1-james.hilliard1@gmail.com/
----
- CMakeLists.txt     | 2 +-
- src/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 796d7bc..0a11730 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,7 @@
- #
- # SPDX-License-Identifier:     LGPL-2.1-or-later
- 
--cmake_minimum_required (VERSION 2.6)
-+cmake_minimum_required (VERSION 3.5)
- project (libubootenv C)
- 
- # The version number.
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index c56d0c7..3370232 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -1,7 +1,7 @@
- # SPDX-FileCopyrightText: 2019-2021 Stefano Babic <stefano.babic@swupdate.org>
- #
- # SPDX-License-Identifier:     LGPL-2.1-or-later
--cmake_minimum_required (VERSION 2.6)
-+cmake_minimum_required (VERSION 3.5)
- # Sources and private headers
- SET(libubootenv_SOURCES
-   uboot_env.c
--- 
-2.34.1
-
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 986b651e42..4b48c5527c 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7946006781ad518aac1f06e2ad7e0281e4ece3d59e9616cccb01fd0c169a3e0b  libubootenv-0.3.6.tar.gz
+sha256  92021fc5a0a965030588d0c867a771d28b28c0d17c9fd022f0dafe9f01de714e  libubootenv-0.3.7.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 5c2c36e90b..b18486af6f 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.6
+LIBUBOOTENV_VERSION = 0.3.7
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
