Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC67EE7AD78
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 16:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 745E440C0D;
	Tue,  3 Oct 2023 16:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 745E440C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzlpV0jpCxbu; Tue,  3 Oct 2023 16:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A50941463;
	Tue,  3 Oct 2023 16:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A50941463
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6D01BF370
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 16:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6681C60F3E
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 16:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6681C60F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-daUTaWWzft for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 16:36:19 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2298E60EF1
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 16:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2298E60EF1
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3ae1916ba69so707373b6e.2
 for <buildroot@buildroot.org>; Tue, 03 Oct 2023 09:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696350978; x=1696955778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YyBzp/bwlQRld7VTeNZpyL2qMWDtYV0ZUW/9f4rZoYI=;
 b=qkI2njoyt13oTk5i8VXRsf73NXbGkka6J+ZV5ULjbcqtFCKdZOpYLy8kl/xnTZ1aaX
 DC7WLcT/07rImjW+rtp5ipZ/2JHF2xdsfL4jML477stuPr8uEIobAiw8GSFJjCHaeeOS
 vPkpKiJuAZCNvWOSkwZdguPdFkD3L1SYsrAAo0nZn7M+cFezdZ+IHzkf2CNJXa6ebtDt
 7rJIx/72qA+SGSiTKbZDeAfi5DJIZ/+avEPJ7VFEVSSwIWdHGi/yge4iT2iqliFlPt9U
 ir6iPAInBSx7h4r06jwQBrPwSoAd0nF7UjYaI4X0T9J8OdMNYYO6ChJ93dy9ZESWqE8y
 JFpw==
X-Gm-Message-State: AOJu0YwDtR2gdYQVU/gTrP7wSzjM20wWLp5XoCpgvoriMqth8TdS2ODB
 n8O51gcPYejs2VI7+bcCa3jkHtxhaA0=
X-Google-Smtp-Source: AGHT+IFyhLkcuvf5kcUadsa74FT55vRSyNzB0EYA7Dbu3sFhnL0rkdK39UFo4HkXm6/7qwsmIo0Dxg==
X-Received: by 2002:a05:6808:a81:b0:3ae:1675:700e with SMTP id
 q1-20020a0568080a8100b003ae1675700emr60419oij.36.1696350978092; 
 Tue, 03 Oct 2023 09:36:18 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:f06:9497:85ae:5cad])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a17090abc8500b00276e8e4f1fbsm8389246pjr.1.2023.10.03.09.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 09:36:17 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 01:36:13 +0900
Message-ID: <20231003163614.1177692-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696350978; x=1696955778; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YyBzp/bwlQRld7VTeNZpyL2qMWDtYV0ZUW/9f4rZoYI=;
 b=moFNlm+N3Y1098jqz6+dh2++fy1Nx9PgGAFnGZOT651cVoLyCmYZyh1Tcu4mfwaB8K
 oJ/GzRCRnGwkRdPow1fegVanCq58kAmOckWCPEg8QN1/QAbbmfer5oHvY7ELZ0Re4ju8
 6VUuSGBUK5WsmJ6xfegnrr4mqf0okOrwnY8LDvV0NCoZTPgf0aTxmhb8aqiOb0T3mPbM
 VmN9Y4VWdxqZJ/0cXfyKQHksvsQCJBbOQnIywx5+78s82mLbn+Zio7eYt6n9oRJSGpw1
 o8S1emcyKHLrK2ivjBbw8ZZkBlWlQClYGqhR5WVD5E4+u398VnLzmB4YWYb+OkZW8k+/
 mbjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=moFNlm+N
Subject: [Buildroot] [PATCH] package/gsettings-desktop-schemas: bump to
 version 45.0
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
Cc: Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This update is required to install the latest version of the GNOME desktop.

Currently, only gvfs depends on this package, and we have confirmed that
gvfs can be built.

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 DEVELOPERS                                                    | 3 +++
 .../gsettings-desktop-schemas/gsettings-desktop-schemas.hash  | 4 ++--
 .../gsettings-desktop-schemas/gsettings-desktop-schemas.mk    | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c45e7315da..24d2f5c946 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2823,6 +2823,9 @@ F:	package/reproc/
 F:	package/termcolor/
 F:	package/tl-expected/
 
+N:	Takumi Takahashi <takumiiinn@gmail.com>
+F:	package/gsettings-desktop-schemas/
+
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
 
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
index bad8eab91d..0d80c87e06 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gsettings-desktop-schemas/3.36/gsettings-desktop-schemas-3.36.1.sha256sum
-sha256  004bdbe43cf8290f2de7d8537e14d8957610ca479a4fa368e34dbd03f03ec9d9  gsettings-desktop-schemas-3.36.1.tar.xz
+# From https://download.gnome.org/sources/gsettings-desktop-schemas/45/gsettings-desktop-schemas-45.0.sha256sum
+sha256  365c8d04daf79b38c8b3dc9626349a024f9e4befdd31fede74b42f7a9fbe0ae2  gsettings-desktop-schemas-45.0.tar.xz
 
 # Hash for license file
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index b77397d565..b47097b9fe 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.36
-GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).1
+GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 45
+GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).0
 GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
 GSETTINGS_DESKTOP_SCHEMAS_SITE = https://download.gnome.org/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
 GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING = YES
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
