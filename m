Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D660CD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0721610A6;
	Tue, 26 May 2026 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lm_2nKRxcOMP; Tue, 26 May 2026 20:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D62C7610A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779826008;
	bh=5Eh19Q1ydY2ksIxRejfDYrT5Sqbkdth7sdWGo39IzL8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rQoz9sFx2kCJEe1etUTFh86xlSdrHA6FsM8rNmJu4+Yap5X9PhUjbkSEYILGwT9H+
	 MWEebAe33L2Z5kBjS1gkWVWSmfIaWe51N9gkDbMJMcDmkWs2M0uBTaPXeQ0YMB1tit
	 VyTjUk/JFBq2z5jRKlbLK4BmgPAzyio1AZg0tLYQEGDLvet9NsFMnC3/AFJxr3Ikjr
	 dxvij2UEESjVtBBIBQ4l0awkW5ODrkVCVTACjFzEZ+zJU5jVXWPz383THSAoReUPAi
	 Rmb+BHeQdXDE24GXBqi3NOcQMkMVWlc22E3gv3/25VOQIWNMpfE8/eGe3WLDMbUHA3
	 FcnKv7/BuPOmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D62C7610A0;
	Tue, 26 May 2026 20:06:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4866297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C661940C1B
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRR_14eOJS04 for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2091D4093E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2091D4093E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2091D4093E
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:06:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88DF0A4C2CB6
 for <buildroot@buildroot.org>; Tue, 26 May 2026 22:06:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39036)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRy2z-000000000xj-3BgW
 for buildroot@buildroot.org; Tue, 26 May 2026 20:06:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 22:06:40 +0200
Message-ID: <20260526200641.939539-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526200641.939539-1-bernd@kuhls.net>
References: <20260526200641.939539-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779826002;
 bh=5M2kh9HRK5GkTld91TBedVxcVhgfT+2JLn4r7GZKxXw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WgdQYP6LH+p9ctIUSviOoXMeOJrD3MbYWvph92Bn7rxsN7WPm31YtRZxy+HjVWC4b
 5Cp9VRtZ6BBoq4hkVQCVV7fPIxQ572XtkjM9I+FY+7xPSQ0If1zp+Dfr0oOROfnxKF
 7D4exyfLEzqan+R4+HrR48nPXjbdgcruWqsZHSryFMnzv6UYTgdtaTdWi1F3hUUQl9
 iLLsZtGg24j8x99ZohZE7AUEjjMrrkFOdHDazkJdrgmUwr5kQaN3LWe6EvuQ9eS7Sq
 AsGGQBx/r8XGPGhs1/UevhcvFgTjsRcNb8WOUTztu6vfoHJcptEWqOb7jW5stAuslV
 eINWzm0J23kVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=WgdQYP6L
Subject: [Buildroot] [PATCH 3/4] package/libheif: security bump version to
 1.22.2
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

https://github.com/strukturag/libheif/releases/tag/v1.22.2
"Fixes missing heif_image_get_bayer_pattern_size() function."

https://github.com/strukturag/libheif/releases/tag/v1.22.1
"Security
- CVE TBD (GHSA-r7qj-cg5r-r6vf) - Wrapped icef compressed-unit range
 check causes out-of-bounds read in uncompressed HEIF decoder
 - (GHSA-5hqq-636x-r3cr) - Out-of-bounds write in inline mask region API
                           when source mask exceeds declared region"

Removed patch which is included in version 1.22.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744

 ...eif_properties.h-fix-bad_pixels-type.patch | 28 -------------------
 package/libheif/libheif.hash                  |  4 +--
 package/libheif/libheif.mk                    |  2 +-
 3 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch

diff --git a/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch b/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
deleted file mode 100644
index 69c5d170fe..0000000000
--- a/package/libheif/0001-heif_properties.h-fix-bad_pixels-type.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ef124f9988e57a06ad6d102c236d2bb4b82aef5d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C8=98tefan=20Talpalaru?= <stefantalpalaru@yahoo.com>
-Date: Wed, 20 May 2026 00:37:24 +0200
-Subject: [PATCH] heif_properties.h: fix "bad_pixels" type
-
-Upstream: https://github.com/strukturag/libheif/commit/ef124f9988e57a06ad6d102c236d2bb4b82aef5d
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libheif/api/libheif/heif_properties.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libheif/api/libheif/heif_properties.h b/libheif/api/libheif/heif_properties.h
-index 9432bd46..0dec3a37 100644
---- a/libheif/api/libheif/heif_properties.h
-+++ b/libheif/api/libheif/heif_properties.h
-@@ -335,7 +335,7 @@ heif_error heif_image_add_sensor_bad_pixels_map(heif_image*,
-                                                  uint32_t num_bad_columns,
-                                                  const uint32_t* bad_columns,
-                                                  uint32_t num_bad_pixels,
--                                                 const heif_bad_pixel* bad_pixels);
-+                                                 const struct heif_bad_pixel* bad_pixels);
- 
- // Returns the number of sensor bad pixels maps on this image (0 if none).
- LIBHEIF_API
--- 
-2.47.3
-
diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index b88784b309..22697f307c 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.22.0
-sha256  8bd20cfa3201997b8f63266cddfabea2e1481467d7f992e6a2595e0bec691fc2  libheif-1.22.0.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.22.2
+sha256  eea48e4841f83fbe51d029337ffd2d14512d0203015dad40b90213d872958af3  libheif-1.22.2.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index e47620b167..4b23f1fda3 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.22.0
+LIBHEIF_VERSION = 1.22.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
