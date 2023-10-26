Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5459EC25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE83640A71;
	Thu, 26 Oct 2023 09:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE83640A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WuV6ysLWKIJ7; Thu, 26 Oct 2023 09:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F7B417C5;
	Thu, 26 Oct 2023 09:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F7B417C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0D11BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54FD2839BB
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FD2839BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Pgc-fNUNGis for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:18 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54406839B4
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54406839B4
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so99771666b.1
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312436; x=1698917236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77a1SuyzsVhz0WYiKLrXz6x7xgADzQWHxCjcE7fUSbc=;
 b=C21HfLZ5U3NEeszKLsddkRgDTIfI7NvKy5o9d9j/anG8u76PvIQ6cLAEdItJPBWIB9
 pzHKjRfgSwZ4rtiU5BxjvwsgQNky+uwTJlCXLJ6CB/FoR7NzoBk1IgpzSrOjzz0zPYSF
 Z1+IsFoHNz7DFEFFwOqFxSWiIW3qmHi7kr4N+hhfpXdLz1v0W4PxsQngKfA/5EDfhF6L
 OO7sUZK905GgiHMfQ/DWabFk0S/mTCz+aROfXRgthCKLNNNHUbHmLiYXLlaMofm3e698
 +IJqY7VFX7pG/O6L8lNiJuOYLOjemmPI5q5Qxj1YRcKJGIsSKVza6/6ADmprr0KnW1rh
 xBpw==
X-Gm-Message-State: AOJu0YwYDuMSkf/yzF4zVo596uRGPeoKBaeQd/etF1dyyzKbaIw077C/
 SBdmiAKE1xqACNceaw4Lh6p1X7fNZyelGjUU8t7biwLmCjN1p6Sr
X-Google-Smtp-Source: AGHT+IG02cpSN1Y0ob+8jib6Jbj2Dha6sS9KUzR3AFVOvRmcEYKA95lN0fAY/2bgjjBz9gwYydpM4g==
X-Received: by 2002:a17:906:7956:b0:9be:e153:3b82 with SMTP id
 l22-20020a170906795600b009bee1533b82mr14096654ejo.17.1698312436205; 
 Thu, 26 Oct 2023 02:27:16 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:43 +0200
Message-ID: <20231026092701.12345-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312436; x=1698917236;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77a1SuyzsVhz0WYiKLrXz6x7xgADzQWHxCjcE7fUSbc=;
 b=aR7V+lvP73VAfytD1a7xtnjRBQ5irid3sKfa0zz7AC8XhrCORCXUai5AK/ny+ToDaM
 soMca/X76I1jmwT4JtNfGF350t6xYwQCll6tXkDVJuJickmgCJRnToUZrAYXZZDR2l4M
 S7SRQcsXyxYp9JnAUJAzjkfyJzBjDL0PK1a2M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aR7V+lvP
Subject: [Buildroot] [PATCH 12/30] package/python3: use upstream build
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
 ...option-to-disable-the-sqlite3-module.patch | 62 -------------------
 package/python3/python3.mk                    |  4 +-
 3 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 51914e5d8c..4c35220d42 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1163,7 +1163,6 @@ package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
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
