Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C51DC04A94
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D65F82050;
	Tue,  8 Aug 2023 18:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D65F82050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SX0uWfY1lVr; Tue,  8 Aug 2023 18:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3884082138;
	Tue,  8 Aug 2023 18:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3884082138
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC8291BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86531402D4
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86531402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KntDssz1je3i for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:54:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3D26401AD
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3D26401AD
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91EFCA4C1110;
 Tue,  8 Aug 2023 20:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnS-0005AS-16;
 Tue, 08 Aug 2023 20:51:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:51:06 +0200
Message-Id: <20230808185108.3787835-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520670;
 bh=vJxdA9/aYBpzw60meA2mbo33rmO0G8qNs3xRwt3MYhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nw8z7ec9BiGe4E54uHXSf+0XoYzHs20pVFj6Z2Iv5TrjdXcK35oeoyKkNWe3qaiCz
 5RCef/zEFJ7JjRYch+dX5J1cloRytTruRKiLlmLoIv1r8JTvK0C+EXQyf2tCgHDdCs
 n7TLgeMX6ODt4Se3jy7lwZjtpwtbtvABzALQm0U9G7slxKqurIsAc3snODMDpEqs9z
 nuuMrfCdXDlml4Iyn+T1A6xErUSxT/8eGlF4Gq/6oFgCKE0jHg3FCULts26j7VLxGi
 usVgr4s+OOeyyf3J9iGWXJOFQ5nLzv9mTpA6DaUuj18JOR8exiMoitmqO8wLHzZiSE
 nLGBJUMzyBmew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Nw8z7ec9
Subject: [Buildroot] [PATCH/next 14/16] package/python3: use upstream build
 system to disable tk module
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
 ...d-an-option-to-disable-the-tk-module.patch | 77 -------------------
 package/python3/python3.mk                    |  4 +-
 2 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch

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
index aa241e843a..2b5ddee52f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -23,7 +23,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
 	--disable-sqlite3 \
-	--disable-tk \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
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
