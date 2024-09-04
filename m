Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF62DCD4F32
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4EA580DC9;
	Wed,  4 Sep 2024 21:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uj7O0--zlIYS; Wed,  4 Sep 2024 21:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEA48812E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA48812E6;
	Wed,  4 Sep 2024 21:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E88C71BF423
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D604B608A4
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 21:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDiZg2yy8bod for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 21:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 955A660896
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955A660896
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 955A660896
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 21:11:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f4f2868783so523291fa.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 14:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725484260; x=1726089060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDH27ulVswsl6xZ+2BJerKqAYDIyLvbzr+fvTNLRRKI=;
 b=JpmZQFLWfO/7StelGzoX5VSPpN2Ixli1vm9CwJOseTvBmvL0XnS2w/DYYFjGh0mv/f
 mVAncoM+o8SW6mz1IvKk/a7OHrpPnRLyZScR1CBV4qXTo+vaxEpmYrl+AYvGfw7k0mBk
 T535ZBM1dmMteoxx+GHDwvw5aPRlhhXhgaanlnb98qulWR+JC9A4JMrH3rCLMyusMAJK
 qOPdv9hwiMSXm5bnxSY7YgVx4LPqtmGONwJ+Zp14NTE7EJHzP5qZ/qTwknFUPLqSukSD
 jJSErXPjuYbMPZlQA+KFvlVn6do+9Q0U2iVMSOEQSk6db1tx3eOODHkpIo9Kw2YijniE
 CLeQ==
X-Gm-Message-State: AOJu0YyzAZ/0Vjj3pEypIFbXxvgUuSQIgcQCBcS349EEVQgck5izYXHv
 QNhrfegreRr0nxYBIbIxGKWbf5bS6vQ8fG0M5ThraBEseDvPXYE9g1HUqA==
X-Google-Smtp-Source: AGHT+IHZWVRRlp4OfHhQUTx7TTm/axWf7xoNXatbbpYoVBHKGv2qgLijChc0QBTiqkjnyrOHA7GnXg==
X-Received: by 2002:a05:651c:211f:b0:2ef:2df7:3d9a with SMTP id
 38308e7fff4ca-2f61e02582emr131083751fa.9.1725484259462; 
 Wed, 04 Sep 2024 14:10:59 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed1565sm26308861fa.6.2024.09.04.14.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 14:10:58 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 23:10:46 +0200
Message-ID: <20240904211049.866640-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904211049.866640-1-roykollensvendsen@gmail.com>
References: <20240904211049.866640-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725484260; x=1726089060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDH27ulVswsl6xZ+2BJerKqAYDIyLvbzr+fvTNLRRKI=;
 b=hJu5ay+joIRrS3O3zjDdLHbPOqSIvZOndUGsjYUAdAFIF7i+RYwLyy54a2kVVGXkqL
 PxGivnGbug57YCyj65yQW0UF0CuYtg78p7KIP49Xak1K0imbzeUEDZ2YW4pannWBIM7Z
 G2fgWKPszS1WujQkDa44IOluny+owsXburgULorXIURewoxL0KsM4E977AX8RPJnTCQH
 6BAsqZlzZwu4Apf+nEY18Km3TY4IeNJdyhyYWIb0HQjURNZ/eXVyKnewvQ3fyYyRgPIR
 FH+C9URmGl/4AvAyOyN3mgZ+NMOJXmTTAAg2qL52xogIgZeOGmqkt3h4ST9zpRc27FHk
 BOxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hJu5ay+j
Subject: [Buildroot] [PATCH v2 3/3] package/qt6/qt6tools: add option to
 build host linguist tools
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

According to src/linguist/CMakeLists.txt we need to enable the linguist
feature:

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
In response to:
https://patchwork.ozlabs.org/project/buildroot/patch/20240904122040.738362-1-roykollensvendsen@gmail.com/

Changes v1 -> v2:
  - avoid inter-twining target package and host package details in the
  mk-file  (suggested by Thomas)
  - move host linguist tools option into Config.in.host  (suggested by Thomas) 

 package/qt6/qt6tools/Config.in.host | 11 +++++++++++
 package/qt6/qt6tools/qt6tools.mk    |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 4fd28172b9..110ecbee9b 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -13,3 +13,14 @@ config BR2_PACKAGE_HOST_QT6TOOLS
 	  and design of applications.
 
 	  https://github.com/qt/qttools
+
+if BR2_PACKAGE_HOST_QT6TOOLS
+
+config BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS
+	bool "host linguist tools"
+	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	help
+	  Translate Qt C++ and Qt Quick applications into local
+	  languages.
+
+endif
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 09c986cfc6..e91db79a12 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -43,5 +43,11 @@ endif
 
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
+ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
+else
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
