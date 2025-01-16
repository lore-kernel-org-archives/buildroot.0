Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25741C02188
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 12:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7011608B9;
	Thu, 16 Jan 2025 12:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXLsJqjaC-6c; Thu, 16 Jan 2025 12:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A7360908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A7360908;
	Thu, 16 Jan 2025 12:55:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01EA8B8B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 12:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E410961054
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 12:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIOmDijwgL-k for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 12:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C4F4608B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C4F4608B9
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C4F4608B9
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 12:55:44 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401c52000dso979871e87.3
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 04:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737032143; x=1737636943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=50w7pyAiLKeQJ70Lz6JZAzF1f1RE2VIaewDVy4rcq8U=;
 b=jAsCSP9yek95NDnZYYw0FF0ZNOjrgoZ90WDD+ThY8sOBmQYBY27+AKI0Cv1Q9kGXE9
 I5fU/nJDyC2E3JUIFjoruM2V+NEG0m3D1lT7QZrSpUSqmlWViOvAiRy7+SV/3+gz/kAB
 GxJc++XUBgWwuzk4mxmhpJYYdMtbdR7Gu8SfEaDFJuEO65dGjWVjRbyCqRJKuqvlXqCK
 STjKSTLok597oeCc/yVjhTODWlvZnZLUMlDAPnqH3Qm3Zw3u5L/XutvxTU/SB5niiiz4
 jKqsR5mVVQ1/HfGArqNMcnN2N99JD7gpe5MMKbd7HdNSR9GbK7DlYYy6wNiCcCprCZ0L
 E2OQ==
X-Gm-Message-State: AOJu0YzGOI/adaaRq0xQ26kNESKZR7iOsjnPktmo6Y6T4Fofdy9tH4ve
 3+6mjy0TXixhO8BfXVVIAndbnuz4fZjZbLl+kJsX/Uvif44klvH8do8LBA==
X-Gm-Gg: ASbGncudfF9GEVUE/zZZyMYqePBWVpv6Mq3Ygn4XK9fkUainBdkbRU1AdzydNS5E//A
 zRWaO1Ir+/3N2CbmVBdHv+Swyjq2ifIWX7OVkJJ8XAUdlQEOksIq6oS2bEwZxjFB8BXK4VCml5h
 iAKJFx/1ndGvPmnzIY9ockM5gVO2SsmfUig5tZ4VRaP//wbQ+hFg0YRhTu74cdEARx/K52miHq7
 fL1Xfb5C18YHRpTtIU+575q02Rv+amv+3UeEh1i99in7wZvc8zXiOrx6ZmweiSi65XarQ6DHSfu
 Nlmxw5i9JCU=
X-Google-Smtp-Source: AGHT+IEQl/jbHuUnkyBQCNVuMOWTLYMEqkVr6nfa3rrI2xvmy3miCiEx3CC39ogj4+NGRnFzCY0MPQ==
X-Received: by 2002:a05:6512:3d16:b0:540:251e:b2b9 with SMTP id
 2adb3069b0e04-542848162c2mr10716224e87.41.1737032142312; 
 Thu, 16 Jan 2025 04:55:42 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becae9esm2304819e87.232.2025.01.16.04.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 04:55:40 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jan 2025 13:55:36 +0100
Message-ID: <20250116125537.531666-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737032143; x=1737636943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=50w7pyAiLKeQJ70Lz6JZAzF1f1RE2VIaewDVy4rcq8U=;
 b=DfIUpz9Bts5y8lIqyHs/XL5uUdf84E53NeeZEBmqtbk8bQOajUWkHZvJEI5fBimyOL
 WK9uVu/spvd0XJqWuzH1pcOvexjP2eJ9mfll1lLp37WDs2k4TaPH/oMQXp/4LXyuo8ju
 rPC14bJttejM/3NZyeOQMcu8YZWrLXFk3N/qYYxMI4XfsbGyR5UqNQpwy97/aWy/xn6+
 WPhCEQXjiOQ6Ihv+n25c57V5FIXnqIwJJpUMEjglKi4z917h17INRKzlFtS0/y4dqdXa
 mnDV06NdcqhrRci2o0yM7YjYrPs4c+oHhHGuTx3/Q+DoRPwz0DH5g/p45y8W5CGWkdIV
 zelw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DfIUpz9B
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6tools: fix host linguist
 tools build
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

The dependency on clang is missing. But also since qttools requires at
least clang 17 (according to .cmake.conf) to build qdoc, i disable the
clang option for now.

Fixes:
CMake Error at /usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake:750 (message):
  The imported target "clangBasic" references the file

     "/usr/lib/llvm-14/lib/libclangBasic.a"

  but this file does not exist.  Possible reasons include:

  * The file was deleted, renamed, or moved to another location.

  * An install or uninstall procedure did not complete successfully.

  * The installation package was faulty and contained

     "/usr/lib/llvm-14/lib/cmake/clang/ClangTargets.cmake"

  but not all the files it references.

Call Stack (most recent call first):
  /usr/lib/cmake/clang-14/ClangConfig.cmake:19 (include)
  cmake/FindWrapLibClang.cmake:17 (find_package)
  [build]/host-qt6base-6.7.3/cmake/QtFindPackageHelpers.cmake:156 (find_package)
  configure.cmake:20 (qt_find_package)
  [build]/host-qt6base-6.7.3/cmake/QtFeature.cmake:678 (include)
  src/CMakeLists.txt:18 (qt_feature_evaluate_features)

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Please don't merge this patch before it has been testet by Patricia Holden, who
reported the problem on the mailing list.

 package/qt6/qt6tools/qt6tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..03a1c8d7a7 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -28,6 +28,7 @@ QT6TOOLS_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_clang=OFF \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -42,6 +43,7 @@ QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
 HOST_QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_clang=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
