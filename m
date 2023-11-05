Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E912FC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 09:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C79260FEF;
	Sun,  5 Nov 2023 09:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C79260FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xhFT64dfnTb; Sun,  5 Nov 2023 09:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADEF960FEB;
	Sun,  5 Nov 2023 09:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADEF960FEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFB881BF578
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1B8F81E83
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B8F81E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOhSTE12iB0m for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 09:10:46 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C06FD81E81
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 09:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06FD81E81
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7a93df91813so129258939f.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699175445; x=1699780245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vHKTYfMZ1ET1u3t7f8DdG2U+WCruHtQFBC2PPZJelbI=;
 b=wU9TY6GK8qCiiUo+X43ZdsjcQWKYxrCmyj3rxNd+wqx8WClLTkCVHC72okvDqu8ril
 /UQ7UlNzXuDHOu+f9foH0UivOrsBCbeOEObjqLYlBhK/b4DC/YaR04E+vCMNmvV7SKjy
 POVNJXrXJ7Uy1ZMnDJcrCPsfQxiV4T8DyCWlET11tqSWRCMNO84+zjwc8eVKTmtFBWhB
 CjVHTCrz+079Ugkc3nyE8HOz1zCiOomkdQgnEkoXzpPYGvDxveGuqX6tP92AYTTxdRt1
 0+AmavsJpv47dbVifGrdbCS37nrlsNSI9eFuPAm1AIvWetRuPxX1MPxoktWJtgHWr4ro
 8cig==
X-Gm-Message-State: AOJu0YzlDUFbucaWK5ciS1qEHlCSuko92sH0ZCelcICaE06dRhGWvdHA
 ZNGY1jwodjVaJOegk76+lCleGMJZrgVQDA==
X-Google-Smtp-Source: AGHT+IGtlu2GcHdz+z9yqhqYQW6R6ajCEU+Exx9dobPayUJh04npIGYT3KTmd95+K5apYyVYVRhD0A==
X-Received: by 2002:a05:6602:2ad6:b0:798:2415:1189 with SMTP id
 m22-20020a0566022ad600b0079824151189mr32291177iov.12.1699175445208; 
 Sun, 05 Nov 2023 01:10:45 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 m14-20020a0566380ace00b0043a11ec651asm871207jab.169.2023.11.05.01.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:10:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 02:10:39 -0700
Message-Id: <20231105091040.2924287-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699175445; x=1699780245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vHKTYfMZ1ET1u3t7f8DdG2U+WCruHtQFBC2PPZJelbI=;
 b=ZUd3ocogbpIuxPYahi0P51YkUzogzHcbD31PA/lF6BuFaGyJVM4p4SVukStOwfrr/x
 NkUPdyhJXFkkfORgNO+Mybg/tGMmSG+0Zat1wVqt0OFnHtYHoo9I4kV4tHf9oLWUsALv
 jijJYO6wuzskibX4g7wCMnOrxrnC6wlB0gywqziKcKqdqYeh//qHegDP9Q6QVRfcW8y6
 +gSdIfQI6G5xF0Q+6YRBy6Uoobgmk3+AJyzWKDWkAvEkNA9loSNjrW5nW9DmMl7ABBUx
 OhoPYjE4wjBP/1N28TFv2jN0RWJCXailubfiqZ7TN4bc9kqLk92+zcO786JeYaj5P0D/
 k6iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZUd3ocog
Subject: [Buildroot] [PATCH 1/2] package/python-jeepney: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-jeepney/Config.in           |  6 ++++++
 package/python-jeepney/python-jeepney.hash |  5 +++++
 package/python-jeepney/python-jeepney.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-jeepney/Config.in
 create mode 100644 package/python-jeepney/python-jeepney.hash
 create mode 100644 package/python-jeepney/python-jeepney.mk

diff --git a/package/Config.in b/package/Config.in
index a0d5339b0a..d3f8b3c914 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1128,6 +1128,7 @@ menu "External python modules"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jedi/Config.in"
+	source "package/python-jeepney/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jmespath/Config.in"
 	source "package/python-json-schema-validator/Config.in"
diff --git a/package/python-jeepney/Config.in b/package/python-jeepney/Config.in
new file mode 100644
index 0000000000..700176e12f
--- /dev/null
+++ b/package/python-jeepney/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_JEEPNEY
+	bool "python-jeepney"
+	help
+	  Low-level, pure Python DBus protocol wrapper.
+
+	  https://gitlab.com/takluyver/jeepney
diff --git a/package/python-jeepney/python-jeepney.hash b/package/python-jeepney/python-jeepney.hash
new file mode 100644
index 0000000000..31a5bac183
--- /dev/null
+++ b/package/python-jeepney/python-jeepney.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jeepney/json
+md5  7e2151e9197c751ceca6550bc6b3294c  jeepney-0.8.0.tar.gz
+sha256  5efe48d255973902f6badc3ce55e2aa6c5c3b3bc642059ef3a91247bcfcc5806  jeepney-0.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-jeepney/python-jeepney.mk b/package/python-jeepney/python-jeepney.mk
new file mode 100644
index 0000000000..ac4c0283a8
--- /dev/null
+++ b/package/python-jeepney/python-jeepney.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jeepney
+#
+################################################################################
+
+PYTHON_JEEPNEY_VERSION = 0.8.0
+PYTHON_JEEPNEY_SOURCE = jeepney-$(PYTHON_JEEPNEY_VERSION).tar.gz
+PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/d6/f4/154cf374c2daf2020e05c3c6a03c91348d59b23c5366e968feb198306fdf
+PYTHON_JEEPNEY_SETUP_TYPE = flit
+PYTHON_JEEPNEY_LICENSE = MIT
+PYTHON_JEEPNEY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
