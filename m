Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEDEECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0437B41824;
	Fri, 26 Aug 2022 12:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0437B41824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrzJ6-iMQPJu; Fri, 26 Aug 2022 12:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9DE541833;
	Fri, 26 Aug 2022 12:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9DE541833
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4CBF1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80A4A404BB
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80A4A404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpvxDu9ymT8r for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D62E40192
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D62E40192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:19 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b44so1973627edf.9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cMz4vp3D/OWWJT2LZI5UGgIOdDQz1GS0ALrFnL6dWmM=;
 b=LNIHBNFO+nHDrXQ8xkR6+QTLPdhYGoX5NmWlx92lX5aInfxDMvsrFUBNWfxkVIuupu
 d+pbN06ZGJCu29zrD8oL8KJpOCHETCRXDd4/5yA01/xVICJYBz8kyBs+C5mt8QLAmrMY
 uSJ7Ptnc8eJJdF3jWoFfNfOKei5QTZufzfqqwhVpiTb4NbKD0nYls/F+hGlXkYRaloKq
 hE2RVvZqe0csj34U4xSDpgPLeE9Bok0m0LjRwAVRNyL1T1Xjnv46mF179w7ThzFpErQQ
 bevRb5ggQ4u7N2gnOatiTeUCYsl2MJsuvSduYB786JI5GBm1i2nD/mYETLqHg8+dUyO6
 WhfA==
X-Gm-Message-State: ACgBeo0onjl85FIVGGGXdRwAhcXlvY8uYRKLqf27o/AzNjbb+J7YbvCe
 bvryvJAojysGocosyHmG7cWeuQw6a4QMTyH4
X-Google-Smtp-Source: AA6agR4Zby1ipN2HNjv6AmmARgkRBTZkgZs9I1Dy6ilfeZKsDS1I3O2EdATB5k56FrcZj+KowRdOGg==
X-Received: by 2002:a05:6402:35d5:b0:43d:a02f:cbfb with SMTP id
 z21-20020a05640235d500b0043da02fcbfbmr6423113edc.275.1661518398757; 
 Fri, 26 Aug 2022 05:53:18 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:18 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:45 +0200
Message-Id: <20220826125252.16782-23-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cMz4vp3D/OWWJT2LZI5UGgIOdDQz1GS0ALrFnL6dWmM=;
 b=J7q24EKN0ID8Jv81Y64TGDHyocg5AMnqGCyHI22G1+3Wdu5lyY5E0zgB+P5kROnIH7
 LfqemrGC5ppKPFY/t7pbjUjDlqBF2Was88BlKoq+hNyh30O569PdHYE9VnUm2hKsvvFm
 ht6rnged8mCswGELH4fF339547z+ipf/HXabVf0gDuUmggN8VlOJ3NPDvWl8DFCb+O13
 eO/6vkFXdGyCAvRqgCXIO8zmZNE0RYQVDBTNhzS2lHdc/ldC6LJ5W7CPuubEQC/BKw38
 UZi4rx0LUTUqpc0vmxvMlRqz1L1WBFrk1/IBzY6EHgFTmrkqflXRgXwW013RQuIbMF5e
 XyNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J7q24EKN
Subject: [Buildroot] [PATCH v3 22/29] package/qt6/qt6base: add support for
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
