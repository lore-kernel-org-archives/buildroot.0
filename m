Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE45C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC1F16100E;
	Tue,  7 Feb 2023 17:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC1F16100E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghQTLC1ZjBbM; Tue,  7 Feb 2023 17:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9BE6101C;
	Tue,  7 Feb 2023 17:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9BE6101C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB9AE1BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92A0F418A3
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92A0F418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80fpAE0vFIWJ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327BD418A0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 327BD418A0
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a2so13999822wrd.6
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDwUC6UISKevWtUWKvVezdAPutAEFiQ8AITGfDtGswE=;
 b=vhjdXz3w6pcVcFDJ+/egVBtTTyb19rsiR3Lv0qnAYwJbWfUN21ykrB/PTGsbXcMsyj
 yc9NPVuVWDCI8k3/5LTOH8oWn3t3450wRaZCTUPq4BHRTYVg2TJwYak53ewSAklxp1No
 ddnMcCxkqoov/mCNkCabxOiC+yxeDk5WdxWnm24dlEv1kwXcIFuieQNJ7GIT0KDZMvCq
 qWCADbHqLLRWaODV3DWZ2uD6I06Qkn3wbQT+YXt/4IIeG/wcfCMTOBr15z5jZUkYGkPW
 xhtzIgrWx3LmHtg+yT5BuJ5WMpL32bLkZq5YE3L08eWt9ageCGMCCRV81djEV7R9zgR+
 JoyA==
X-Gm-Message-State: AO0yUKU9z8pMFnm96bESFW1w+5qx8JyJvHundXEU57IUs2Yt9jH6iY82
 yJJa41uJ8waN0XTENFiVh6qK6wlaMNHR+URk1dqBOQ==
X-Google-Smtp-Source: AK7set8bCvKUeOTazKWYOKLJESQvDp96N22vMF/bjc3xNwGgNKx5ve3m5w3Vruxs5NJprAW9L70ydA==
X-Received: by 2002:a5d:658a:0:b0:2c3:ea86:863b with SMTP id
 q10-20020a5d658a000000b002c3ea86863bmr3336941wru.29.1675790251016; 
 Tue, 07 Feb 2023 09:17:31 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:30 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:10 +0100
Message-Id: <20230207171721.2973997-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDwUC6UISKevWtUWKvVezdAPutAEFiQ8AITGfDtGswE=;
 b=hd0QDrygmQLxCyyH6+HEIIJV+KtlnLrK8LKgF0M4rQV5vQw97LocCNpstukEJmg9ue
 FPvI1NwjWl17DGFjMnM0B1vL1R9M8pTEFJgYVuTTqzmcZxAsyrUqoeA6dSfXISIF199h
 VxMH6mka/M3kG0wqunhBbvd/2M52ITyO6+5IU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hd0QDryg
Subject: [Buildroot] [PATCH v6 02/13] package/qt6/qt6base: add support for
 fontconfig/harfbuzz
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Additionally the harfbuzz license file is added and the hash for this is
also added to the hash file

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in    | 17 +++++++++++++++++
 package/qt6/qt6base/qt6base.hash |  1 +
 package/qt6/qt6base/qt6base.mk   | 23 +++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 1810b1586d..594221b792 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -59,6 +59,23 @@ config BR2_PACKAGE_QT6BASE_XCB
 comment "X.org XCB backend available if X.org is enabled"
 	depends on !BR2_PACKAGE_XORG7
 
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
 endif
 
 config BR2_PACKAGE_QT6BASE_NETWORK
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 0c722ccded..dda7ff61c8 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,6 @@
 # Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256
 sha256  a88bc6cedbb34878a49a622baa79cace78cfbad4f95fdbd3656ddb21c705525d  qtbase-everywhere-src-6.4.2.tar.xz
+sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9bfb2a8420..da67b12c99 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -170,6 +170,29 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
 endif
 
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
