Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB78C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7BA1822A5;
	Sun, 12 May 2024 20:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X60EYFCmKIiQ; Sun, 12 May 2024 20:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFF983BD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFF983BD4;
	Sun, 12 May 2024 20:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A40A51BF3E0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9102C4073B
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljpGdOnqn5BJ for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27BE24072F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BE24072F
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27BE24072F
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:21 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e564cad1f6so19719831fa.1
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545159; x=1716149959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVAAEHH4TizDP63j3sU6DmsTjUnFsue52aJJVSk1TPg=;
 b=n4Vh04a7z0Bh2a3cw2fY+DiH8BnU95ZcMRXvWb0bi2gmzYw043Jb1PCYCqsuf1hxHY
 virLpP2vzAozfy4bfgtPbXb63mvy8n4USpzBZPoORNHkLCJVw4s5pihgzM30dfk2b2pA
 EfCrMef2kkvQ9OQXTvHcxpEYnOLcYNQRoyDgUgxRGS7gyWIGO7ckM4+p89m8vUpr9zE9
 D9rXQg4CuU0z4hYoh4KPlJvDp8JdAXPEd58YuUbq0WUKQG0IYLGVAT18jDlksKSDJbps
 DgX/JdMqszcK1bJ/UVBZq+OJS7HP5ZNQET1wvkiRxB/LBRsRQL11ApL6x8ciRvmYLA9s
 ZzeQ==
X-Gm-Message-State: AOJu0YwgrH9ymBTkYLkBRC15DYKxyMHgV3r1iP79wv+4/BCgNI8VizlF
 phH1SVoUtg3p9VCnj0iaDEdC4Mb+t6X7fN4oCtx5irzOtXmFoJ51gy/aVBzO
X-Google-Smtp-Source: AGHT+IErQ63HyCaFSX1DOKaPinHJZr0h5ZVMRncuXtpk89FZNwhZAbvYbL+llwz01FBak+eWFJQ7QQ==
X-Received: by 2002:a2e:3603:0:b0:2e0:4a32:1f38 with SMTP id
 38308e7fff4ca-2e51ff66803mr48647341fa.28.1715545158796; 
 Sun, 12 May 2024 13:19:18 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:18 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:55 +0200
Message-ID: <20240512114617.2564569-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545159; x=1716149959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVAAEHH4TizDP63j3sU6DmsTjUnFsue52aJJVSk1TPg=;
 b=BUKIbwfnmTMR+CgsRafjJ+Z9k8dih+0rie5ntdoO4jYhvMtskWojFZZ9vWLdwsjso5
 2vIsgrHfigXeRrrfzigjF8mVCFQ/atDtnMOK2VD8t/VLw1DYcp0EwFAcT4HX4Y67p4qR
 mZ5cHNu3pxT9HbFfsxjZPol5HieP4CypphgG3SBaGWvZwKTaZMt5r2IsXzRXK/d9onSH
 lwuCtrnwK0mi20hQpl/N53HzTZus0xMGrn/iK0MUxHrFPGX0Y4Doa85mKsXFG19HDnYQ
 /bgprFg/TQi4stvv7MpMHMdYmddAG7LzqdvhRXtEx0CbjJz0R3k5DZ7rGEFXiCIObqPe
 kQUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BUKIbwfn
Subject: [Buildroot] [PATCH v3 08/14] package/qt6/qt6declarative: fix build
 when Qt Network not available
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Avoid checking for FEATURE_ssl when FEATURE_network is not available.

The failure occurs because FEATURE_ssl is defined by the Qt Network
module. So we check for FEATURE_network before we check for
FEATURE_ssl.

Fixes the following build failure:

CMake Error at qt6base-6.7.0/cmake/QtFeature.cmake:376 (message):
  Attempting to evaluate feature ssl but its definition is missing.  Either
  the feature does not exist or a dependency to the module that defines it is
  missing
Call Stack (most recent call first):
  qt6base-6.7.0/cmake/QtFeature.cmake:141 (qt_evaluate_feature)
  qt6base-6.7.0/cmake/QtFeature.cmake:180 (qt_internal_evaluate_config_expression)
  qt6base-6.7.0/cmake/QtFeature.cmake:396 (qt_evaluate_config_expression)
  qt6base-6.7.0/cmake/QtFeature.cmake:711 (qt_evaluate_feature)
  qt6base-6.7.0/cmake/QtFeature.cmake:680 (qt_feature_module_end)
  src/qml/CMakeLists.txt:13 (qt_feature_evaluate_features)

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v2 -> v3:
  - This fix was added in this version of the patch set.

 ...1-Fix-build-with--no-feature-network.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch

diff --git a/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
new file mode 100644
index 0000000000..bef5794229
--- /dev/null
+++ b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
@@ -0,0 +1,28 @@
+From 8377691a0998fd84e6fc8349a5db450bf2d79164 Mon Sep 17 00:00:00 2001
+From: Tasuku Suzuki <tasuku.suzuki@signal-slot.co.jp>
+Date: Tue, 21 Nov 2023 23:58:43 +0900
+Subject: Fix build with -no-feature-network
+
+Change-Id: Ib21012301da6afb5458f707b39a9a8079d93eb93
+Reviewed-by: Ulf Hermann <ulf.hermann@qt.io>
+Upstream: https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=8377691a0998fd84e6fc8349a5db450bf2d79164
+Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+---
+ src/qml/configure.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/qml/configure.cmake b/src/qml/configure.cmake
+index 2d0434643a..d1ff90bd54 100644
+--- a/src/qml/configure.cmake
++++ b/src/qml/configure.cmake
+@@ -82,7 +82,7 @@ qt_feature("qml-ssl" PUBLIC
+     SECTION "QML"
+     LABEL "QML SSL support"
+     PURPOSE "Provides ssl support in QML."
+-    CONDITION QT_FEATURE_ssl
++    CONDITION QT_FEATURE_qml_network AND QT_FEATURE_ssl
+ )
+ 
+ # On arm and arm64 we need a specialization of cacheFlush() for each OS to be
+-- 
+cgit v1.2.3
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
