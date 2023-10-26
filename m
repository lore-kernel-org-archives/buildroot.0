Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1020CC25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5A2E41721;
	Thu, 26 Oct 2023 09:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A2E41721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNLhfmWdkODb; Thu, 26 Oct 2023 09:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9243241765;
	Thu, 26 Oct 2023 09:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9243241765
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6A41BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58FEA6124D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FEA6124D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5drU7L_GOBa for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:17 +0000 (UTC)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 693076124C
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693076124C
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so99769666b.1
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312435; x=1698917235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g4Sf+wMheje2ZoL0JY0tsFK3g7O70XBDs/ciPkJ35Pw=;
 b=Orv1QNdZgwUn4HIIfeQIU2vEKKtEEn0ESIz2/RCYiyBoIOiecNLT2mSFpUH35eiL+w
 XwuCdbVf3QgQrX0+TjIwpOFqDQD8h5AmjLTHu/PydhJn/c/TTs5QMWF2mBJQbSrKyQfb
 LGGWxDz+1QDN6IfYYh1P09AD7nsNQQQSxDd3Tyu/pkxuVdzIqqdDujcImceWBo3gWlC+
 Ic0/Ncat0Z3XGe89JUD35GZstjD5dNjaC5BVrsmeM08T3Bas/IMqJcLm32IaLmDEvH9h
 Y7N/2W9bsAvfe0gJ4nBQlcgYMpYA3bavz9QT+oATm3N3CuIazqDKqe8amVeYqi+eXaBF
 1AAQ==
X-Gm-Message-State: AOJu0YxqHg/4Rhjhf6uQXH1Zz2L4n9N9BHl/kfhlbcrsVTh1dvYA0uL7
 gZaZ92EVS4YiLx+sPHq9AVQowI6EBe8leEqLrsJZrwtRamPYWHr3
X-Google-Smtp-Source: AGHT+IEvgP7XgXmbaQ2Uo8+6t4qzWmoG1DhPK1DUiSiXzDWjVVVxglmrjrecYrznsSrmyZB5PsHrmg==
X-Received: by 2002:a17:907:3688:b0:9c6:1143:b52 with SMTP id
 bi8-20020a170907368800b009c611430b52mr12675005ejc.55.1698312435140; 
 Thu, 26 Oct 2023 02:27:15 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:42 +0200
Message-ID: <20231026092701.12345-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312435; x=1698917235;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4Sf+wMheje2ZoL0JY0tsFK3g7O70XBDs/ciPkJ35Pw=;
 b=XSpYD36DcAubrOBcKsg+JWxA75CB6oLlm60xDHAZAmxBZbNvSn0ZhqydcIgrCWu3lm
 zqJaiBiCppH27rJ1SCFs6qUpTbVdX4wAY3jbL2Q0Fr3IjCBUHBYbN4WJ/+5t7mk+gt4B
 P9Tk1vaPdkT7haqy9GqTZm2U0abW1fXcDqoQI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XSpYD36D
Subject: [Buildroot] [PATCH 11/30] package/python3: use upstream build
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 .../0016-Add-an-option-to-disable-expat.patch | 82 -------------------
 package/python3/python3.mk                    |  6 +-
 3 files changed, 3 insertions(+), 86 deletions(-)
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index da17dd32f0..51914e5d8c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1165,7 +1165,6 @@ package/python3/0011-Add-an-option-to-disable-pydoc.patch Upstream
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
index e4b97e7d62..956837db68 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -21,7 +21,7 @@ HOST_PYTHON3_CONF_OPTS += \
 	--without-cxx-main \
 	--disable-sqlite3 \
 	--disable-tk \
-	--with-expat=system \
+	--with-system-expat \
 	--disable-test-modules \
 	--disable-idle3 \
 	--disable-ossaudiodev
@@ -107,9 +107,9 @@ endif
 
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
