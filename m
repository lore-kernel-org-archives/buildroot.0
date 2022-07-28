Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3E8C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98162605B2;
	Thu, 28 Jul 2022 21:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98162605B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rIe0Xkc2Wha; Thu, 28 Jul 2022 21:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A7460BB2;
	Thu, 28 Jul 2022 21:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A7460BB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3893C1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1308B60ACD
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1308B60ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eir_jjol0ibc for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:13:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C04607F0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5C04607F0
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:13:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b26so3817099wrc.2
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 14:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lYPvJhklBhCR9pYdocBEU7ytLZbAmhdFJ1wdj44G5Rs=;
 b=71pBKCqb+WYmUJ1NPOHe7+e6EMIKjt0QIxNUUsqRycy/7m/baoCi4CEYELjl5ljH6a
 7bzXlJ+5ylMof0zaDGf/FKmxEM2UkXSwrDD2WZD1rkuRP5mZFK4tzhzB0wisKnMz9Igc
 vksnUst/8l1o0AMFhkd3E68BAKqL3JcQhQRcaRvI9V1GbBKRtukSSx5TdV/xJyR0drEL
 wQERKoo0+moTm8xifWz7lYQSEaocWFTE5///PBxDuZJm4a5wbyyuUS0bc3J6wQdlX1lJ
 pBgzUtWN6nEbMSQgMknsOeN/evKsAjrORbUyyKVnh/Vf9ZN5ifo3JYHFl6n62NBVyxBE
 kAsA==
X-Gm-Message-State: ACgBeo0N2CMN7wN9+m0U/K7Wsj+TjxYs68xxgHMnIPJNX8Ef8Y1bnbUm
 Qv40PbJZSBl7RxcDtS3b9cBHonwWRxdAGA==
X-Google-Smtp-Source: AA6agR5fc6ekBg28ZZBRJ08PzetFg/qnxbpjLf4hyz2m1QtGRrBq6WTPMJhDAwVzYoAveMrAP/XmDA==
X-Received: by 2002:a05:6000:15c3:b0:21d:9f8b:2c3e with SMTP id
 y3-20020a05600015c300b0021d9f8b2c3emr478966wry.72.1659042785037; 
 Thu, 28 Jul 2022 14:13:05 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. ([37.162.209.91])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a5d6092000000b0021eb5a1bb1csm1991106wrt.30.2022.07.28.14.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 14:13:04 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:12:59 +0200
Message-Id: <20220728211259.121416-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lYPvJhklBhCR9pYdocBEU7ytLZbAmhdFJ1wdj44G5Rs=;
 b=kYIkveDY4JGFiSjOrSfJpay6QXHpYApYxY7I6SSA5g8YI0iXAY6u1PU2KlzTb3644M
 wT2FTVwHkfmIVboD5KJqraTEMs63C5MIWMjKvKFR6tCny0X7QiUZW+klOJwof4liGRM9
 vD4hr38r8XEWiiIOBOSlB5SrK2uUj5/6MvJzQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kYIkveDY
Subject: [Buildroot] [PATCH v2] package/libdill: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libdill is a C library that makes writing structured concurrent programs
easy.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changelog

v1->v2:
* Added comment to autoreconf (Romain)

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libdill/Config.in    |  7 +++++++
 package/libdill/libdill.hash |  3 +++
 package/libdill/libdill.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/libdill/Config.in
 create mode 100644 package/libdill/libdill.hash
 create mode 100644 package/libdill/libdill.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cb98c3883d..f32eb6babf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -164,6 +164,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 4ff1fb2f3c..fd0598c537 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1999,6 +1999,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdill/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libdill/Config.in b/package/libdill/Config.in
new file mode 100644
index 0000000000..0e6757b809
--- /dev/null
+++ b/package/libdill/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDILL
+	bool "libdill"
+	help
+	  Libdill is a C library that makes writing structured concurrent
+	  programs easy.
+
+	  http://libdill.org
diff --git a/package/libdill/libdill.hash b/package/libdill/libdill.hash
new file mode 100644
index 0000000000..4a1fb91a57
--- /dev/null
+++ b/package/libdill/libdill.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  6df7527e8f1e91f5106c21c5bfeaa69eee470bec476c74585143e3e439864404  libdill-fa01648cf2a8d06e53c965b45eeacfb3ac57bd04.tar.gz
+sha256  3f78d9c42c8919cb6dc63e51de17b9eb40a49d9cdd876ce59e77392721e8c2c6  COPYING
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
new file mode 100644
index 0000000000..822f07b939
--- /dev/null
+++ b/package/libdill/libdill.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libdill
+#
+################################################################################
+
+LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
+LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
+LIBDILL_LICENSE = MIT
+LIBDILL_LICENSE_FILES = COPYING
+LIBDILL_CPE_ID_VENDOR = libdill
+LIBDILL_CPE_ID_PRODUCT = libdill
+LIBDILL_INSTALL_STAGING = YES
+# Fetched from Github, with no configure script
+LIBDILL_AUTORECONF = YES
+
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBDILL_CONF_OPTS += --disable-threads
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBDILL_DEPENDENCIES = openssl
+LIBDILL_CONF_OPTS += --enable-tls
+endif
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
