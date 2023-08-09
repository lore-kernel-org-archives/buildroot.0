Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28E2C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BEFA418FA;
	Wed,  9 Aug 2023 17:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BEFA418FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVGR7ZGNW4vc; Wed,  9 Aug 2023 17:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBBF94194E;
	Wed,  9 Aug 2023 17:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBF94194E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41F331BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14490418DE
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14490418DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IfRvQrneab8 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:35:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8EF14191C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8EF14191C
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B357A4C110E;
 Wed,  9 Aug 2023 19:33:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3v-0001yu-2g;
 Wed, 09 Aug 2023 19:33:35 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:25 +0200
Message-Id: <20230809173334.2514813-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602416;
 bh=aTQuiGMFi/mqiYwjmYBf3qL3w552t6tyW7a2y4ogD38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zZbcgCSC0WME7UikEWAbIBgcr8nMzjvt0S2ETeLdyyjcvxJ9LwNLe7cp+X85NRQvM
 +iuDXyhJ2zqLii3P6Ya/nMvEXarxrUXpNhFIFp6bQ8KZBw8hWG5rbcQMNz6jpkwL1D
 0Hi9/OfZ62b2ySer7iXbnubLojDfAKzhyuFmfZZpHr+8bSb+dju4sooUATY31TtbWe
 qeSBAR2YS6b36V+tgJ/Jj8BMG2XEQh/Z/vexf9wsgLa01Luoissqzy8497HkxVwQyq
 hHCqbt+z7X7V759uISzAkjbmoqoXFxTXpmAlSDi8JPUJRVM8J8Hcr6sVAWtL+NeWNV
 vHlkUW27qqTxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=zZbcgCSC
Subject: [Buildroot] [PATCH/next v2 07/16] package/python3: use upstream
 build system to disable ssl module
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...an-option-to-disable-openssl-support.patch | 30 -------------------
 package/python3/python3.mk                    |  8 +++--
 3 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index efab5e9118..7bc62afa59 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1227,7 +1227,6 @@ package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
-package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
deleted file mode 100644
index d4c9fd43be..0000000000
--- a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 25c900e81a2fc0bbe35e7c94e2e5028cfbf6582a Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Wed, 22 Feb 2017 17:55:59 -0800
-Subject: [PATCH] Add an option to disable openssl support.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index db33d567ad..42fe6c8f5a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4219,6 +4219,12 @@ AC_ARG_ENABLE(unicodedata,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-   	  fi])
- 
-+AC_ARG_ENABLE(openssl,
-+	AS_HELP_STRING([--disable-openssl], [disable openssl support]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3093ae0fab..596bf44b56 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -62,7 +62,9 @@ endif
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-HOST_PYTHON3_CONF_OPTS += --disable-openssl
+HOST_PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 PYTHON3_INSTALL_STAGING = YES
@@ -118,7 +120,9 @@ ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
 PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 else
-PYTHON3_CONF_OPTS += --disable-openssl
+PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
