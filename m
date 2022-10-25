Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B72FA373F
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2A644026E;
	Tue, 25 Oct 2022 06:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A644026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZpth1ok0Wm4; Tue, 25 Oct 2022 06:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1F8140220;
	Tue, 25 Oct 2022 06:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F8140220
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6A701BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE4604025F
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE4604025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P19S_-x6F8OD for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:54:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6104019B
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC6104019B
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:54:04 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ud5so6592632ejc.4
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 23:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxW2ZCKeTbtQWQ66YKY2OJLuN8iMARwfta5f12CMweo=;
 b=XM/PAk7O2+pHP3tG4g80TX/gmDF2/ST5f8UOa+vQny86PxW6AvYz+4L75FJGdjtKkp
 Wrq7SB+w/biaDzbtakFOP15mr5sWQi2urM5XOPEWPoUERqUkL+57KFA7ql7HAHENzaWG
 JkKHJh/5FcNOkLJwzKGYeI7F6NxF5tZpN7UgICAzNVDU/mQbbs1iA6hmQbyFI7BgbTTi
 T/kgWiscuZkSvR9p4MXNzyqwiZUySgHQ3kin/lPXtQnM1l/xJdaaWAaFnMTHEGWibJBL
 bPaqTiyzKZBBUHYL+0AWXBjMjFUYRqwN2ClxOiiGG9VqGrrJ6cYj7snSvyxs4A2viLHr
 TqPg==
X-Gm-Message-State: ACrzQf3mHWkMXmOkESeybneg2vzyB4mUBrnvoRrCDZ6yN+XkCovSdvxq
 GMlzTgf1wP25cDMxSuPGmhhKiQnwJxlH0IRRMQ0=
X-Google-Smtp-Source: AMsMyM40WRTsG6C5biGKNfBkY9tubLuDfKs3lm69bidb/KE+hY4CxhZuR//NTlw8586MlKIzWYnK/A==
X-Received: by 2002:a17:906:fe46:b0:730:ca2b:cb7b with SMTP id
 wz6-20020a170906fe4600b00730ca2bcb7bmr32135465ejb.703.1666680842453; 
 Mon, 24 Oct 2022 23:54:02 -0700 (PDT)
Received: from smart-All-Series.cisco.com (ip34.ip-145-239-104.eu.
 [145.239.104.34]) by smtp.gmail.com with ESMTPSA id
 dm28-20020a05640222dc00b004587c2b5048sm1044521edb.52.2022.10.24.23.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 23:54:01 -0700 (PDT)
From: Nasser Afshin <afshin.nasser@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 10:23:56 +0330
Message-Id: <20221025065356.1838-1-afshin.nasser@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxW2ZCKeTbtQWQ66YKY2OJLuN8iMARwfta5f12CMweo=;
 b=bJkQt1/9Rumgdbe8e3GIM99AlqvyeOBqUuOEO8aRDzkHElhxkvOoaC2hNMIE4VBDp7
 QbaofhN0u+PZyuRhYWTJVKvTyanFB1A9VK9Lxu2JWtjaMAtMQ9jwLZHgR8gRgUt9ZqhJ
 odq4lGJPtaiVX5zdnHK02dEunCy06jQXE6gx5A0SwMwmXLbXT3ga9RYSQpP0bFNezoFq
 NfzSGaA/KlJXOaIl2UPr3WfiMkMyQGfofY74OT0zTEuHA/FpuU+1fG7AHiUTwVuf8ah0
 gwjRq0k2h18M/7j4gT6imuiv3fj9CWve20yITTHJMlqqIwSEEaKw70rtUA+xsxFSNueC
 0IOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bJkQt1/9
Subject: [Buildroot] [PATCH] python-wheel: new package
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
Cc: Nasser Afshin <afshin.nasser@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-wheel/Config.in         | 15 +++++++++++++++
 package/python-wheel/python-wheel.hash |  5 +++++
 package/python-wheel/python-wheel.mk   | 14 ++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/python-wheel/Config.in
 create mode 100644 package/python-wheel/python-wheel.hash
 create mode 100644 package/python-wheel/python-wheel.mk

diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..56b1a08d8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1062,6 +1062,7 @@ menu "External python modules"
 	source "package/python-websocket-client/Config.in"
 	source "package/python-websockets/Config.in"
 	source "package/python-werkzeug/Config.in"
+	source "package/python-wheel/Config.in"
 	source "package/python-whoosh/Config.in"
 	source "package/python-wrapt/Config.in"
 	source "package/python-ws4py/Config.in"
diff --git a/package/python-wheel/Config.in b/package/python-wheel/Config.in
new file mode 100644
index 0000000000..225d7529a4
--- /dev/null
+++ b/package/python-wheel/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_WHEEL
+	bool "python-wheel"
+	help
+      This library is the reference implementation of the Python wheel
+      packaging standard, as defined in PEP 427.
+
+        It has two different roles:
+            1. A setuptools extension for building wheels that provides the bdist_wheel
+            setuptools command
+            2. A command line tool for working with wheel files
+
+        It should be noted that wheel is not intended to be used as a library, and as
+        such there is no stable, public API.
+
+          https://github.com/pypa/wheel
diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
new file mode 100644
index 0000000000..be82f63a30
--- /dev/null
+++ b/package/python-wheel/python-wheel.hash
@@ -0,0 +1,5 @@
+# md5 from https://pypi.python.org/pypi/wheel/json
+md5 f490f1399e5903706cb1d4fbed9ecb28  wheel-0.37.1.tar.gz
+# Locally computed
+sha256  e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4  wheel-0.37.1.tar.gz
+sha256  cca9e20c6af1fcfbf69408f377769286cbeebcded336100c9b4a3f35fbe635e4  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
new file mode 100644
index 0000000000..d8fab54867
--- /dev/null
+++ b/package/python-wheel/python-wheel.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wheel
+#
+################################################################################
+
+PYTHON_WHEEL_VERSION = 0.37.1
+PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/c0/6c/9f840c2e55b67b90745af06a540964b73589256cb10cc10057c87ac78fc2
+PYTHON_WHEEL_SETUP_TYPE = distutils
+PYTHON_WHEEL_LICENSE = MIT
+PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
