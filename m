Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844FEC47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 22:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28B0A4016B;
	Fri, 26 Jan 2024 22:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28B0A4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxH9JAXVBfUj; Fri, 26 Jan 2024 22:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAC1D40338;
	Fri, 26 Jan 2024 22:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAC1D40338
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 515B11BF3C8
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 22:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A4EE41FC4
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 22:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A4EE41FC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgO9J_NNAu4i for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 22:13:28 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0532641FAC
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 22:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0532641FAC
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so931059f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 14:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706307205; x=1706912005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hvXayTtR26CNNJAbRbmXq9KbTIp0qp+MADJ14VWisNI=;
 b=R7HLkvdYMGb/Q9V1a4AL+IdzNCuFOpeDgeTq1mLecVNa93OuOG1tVwH1+qLahzC0up
 RaWodiD3xScjfO1Br6m0lJq/S/W+NNoWK6nJ14LnopP2MnuA8yW5VRJrX5MuTVhYZstS
 8sG9AOv9PC6AZ/+fTVaA7ILcc3Q9U4ynKlhZ6G0wXZwMc2p2iISrvO3trWZchmL4IiDO
 ayPMn8mH9hjl4U1b12iLWrRVCU/rfe59ORYkrC4Qqzci00PDzD5EhIH48akGhCDo/ba1
 zkXBtaaTK31OthXSjMPmD9KNK7M9Y7qrqST83bxioNXx3pgH5wdijyT79YHKQpO1hm7I
 x7vw==
X-Gm-Message-State: AOJu0YzGJfPIii4gwgJ9UV+Ue0Qn4rmhZ7xjQv5IK550uhtn+RTSz3rU
 M2d2neV7jkpVFdwX4WVzcgh5e9c8GfIoS5eqr1FxU86qvfED4rCGW/7F+H/m3E0=
X-Google-Smtp-Source: AGHT+IGU4wDIR9oR9OanBJ+80FHYyyR73H11KFLiry2ipo8KIuZ2dc/kQKwAg4xQTTSDCpQwgzbC3Q==
X-Received: by 2002:a05:6000:18a4:b0:337:d6d9:bf3b with SMTP id
 b4-20020a05600018a400b00337d6d9bf3bmr246154wri.117.1706307205188; 
 Fri, 26 Jan 2024 14:13:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h13-20020adffd4d000000b00337d1c832basm2089198wrs.113.2024.01.26.14.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 14:13:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 23:13:23 +0100
Message-ID: <20240126221323.1780561-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706307205; x=1706912005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hvXayTtR26CNNJAbRbmXq9KbTIp0qp+MADJ14VWisNI=;
 b=nhf5A7IMYJXWsx+TbptZoKh8QEeMxDkd1zOQejd6K7QcKSYLbhfJUmPDIbtQ5VU3ru
 UUJWYd/3fQ6nsb0b88EL4N9wVElky0U7+qeYxvapqo7v79g1BMWH8SNKgV/RULrDVsV6
 9oIeeOp+5lxTvhQ+9bKMMMgeFNCIeZgst8YMkWNky2Cf+vthqkx8xiIIAj8JxYrcG8zY
 VM9IA+kD9Xdk+j7qUcXrBhFc0IiAOO9VQ+eiORkzLgSpSaSW+hrpI+UxRRwl4I05BJ0Z
 Xc9zlw6YRCkhjDqk2Zr1q+9uKRy2ZNjZ7bp0mcZbd1fqdRTka4squmCE5OkBdkoYDyhD
 KWiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nhf5A7IM
Subject: [Buildroot] [PATCH 1/1] package/minizip-zlib: bump to version 1.3.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/madler/zlib/releases/tag/v1.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lows-of-zip-header-fields-in-minizip.patch | 39 -------------------
 package/minizip-zlib/minizip-zlib.hash        |  2 +-
 package/minizip-zlib/minizip-zlib.mk          |  4 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch

diff --git a/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch b/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
deleted file mode 100644
index f4eacc7fdc..0000000000
--- a/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
-From: Hans Wennborg <hans@chromium.org>
-Date: Fri, 18 Aug 2023 11:05:33 +0200
-Subject: [PATCH] Reject overflows of zip header fields in minizip.
-
-This checks the lengths of the file name, extra field, and comment
-that would be put in the zip headers, and rejects them if they are
-too long. They are each limited to 65535 bytes in length by the zip
-format. This also avoids possible buffer overflows if the provided
-fields are too long.
-
-Upstream: https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/minizip/zip.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
-index 3d3d4cadd..0446109b2 100644
---- a/contrib/minizip/zip.c
-+++ b/contrib/minizip/zip.c
-@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
-       return ZIP_PARAMERROR;
- #endif
- 
-+    // The filename and comment length must fit in 16 bits.
-+    if ((filename!=NULL) && (strlen(filename)>0xffff))
-+        return ZIP_PARAMERROR;
-+    if ((comment!=NULL) && (strlen(comment)>0xffff))
-+        return ZIP_PARAMERROR;
-+    // The extra field length must fit in 16 bits. If the member also requires
-+    // a Zip64 extra block, that will also need to fit within that 16-bit
-+    // length, but that will be checked for later.
-+    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
-+        return ZIP_PARAMERROR;
-+
-     zi = (zip64_internal*)file;
- 
-     if (zi->in_opened_file_inzip == 1)
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index 23bfda8474..cbd9313870 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  8a9ba2898e1d0d774eca6ba5b4627a11e5588ba85c8851336eb38de4683050a7  zlib-1.3.tar.xz
+sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
 # License files, locally calculated
 sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 81fee3c687..6d4a2d2e20 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.3
+MINIZIP_ZLIB_VERSION = 1.3.1
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = http://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
@@ -16,7 +16,5 @@ MINIZIP_ZLIB_AUTORECONF = YES
 MINIZIP_ZLIB_DEPENDENCIES = zlib
 # demos must be disabled to avoid a conflict with BR2_PACKAGE_MINIZIP_DEMOS
 MINIZIP_ZLIB_CONF_OPTS = --disable-demos
-# 0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
-MINIZIP_ZLIB_IGNORE_CVES += CVE-2023-45853
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
