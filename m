Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B3C0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 16:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9FE241564;
	Sat, 28 Oct 2023 16:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9FE241564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_umPCv96ZrC; Sat, 28 Oct 2023 16:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B76F1415C6;
	Sat, 28 Oct 2023 16:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76F1415C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0DB11BF865
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7423611D5
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7423611D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLxna7gVIpDs for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 16:13:09 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4386611A1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 16:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4386611A1
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40839807e82so17872595e9.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 09:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698509586; x=1699114386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sSuirZJUFYUpmTdP+j+ma5xKHz0BlAd1+B2jVY0ns6Q=;
 b=YonAS9JU0fC5eMhDzuf/8e8b6GENLEcWmHOOWmJVf9iDhMATEZBNC90IWmSmyBdfm+
 INlZtL7kEYe12Bv8jR617ha82l1oFzrkNFfVgY4B4KJygaw/x0nULj2DqiHhv00XayaH
 3J7p7FlI2lmdCKx2r95m4ACWF4qdhD+ukQebqdAxtrhr3yH6ykS1tQY8hvI/YdvPceef
 Q2pjTXS27PmlIpmpik+lY1m1Nco2RRu+8L6yLi/aITa/nDDwsQbbElzCPqI7/t6UeEks
 MPrzfs9ZB5Y8MVm0wCqgWZQIzU4K2l/AtqcX4Je1gsSJonW4AJl95+bDfi8K3I9zM+AS
 PnbA==
X-Gm-Message-State: AOJu0YwdyMHa4i7ZaXV0TV5pDVTlXY9r/bNyMQ2RpWa7BoMsHlYTKU9T
 c+lxxLIHPmFxh1axAAl+hOG/M6Sfdw0=
X-Google-Smtp-Source: AGHT+IEP2cP6R2QPLJ5Dw++LegkS4HUfSPqgdMxzN/KJEKcZ69EZYucgeE3hSXjnORLBHp66C73sPg==
X-Received: by 2002:a05:600c:1c14:b0:405:358c:ba74 with SMTP id
 j20-20020a05600c1c1400b00405358cba74mr9904019wms.0.1698509586004; 
 Sat, 28 Oct 2023 09:13:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o1-20020a05600c510100b003fe1c332810sm7889463wms.33.2023.10.28.09.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 09:13:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 18:12:44 +0200
Message-ID: <20231028161244.221857-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698509586; x=1699114386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sSuirZJUFYUpmTdP+j+ma5xKHz0BlAd1+B2jVY0ns6Q=;
 b=cGQB32OaldpRHZDhP7fDhq+5/8dRSbeO9IB4JTnlZDiGeRxWrvaLp/aBLE1O8Ak7hd
 lxoCCXMhG34u/pphmNrz8aBRsUlamRaAcyQSToCGWuW6M02Jg1AnD+M3qM3EpuxEj+g9
 s/o3I/rwW0V4biytwTGxzDDniGLKfOWGLdkUEsYLDeBrtVg7eM4q3BwUSXQWybI4z/m5
 kqYv7jaJ11Kw86hnmGTPenZjpxDkkpDr2LX33WJRrP4fdQXEewtVyGBAEn30fCtqkfGb
 l3RDTbk00qqF3LBexMmQ2XOp2O3FvQ5+nExDWlJQcIqWjXvnOq2OKmkgBzT1tGbm0DyP
 eiuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cGQB32Oa
Subject: [Buildroot] [PATCH 1/1] package/tiff: security bump to version 4.6.0
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

- Drop --without-x (now unrecognized)
- Fix CVE-2023-40745: LibTIFF is vulnerable to an integer overflow. This
  flaw allows remote attackers to cause a denial of service (application
  crash) or possibly execute an arbitrary code via a crafted tiff image,
  which triggers a heap-based buffer overflow.
- Fix CVE-2023-41175: A vulnerability was found in libtiff due to
  multiple potential integer overflows in raw2tiff.c. This flaw allows
  remote attackers to cause a denial of service or possibly execute an
  arbitrary code via a crafted tiff image, which triggers a heap-based
  buffer overflow.

https://libtiff.gitlab.io/libtiff/releases/v4.6.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/tiff.hash | 2 +-
 package/tiff/tiff.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 0fa503a02a..3aae7dc4d5 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b  tiff-4.5.1.tar.gz
+sha256  88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a  tiff-4.6.0.tar.gz
 sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 0006f461a0..e384e8b814 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.5.1
+TIFF_VERSION = 4.6.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = LICENSE.md
@@ -17,14 +17,12 @@ TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPTS = \
 	--disable-contrib \
 	--disable-tests \
-	--disable-webp \
-	--without-x
+	--disable-webp
 
 TIFF_DEPENDENCIES = host-pkgconf
 
 HOST_TIFF_CONF_OPTS = \
 	--disable-cxx \
-	--without-x \
 	--disable-zlib \
 	--disable-libdeflate \
 	--disable-lzma \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
