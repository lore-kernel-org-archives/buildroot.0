Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1689BECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 14:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9EAB41A3D;
	Fri, 26 Aug 2022 14:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9EAB41A3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1ChwsE-6wo5; Fri, 26 Aug 2022 14:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D30341A3F;
	Fri, 26 Aug 2022 13:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D30341A3F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99EC31BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 730AC41A21
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730AC41A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dT6TU6HlVqZo for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC1A41A10
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EC1A41A10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:29 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id fy31so2894317ejc.6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cMz4vp3D/OWWJT2LZI5UGgIOdDQz1GS0ALrFnL6dWmM=;
 b=U7Omqu7qy4tqvUZkOZjQbdYCoD3IPdb30Je+BVDPNERQCSyGrP8Y6rPVBEcvJCNyvw
 cF7qxxgRt0TVpmpRaYfJoRWyLQ43RZMvfLXILXrWEuMLHLfaKSv73SpjkAtv5uCTIQyK
 lsjaDTrZyDxoxgLPFYHE3rZkZLKZqouF7Q0QWTnK0rUkUYBgZmraRdtukirjYN8mIoyN
 +NSr87xeoEaG1clkLvFdjoxyiLaq+Vhs1agM5x0c99HQOspslbGxW1EYoZflUSSQ1bS/
 OXQvCTWH/TPxyMHaNvLY8Hvt+SYvLHv5SlPtINpqgm4+7zk8ZNrTJmhn+xJ+iekR74YM
 /xMA==
X-Gm-Message-State: ACgBeo1AmQcryKL/4qg+6TbVSlNOl7qE+ph++7aP9JPSOcB7/RlYarXY
 Y+uOaA/uDBm/+Ffm2JzsDi5mCOuM6k+IOJgH
X-Google-Smtp-Source: AA6agR66EvaHA2Jpx8nwcdkpvQpNUKBAxIw28XXkyv9yQeVHXw2irX44w08bVKb3+gI93OifFi5edg==
X-Received: by 2002:a17:907:2c68:b0:730:9272:8c7f with SMTP id
 ib8-20020a1709072c6800b0073092728c7fmr5713115ejc.528.1661522128250; 
 Fri, 26 Aug 2022 06:55:28 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:27 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:56 +0200
Message-Id: <20220826135503.20612-23-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cMz4vp3D/OWWJT2LZI5UGgIOdDQz1GS0ALrFnL6dWmM=;
 b=SmBn2EsQkNFUvS2RjN3+UFn/j4Nwu6Lz+TXxvSxGQAoyAKmkUXH2DysxN9pOqzEDSm
 BFNvgejeTbdJCICFkzpFLCtcGRN0dmmD9xX1WgMggwOge7jgCmmCZyzTOCo/zGv+e9kL
 /CmtJ6HXCLUdYEBdmcQIZMdPvn2OAiDlKm7CX8vGTmErhCsMLANUlpOvPbKYzmjzXtOz
 u6Hfd/Ztqwg6A18QcDUTScU+wBINKNvPuOUMA1xyIawch9ZVomMe7fQGKiB1bTDptIyj
 rn4MOCL+zzuONnarHCN2SsFzP2D/+O+9DD5Q1rocfBdDz9dlgsivDiywNQocyXN2Agkd
 csIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SmBn2EsQ
Subject: [Buildroot] [PATCH v4 22/29] package/qt6/qt6base: add support for
 gui module fontconfig/harfbuzz
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Additionally the harfbuzz license file is added and the hash for this is
also added to the hash file

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in    | 21 +++++++++++++++++++++
 package/qt6/qt6base/qt6base.hash |  1 +
 package/qt6/qt6base/qt6base.mk   | 23 +++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 710e027602..db510989ca 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -46,6 +46,27 @@ config BR2_PACKAGE_QT6BASE_GUI
 	help
 	  This option enables the Qt6Gui library.
 
+if BR2_PACKAGE_QT6BASE_GUI
+
+config BR2_PACKAGE_QT6BASE_FONTCONFIG
+	bool "fontconfig support"
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  This option enables Fontconfig and Freetype support using
+	  the system fontconfig and freetype2 libraries.
+
+config BR2_PACKAGE_QT6BASE_HARFBUZZ
+	bool "harfbuzz support"
+	select BR2_PACKAGE_HARFBUZZ if \
+		BR2_TOOLCHAIN_HAS_SYNC_4 && \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  This option enables HarfBuzz support (either system harfbuzz
+	  if the toolchain supports __sync for 4 bytes, or the qt
+	  provided one which avoids this dependency by using QAtomic).
+
+endif
+
 config BR2_PACKAGE_QT6BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 5efc5c2815..0f845ce38b 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -6,3 +6,4 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
 sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 2e63d0b4f3..ae6c482197 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -139,6 +139,29 @@ ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
 QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF
 QT6BASE_DEPENDENCIES += freetype
 
+ifeq ($(BR2_PACKAGE_QT6BASE_HARFBUZZ),y)
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=ON
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
+# system harfbuzz in case __sync for 4 bytes is supported
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=OFF
+QT6BASE_DEPENDENCIES += harfbuzz
+else #BR2_TOOLCHAIN_HAS_SYNC_4
+# qt harfbuzz otherwise (using QAtomic instead)
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=ON
+QT6BASE_LICENSE += , MIT (harfbuzz)
+QT6BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
+QT6BASE_DEPENDENCIES += fontconfig
+else
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
