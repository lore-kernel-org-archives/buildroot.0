Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15036C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC7F141A55;
	Fri, 17 Jan 2025 10:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cMWDV0QRNsW; Fri, 17 Jan 2025 10:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E96A41A6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E96A41A6B;
	Fri, 17 Jan 2025 10:49:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BA394B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8569481DF1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JJfQYu8kZak for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4CD28148A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4CD28148A
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4CD28148A
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-540215984f0so2118256e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110987; x=1737715787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gp+nUQcAPT6lIDrasKlZTkZsKr8/wou8W+TtZWLO2mE=;
 b=HYfJCEqo51aYheZSqkiDYMQv8d6g7AbKPo6mNL+JLssDbpkxwEGSkqzXeV9/nSKghp
 1jYG9DsElr8riXLxiRFznTTLB/C109Ph8zEA6Atl6DNAEj8wEsmqO7uFkCUVWoTqTyFw
 +qBt+kaza+PWYfqlBlbt/HSEzd63wMxVNe4i7Ud0edwLE/l2XcmfMxNlf6OGhClcMzid
 dEwWmuz3jaaYuu/iGVRzgT8s6X+fyINEv2y3K1DGheHRfoawndRevrKcRY65I+E5Uy2d
 nRaEwgYg/s2EdKaEhJjBo837jQ0UjOITqzKnw+nPG76Md5ctgGJmiAkz5QKakCeclD9O
 2hKA==
X-Gm-Message-State: AOJu0YxLbOEg4LJfgDK7+74xRp69GJCivqjHBSfOQdoBz/rG6SN6hImd
 bqTMZMzlgUdCUoXeKiJpZb09kkXoHCibP4t2LWTQvsnJW8s47o5vM5dGeQ==
X-Gm-Gg: ASbGncvHijMggVYKZqUfZ87C0DTHo/71/8HuupTckq6XhLmUmaR1DWvkWjhqPPsAY47
 foYPP8hyfU9aMJb4y/WAB5+W0Uo+sriYDzGf61tlAC/6nFVQumK0eesJamGhGn1CVISjYnTovEo
 l/b6RcXxllPHTyFe66y/6sLbkZHWsgiFtcSG0/d5CJ93bJso6gOJvhUyrICVFP0h+gkkysa2yEW
 MMXxEOFl/A84SnApG2sKKq6HOmZetHvztEOREzySLEMkAgitZTD9f2Zdz5xXRZMlOzoXdE7Q6jj
 T89itcl3+Y8=
X-Google-Smtp-Source: AGHT+IElo5kkmwI6TiJBrsV6N3uTkSGEUr3nvfd8EWjUkMxG7+7GV4Q+uC+aHikH9DdO9NjwJkh+Eg==
X-Received: by 2002:a05:6512:ad5:b0:542:2190:9d99 with SMTP id
 2adb3069b0e04-5439c22d7fcmr624456e87.6.1737110987203; 
 Fri, 17 Jan 2025 02:49:47 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:45 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:46 +0100
Message-ID: <20250117104911.613221-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110987; x=1737715787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gp+nUQcAPT6lIDrasKlZTkZsKr8/wou8W+TtZWLO2mE=;
 b=aN46gbmjmfX0hqYGxzITtYfVZc8m9IZzcILB1NpvGRNyJdtmVbXNlMz9npyx464EY0
 MCCPpZNYhGYoVu7kjKMZ7sqKssnSafUwuhnO+W+70wHNiJQJIlciXEXm+KovpHbdjLjB
 xokGldmmF1MabzD3MnEqj1kagrl2CaekI/ou6KiKPgPgG97vYA/sW8t+inkuxoQGG/mQ
 3I1JC4eh/K+LArB1FBtSr97T7Lb7iuc4M7B+NReL9kxTuK7J9f7qAKzrYVaNWHzf3ULZ
 AyZyxgWIOeBzlmGju+sHWDJWR1RNbxnn3kxLd1YZ0I11H40tGDzsEywM9zcofKxlsw/P
 /cjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aN46gbmj
Subject: [Buildroot] [PATCH 06/19] package/qt6/qt6multimedia: set license
 files unconditionally
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 33 ++++++++++------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 01bf9adf96..6aef78bf02 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -13,12 +13,26 @@ QT6MULTIMEDIA_CMAKE_BACKEND = ninja
 QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
 
 QT6MULTIMEDIA_LICENSE_FILES = \
+	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSD-Source-Code.txt \
+	LICENSES/BSL-1.0.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
+	LICENSES/IJG.txt \
+	LICENSES/ISC.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/MIT.txt \
+	LICENSES/MPL-2.0.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	LICENSES/Zlib.txt \
+	src/3rdparty/eigen/COPYING.BSD \
+	src/3rdparty/eigen/COPYING.MPL2 \
+	src/3rdparty/eigen/COPYRIGHTS \
+	src/3rdparty/pffft/COPYRIGHTS \
+	src/3rdparty/pffft/LICENSE
 
 QT6MULTIMEDIA_DEPENDENCIES = \
 	qt6base \
@@ -55,16 +69,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
-QT6MULTIMEDIA_LICENSE_FILES += \
-	LICENSES/BSD-2-Clause.txt \
-	LICENSES/BSD-Source-Code.txt \
-	LICENSES/BSL-1.0.txt \
-	LICENSES/IJG.txt \
-	LICENSES/ISC.txt \
-	LICENSES/LGPL-2.1-or-later.txt \
-	LICENSES/MIT.txt \
-	LICENSES/MPL-2.0.txt \
-	LICENSES/Zlib.txt
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
@@ -97,13 +101,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
-QT6MULTIMEDIA_LICENSE_FILES += \
-	LICENSES/MPL-2.0.txt \
-	src/3rdparty/eigen/COPYING.BSD \
-	src/3rdparty/eigen/COPYING.MPL2 \
-	src/3rdparty/eigen/COPYRIGHTS \
-	src/3rdparty/pffft/COPYRIGHTS \
-	src/3rdparty/pffft/LICENSE
 
 # for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
