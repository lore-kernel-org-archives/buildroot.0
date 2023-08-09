Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF81C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6D4417C2;
	Wed,  9 Aug 2023 17:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6D4417C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6tzKLYw10lr; Wed,  9 Aug 2023 17:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE98D418FB;
	Wed,  9 Aug 2023 17:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE98D418FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 267B21BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3C4541AE0
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3C4541AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIziomHnQrNf for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:36:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB43C41A3A
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB43C41A3A
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DE411A4C1117;
 Wed,  9 Aug 2023 19:33:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3w-0001yu-1w;
 Wed, 09 Aug 2023 19:33:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:33 +0200
Message-Id: <20230809173334.2514813-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602416;
 bh=FknbfgInh1q9ktInLIOCm1yClOzo3zZm4KxlElZwSmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zdQPGwr/Dw1cnTT8nqdjrPFInAtiP/QU1ikFSUymo6ol2qaCuXZcsu2Tv5r+uu6Qc
 Nihy7xhdL9PQnMB947SDKYYXxmIUIAjOpmbG03O5mbOV/g6LXAjL1Pe1VBTWFC7nNh
 xeHe7cZDUG7rapuIy10xxxGCosErIDIA8F/jUHh9ehQ+1C47anX+AjXjuwWnckbl5N
 3M6w0TJKPqFKeMeum2SFDJaZqW8LK4nAaJxNqwI4sLzXQKD6NGuZiQu//Zo5XedQUK
 bWZd4q5zh40aPrC2dGtcU/+OEopRN7dri7DDV3iPiHj2+wSEkc/qTBfwKGwFJT3DoV
 zgqeGnqpIcUdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=zdQPGwr/
Subject: [Buildroot] [PATCH/next v2 15/16] package/python3: use upstream
 build system to disable sqlite3 module
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
 ...option-to-disable-the-sqlite3-module.patch | 62 -------------------
 package/python3/python3.mk                    |  4 +-
 3 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 22f16cf744..6a3babb16e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1218,7 +1218,6 @@ package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch Upstream
 package/python3/0011-Add-an-option-to-disable-pydoc.patch Upstream
 package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
-package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
diff --git a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
deleted file mode 100644
index 795ea3b898..0000000000
--- a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From ef8c030e01b1be8be582e90c31298a5863094858 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:20:45 -0800
-Subject: [PATCH] Add option to disable the sqlite3 module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Makefile.pre.in | 5 ++++-
- configure.ac    | 9 +++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f5d0573067..9f4cdf14cf 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
- 		multiprocessing multiprocessing/dummy \
- 		re \
- 		site-packages \
--		sqlite3 \
- 		tkinter \
- 		tomllib \
- 		turtledemo \
-@@ -2018,6 +2017,10 @@ TESTSUBDIRS += lib2to3/tests			\
- 	lib2to3/tests/data/fixers/myfixes
- endif
- 
-+ifeq (@SQLITE3@,yes)
-+LIBSUBDIRS += sqlite3
-+endif
-+
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
-diff --git a/configure.ac b/configure.ac
-index d8e10cf2b2..4cc0951ab9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4171,6 +4171,15 @@ AS_VAR_IF([posix_threads], [stub], [
-   AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
- ])
- 
-+AC_SUBST(SQLITE3)
-+AC_ARG_ENABLE(sqlite3,
-+	AS_HELP_STRING([--disable-sqlite3], [disable sqlite3]),
-+	[ SQLITE3="${enableval}" ], [ SQLITE3=yes ])
-+
-+if test "$SQLITE3" = "no" ; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index febb9c1780..e1d9815aec 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -22,7 +22,6 @@ PYTHON3_IGNORE_CVES += CVE-2022-45061
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
-	--disable-sqlite3 \
 	--with-system-expat \
 	--disable-test-modules \
 	--disable-idle3 \
@@ -45,6 +44,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__codecs_jp=n/a \
 	py_cv_module__codecs_kr=n/a \
 	py_cv_module__codecs_tw=n/a \
+	py_cv_module__sqlite3=n/a \
 	py_cv_module__tkinter=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
@@ -118,7 +118,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 else
-PYTHON3_CONF_OPTS += --disable-sqlite3
+PYTHON3_CONF_ENV += py_cv_module__sqlite3=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
