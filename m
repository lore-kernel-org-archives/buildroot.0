Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45264C04FDF
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F40558212D;
	Tue,  8 Aug 2023 18:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40558212D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTcCpgJ5j-hK; Tue,  8 Aug 2023 18:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27DAE820F4;
	Tue,  8 Aug 2023 18:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27DAE820F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97E121BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71D82402D4
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D82402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvxQY6vijeCs for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:53:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EFCA401AD
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFCA401AD
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84B4AA4C110F;
 Tue,  8 Aug 2023 20:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnS-0005AS-0k;
 Tue, 08 Aug 2023 20:51:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:51:05 +0200
Message-Id: <20230808185108.3787835-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520670;
 bh=lopEAUJW0Q4r+rs7fHvlXpxPL7/HBKhm83w2vdxtzMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b10uT7JNqLuOYothvnlHYXss6lvwetAw5LOkdvWAXwx24w8JIymID1umLdZQxa1LQ
 qJfTvlGAE9+akN4Km1DzFHIBMYYbN3Lli7ri8w0iQ2NkQZqo4H+a1XPPOQtfUs5MTG
 oq9LGNpeX2f/NKy49ZT8TP2DCPS/et9qw3/lBX74/tQeHHzoIvVkp5V53pLIsPJZEj
 5YMwz6DNUEYnLbkuAXcrA0cT8WlSIYvSwsTr41nav+zzRtKFP9GjxxMCBgmYYjHES1
 6bdnBfGv4qbyPnTh9w5RD0B8QMVp8m+/7OLRje6JgWp7TN3dActT8w0fyWVl4mpem3
 cP+2N1P4Rb0BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=b10uT7JN
Subject: [Buildroot] [PATCH/next 13/16] package/python3: use upstream build
 system to disable pyexpat module
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
 .../0016-Add-an-option-to-disable-expat.patch | 82 -------------------
 package/python3/python3.mk                    |  6 +-
 2 files changed, 3 insertions(+), 85 deletions(-)
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch

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
index 35f9c286af..aa241e843a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -24,7 +24,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--without-cxx-main \
 	--disable-sqlite3 \
 	--disable-tk \
-	--with-expat=system \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -39,6 +38,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__curses=n/a \
 	py_cv_module__curses_panel=n/a \
 	py_cv_module_nis=n/a \
+	py_cv_module_pyexpat=n/a \
 	py_cv_module_unicodedata=yes \
 	py_cv_module__codecs_cn=n/a \
 	py_cv_module__codecs_hk=n/a \
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
