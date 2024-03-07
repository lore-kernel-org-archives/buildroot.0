Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A27C48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 10:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4C960596;
	Thu,  7 Mar 2024 10:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASBpZE4VHpoO; Thu,  7 Mar 2024 10:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 799586075D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 799586075D;
	Thu,  7 Mar 2024 10:25:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 814651BF5AA
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DBE880BB1
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4qeySps3tTO for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 10:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C0C3809E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C0C3809E9
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C0C3809E9
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 10:25:40 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso8962451fa.3
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 02:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709807138; x=1710411938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EXaDFZ32zD8+b3uDRpkLycq5kjZxlWTgawBmT4t9X0o=;
 b=GmmzkZdfdo8qd+db8D9h6bkQU/tqXsn/K9Qz0iu5mjYqR1PHxJ3JbX7Plr+d4MDAK/
 lfI5F3xzbFHZlpKSEyobcijoPr1uDxLVEc2hyqtefsfhQQ4OPWd7MjoAENyUCmuoTtn3
 LYY9RCyzM3Txq4XG04FFNAmW+3+fIwo/efmgU1vou6n/G37CC2HA0wWt2q1W+xR3qJRP
 eMvaSB5dYcSjs0Ak+RAhyr4RnSm7Vq3sG+xXQo7W8IyNtLUJiiC20yZayg4oKMo/W5f1
 ip/zubjVcle6ivXgy3l1bee5pQb3gSzSH5eD+6n9/3+BzGJ1q0WNs+osfQvLIam6KPAo
 gjUQ==
X-Gm-Message-State: AOJu0YxepibqzDD5oIzsBaqEPhB6ryDiido1T7pdoELU3rO++r/6K+Pi
 XuWCW3BP54eG54vBIB+KAEQFFdvcFMzkDw69/NTH3ROpfgCq9OhchsQWl7OG
X-Google-Smtp-Source: AGHT+IEyjcH25XTQj90oeHAKmP+eEpxofh5DVdP0udK2mBoqo+YkJm5r2GO/1jVWAKvrNJN76iSbEQ==
X-Received: by 2002:a05:6512:2003:b0:513:4acb:6ea7 with SMTP id
 a3-20020a056512200300b005134acb6ea7mr1139158lfb.33.1709807137389; 
 Thu, 07 Mar 2024 02:25:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c471100b00412ee8e2f2asm2226435wmo.9.2024.03.07.02.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:25:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 11:25:35 +0100
Message-ID: <20240307102535.20447-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709807138; x=1710411938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EXaDFZ32zD8+b3uDRpkLycq5kjZxlWTgawBmT4t9X0o=;
 b=P1Z3fZn8DiovcFEzEMAizbdNgfkOon/faMJ/dFgIhRA/9lGqHNpBI13utVIbrm7VOv
 NXju7cM+WiUScFrj63eTNr/AqBK1+YGLVwh5LUg/XUXiFUBiwO1eAKk2Bfn9wu7lkh4/
 JMIMiXa+rFLIrnLE8gtQ1tqJb85w+c9ye/bGCVF2jlH/Q0v8N+q6ipSYWgfmoTESFBOP
 DZVaqnZhnU3LIDqARSiLJPXBwIZQx4BXWEMPeqe6ovtOakcSFO1t0C10ffdSelbzWCqi
 g9h8yG4mJkS5FXoyAkGFxEzxJFDsRfh5Pgy5LyFzWJi6aGCwudGuTsVl4I1HWRt08Lok
 nmCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P1Z3fZn8
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: drop opencv and qt
 dependencies
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

opencv and qt handling can be dropped since switch to an active fork in
commit 456a7398316655ad0b669635f580e4887c24a700 as they are only used
when examples are enabled resulting in the following warning:

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_DISABLE_FIND_PACKAGE_OpenCV
    CMAKE_DISABLE_FIND_PACKAGE_Qt5

While at it, also drop BUILD_EXAMPLES which is already passed by
pkg-cmake.mk

Fixes: 456a7398316655ad0b669635f580e4887c24a700

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zxing-cpp/zxing-cpp.mk | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index b0cadf1b1f..86a1ef9680 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -14,23 +14,10 @@ ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
 	-DBUILD_READERS=ON \
 	-DBUILD_WRITERS=ON \
-	-DBUILD_EXAMPLES=OFF \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_DEPENDENCIES=LOCAL
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),y)
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-ZXING_CPP_DEPENDENCIES += opencv3
-endif
-ifeq ($(BR2_PACKAGE_OPENCV4),y)
-ZXING_CPP_DEPENDENCIES += opencv4
-endif
-ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=TRUE
-else
-ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
 ZXING_CPP_DEPENDENCIES += python3 python-pybind
 ZXING_CPP_CONF_OPTS += \
@@ -41,17 +28,4 @@ else
 ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE),y)
-ZXING_CPP_DEPENDENCIES += qt5base
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yy)
-ZXING_CPP_DEPENDENCIES += qt5declarative qt5multimedia
-endif
-# Only set qt5 as required when all optional qt5 dependencies are present
-ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yyy)
-ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=TRUE
-endif
-else
-ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_Qt5=TRUE
-endif
-
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
