Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55099C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0135241915;
	Wed,  9 Aug 2023 17:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0135241915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCRot8lDbNSC; Wed,  9 Aug 2023 17:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA46641934;
	Wed,  9 Aug 2023 17:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA46641934
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397A91BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2020A82322
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2020A82322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mvcH9F5vwUR for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:34:26 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48655821B7
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48655821B7
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A9BCA4C110B;
 Wed,  9 Aug 2023 19:33:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3u-0001yu-32;
 Wed, 09 Aug 2023 19:33:35 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:23 +0200
Message-Id: <20230809173334.2514813-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602415;
 bh=mzzHigiXiQ98i5079FiM0oBkYV1P1tqTpb5OHOXIx4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GnPbbnk5GLZTe8rOhybDrr/O0mgMgAxokNKOkpfCjMISxCBk2EPI0NZ3mswutiRI2
 ykwWtKMemiDfpygqd7cXsuTlo8zAH536RAcdNRnLGHkrLlgtN8TMeNqKoVu1DOirIk
 kS2GRtcRsRPr1K80vPcYTECI4j6r0mcStyMA4w3NiEn7Ug90QrKQhbll17/Y4pioMf
 IwLyBgFMX3XFEIsFugPxoENMe9oa+sCdEohxZj5ErZEq62IdUIGD7o06KxxetuISBp
 UL6HQ7n5H6QR9qZ4mctexX26e1aRGtgQb5C20b+TMVPCntG72cwxuMSVigJZT4vWG4
 y4ST4eWUzAYsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GnPbbnk5
Subject: [Buildroot] [PATCH/next v2 05/16] package/python3: use upstream
 build system to disable bzip2/zlib/xz modules
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
 ...to-disable-zlib-bzip2-and-xz-modules.patch | 42 -------------------
 package/python3/python3.mk                    |  8 ++--
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3945ea268c..7bc17c0477 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1230,7 +1230,6 @@ package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
 package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch Upstream
-package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
deleted file mode 100644
index 70a0d6cd15..0000000000
--- a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 988a335cb34b5fc25ea345ba04ff5ddffe2e946c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:31:11 +0100
-Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 19875d7d30..ca6c16491a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4231,6 +4231,24 @@ AC_ARG_ENABLE(readline,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
- 	  fi])
- 
-+AC_ARG_ENABLE(bzip2,
-+	AS_HELP_STRING([--disable-bzip2], [disable bzip2]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bz2"
-+	  fi])
-+
-+AC_ARG_ENABLE(zlib,
-+	AS_HELP_STRING([--disable-zlib], [disable zlib]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
-+	  fi])
-+
-+AC_ARG_ENABLE(xz,
-+	AS_HELP_STRING([--disable-xz], [disable xz]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _lzma"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5d36917817..2a552cd0f4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -55,7 +55,7 @@ HOST_PYTHON3_DEPENDENCIES = \
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
 HOST_PYTHON3_DEPENDENCIES += host-bzip2
 else
-HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+HOST_PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
@@ -133,19 +133,19 @@ PYTHON3_CONF_ENV += py_cv_module__uuid=n/a
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 else
-PYTHON3_CONF_OPTS += --disable-bzip2
+PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
 PYTHON3_DEPENDENCIES += xz
 else
-PYTHON3_CONF_OPTS += --disable-xz
+PYTHON3_CONF_ENV += py_cv_module__lzma=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
 else
-PYTHON3_CONF_OPTS += --disable-zlib
+PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
