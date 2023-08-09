Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FB0C04A94
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1BE41B55;
	Wed,  9 Aug 2023 17:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1BE41B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QP_T9oEP_dfX; Wed,  9 Aug 2023 17:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DC241B58;
	Wed,  9 Aug 2023 17:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DC241B58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF461BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8655460AA0
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8655460AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4o1ptrd21Rjg for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:36:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A508606A9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A508606A9
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6031A4C1116;
 Wed,  9 Aug 2023 19:33:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3w-0001yu-1Z;
 Wed, 09 Aug 2023 19:33:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:32 +0200
Message-Id: <20230809173334.2514813-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602416;
 bh=GcwA7Um0RFzWKKfboa3Hqa4coiSSeKaMQ1JvSRIbBT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vZclW1rY1nJLNWMvS6XfEYoxooGv05tIwAxEgNw9jHAgY6KfO/NDds1hU9t3ORSKt
 QJn/xZeh0IrGDTxW6AcwQx0o50y736qcwaryvwEoaILhZIW3spT5Lh1z5TSpJBuWBW
 mDsSC6n5Y4rDmMreTWwQoBrgvWzu6J7N/eLWTx/pifF0pN/Qc/0aCct0QyhYomMNPX
 KkvXcBd2E35zvmVR3Y36hXgjp6x9ANx5qMeXxk47H931YPXGTIipVKAJ5KpdygBUA4
 wHbNELVmksubQQFIQUegbcsKogV/sa5eSXSFHfqvgcxxlBuT6e56CpZG3kLaSb8lNb
 lF/0+0j1nAhaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vZclW1rY
Subject: [Buildroot] [PATCH/next v2 14/16] package/python3: use upstream
 build system to disable tk module
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
 ...d-an-option-to-disable-the-tk-module.patch | 77 -------------------
 package/python3/python3.mk                    |  4 +-
 3 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 36e78dbf62..22f16cf744 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1219,7 +1219,6 @@ package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
 package/python3/0011-Add-an-option-to-disable-pydoc.patch Upstream
 package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
-package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
deleted file mode 100644
index b89e1d27bc..0000000000
--- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From bbbfe699d648a5cb191203b16e1786e8cf4ea908 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:23:42 -0800
-Subject: [PATCH] Add an option to disable the tk module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Makefile.pre.in | 10 +++++++---
- configure.ac    |  9 +++++++++
- 2 files changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9f4cdf14cf..4f83911200 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
- 		multiprocessing multiprocessing/dummy \
- 		re \
- 		site-packages \
--		tkinter \
- 		tomllib \
- 		turtledemo \
- 		unittest \
-@@ -2038,9 +2038,6 @@
- 		test/xmltestdata \
- 		test/xmltestdata/c14n-20 \
- 		test/ziptestdata \
--		tkinter/test \
--		tkinter/test/test_tkinter \
--		tkinter/test/test_ttk \
- 		unittest/test \
- 		unittest/test/testmock
- ifeq (@PYDOC@,yes)
-@@ -2021,6 +2018,13 @@ ifeq (@SQLITE3@,yes)
- LIBSUBDIRS += sqlite3
- endif
- 
-+ifeq (@TK@,yes)
-+LIBSUBDIRS += tkinter
-+TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
-+	tkinter/test/test_ttk
-+endif
-+
-+
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
-diff --git a/configure.ac b/configure.ac
-index 4cc0951ab9..f4ce506801 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4180,6 +4180,15 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_SUBST(TK)
-+AC_ARG_ENABLE(tk,
-+	AS_HELP_STRING([--disable-tk], [disable tk]),
-+	[ TK="${enableval}" ], [ TK=yes ])
-+
-+if test "$TK" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 87dc454185..febb9c1780 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -23,7 +23,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
 	--disable-sqlite3 \
-	--disable-tk \
 	--with-system-expat \
 	--disable-test-modules \
 	--disable-idle3 \
@@ -46,6 +45,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__codecs_jp=n/a \
 	py_cv_module__codecs_kr=n/a \
 	py_cv_module__codecs_tw=n/a \
+	py_cv_module__tkinter=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -179,6 +179,7 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
 	py_cv_module_nis=n/a \
+	py_cv_module__tkinter=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
@@ -205,7 +206,6 @@ PYTHON3_CONF_OPTS += \
 	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
-	--disable-tk \
 	--disable-idle3 \
 	--disable-pyc-build
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
