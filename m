Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF83BC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C3D260773;
	Tue, 25 Jul 2023 17:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C3D260773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPfcA8f94_GX; Tue, 25 Jul 2023 17:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FDF7610DD;
	Tue, 25 Jul 2023 17:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FDF7610DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9C1F1BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B32FB8138B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B32FB8138B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYUA3uDkBySZ for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:33:54 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 955CD8138A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 955CD8138A
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso47219915e9.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306432; x=1690911232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lb1D/FTfy+CErfn10D+Z7ayv8gKPsJFsdYPfluVxPA4=;
 b=iDKqYM7S9eRitaYa9+YwijfO92m/JJHrTzBhbDuoSSE4dPEnNAMHGtMR6Ql06CBQYs
 027B80e1gzhFC4gHc0//2pLdHct4FrByT4zQjLli/1Fq2Zx+rgjBxfEvZnrCUqbAXhx+
 sq2zKrF/B7EaBmMdNRxWqj1FYpKknZYgszq/A4yEy+LpV59d1j5d0BNA1dBXsl5Q3+yR
 sC9co0BgTdYyuPhUAn0GkX4EU0wGtUZoKt/VUAnTfMocilfraizXp4hr6vAL4aHgWkni
 Pw0jo0Yh7LfjEVIIg3BV+dykI/oLjlomCXO8WCUcA0JHCScqjKUoCERW7SWuiwd9S5M5
 C0Iw==
X-Gm-Message-State: ABy/qLbIWmCfW1SIzryuCQIg7E2/FTY2Nd5/WwLH9nJbCQRgxOxYVFud
 TrqCF9clBGrpDQWjtbgZE/aYbJeZ9WW7lHYFzls=
X-Google-Smtp-Source: APBJJlE0pUw62aJw/je0nKLVlMJRRf3K9/u5jO83feZCVSLndf8TZ6jAmlrzzqqQOVJtGmviQm88Tw==
X-Received: by 2002:a1c:f201:0:b0:3fb:ac9c:e6f with SMTP id
 s1-20020a1cf201000000b003fbac9c0e6fmr9876090wmc.38.1690306432373; 
 Tue, 25 Jul 2023 10:33:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:33:52 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:56 +0200
Message-Id: <20230725173102.543874-5-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306432; x=1690911232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lb1D/FTfy+CErfn10D+Z7ayv8gKPsJFsdYPfluVxPA4=;
 b=MX8ZBdmwt1/SOLyRbDTB05ehEnl+1c4Ze3A/j6LgLNniei3DDAN1N96EYCd/hUTRVF
 AO3E1x7Jmm8HmW+htaxZE2GAs8kzk3A1k3rQdLY8akDTmLYUhONSKgMgwCpY1rf/G47j
 1Hj6jCTt8d/IZgAeTnYbXITemihYRwZOa4V1UAZmNdL+eoKF1H7NM6mZXe9KNGloTXA1
 fObGsR4ZzKOCcr7M98bpfEqSj6Hca7QzLpr2PYcUqsoCd8Jwsgys1FJoW09shzJ7lfWW
 wUyG/5ZbJWNI1bXzhFsGtwm10NNAY0vRyPe+8RGojhxsMqURrJVs4QFCC7eE3jz6Pyl4
 No6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=MX8ZBdmw
Subject: [Buildroot] [PATCH v2 4/9] package/spirv-headers: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

These headers are required to build the pacakge spirv-tools which is
requried by mesa3d for building rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/Config.in                        |  1 +
 package/spirv-headers/Config.in          |  6 ++++++
 package/spirv-headers/spirv-headers.hash |  2 ++
 package/spirv-headers/spirv-headers.mk   | 15 +++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/spirv-headers/Config.in
 create mode 100644 package/spirv-headers/spirv-headers.hash
 create mode 100644 package/spirv-headers/spirv-headers.mk

diff --git a/package/Config.in b/package/Config.in
index 1e551d17c4..931b0cc21e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -326,6 +326,7 @@ comment "Graphic applications"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/spirv-headers/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
 	source "package/tesseract-ocr/Config.in"
diff --git a/package/spirv-headers/Config.in b/package/spirv-headers/Config.in
new file mode 100644
index 0000000000..fd20f301d4
--- /dev/null
+++ b/package/spirv-headers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SPIRV_HEADERS
+	bool "spirv-headers"
+	help
+	  Machine-readable files for the SPIR-V Registry
+
+	  https://www.khronos.org/registry/spir-v
diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
new file mode 100644
index 0000000000..b83959f7a4
--- /dev/null
+++ b/package/spirv-headers/spirv-headers.hash
@@ -0,0 +1,2 @@
+sha256  71668e18ef7b318b06f8c466f46abad965b2646eaa322594cd015c2ac87133e6  spirv-headers-1.3.246.1.tar.gz
+sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
new file mode 100644
index 0000000000..11119ac6b2
--- /dev/null
+++ b/package/spirv-headers/spirv-headers.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# spirv-headers
+#
+################################################################################
+
+SPIRV_HEADERS_VERSION = 1.3.246.1
+SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
+SPIRV_HEADERS_LICENSE = MIT
+SPIRV_HEADERS_LICENSE_FILES = LICENSE
+
+SPIRV_HEADERS_INSTALL_STAGING = YES
+SPIRV_HEADERS_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
