Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFB8CD4F32
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CB18122D;
	Wed,  4 Sep 2024 21:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_lc4XHteGx5; Wed,  4 Sep 2024 21:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA2D80D3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BA2D80D3A;
	Wed,  4 Sep 2024 21:11:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEF0D1BF423
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAF4580DC9
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tG_ytmjiMon for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 21:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76C9680D24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C9680D24
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76C9680D24
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 21:10:59 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f3fea6a0a9so721151fa.0
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 14:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725484257; x=1726089057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h0tcyXgRnMSGa2uMuFR+4R7COT5DXpu+065yIw3zEgU=;
 b=sNay+g6VCFxoekw3ApIwjkdqBHRTUoTH2vl1JwehW5jGxu99u0IjxdRC/MuY+4XyEQ
 5CVFKN190tuj+nAA47R96wvcKsUKftLE4wOlZl+cbp/k8j8XWnnHLJFFF8PsD/Q9uWTy
 qqwEcLfh4EES1xxGpwAppP0gG98akKnP2ECqcXsbFzLRVEgz7vU0DJR6GICuWC1csTQ+
 3W7C6pztv/LDHGfLR0IuYiTMZxVtZbKjIpvbm5rPm9PnfogAstL3PpcP0P2nJjy6mizv
 aaeY3MSZfIDTVG3g8gLUeUHLzmVBtMkB8k/JCDTZWn0bgsCT624fqKmrypG38D8tD/lP
 PqRg==
X-Gm-Message-State: AOJu0Yz7chSz//OS56CDWgYjAjEofcE5olpvNrejUnF6lpWbLKkM0BS3
 p5f24DP8aoezSoLRvxbBfSDyKFdXa0FEumIZ5f55j49fk8ERyIfdpEPvfA==
X-Google-Smtp-Source: AGHT+IHql0/Z8FU7PUA6FoFK+V+eEWQQLhmj8qEvK/d8yVsElJgTx/+ogxtzbpdTcbSeuk7kC/iH/w==
X-Received: by 2002:a05:651c:1504:b0:2ef:334e:7c36 with SMTP id
 38308e7fff4ca-2f657bd5a68mr11029371fa.6.1725484256102; 
 Wed, 04 Sep 2024 14:10:56 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed1565sm26308861fa.6.2024.09.04.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 14:10:55 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 23:10:44 +0200
Message-ID: <20240904211049.866640-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725484257; x=1726089057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h0tcyXgRnMSGa2uMuFR+4R7COT5DXpu+065yIw3zEgU=;
 b=L+eqMbwbdXSO/vERQbiwt1W/+G7Szxwo2LeW5FLiAZghCCt9pha9nTVDqFthFYugEJ
 NqkaBv82DoyEdYt0umBd8WSh0/IjWYJ54MZEEzYlHv5H8mVYafyJKVdCz2hUtlrtMszD
 DJPxhLYQ6tIVQhNGdm8u8DIBqItElDw0Oj7/lrnj9S359t+4YYe3ppMIdbFP2dGHSPRy
 rd2+88HkTwhQHAEW7D5+tuNNddU/58Y+eXwNzHB62D7NqjFGHPZcj+0Vj3lscB5qjSYZ
 y5kE3dBtvUlzSyNUxYcdgLFkMe7rvEPTB8I1RkuWtvVBi8v5Le5UGRqB4N2NwoN2mVsz
 0mnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L+eqMbwb
Subject: [Buildroot] [PATCH v2 1/3] package/qt6/qt6base: allow selecting the
 host print support module
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
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to configure.cmake print support requires us to select the
widgets feature:

...
qt_feature("printsupport" PRIVATE
    LABEL "Qt PrintSupport"
    CONDITION QT_FEATURE_widgets
    SECTION "Module"
    PURPOSE "Provides the Qt PrintSupport module."
)
...

And further, according to configure.cmake, widgets requires us to select
the gui feature:

...
qt_feature("widgets" PRIVATE
    LABEL "Qt Widgets"
    AUTODETECT NOT TVOS AND NOT WATCHOS
    CONDITION QT_FEATURE_gui
)
...

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
In response to:
https://patchwork.ozlabs.org/project/buildroot/patch/20240904122040.738362-2-roykollensvendsen@gmail.com/

Changes v1 -> v2:
  - make this commit the first one in the series  (suggested by Thomas)
  - remove useless comments  (suggested by Thomas)
  
 package/qt6/qt6base/Config.in.host |  9 +++++++++
 package/qt6/qt6base/qt6base.mk     | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 46fb668817..786c8ea3a7 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -8,6 +8,11 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
 
+# The Qt Widgets module is required for printsupport
+config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	bool
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+
 # Select this if you need host qt6 tools that require the Qt::Test module
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
@@ -17,3 +22,7 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
 # (e.g. qhelpgenerator).
 config BR2_PACKAGE_HOST_QT6BASE_SQL
 	bool
+
+config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	bool
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4c0392f92d..0617d05f5c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -113,10 +113,8 @@ HOST_QT6BASE_CONF_OPTS += \
 	-DFEATURE_png=OFF \
 	-DFEATURE_gif=OFF \
 	-DFEATURE_jpeg=OFF \
-	-DFEATURE_printsupport=OFF \
 	-DFEATURE_kms=OFF \
 	-DFEATURE_fontconfig=OFF \
-	-DFEATURE_widgets=OFF \
 	-DFEATURE_libinput=OFF \
 	-DFEATURE_tslib=OFF \
 	-DFEATURE_eglfs=OFF
@@ -131,6 +129,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 # We need host qt6base with Sql support for host-qt6tools to generate the
 # qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
 # available.
@@ -150,6 +154,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
