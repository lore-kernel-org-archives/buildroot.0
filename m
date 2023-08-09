Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E22C001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59EDB60E83;
	Wed,  9 Aug 2023 21:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59EDB60E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqyfagXUOc6k; Wed,  9 Aug 2023 21:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5676761241;
	Wed,  9 Aug 2023 21:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5676761241
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEB601BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96E3741757
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E3741757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_LTDPcJCMLx for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:16:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9085441745
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9085441745
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0CCCA4C1116;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVG-0001EZ-2g;
 Wed, 09 Aug 2023 23:14:02 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:13:52 +0200
Message-Id: <20230809211401.3587177-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
References: <20230809211401.3587177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=eICMZ1hOsJ0OuHrzQc0zsLus1rj0CfFVwTp8gZJJhqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M0uEca3o19t7/Dxj27hafopLIxDYA4laQYEl73XeMQv9zOj4ZIoxF60uXhfMQNmDa
 d7WYoXfXdtCEHo316RlDwP+17bsTLMJs6uijSncMIiXEeyiagxP0SVQ0TKEQ5fG10k
 GDh6Xp8wcz79i5/cBXyNgKL+y4BVxMRfrq4YSWeeIuycjgR56CNlaH86QroizzUFHo
 8CRoOYgDQ9Qe4j/AwSl/wUCAr8XVntzvd70j9XAG7TBiryWAutuL/ZnyfmxZZTtEW5
 loYV343QZpu7o0sT4xI5N4PLCPIUL7JwWploJTionU9OjoTYhB78SgbBC9474j5ZOw
 bdY9cMNw0jTFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=M0uEca3o
Subject: [Buildroot] [PATCH/next v3 05/14] package/python3: use upstream
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
index cbd62e499b..7f64de8cc6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1230,7 +1230,6 @@ package/python3/0019-Add-an-option-to-disable-unicodedata.patch Upstream
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
