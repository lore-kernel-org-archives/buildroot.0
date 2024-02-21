Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5871EC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07DFA605F9;
	Wed, 21 Feb 2024 17:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZZ59J9HXn62; Wed, 21 Feb 2024 17:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F28E960F1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F28E960F1D;
	Wed, 21 Feb 2024 17:39:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 249D81BF2FD
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F31460F1D
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54nFK_DduaNN for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:39:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09B97605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09B97605F9
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09B97605F9
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:39:21 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so13789031fa.1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 09:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708537159; x=1709141959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4S98gmCASr+jzZbJWr5Lfm8uvAQPH6JQeWNw9FSJMzE=;
 b=XcN2J9CahJc+Jeo54k+X20MAQbSEzcSXIB6RImXdek2tl0sY/lJj+he2ryCTBlAptq
 Nlw+2QUd7ohs3KeYfMhNPR99qisr8Z0cfve2RXtNww/Egs7ruQ71aUvD/S+QqrtEAKOk
 GMk6fVrracyNp15AGMKCdRLGfF+pUECQmLRP+cXLLeEYKWGWdZ2AE/XmYLTKclVsJe9H
 3DLMxxD0DZCC6q3CfWSylxAqYCG/CINMHgIrk7eEuWSP8Tdp6dxXetE627I3x2Re6w6H
 sGrrUurV1EsUfczUAv251UXYPS6oOguimHnNCf8R/ermrgab+pPHKgaE2MzUZSimCYsb
 GU+g==
X-Gm-Message-State: AOJu0YzXamxpA7VPnLp1SIOUQuMxr5g8x+27AypqsiLte8UKIx7xxWLc
 8KWWB7ZSl7f9Mro4DcyYaWUL0ffVm90xr5y5E2Q9kLObJGUqh4GsGmAjSQIZGE4=
X-Google-Smtp-Source: AGHT+IGCugP+pEC+g5grxbbOHr5psqGy1pBLn4tkB1dzdYkmjhgrxhmHUHJWyEqbcc5oCIJfAqiG6g==
X-Received: by 2002:a05:651c:218:b0:2d2:3437:ef4a with SMTP id
 y24-20020a05651c021800b002d23437ef4amr6691268ljn.42.1708537158770; 
 Wed, 21 Feb 2024 09:39:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c230d00b00411d640085csm18553451wmo.43.2024.02.21.09.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 09:39:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 18:39:16 +0100
Message-ID: <20240221173916.1095723-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708537159; x=1709141959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4S98gmCASr+jzZbJWr5Lfm8uvAQPH6JQeWNw9FSJMzE=;
 b=IPcY4+lXWUezbQiwMYAdSEcQMVVNvsFb9LtXvVy91l8LnHNq6K9j5zqqDPQRjfb5iC
 11tBwTGVyUkfmCDHbk+uOS/jupTkNc2LajroQWev0/YEQ8J8AC/qkbD+C3GPhkWS5/gv
 HM8HvP3G78MrmDPcIt1pGB1jS6oPWwJeex/k6PES5B2bCf3C0X2KgwPW9pAcZxBqymyx
 mfH6BQhou+HMiK9rj/Bik2z1crnHMxRDD4bvAi9BDp1Np1lv+1PmQxqkuzn1d0Se+eKW
 Bk5/kQ3PfgvcwoOl6MGTcHcjmi/bv70OEg09HOINLaYjF6/x2maJbhwcIekvjueAsomL
 WEAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IPcY4+lX
Subject: [Buildroot] [PATCH 1/1] package/cegui: fix build with libxml2 >=
 2.12
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of libxml2 to version
2.12.1 in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:

/home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp: In member function 'virtual void CEGUI::LibxmlParser::parseXML(CEGUI::XMLHandler&, const CEGUI::RawDataContainer&, const CEGUI::String&, bool)':
/home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp:111:40: error: invalid conversion from 'const xmlError*' {aka 'const _xmlError*'} to 'xmlError*' {aka '_xmlError*'} [-fpermissive]
  111 |         xmlError* err = xmlGetLastError();
      |                         ~~~~~~~~~~~~~~~^~
      |                                        |
      |                                        const xmlError* {aka const _xmlError*}

Fixes: d8ac52108c12f0fcc9641b63e7922009270f96c6
 - http://autobuild.buildroot.org/results/b239b7b03542311e311e4612e9b811c154302a6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-of-xmlGetLastError-for-libxml2-2-12.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch

diff --git a/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch b/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
new file mode 100644
index 0000000000..9091062e28
--- /dev/null
+++ b/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
@@ -0,0 +1,29 @@
+From 285ba5a2c0c435ed865c6e86afe314a822fd1e3f Mon Sep 17 00:00:00 2001
+From: oreo639 <oreo6391@gmail.com>
+Date: Sun, 18 Feb 2024 14:16:21 -0800
+Subject: [PATCH] Fix return type of xmlGetLastError for libxml2 2.12
+
+https://gitlab.gnome.org/GNOME/libxml2/-/commit/45470611b047db78106dcb2fdbd4164163c15ab7
+
+Upstream: https://github.com/cegui/cegui/commit/285ba5a2c0c435ed865c6e86afe314a822fd1e3f
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ cegui/src/XMLParserModules/Libxml2/XMLParser.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
+index 74a3dbddd..a408f9305 100644
+--- a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
++++ b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
+@@ -109,7 +109,11 @@ void LibxmlParser::parseXML(XMLHandler& handler,
+ 
+     if (!doc)
+     {
++#if LIBXML_VERSION >= 21200
++        const xmlError* err = xmlGetLastError();
++#else
+         xmlError* err = xmlGetLastError();
++#endif
+ 
+         throw GenericException(
+             String("xmlParseMemory failed in file: '") +
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
