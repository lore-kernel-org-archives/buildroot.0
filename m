Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB80C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3707C40A6F;
	Sun,  5 Nov 2023 20:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3707C40A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkAPOfVQxF0v; Sun,  5 Nov 2023 20:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5A940A7F;
	Sun,  5 Nov 2023 20:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF5A940A7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB15A1BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C192661045
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C192661045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zz91uht7oH2e for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:18 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1163261040
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1163261040
Received: by mail-pg1-x542.google.com with SMTP id
 41be03b00d2f7-5b980391d7cso2112903a12.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215976; x=1699820776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIgu5fmYqxOHKgn3qjzNk4XALsn3bLVs1Wv/tfayYZ0=;
 b=fVwi5opMedBv57mjoeOqojB+1CU/M709spuzLVzwWs/TXdfJwj/2Hpx0sRjx5XIhdO
 Xc8ILL7ulQj4SBFmmaZWOagiE0Q8POOi/Z3T3Hbczbd2ADiASApO118GZA6d5AWD2v0R
 GkOVRZ7cqf7tduYUeEGzufewNQmol/TTAW65GHqS0992M0l1glDGzXtpG2p5JoaqOzG4
 tcUvsrQa7qYtSpWsdwIu0WyMVe0+VwHb+hBmUf7XauEvg1owm1Fvl/Oon81m1nQwLqYT
 kO2KLQG7kTUIbJwM7NiPXVdZWdmBsytCnTApmKgXB4w1/6XaD0dqYs0wIjP9gXuhisH2
 VIWg==
X-Gm-Message-State: AOJu0Yyte62nkhsT34kFIEs+9oFfVkqHhffWkO0JFScaurMnRN5UlSCj
 AY1sIWUNvauHQyyH6/fRuFsBfUfkBJq6t9vxSIMwnrUQOnw=
X-Google-Smtp-Source: AGHT+IF8xUEbi4HtowAQPM2/Fp1jeK/M1morrU3k+0XFhPSonz7/9ccC19+0Dn+WwnEy1PukXgr7gA==
X-Received: by 2002:a05:6a20:7d8a:b0:171:a8bc:74b2 with SMTP id
 v10-20020a056a207d8a00b00171a8bc74b2mr27108147pzj.7.1699215976567; 
 Sun, 05 Nov 2023 12:26:16 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:15 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:43 -0700
Message-ID: <20231105202555.359391-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215976; x=1699820776;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIgu5fmYqxOHKgn3qjzNk4XALsn3bLVs1Wv/tfayYZ0=;
 b=cQqGOWmy9pFUGCbWFcOSHAyUcB7i+KR1f3EUvZi8XMSsfMTs53ak8tKf31HaBzuDe+
 5fGdOmjg6RZgZiJEkLGthuSOVxsTn+QCwaZWhDmnwIanbPUwCERrtmcYo76rTtUV8a7J
 xqQu1b3N+X4G4OHi7FZuVP8tt84XKCsLHYxSk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cQqGOWmy
Subject: [Buildroot] [PATCH v2 12/24] package/python3: use upstream build
 system to disable sqlite3 module
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
 ...option-to-disable-the-sqlite3-module.patch | 62 -------------------
 package/python3/python3.mk                    |  4 +-
 3 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 036c764c97..1b4431a43b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1149,7 +1149,6 @@ package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch Upstream
 package/python3/0011-Add-an-option-to-disable-pydoc.patch Upstream
 package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
-package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
 package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
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
index 956837db68..8b06c28fde 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -19,7 +19,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
-	--disable-sqlite3 \
 	--disable-tk \
 	--with-system-expat \
 	--disable-test-modules \
@@ -43,6 +42,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__codecs_jp=n/a \
 	py_cv_module__codecs_kr=n/a \
 	py_cv_module__codecs_tw=n/a \
+	py_cv_module__sqlite3=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -115,7 +115,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 else
-PYTHON3_CONF_OPTS += --disable-sqlite3
+PYTHON3_CONF_ENV += py_cv_module__sqlite3=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
