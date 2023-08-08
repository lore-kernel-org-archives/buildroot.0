Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D5C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B5EF82112;
	Tue,  8 Aug 2023 18:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B5EF82112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtX_IGM2ssWP; Tue,  8 Aug 2023 18:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 845358209C;
	Tue,  8 Aug 2023 18:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 845358209C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBEEC1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6224820EF
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6224820EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApTqwPOmQT3o for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:52:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE51F820D3
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE51F820D3
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0ACBEA4C1101;
 Tue,  8 Aug 2023 20:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnR-0005AS-2U;
 Tue, 08 Aug 2023 20:51:09 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:50:59 +0200
Message-Id: <20230808185108.3787835-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520670;
 bh=yaWmbvRDEYMhr7nChSTn2eiHeuv7GEsCPWMrEjutbkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F/FT2sbRUCnH+NgIXpDhx4496VoxtGlG50a7NRF90TA8EDI7rYIdytiHEb8Fyg36a
 ldO8ypSggKyMsCig1V+wjdXAiXRHCsA0gdxl9x6P4t3ahEDyqyZysJJR9scCiLyNXU
 WStwN2/kZUjCbU15zz9ebr0PtOeUoXG0IoqgsBZ7eKJBeKcvWerA3e5G0HWj7mkkBH
 C5inl/oBUlcE+4DgshTNTq93OjOhYCCsV0OgWUovJv9UxwWaqXA2euYRhZBMziqJ1a
 C/cro/y1JCOjtEcrPcU0DQdoC/ypvEn4K4AZebfGkfnhGBNK/1zvkJdWvxnELa0uuk
 PKnm2xokbHcug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=F/FT2sbR
Subject: [Buildroot] [PATCH/next 07/16] package/python3: use upstream build
 system to disable ssl module
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
 ...an-option-to-disable-openssl-support.patch | 30 -------------------
 package/python3/python3.mk                    |  8 +++--
 2 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch

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
