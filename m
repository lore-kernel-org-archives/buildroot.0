Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C92C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F129960EF7;
	Wed,  9 Aug 2023 21:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F129960EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XU8YBYcUmaD5; Wed,  9 Aug 2023 21:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2CFC611E1;
	Wed,  9 Aug 2023 21:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2CFC611E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FEB91BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37D7841745
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D7841745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39OiXAi00f-2 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:15:57 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17A074173F
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A074173F
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9E1BA4C1111;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVH-0001EZ-1C;
 Wed, 09 Aug 2023 23:14:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:13:58 +0200
Message-Id: <20230809211401.3587177-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
References: <20230809211401.3587177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=nHGViFhRD1Qk4d7wDschCavnsvJWWi1lH0Nhdp6xt2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dM90iavjUut6zjh4ZLsia/9ECD1pmS/rOlAh8hQmCfnTKsTU+rRVylk9kSrSltnoN
 bKmd1qxJaqjHo+S+SOrBYVD09AfYrML9KpVMvE38HB0gu+o8tVum9q41Q5MHD1BjGr
 oQrHHTCa7oQg4mQizisAAAebjQ5gOOYorJc8Ol49BGamIPtg4VfqqVo9bvDC7v7Jfd
 aaNMSnnA1bh2ud6YFPdTHl+TlCcM0dR6Ycp16eNbPKlsI3iJXz9krPbx4hVZeWL+F3
 KAmdhvs+a5CsoBjaiVODQ/G9TcFDKXO54MMo1+NA79zh1V310PljNRcuBv91Ihe7Ho
 hwYHJdU+2Ng9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dM90iavj
Subject: [Buildroot] [PATCH/next v3 11/14] package/python3: use upstream
 build system to disable pyexpat module
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
 .../0016-Add-an-option-to-disable-expat.patch | 82 -------------------
 package/python3/python3.mk                    |  6 +-
 3 files changed, 3 insertions(+), 86 deletions(-)
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a282675f90..870dd9caaf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1223,7 +1223,6 @@ package/python3/0011-Add-an-option-to-disable-pydoc.patch Upstream
 package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
-package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
diff --git a/package/python3/0016-Add-an-option-to-disable-expat.patch b/package/python3/0016-Add-an-option-to-disable-expat.patch
deleted file mode 100644
index c30740762a..0000000000
--- a/package/python3/0016-Add-an-option-to-disable-expat.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From c9a2ea3edacf57746517600ccc11c254a9fd6c48 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:40:45 -0800
-Subject: [PATCH] Add an option to disable expat
-
-This patch replaces the existing --with-system-expat option with a
---with-expat={system,builtin,none} option, which allows to tell Python
-whether we want to use the system expat (already installed), the expat
-builtin the Python sources, or no expat at all (which disables the
-installation of XML modules).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Makefile.pre.in |  5 ++++-
- configure.ac    | 20 ++++++++++++++------
- 2 files changed, 18 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8e879b35c6..80d617cf7f 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1925,7 +1925,6 @@ LIBSUBDIRS=	asyncio \
- 		urllib \
- 		venv venv/scripts venv/scripts/common venv/scripts/posix \
- 		wsgiref \
--		$(XMLLIBSUBDIRS) \
- 		xmlrpc \
- 		zoneinfo \
- 		__phello__
-@@ -2027,6 +2026,10 @@ ifeq (@CURSES@,yes)
- LIBSUBDIRS += curses
- endif
- 
-+ifeq (@EXPAT@,yes)
-+LIBSUBDIRS += $(XMLLIBSUBDIRS)
-+endif
-+
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
-diff --git a/configure.ac b/configure.ac
-index 0ae9863cd6..201cad0bfc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3565,15 +3565,23 @@ LIBS="$withval $LIBS"
- AC_SUBST(DISABLED_EXTENSIONS)
- 
- # Check for use of the system expat library
--AC_MSG_CHECKING(for --with-system-expat)
--AC_ARG_WITH(system_expat,
--            AS_HELP_STRING([--with-system-expat], [build pyexpat module using an installed expat library, see Doc/library/pyexpat.rst (default is no)]),
-+AC_MSG_CHECKING(for --with-expat)
-+AC_ARG_WITH(expat,
-+            AS_HELP_STRING([--with-expat], [select which expat version to use: system, builtin, none]),
-             [],
--            [with_system_expat="no"])
-+            [with_expat="builtin"])
- 
--AC_MSG_RESULT($with_system_expat)
-+AC_MSG_RESULT($with_expat)
- 
--AS_VAR_IF([with_system_expat], [yes], [
-+if test "$with_expat" != "none"; then
-+   EXPAT=yes
-+else
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} pyexpat"
-+   EXPAT=no
-+fi
-+AC_SUBST(EXPAT)
-+
-+AS_VAR_IF([with_expat], [system], [
-   LIBEXPAT_CFLAGS=${LIBEXPAT_CFLAGS-""}
-   LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
-   LIBEXPAT_INTERNAL=
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 35f9c286af..87dc454185 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -24,7 +24,7 @@ HOST_PYTHON3_CONF_OPTS += \
 	--without-cxx-main \
 	--disable-sqlite3 \
 	--disable-tk \
-	--with-expat=system \
+	--with-system-expat \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -110,9 +110,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
 PYTHON3_DEPENDENCIES += expat
-PYTHON3_CONF_OPTS += --with-expat=system
+PYTHON3_CONF_OPTS += --with-system-expat
 else
-PYTHON3_CONF_OPTS += --with-expat=none
+PYTHON3_CONF_ENV += py_cv_module_pyexpat=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
