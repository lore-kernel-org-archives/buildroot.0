Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D80CD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67486402B1;
	Wed,  4 Sep 2024 12:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QakYKD4-9Xg; Wed,  4 Sep 2024 12:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2460D402B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2460D402B2;
	Wed,  4 Sep 2024 12:21:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D1051BF47A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 798AE80C7F
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReLxHtqAoRFn for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BDB280C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BDB280C6F
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BDB280C6F
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:21:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f3f07ac2dcso72537751fa.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 05:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725452458; x=1726057258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=boZ4YuA/2Sf88w9E0YNE6ImutR5jU0EzBfPDNpUnCx4=;
 b=Ku+a3X888Jjbded8KzY6b9mAFkyTaXCsubqHA9sUxyv/E6JqD4unto5VhBj6jDY0fp
 M7wvwioiHCtfnaGtHRSBvj+m+qYjs5WOl9uODaRBFFbxgowJ60KmqCSED42uymC1+Bi0
 +U5bJdDn02bk9L2Cm79DzDEaaS3WJOfihiXgIf06aXPRkLqehoUocZIgLoVmlKLvcVAn
 sG1wZaSMtwPSuBNopZhxynn5Yz8nED292xiLPpn1LwMtZrcLj1v3herFxTJlkVrw3knS
 adrPUTFmvMxzp8EA70oP/FM7AhSjm/yHH6CSsa7PWevU6H0doDbY/uTWCDKoeTyiJAO3
 wPMg==
X-Gm-Message-State: AOJu0Yz9Nkcb12Iq0YEXDYAU80Xa0Jfh2UoZV3ppzpYprI5erz65GtUN
 oBDhy0R2dizzgSHwHFtQ6L7N1pfZborviFGpE0QGQsXIRbXsEaB2RiG1Fw==
X-Google-Smtp-Source: AGHT+IHkxEL8AotS4Snptra0o9KQAeryVMgLcoRSawsiDUAmCtefAJQKe2lYA98EHaVRT/IIiewa6Q==
X-Received: by 2002:a05:6512:b09:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-53546ba03a3mr12198868e87.58.1725452457148; 
 Wed, 04 Sep 2024 05:20:57 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540841326sm2333930e87.197.2024.09.04.05.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:20:56 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 14:20:37 +0200
Message-ID: <20240904122040.738362-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725452458; x=1726057258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=boZ4YuA/2Sf88w9E0YNE6ImutR5jU0EzBfPDNpUnCx4=;
 b=V5sUFNJ/z3436p2f/NAyj496ntkqV3DEmd9X0U3hJW5GEVQZZkjwZ/kf7PszCeepaB
 P/mo0WrBcYm9XIq+WP7mpj0PZOWt+fWl0VWEEa8HTjvXf/BiEdwMPQOrWrW6d60J/CGp
 0kBlyq43cppTzK6xTpLYWfATA5vkpRfa8dRSfDhca4JU+Bi/1L93t0QH8eekqJxPH+DX
 bB8B+NXtuiBzpljzjPsZO1y12usFBzFRx11rBEi406urjM+s2ydWrC97qEmIwKkakz7H
 j8DVrvgzBddLHAN2WQxK4tpLC+Ggg+p41aC0k61UHQ3kizP6nUmluTmx2QJsf8/H/lHr
 Y27A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V5sUFNJ/
Subject: [Buildroot] [PATCH 1/2] package/qt6/qt6tools: allow building host
 Qt Linguist Tools
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

According to src/linguist/CMakeLists.txt we need to enable the
linguist feature:

...
if(NOT QT_FEATURE_linguist)
    return()
endif()
add_subdirectory(lconvert)
add_subdirectory(lprodump)
add_subdirectory(lrelease)
add_subdirectory(lrelease-pro)
add_subdirectory(lupdate)
add_subdirectory(lupdate-pro)
if(QT_FEATURE_process AND QT_FEATURE_pushbutton AND QT_FEATURE_toolbutton AND TARGET Qt::Widgets AND NOT no-png)
    add_subdirectory(linguist)
endif()
...

And according to configure.cmake we need to select print support:
...
qt_feature("linguist" PRIVATE
    LABEL "Qt Linguist"
    PURPOSE "Qt Linguist can be used by translator to translate text in Qt applications."
    CONDITION TARGET Qt::PrintSupport
)
...

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/Config.in   | 11 +++++++++++
 package/qt6/qt6tools/qt6tools.mk | 10 ++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 5f52c5644f..eea461a2a9 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -15,3 +15,14 @@ config BR2_PACKAGE_QT6TOOLS
 	  and design of applications.
 
 	  https://github.com/qt/qttools
+
+if BR2_PACKAGE_QT6TOOLS
+
+config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
+	bool "linguist tools (host)"
+	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	help
+	  Translate Qt C++ and Qt Quick applications into local
+	  languages.
+
+endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 09c986cfc6..897cf43054 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -37,11 +37,17 @@ QT6TOOLS_DEPENDENCIES = \
 	qt6base \
 	host-qt6tools
 
+HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
+
+ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
+else
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
-HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
-
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
