Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBCBC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C7C40A6F;
	Sun,  5 Nov 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C7C40A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6tbnsFnbntg; Sun,  5 Nov 2023 20:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E85B40A65;
	Sun,  5 Nov 2023 20:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E85B40A65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 683DB1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 418A961043
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 418A961043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1Avyj0-TB7E for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:16 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BFF261040
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BFF261040
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1cc30bf9e22so30428645ad.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215975; x=1699820775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vxB9Vrt94RrZ/pk0e40Esj9OSgxphdOqVs8DQiF3rw=;
 b=iSVWncVuS02yDOKgkAstaegoQ49wsAzQn4LkS8mDYz1s2k2mn5LjVM2CAy2YJyfZd6
 Y5usmBno0UA3DEdqJFCBjLNKoxHOjGxIQO5svGH9WWOYaEP95vrT7rIoLJiFkPFLKqAy
 HbrlJhxyKjoQ3m+ONc1v1s4YxquxgrnXNvivSzOx9rac0Xyg3sJ6lEjYNt7SM0O3QfYQ
 z7XE5/XWe9+Xb44qHf+LFH/FhOStydv+99k4B9rH94oJ7PrS2cv7Jd7KOjF8Hdokz37P
 wx0O6t3knQOzgXDOk6D5oCk8rOQBXpF6WaHbpqYFaMEHQRtkexnsiewwmfz6J3CBHKhd
 cbuw==
X-Gm-Message-State: AOJu0Yz5Og2C1V5W3ABajvGCx3R5ugU4KyUBi1Ms4yKhuc7r6uAvmTf9
 VK61TlJBlYEr8QUCktyMg9sSDXXTXfP4e4y+WMRgemqAcCo=
X-Google-Smtp-Source: AGHT+IEgJwtzU1FNn3EK/oyF+IjfPWOW+z7p9ApRbJOztZcBoEsIr/Zngg/h+438Gv2aXiUnWhUlkQ==
X-Received: by 2002:a17:903:120c:b0:1cc:467a:338f with SMTP id
 l12-20020a170903120c00b001cc467a338fmr12987063plh.4.1699215974787; 
 Sun, 05 Nov 2023 12:26:14 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:14 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:42 -0700
Message-ID: <20231105202555.359391-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215975; x=1699820775;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vxB9Vrt94RrZ/pk0e40Esj9OSgxphdOqVs8DQiF3rw=;
 b=FaWfy7LsAtZ+yxPBjVu9kqCRm9gYfIASRfDIW4CpFFvjNoSXnVl6evJ0PH0UonpiA2
 7/hRdPkB/+srDFWaVsQTjAVyNXFOA4z/GsJcqVUIVfMZ9/gnHoJjZY5JUFhfb0LC79ko
 z/ccNiggPTomvJ1fXaNK/6itwSXcWYh+rzB2g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FaWfy7Ls
Subject: [Buildroot] [PATCH v2 11/24] package/python3: use upstream build
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
Cc: Adam Duskett <aduskett@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 .../0016-Add-an-option-to-disable-expat.patch | 82 -------------------
 package/python3/python3.mk                    |  6 +-
 3 files changed, 3 insertions(+), 86 deletions(-)
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index c5e183ffb2..036c764c97 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1151,7 +1151,6 @@ package/python3/0011-Add-an-option-to-disable-pydoc.patch Upstream
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
