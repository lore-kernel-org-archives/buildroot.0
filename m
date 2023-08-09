Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA7FC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4C341A32;
	Wed,  9 Aug 2023 17:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4C341A32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ji81O0vAEghN; Wed,  9 Aug 2023 17:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA35E41949;
	Wed,  9 Aug 2023 17:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA35E41949
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2741BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14B7B418F1
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B7B418F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLjWNtknOWtm for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:35:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 062C7418F7
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062C7418F7
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50E68A4C1112;
 Wed,  9 Aug 2023 19:33:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3w-0001yu-0G;
 Wed, 09 Aug 2023 19:33:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:28 +0200
Message-Id: <20230809173334.2514813-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602416;
 bh=+PfZ3NMvyNp8uPBK3HH8uO/0FFiDoU06573pjQKSo/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D3V/lVsp5E/abSQtIrTTV4OASQjLXad8zdnOUnWPyibvumefJzPyl4SI1DK7sQnHq
 c7cc1FWRmP8qCTiwbPBbPDBOYVdvGrIJ4+OWvKyoQaSOYN7uDwH+pVMRH145IrdxhU
 E+A81aA42RHiY8rNRzu5zCua2wuWkwLpwzc//V32l4Tds030G/x1KjoLIuqRUx5yrN
 MURLLgstAHKq9Tdl5rbh/dUFic8/ZxDeW/a9e3QNPo2XFm1MnQhIwTqSUqdw2/5WcK
 nndb8PQFNXZzqd43sIm7b6nVTIGebc6PfNz/lpkNZ6Rj48bavjd4vv29/10famFwFu
 v4H+De9d1+h+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=D3V/lVsp
Subject: [Buildroot] [PATCH/next v2 10/16] package/python3: use upstream
 build system to disable nis module
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
 .../0018-Add-an-option-to-disable-NIS.patch   | 33 -------------------
 package/python3/python3.mk                    |  4 +--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 56b535754f..52d5d8ebb7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1222,7 +1222,6 @@ package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
-package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b/package/python3/0018-Add-an-option-to-disable-NIS.patch
deleted file mode 100644
index 977955d1cb..0000000000
--- a/package/python3/0018-Add-an-option-to-disable-NIS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 09fc9f72ebe60bb65e80732a6bd4f12a84159f6d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:11 +0100
-Subject: [PATCH] Add an option to disable NIS
-
-NIS is not necessarily available in uClibc, so we need an option to
-not compile support for it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ecdd7dbc07..1bdde7f69d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4194,6 +4194,12 @@ AC_ARG_ENABLE(codecs-cjk,
- 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
- 	fi])
- 
-+AC_ARG_ENABLE(nis,
-+	AS_HELP_STRING([--disable-nis], [disable NIS]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e047cf8a56..324c35838b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -26,7 +26,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-tk \
 	--with-expat=system \
 	--disable-codecs-cjk \
-	--disable-nis \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -40,6 +39,7 @@ HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module__curses=n/a \
 	py_cv_module__curses_panel=n/a \
+	py_cv_module_nis=n/a \
 	py_cv_module_unicodedata=yes \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
@@ -167,6 +167,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
+	py_cv_module_nis=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
@@ -194,7 +195,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
-	--disable-nis \
 	--disable-idle3 \
 	--disable-pyc-build
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
