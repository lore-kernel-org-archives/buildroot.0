Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B67C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 06:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C2FA825B9;
	Sat, 25 May 2024 06:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxZcEwdFder2; Sat, 25 May 2024 06:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF3F5825C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3F5825C6;
	Sat, 25 May 2024 06:11:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB56A1D01FD
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A4A400C1
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9XGC6atOyQB for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 06:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 617B7400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 617B7400BA
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 617B7400BA
 for <buildroot@buildroot.org>; Sat, 25 May 2024 06:11:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-529646df247so1511170e87.3
 for <buildroot@buildroot.org>; Fri, 24 May 2024 23:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716617466; x=1717222266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+nh7GE11Dmyuottk+DuNXdGlETjVd+QOk/t9GHjuSI=;
 b=QNeTV1/GVtxLhhp1SnlnrDZagcB409WnQM8jj8FQz5jcM8UruxQGQjvYjc6Ed6DTbj
 sTvjmmkOhEBn8EVrU6/Lo05NWe9u12ctG90f292PBP6a9zXMYCtKmt4OYidbrp3hhENL
 F5pK0pT1G6/aFpnS4zXBdeTFO4xq/3clA/Fft6iUevsOFkofB9b61WdNNJ0n5MSYw2l7
 UdQtEdMtac7Q3v91mhX4J1rgl8XGSSCK6IvI8qPR0/43WuqcodMp3qHFFOjQZMFp+x6j
 0+WdR+zJ6DBIWKHnBLwNO460UmEpzSo4CaiNzlCalZ8fJPjZ4i/Siz4AxQnPLVwp2AYo
 hdMA==
X-Gm-Message-State: AOJu0Yx/ProrKq7Zi60dB2t/7uzkKy+Aw0yCZlT/J6RA2fLq3XV5RRaZ
 bkIGSm3bX9oyjlN6mmX6KPO4nDjOhz4fw5i8+mhzeAz7NYX7Mg4Qy6okNA==
X-Google-Smtp-Source: AGHT+IGcU7477r/AAtZmCU+mMwKipiKpAUvREnv85TAWB0SCMaX7/T3+oR4GbTbJgjkaWjVB4eXAKg==
X-Received: by 2002:a05:6512:3e13:b0:524:43b2:d326 with SMTP id
 2adb3069b0e04-52964ca75d5mr3143958e87.37.1716617465471; 
 Fri, 24 May 2024 23:11:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089afcfdsm38885225e9.36.2024.05.24.23.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 23:11:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 08:11:02 +0200
Message-ID: <20240525061102.6898-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716617466; x=1717222266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8+nh7GE11Dmyuottk+DuNXdGlETjVd+QOk/t9GHjuSI=;
 b=D2T46BIHJdeNhwLCR5b6KLWD9xZqzKCmvzpQO+wHX3DSpCXPAHJU3ixEPqQg6oyP2E
 FKZYIH+th3d5sN4PSoqEkO3v1xtHjzLYrIK2mg8uNGLE3Gc9h+ReUIqX62+RvBCvDzU4
 1SbLFtu2vBBMm6uS0ATWa7UyvVieO7JPcW94cvF/cx20rTVR0CB+2kASY9n9+Z6JYuk4
 WhJ69FLUrt2pA4ipBwRUcc+DH+X9hmivnDaEEFcVxSKTxK2JTEqIFuF0pjCasxacWYvt
 +gVXpCDq1Ovd5fPYVvf66V6zMp9fG4Eyxk0wZXDCAuRKMfvWW9kvKdekNzpJkVNuKLzX
 YSYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D2T46BIH
Subject: [Buildroot] [PATCH v2,
 1/1] package/libgeotiff: bump to version 1.7.3
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OSGeo/libgeotiff/releases/tag/1.7.3
https://github.com/OSGeo/libgeotiff/releases/tag/1.7.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Bump to 1.7.3

 package/libgeotiff/libgeotiff.hash | 2 +-
 package/libgeotiff/libgeotiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 883199501d..3165994bfd 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  05ab1347aaa471fc97347d8d4269ff0c00f30fa666d956baba37948ec87e55d6  libgeotiff-1.7.1.tar.gz
+sha256  ba23a3a35980ed3de916e125c739251f8e3266be07540200125a307d7cf5a704  libgeotiff-1.7.3.tar.gz
 sha256  a822a731a7ac4ba7d8f18fa0dc29db2e68a5dcfc315b46e4a4c8956720d55d93  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 6ab60c93fc..126d61cb1a 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.7.1
+LIBGEOTIFF_VERSION = 1.7.3
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = MIT, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
