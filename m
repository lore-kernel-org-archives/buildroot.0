Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80220C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 22:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362484167D;
	Mon, 18 Dec 2023 22:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362484167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JNCFvynqPqc; Mon, 18 Dec 2023 22:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB4C4192E;
	Mon, 18 Dec 2023 22:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB4C4192E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96A1A1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C8AD80DC5
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 22:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C8AD80DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GngXkt6ive52 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 22:05:24 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E1A680C09
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 22:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1A680C09
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7b6fe5d67d4so160467539f.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 14:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702937122; x=1703541922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=csQxsYJFi/xf1nHsiMqf5UNMLytLGhoVjIJwred/LRE=;
 b=dp4bnIU2NGtj5AzBu6IvYuBjNE+kOKzJFnWLSRwGt5GSdHe4VslWWOXAZrvQ4ePyxX
 aY/y6mEEG7ck4jK3VTS+a65AMlC3l8uC3tMA45s6VgnCtZOv+79zIy2y0nLhX0GS60MR
 CSe29IYNYP9uJheAjZ+AftN58gqOebuNYj4DkDrKapTJOg8jG9ItMBm0yeKDlp5NP7mT
 bLisemUgSwH2rP2j6U1Um/OWiGiI7KPUEtuGsF+vDfTnnix5Y8gc1ZsYrbZi8Ho+5bUA
 aDWeSlXLw2gsKJ7SSpEauobEpeB0Vxk8D1GTh3ONrfh+kqduzc4G3+cZOjYmcuBHuT2B
 BPdA==
X-Gm-Message-State: AOJu0YzxAlfduscOr/lw4HhKvRN+PmYJ+5AYY1tNvi77XtQ4cuc0aYID
 7rgMGh0xV/GJ7zXoPuzdpoRUBasO3CQnvxPpzH8=
X-Google-Smtp-Source: AGHT+IFwyLmVOQFhEJYiFegrrj4zwy+h1AiwNDaYActHn8zdDE0SJ/MEepBKnRK+Ju7AysapN4DzpA==
X-Received: by 2002:a6b:7701:0:b0:7b7:6529:34ec with SMTP id
 n1-20020a6b7701000000b007b7652934ecmr11623173iom.32.1702937121235; 
 Mon, 18 Dec 2023 14:05:21 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a63e511000000b005cd78f13608sm4441768pgh.13.2023.12.18.14.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 14:05:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 15:04:56 -0700
Message-ID: <20231218220457.1705749-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
References: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702937122; x=1703541922;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csQxsYJFi/xf1nHsiMqf5UNMLytLGhoVjIJwred/LRE=;
 b=oQ07ctF3k/cjs8ED6i7JIlHHm6ASmXOFfWwOH/OrIugTq6xpSZpPtlr60JPF9gEPfu
 hNmQLUwz3Ut4N2WIXl9ZlXqiApRxG6kT2/L88HrGXw1MIYyG6vSccKuESHb+HuFYSlzQ
 fLcDw7maDVWHnqhgA0XWV14JITQvLn7C2HYdk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oQ07ctF3
Subject: [Buildroot] [PATCH v4 3/3] package/python3: bump version to 3.12.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python 3.12.1 has removed distutils support. As such, we remove the distutils
option from pkg-python.mk as well.

Tested on Fedora 39, and Debian 11. All 68 package tests pass.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v3 -> v4:
  - Drop distutils in pkg-python.mk
  - 3.12.0 -> 3.12.1

 package/pkg-python.mk                         |  38 +-----
 ...e-the-build-of-pyc-files-conditional.patch |  24 ++--
 ...taddrinfo-configure-test-when-cross-.patch |   2 +-
 ...re-to-disable-the-build-of-certain-e.patch | 108 ------------------
 ...-header-paths-for-cross-compilation.patch} |  31 ++---
 ...tch => 0004-Serial-ioctl-workaround.patch} |   0
 ...ook-in-usr-lib-termcap-for-libraries.patch |  31 -----
 ...g.sh.in-ensure-sed-invocations-only.patch} |   0
 ...0006-Add-an-option-to-disable-pydoc.patch} |  50 ++------
 .../0006-Don-t-add-multiarch-paths.patch      |  37 ------
 .../0007-Abort-on-failed-module-build.patch   |  30 -----
 ...07-Add-an-option-to-disable-lib2to3.patch} |  74 +++++-------
 ... 0008-Add-an-option-to-disable-IDLE.patch} |  43 ++-----
 ...e-shebang-of-Python-scripts-for-cros.patch |  35 ------
 ...hon-config.sh-don-t-reassign-prefix.patch} |   0
 ...d-an-option-to-disable-the-tk-module.patch |  79 +++++++++++++
 ...fix-building-on-older-distributions.patch} |  12 +-
 ...p-CC-print-multiarch-output-for-mus.patch} |   2 +-
 ...option-to-disable-the-sqlite3-module.patch |  62 ----------
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 ...d-an-option-to-disable-the-tk-module.patch |  77 -------------
 ...-option-to-disable-the-curses-module.patch |  61 ----------
 .../0016-Add-an-option-to-disable-expat.patch |  82 -------------
 ...-Add-an-option-to-disable-CJK-codecs.patch |  30 -----
 .../0018-Add-an-option-to-disable-NIS.patch   |  33 ------
 ...Add-an-option-to-disable-unicodedata.patch |  30 -----
 ...021-Add-an-option-to-disable-decimal.patch |  54 ---------
 ...on-to-disable-the-ossaudiodev-module.patch |  30 -----
 ...an-option-to-disable-openssl-support.patch |  30 -----
 ...ption-to-disable-the-readline-module.patch |  30 -----
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  42 -------
 ...Add-an-option-to-disable-uuid-module.patch |  33 ------
 ...ion-to-disable-the-berkeleydb-module.patch |  30 -----
 package/python3/python3.hash                  |   6 +-
 package/python3/python3.mk                    |  81 ++++++++-----
 35 files changed, 216 insertions(+), 1091 deletions(-)
 delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
 rename package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.patch => 0003-Adjust-library-header-paths-for-cross-compilation.patch} (64%)
 rename package/python3/{0008-Serial-ioctl-workaround.patch => 0004-Serial-ioctl-workaround.patch} (100%)
 delete mode 100644 package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
 rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
 rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch => 0006-Add-an-option-to-disable-pydoc.patch} (54%)
 delete mode 100644 package/python3/0006-Don-t-add-multiarch-paths.patch
 delete mode 100644 package/python3/0007-Abort-on-failed-module-build.patch
 rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch => 0007-Add-an-option-to-disable-lib2to3.patch} (59%)
 rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch => 0008-Add-an-option-to-disable-IDLE.patch} (57%)
 delete mode 100644 package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patch => 0009-python-config.sh-don-t-reassign-prefix.patch} (100%)
 create mode 100644 package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0028-fix-building-on-older-distributions.patch => 0011-fix-building-on-older-distributions.patch} (82%)
 rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (97%)
 delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
 delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch
 delete mode 100644 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
 delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch
 delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4bed5a1835..94f28ff841 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -52,40 +52,6 @@ HOST_PKG_PYTHON_ENV = \
 	PYTHONNOUSERSITE=1 \
 	$(HOST_CONFIGURE_OPTS)
 
-# Target distutils-based packages
-PKG_PYTHON_DISTUTILS_ENV = \
-	$(PKG_PYTHON_ENV) \
-	LDSHARED="$(TARGET_CROSS)gcc -shared"
-
-PKG_PYTHON_DISTUTILS_BUILD_CMD = \
-	setup.py build \
-	--executable=/usr/bin/python
-
-PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr
-
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_CMD = \
-	setup.py install --no-compile \
-	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
-	--root=$(TARGET_DIR)
-
-PKG_PYTHON_DISTUTILS_INSTALL_STAGING_CMD = \
-	setup.py install \
-	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
-	--root=$(STAGING_DIR)
-
-# Host distutils-based packages
-HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
-
-HOST_PKG_PYTHON_DISTUTILS_BUILD_CMD = \
-	setup.py build \
-
-HOST_PKG_PYTHON_DISTUTILS_INSTALL_CMD = \
-	setup.py install \
-	--prefix=$(HOST_DIR)
-
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -287,8 +253,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out distutils setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 92aa7274ba..16cd1dd985 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -9,6 +9,8 @@ the compilation of pyc.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [ Andrey Smrinov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.12.0 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  Makefile.pre.in | 2 ++
  configure.ac    | 6 ++++++
@@ -18,17 +20,17 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 8fbcd7ac17..2957c8e5a1 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2078,6 +2078,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
- 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
- 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
- 	fi
+@@ -2316,6 +2316,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+ 		$(DESTDIR)$(LIBDEST); \
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
 +ifeq (@PYC_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
+@@ -2325,6 +2326,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-j0 -d $(LIBDEST) -f \
-@@ -2105,6 +2106,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
- 		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-j0 -d $(LIBDEST)/site-packages -f \
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 +endif
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
@@ -38,9 +40,9 @@ diff --git a/configure.ac b/configure.ac
 index ab5e1de6fa..0cf89ed641 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1441,6 +1441,12 @@ fi
+@@ -1479,6 +1479,12 @@ fi
  
- AC_MSG_CHECKING(LDLIBRARY)
+ AC_MSG_CHECKING([LDLIBRARY])
  
 +AC_SUBST(PYC_BUILD)
 +
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 5389cb5d15..ce3ba9069b 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
 index 0cf89ed641..830885fcb3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5086,7 +5086,7 @@ fi]))
+@@ -5401,7 +5401,7 @@ fi]))
  dnl if ac_cv_func_getaddrinfo
  ])
  
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
deleted file mode 100644
index 5b3911374e..0000000000
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 8e02cebdac536dfb6748da2c50656a26f70d9da7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 16:33:22 -0800
-Subject: [PATCH] Add infrastructure to disable the build of certain extensions
-
-Some of the extensions part of the Python core have dependencies on
-external libraries (sqlite, tk, etc.) or are relatively big and not
-necessarly always useful (CJK codecs for example). By extensions, we
-mean part of Python modules that are written in C and therefore
-compiled to binary code.
-
-Therefore, we introduce a small infrastructure that allows to disable
-some of those extensions. This can be done inside the configure.ac by
-adding values to the DISABLED_EXTENSIONS variable (which is a
-word-separated list of extensions).
-
-The implementation works as follow :
-
- * configure.ac defines a DISABLED_EXTENSIONS variable, which is
-   substituted (so that when Makefile.pre is generated from
-   Makefile.pre.in, the value of the variable is substituted). For
-   now, this DISABLED_EXTENSIONS variable is empty, later patches will
-   use it.
-
- * Makefile.pre.in passes the DISABLED_EXTENSIONS value down to the
-   variables passed in the environment when calling the setup.py
-   script that actually builds and installs those extensions.
-
- * setup.py is modified so that the existing "disabled_module_list" is
-   filled with those pre-disabled extensions listed in
-   DISABLED_EXTENSIONS.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
-then extended by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
----
- Makefile.pre.in | 6 +++++-
- configure.ac    | 2 ++
- setup.py        | 5 ++++-
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2957c8e5a1..c1cfb96767 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -239,6 +239,8 @@ FILEMODE=	644
- # configure script arguments
- CONFIG_ARGS=	@CONFIG_ARGS@
- 
-+# disabled extensions
-+DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
- 
- # Subdirectories with code
- SRCDIRS= 	@SRCDIRS@
-@@ -739,6 +741,7 @@ sharedmods: $(PYTHON_FOR_BUILD_DEPS) pybuilddir.txt @LIBMPDEC_INTERNAL@ @LIBEXPA
- 	    *) quiet="";; \
- 	esac; \
- 	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
-+		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
- 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
-@@ -2228,7 +2231,8 @@ libainstall: all python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: all
--	$(RUNSHARED) $(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
-+	$(RUNSHARED) DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
-+		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-diff --git a/configure.ac b/configure.ac
-index 830885fcb3..5a6a1fe608 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3562,6 +3562,8 @@ LIBS="$withval $LIBS"
- ],
- [AC_MSG_RESULT(no)])
- 
-+AC_SUBST(DISABLED_EXTENSIONS)
-+
- # Check for use of the system expat library
- AC_MSG_CHECKING(for --with-system-expat)
- AC_ARG_WITH(system_expat,
-diff --git a/setup.py b/setup.py
-index 15d0d4576a..e496ee34c2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -56,7 +56,10 @@
- 
- 
- # This global variable is used to hold the list of modules to be disabled.
--DISABLED_MODULE_LIST = []
-+try:
-+    DISABLED_MODULE_LIST = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
-+except KeyError:
-+    DISABLED_MODULE_LIST = list()
- 
- # --list-module-names option used by Tools/scripts/generate_module_names.py
- LIST_MODULE_NAMES = False
--- 
-2.34.1
-
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
similarity index 64%
rename from package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
rename to package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
index 9a55d2582d..25115b7e63 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
@@ -15,34 +15,19 @@ values, and get correct header/library paths when cross-compiling
 third-party Python modules.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Refresh for 3.10.0
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- Lib/distutils/command/build_ext.py |  5 ++++-
- Lib/sysconfig.py                   | 15 +++++++++++----
- 2 files changed, 15 insertions(+), 5 deletions(-)
+ Lib/sysconfig.py | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
 
-diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index f287b34998..298234d6a1 100644
---- a/Lib/distutils/command/build_ext.py
-+++ b/Lib/distutils/command/build_ext.py
-@@ -234,7 +234,10 @@ def finalize_options(self):
-         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
-             if not sysconfig.python_build:
-                 # building third party extensions
--                self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
-+                libdir = sysconfig.get_config_var('LIBDIR')
-+                if "_python_sysroot" in os.environ:
-+                    libdir = os.environ.get("_python_sysroot") + libdir
-+                self.library_dirs.append(libdir)
-             else:
-                 # building python standard extensions
-                 self.library_dirs.append('.')
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
 index ebe3711827..6328ec41af 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -168,10 +168,17 @@ def joinuser(*args):
+@@ -169,10 +169,17 @@ _SCHEME_KEYS = ('stdlib', 'platstdlib', 'purelib', 'platlib', 'include',
  _PY_VERSION = sys.version.split()[0]
  _PY_VERSION_SHORT = f'{sys.version_info[0]}.{sys.version_info[1]}'
  _PY_VERSION_SHORT_NO_DOT = f'{sys.version_info[0]}{sys.version_info[1]}'
@@ -61,9 +46,9 @@ index ebe3711827..6328ec41af 100644
 +    _EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
 +    _BASE_PREFIX = os.path.normpath(sys.base_prefix)
 +    _BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
+ # Mutex guarding initialization of _CONFIG_VARS.
+ _CONFIG_VARS_LOCK = threading.RLock()
  _CONFIG_VARS = None
- _USER_BASE = None
- 
 -- 
 2.34.1
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0004-Serial-ioctl-workaround.patch
similarity index 100%
rename from package/python3/0008-Serial-ioctl-workaround.patch
rename to package/python3/0004-Serial-ioctl-workaround.patch
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
deleted file mode 100644
index 78b3ae596d..0000000000
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5d13e384b30a2c0b1c7b65718590b7fb0c3ba55e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:36:00 +0100
-Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index e496ee34c2..1904898165 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1107,12 +1107,9 @@ def detect_readline_curses(self):
-                 pass # Issue 7384: Already linked against curses or tinfo.
-             elif curses_library:
-                 readline_libs.append(curses_library)
--            elif self.compiler.find_library_file(self.lib_dirs +
--                                                     ['/usr/lib/termcap'],
--                                                     'termcap'):
-+            elif self.compiler.find_library_file(self.lib_dirs, 'termcap'):
-                 readline_libs.append('termcap')
-             self.add(Extension('readline', ['readline.c'],
--                               library_dirs=['/usr/lib/termcap'],
-                                libraries=readline_libs))
-         else:
-             self.missing.append('readline')
--- 
-2.34.1
-
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
similarity index 100%
rename from package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
rename to package/python3/0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch b/package/python3/0006-Add-an-option-to-disable-pydoc.patch
similarity index 54%
rename from package/python3/0011-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0006-Add-an-option-to-disable-pydoc.patch
index f7bfd437bb..b9ef85d90c 100644
--- a/package/python3/0011-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0006-Add-an-option-to-disable-pydoc.patch
@@ -12,17 +12,18 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
- setup.py        | 9 +++++++--
- 3 files changed, 19 insertions(+), 3 deletions(-)
+ 2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
 index c1cfb96767..403380e181 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1864,7 +1864,9 @@ bininstall: altbininstall
+@@ -2046,7 +2046,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -32,7 +33,7 @@ index c1cfb96767..403380e181 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1915,7 +1917,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2098,7 +2100,6 @@ LIBSUBDIRS=	asyncio \
  		lib2to3 lib2to3/fixes lib2to3/pgen2 \
  		logging \
  		multiprocessing multiprocessing/dummy \
@@ -40,22 +41,22 @@ index c1cfb96767..403380e181 100644
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2008,6 +2009,10 @@ TESTSUBDIRS=	ctypes/test \
- 		tkinter/test/test_ttk \
- 		unittest/test unittest/test/testmock
+@@ -2244,6 +2245,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 
+ COMPILEALL_OPTS=-j0
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 
+ .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
 index 5a6a1fe608..f68ea72321 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4171,6 +4171,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4485,6 +4485,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -66,35 +67,8 @@ index 5a6a1fe608..f68ea72321 100644
 +	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
 +
  # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
+ AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
-diff --git a/setup.py b/setup.py
-index 0e04944ce0..3e55f5b2e0 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1593,6 +1593,12 @@ class DummyProcess:
-     # turn off warnings when deprecated modules are imported
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
-+
-+    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3',
-+               'Lib/smtpd.py']
-+    if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/pydoc3' ]
-+
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
-           version = sys.version.split()[0],
-@@ -1617,8 +1623,7 @@ class DummyProcess:
-           # If you change the scripts installed here, you also need to
-           # check the PyBuildScripts command above, and change the links
-           # created by the bininstall target in Makefile.pre.in
--          scripts = ["Tools/scripts/pydoc3", "Tools/scripts/idle3",
--                     "Tools/scripts/2to3"]
-+          scripts = scripts
-         )
- 
- # --install-platlib
 -- 
 2.34.1
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
deleted file mode 100644
index 749e295df1..0000000000
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From ad463b5d58ae79f69b011fb048861bd874d34369 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:36:27 +0100
-Subject: [PATCH] Don't add multiarch paths
-
-The add_multiarch_paths() function leads, in certain build
-environments, to the addition of host header paths to the CFLAGS,
-which is not appropriate for cross-compilation. This patch fixes that
-by simply removing the call to add_multiarch_paths() when we're
-cross-compiling.
-
-Investigation done by David <buildroot-2014@inbox.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 1904898165..32294546b6 100644
---- a/setup.py
-+++ b/setup.py
-@@ -852,10 +852,10 @@ def configure_compiler(self):
-         if not CROSS_COMPILING:
-             add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+            self.add_multiarch_paths()
-         # only change this for cross builds for 3.3, issues on Mageia
-         if CROSS_COMPILING:
-             self.add_cross_compiling_paths()
--        self.add_multiarch_paths()
-         self.add_ldflags_cppflags()
- 
-     def init_inc_lib_dirs(self):
--- 
-2.34.1
-
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
deleted file mode 100644
index a473896127..0000000000
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 60b1664a7acebadb1a3d6df871145147f33b5afe Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:43:24 +0100
-Subject: [PATCH] Abort on failed module build
-
-When building a Python module fails, the setup.py script currently
-doesn't exit with an error, and simply continues. This is not a really
-nice behavior, so this patch changes setup.py to abort with an error,
-so that the build issue is clearly noticeable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setup.py b/setup.py
-index 32294546b6..0e04944ce0 100644
---- a/setup.py
-+++ b/setup.py
-@@ -579,6 +579,7 @@ def print_three_column(lst):
-             print("Failed to build these modules:")
-             print_three_column(failed)
-             print()
-+            sys.exit(1)
- 
-         if self.failed_on_import:
-             failed = self.failed_on_import[:]
--- 
-2.34.1
-
diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch b/package/python3/0007-Add-an-option-to-disable-lib2to3.patch
similarity index 59%
rename from package/python3/0012-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0007-Add-an-option-to-disable-lib2to3.patch
index 228b86a90b..278fd47a23 100644
--- a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0007-Add-an-option-to-disable-lib2to3.patch
@@ -14,17 +14,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Bernd Kuhls: ported to Python 3.11.4]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  Makefile.pre.in | 17 ++++++++++++-----
  configure.ac    |  6 ++++++
- setup.py        |  6 +++---
- 3 files changed, 21 insertions(+), 8 deletions(-)
+ 2 files changed, 18 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 403380e181..f5d0573067 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1868,7 +1868,9 @@ ifeq (@PYDOC@,yes)
+@@ -2050,7 +2050,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -34,7 +35,7 @@ index 403380e181..f5d0573067 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1914,7 +1916,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2097,7 +2099,6 @@ LIBSUBDIRS=	asyncio \
  		idlelib idlelib/Icons \
  		importlib importlib/resources importlib/metadata \
  		json \
@@ -42,34 +43,34 @@ index 403380e181..f5d0573067 100644
  		logging \
  		multiprocessing multiprocessing/dummy \
  		re \
-@@ -1934,10 +1935,6 @@ LIBSUBDIRS=	asyncio \
- TESTSUBDIRS=	ctypes/test \
- 		distutils/tests \
- 		idlelib/idle_test \
--		lib2to3/tests \
--		lib2to3/tests/data \
--		lib2to3/tests/data/fixers \
--		lib2to3/tests/data/fixers/myfixes \
- 		test \
- 		test/audiodata \
- 		test/capath \
-@@ -2013,6 +2010,14 @@ ifeq (@PYDOC@,yes)
+@@ -2200,10 +2201,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_importlib/resources/zipdata02 \
+ 		test/test_importlib/source \
+ 		test/test_json \
+-		test/test_lib2to3 \
+-		test/test_lib2to3/data \
+-		test/test_lib2to3/data/fixers \
+-		test/test_lib2to3/data/fixers/myfixes \
+ 		test/test_module \
+ 		test/test_peg_generator \
+ 		test/test_sqlite3 \
+@@ -2249,6 +2246,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
-+TESTSUBDIRS += lib2to3/tests			\
-+	lib2to3/tests/data			\
-+	lib2to3/tests/data/fixers		\
-+	lib2to3/tests/data/fixers/myfixes
++TESTSUBDIRS += test/test_lib2to3			\
++		test/test_lib2to3/data \
++		test/test_lib2to3/data/fixers \
++		test/test_lib2to3/data/fixers/myfixes
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
-@@ -2115,10 +2120,12 @@ ifeq (@PYC_BUILD@,yes)
- 		-j0 -d $(LIBDEST)/site-packages -f \
+ 
+ .PHONY: libinstall
+@@ -2332,10 +2337,12 @@ ifeq (@PYC_BUILD@,yes)
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
 +ifeq (@LIB2TO3@,yes)
@@ -85,7 +86,7 @@ diff --git a/configure.ac b/configure.ac
 index f68ea72321..d8e10cf2b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7078,6 +7078,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
+@@ -7529,6 +7529,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -96,27 +97,8 @@ index f68ea72321..d8e10cf2b2 100644
 +	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
 +
  # generate output files
- AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
- AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
-diff --git a/setup.py b/setup.py
-index 3e55f5b2e0..c490b0b08f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1594,11 +1594,11 @@ class DummyProcess:
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
- 
--    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3',
--               'Lib/smtpd.py']
-+    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
-     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/pydoc3' ]
--
-+    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/2to3' ]
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
-           version = sys.version.split()[0],
+ AC_CONFIG_FILES(m4_normalize([
+   Makefile.pre
 -- 
 2.34.1
 
diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch b/package/python3/0008-Add-an-option-to-disable-IDLE.patch
similarity index 57%
rename from package/python3/0020-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0008-Add-an-option-to-disable-IDLE.patch
index 09b5f13cdb..16d1cc9921 100644
--- a/package/python3/0020-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0008-Add-an-option-to-disable-IDLE.patch
@@ -11,17 +11,18 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
- setup.py        | 5 ++++-
- 3 files changed, 16 insertions(+), 2 deletions(-)
+ 2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 80d617cf7f..8d1ba1356c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1862,7 +1862,9 @@ bininstall: altbininstall
+@@ -2044,7 +2044,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -31,7 +32,7 @@ index 80d617cf7f..8d1ba1356c 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1912,7 +1914,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2096,7 +2098,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -39,8 +40,8 @@ index 80d617cf7f..8d1ba1356c 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2030,6 +2031,10 @@ ifeq (@EXPAT@,yes)
- LIBSUBDIRS += $(XMLLIBSUBDIRS)
+@@ -2254,6 +2255,10 @@ TESTSUBDIRS += test/test_lib2to3			\
+ 		test/test_lib2to3/data/fixers/myfixes
  endif
  
 +ifeq (@IDLE@,yes)
@@ -48,13 +49,13 @@ index 80d617cf7f..8d1ba1356c 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 
+ .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
 index ba4b0e0c1c..5e6d72f7db 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7137,6 +7137,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -7535,6 +7535,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -65,28 +66,8 @@ index ba4b0e0c1c..5e6d72f7db 100644
 +	[ IDLE="${enableval}" ], [ IDLE=yes ])
 +
  # generate output files
- AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
- AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
-diff --git a/setup.py b/setup.py
-index c490b0b08f..4d49a792f7 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1594,11 +1594,14 @@ class DummyProcess:
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
- 
--    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
-+    scripts = [ 'Lib/smtpd.py']
-     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/pydoc3' ]
-     if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/2to3' ]
-+    if not '--disable-idle3' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/idle3' ]
-+
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
-           version = sys.version.split()[0],
+ AC_CONFIG_FILES(m4_normalize([
+   Makefile.pre
 -- 
 2.34.1
 
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
deleted file mode 100644
index eff8fc7694..0000000000
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2439bd2ed5dbdd7e5fda15adefd0f6f1b047ec1b Mon Sep 17 00:00:00 2001
-From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
-Date: Wed, 23 Dec 2015 11:44:30 +0100
-Subject: [PATCH] Do not adjust the shebang of Python scripts for
- cross-compilation
-
-The copy_scripts() method in distutils copies the scripts listed in
-the setup file and adjusts the first line to refer to the current
-Python interpreter. When cross-compiling, this means that the adjusted
-shebang refers to the host Python interpreter.
-
-This patch modifies copy_scripts() to preserve the shebang when
-cross-compilation is detected.
-
-Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
----
- Lib/distutils/command/build_scripts.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
-index ccc70e6465..d6d54195c1 100644
---- a/Lib/distutils/command/build_scripts.py
-+++ b/Lib/distutils/command/build_scripts.py
-@@ -91,7 +91,7 @@ def copy_scripts(self):
-                     adjust = True
-                     post_interp = match.group(1) or b''
- 
--            if adjust:
-+            if adjust and not '_python_sysroot' in os.environ:
-                 log.info("copying and adjusting %s -> %s", script,
-                          self.build_dir)
-                 updated_files.append(outfile)
--- 
-2.34.1
-
diff --git a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0009-python-config.sh-don-t-reassign-prefix.patch
similarity index 100%
rename from package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0009-python-config.sh-don-t-reassign-prefix.patch
diff --git a/package/python3/0010-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
new file mode 100644
index 0000000000..b65578726c
--- /dev/null
+++ b/package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
@@ -0,0 +1,79 @@
+From bbbfe699d648a5cb191203b16e1786e8cf4ea908 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 22 Feb 2017 17:23:42 -0800
+Subject: [PATCH] Add an option to disable the tk module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Bernd Kuhls: ported to Python 3.11.4]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ Makefile.pre.in | 8 +++++---
+ configure.ac    | 5 +++++
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 9f4cdf14cf..4f83911200 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -2105,7 +2105,6 @@ LIBSUBDIRS=	asyncio \
+ 		re \
+ 		site-packages \
+ 		sqlite3 \
+-		tkinter \
+ 		tomllib \
+ 		turtledemo \
+ 		unittest \
+@@ -2205,7 +2204,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_module \
+ 		test/test_peg_generator \
+ 		test/test_sqlite3 \
+-		test/test_tkinter \
+ 		test/test_tomllib \
+ 		test/test_tomllib/data \
+ 		test/test_tomllib/data/invalid \
+@@ -2225,7 +2223,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_tomllib/data/valid/dates-and-times \
+ 		test/test_tomllib/data/valid/multiline-basic-str \
+ 		test/test_tools \
+-		test/test_ttk \
+ 		test/test_unittest \
+ 		test/test_unittest/testmock \
+ 		test/test_warnings \
+@@ -2241,6 +2238,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/xmltestdata/c14n-20 \
+ 		test/ziptestdata
+ 
++ifeq (@TK@,yes)
++LIBSUBDIRS += tkinter
++TESTSUBDIRS += test/test_tkinter test/test_ttk
++endif
++
+ COMPILEALL_OPTS=-j0
+ 
+ ifeq (@PYDOC@,yes)
+diff --git a/configure.ac b/configure.ac
+index 4cc0951ab9..f4ce506801 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4491,6 +4491,11 @@ AC_ARG_ENABLE(pydoc,
+ 	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
+ 	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
+ 
++AC_SUBST(TK)
++AC_ARG_ENABLE(tk,
++	AS_HELP_STRING([--disable-tk], [disable tk]),
++	[ TK="${enableval}" ], [ TK=yes ])
++
+ # Check for enable-ipv6
+ AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
+-- 
+2.34.1
+
diff --git a/package/python3/0028-fix-building-on-older-distributions.patch b/package/python3/0011-fix-building-on-older-distributions.patch
similarity index 82%
rename from package/python3/0028-fix-building-on-older-distributions.patch
rename to package/python3/0011-fix-building-on-older-distributions.patch
index 4541b31c5f..bcd8a60d01 100644
--- a/package/python3/0028-fix-building-on-older-distributions.patch
+++ b/package/python3/0011-fix-building-on-older-distributions.patch
@@ -16,14 +16,16 @@ This change fixes building on older systems such as CentOS7, that only come
 with python 2.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Adam Duskett: ported to Python 3.12.1 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- Tools/scripts/update_file.py | 4 ++--
+ Tools/build/update_file.py | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/Tools/scripts/update_file.py b/Tools/scripts/update_file.py
-index b4182c1d0c..ab443cb1a6 100644
---- a/Tools/scripts/update_file.py
-+++ b/Tools/scripts/update_file.py
+diff --git a/Tools/build/update_file.py b/Tools/build/update_file.py
+index b4182c1..ab443cb 100644
+--- a/Tools/build/update_file.py
++++ b/Tools/build/update_file.py
 @@ -53,7 +53,7 @@ def update_file_with_tmpfile(filename, tmpfile, *, create=False):
          if not create:
              raise  # re-raise
diff --git a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 97%
rename from package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 5253076d90..9acb6e0e67 100644
--- a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -33,7 +33,7 @@ diff --git a/configure.ac b/configure.ac
 index ed03b27fb1..841fd6732c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1086,7 +1086,11 @@ AC_MSG_CHECKING([for multiarch])
+@@ -1123,7 +1123,11 @@ AC_MSG_CHECKING([for multiarch])
  AS_CASE([$ac_sys_system],
    [Darwin*], [MULTIARCH=""],
    [FreeBSD*], [MULTIARCH=""],
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
diff --git a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
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
diff --git a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
deleted file mode 100644
index da6f891104..0000000000
--- a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 03e28cdd46dac1b7e4e9c8bbd2ea44b09e514205 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:31:51 -0800
-Subject: [PATCH] Add an option to disable the curses module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Makefile.pre.in | 4 +++-
- configure.ac    | 9 +++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4f83911200..8e879b35c6 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1905,7 +1905,6 @@ LIBSUBDIRS=	asyncio \
- 		concurrent concurrent/futures \
- 		csv \
- 		ctypes ctypes/macholib \
--		curses \
- 		dbm \
- 		distutils distutils/command \
- 		email email/mime \
-@@ -2024,6 +2023,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
- 	tkinter/test/test_ttk
- endif
- 
-+ifeq (@CURSES@,yes)
-+LIBSUBDIRS += curses
-+endif
- 
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
-diff --git a/configure.ac b/configure.ac
-index f4ce506801..0ae9863cd6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4189,6 +4189,15 @@ if test "$TK" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
- fi
- 
-+AC_SUBST(CURSES)
-+AC_ARG_ENABLE(curses,
-+	AS_HELP_STRING([--disable-curses], [disable curses]),
-+	[ CURSES="${enableval}" ], [ CURSES=yes ])
-+
-+if test "$CURSES" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
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
diff --git a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
deleted file mode 100644
index 63a07fb514..0000000000
--- a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d8ef6a7a9f2b954cf1c1e37fc3c35055b42af0f5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:55 +0100
-Subject: [PATCH] Add an option to disable CJK codecs
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 201cad0bfc..ecdd7dbc07 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4188,6 +4188,12 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_ARG_ENABLE(codecs-cjk,
-+	AS_HELP_STRING([--disable-codecs-cjk], [disable CJK codecs]),
-+	[ if test "$enableval" = "no"; then
-+		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
-+	fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
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
diff --git a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
deleted file mode 100644
index 74702b67a5..0000000000
--- a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4fe7f375a3d171d294caebdd7b7ce49bbc9ad9f3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:27 +0100
-Subject: [PATCH] Add an option to disable unicodedata
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 1bdde7f69d..ba4b0e0c1c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4200,6 +4200,12 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
- 
-+AC_ARG_ENABLE(unicodedata,
-+	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.patch b/package/python3/0021-Add-an-option-to-disable-decimal.patch
deleted file mode 100644
index d683565f94..0000000000
--- a/package/python3/0021-Add-an-option-to-disable-decimal.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 7091fdf77f612425c178a75148560f9c3514e8b8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:31 +0100
-Subject: [PATCH] Add an option to disable decimal
-
-This patch replaces the existing --with-system-libmpdec option with a
---with-libmpdec={system,builtin,none} option, which allows to tell
-Python whether we want to use the system libmpdec (already installed),
-the libmpdec builtin the Python sources, or no libmpdec at all.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[aduskett@gmail.com: Update for python 3.7.0]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[james.hilliard1@gmail.com: adapt to python 3.9]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- configure.ac | 19 +++++++++++++------
- 1 file changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5e6d72f7db..e6b1f1e9de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3630,14 +3630,21 @@ fi
- AC_SUBST(LIBFFI_INCLUDEDIR)
- 
- # Check for use of the system libmpdec library
--AC_MSG_CHECKING(for --with-system-libmpdec)
--AC_ARG_WITH(system_libmpdec,
--            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library, see Doc/library/decimal.rst (default is no)]),
-+AC_MSG_CHECKING(for --with-libmpdec)
-+AC_ARG_WITH(libmpdec,
-+            AS_HELP_STRING([--with-libmpdec], [select which libmpdec version to use: system, builtin, none]),
-             [],
--            [with_system_libmpdec="no"])
--AC_MSG_RESULT($with_system_libmpdec)
-+            [with_libmpdec="builtin"])
-+AC_MSG_RESULT($with_libmpdec)
-+if test "$with_libmpdec" != "none"; then
-+   MPDEC=yes
-+else
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _decimal"
-+   MPDEC=no
-+fi
-+AC_SUBST(MPDEC)
- 
--AS_VAR_IF([with_system_libmpdec], [yes], [
-+AS_VAR_IF([with_libmpdec], [system], [
-   LIBMPDEC_CFLAGS=${LIBMPDEC_CFLAGS-""}
-   LIBMPDEC_LDFLAGS=${LIBMPDEC_LDFLAGS-"-lmpdec"}
-   LIBMPDEC_INTERNAL=
--- 
-2.34.1
-
diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
deleted file mode 100644
index 56713a7f8f..0000000000
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:51:58 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e6b1f1e9de..db33d567ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3678,6 +3678,12 @@ fi
- 
- AC_MSG_RESULT($with_decimal_contextvar)
- 
-+AC_ARG_ENABLE(ossaudiodev,
-+	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
-+	[ if test "$enableval" = "no"; then
-+	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
-+	  fi])
-+
- # Check for libmpdec machine flavor
- AC_MSG_CHECKING(for decimal libmpdec machine)
- AS_CASE([$ac_sys_system],
--- 
-2.34.1
-
diff --git a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
deleted file mode 100644
index d4c9fd43be..0000000000
--- a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 25c900e81a2fc0bbe35e7c94e2e5028cfbf6582a Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Wed, 22 Feb 2017 17:55:59 -0800
-Subject: [PATCH] Add an option to disable openssl support.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index db33d567ad..42fe6c8f5a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4219,6 +4219,12 @@ AC_ARG_ENABLE(unicodedata,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-   	  fi])
- 
-+AC_ARG_ENABLE(openssl,
-+	AS_HELP_STRING([--disable-openssl], [disable openssl support]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
deleted file mode 100644
index 9250007dae..0000000000
--- a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9082468ca620db77b670ccf568a96bbabb865f80 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:29:05 +0100
-Subject: [PATCH] Add an option to disable the readline module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 42fe6c8f5a..19875d7d30 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4225,6 +4225,12 @@ AC_ARG_ENABLE(openssl,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
- 	  fi])
- 
-+AC_ARG_ENABLE(readline,
-+	AS_HELP_STRING([--disable-readline], [disable readline]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
deleted file mode 100644
index 70a0d6cd15..0000000000
--- a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 988a335cb34b5fc25ea345ba04ff5ddffe2e946c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:31:11 +0100
-Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 19875d7d30..ca6c16491a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4231,6 +4231,24 @@ AC_ARG_ENABLE(readline,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
- 	  fi])
- 
-+AC_ARG_ENABLE(bzip2,
-+	AS_HELP_STRING([--disable-bzip2], [disable bzip2]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bz2"
-+	  fi])
-+
-+AC_ARG_ENABLE(zlib,
-+	AS_HELP_STRING([--disable-zlib], [disable zlib]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
-+	  fi])
-+
-+AC_ARG_ENABLE(xz,
-+	AS_HELP_STRING([--disable-xz], [disable xz]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _lzma"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch b/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
deleted file mode 100644
index a9501ec189..0000000000
--- a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 58027d25c3cabcf654cb0b31a61d7cbd53dc68c0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 18 Aug 2018 10:54:56 +0200
-Subject: [PATCH] Add an option to disable uuid module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ca6c16491a..ed03b27fb1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4267,6 +4267,15 @@ if test "$CURSES" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
- fi
- 
-+AC_SUBST(UUID)
-+AC_ARG_ENABLE(uuid,
-+	AS_HELP_STRING([--disable-uuid], [disable uuid]),
-+	[ UUID="${enableval}" ], [ UUID=yes ])
-+
-+if test "$UUID" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
deleted file mode 100644
index 5fb436db59..0000000000
--- a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 11 Apr 2020 22:01:40 +0200
-Subject: [PATCH] Add an option to disable the berkeleydb module
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 841fd6732c..06c9a81f95 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4280,6 +4280,12 @@ if test "$UUID" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
- fi
- 
-+AC_ARG_ENABLE(berkeleydb,
-+	AS_HELP_STRING([--disable-berkeleydb], [disable berkeleydb]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _dbm"
-+	  fi])
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 39a16c1f71..725c854050 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3116/
-md5  d0c5a1a31efe879723e51addf56dd206  Python-3.11.6.tar.xz
+# From https://www.python.org/downloads/release/python-3121/
+md5  50f827c800483776c8ef86e6a53831fa  Python-3.12.1.tar.xz
 # Locally computed
-sha256  0fab78fa7f133f4f38210c6260d90d7c0d5c7198446419ce057ec7ac2e6f5f38  Python-3.11.6.tar.xz
+sha256  8dfb8f426fcd226657f9e2bd5f1e96e53264965176fa17d32658e873591aeb21  Python-3.12.1.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b9c5054a21..16e8567b9e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION_MAJOR = 3.12
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -19,16 +19,10 @@ PYTHON3_CPE_ID_PRODUCT = python
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
-	--disable-sqlite3 \
 	--disable-tk \
-	--with-expat=system \
-	--disable-curses \
-	--disable-codecs-cjk \
-	--disable-nis \
-	--enable-unicodedata \
+	--with-system-expat \
 	--disable-test-modules \
 	--disable-idle3 \
-	--disable-uuid \
 	--disable-ossaudiodev
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
@@ -38,6 +32,19 @@ HOST_PYTHON3_CONF_OPTS += \
 # communicate over the network during the build.
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+	py_cv_module__curses=n/a \
+	py_cv_module__curses_panel=n/a \
+	py_cv_module_nis=n/a \
+	py_cv_module_unicodedata=yes \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a \
+	py_cv_module__sqlite3=n/a \
+	py_cv_module__tkinter=n/a \
+	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
@@ -52,13 +59,15 @@ HOST_PYTHON3_DEPENDENCIES = \
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
 HOST_PYTHON3_DEPENDENCIES += host-bzip2
 else
-HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+HOST_PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-HOST_PYTHON3_CONF_OPTS += --disable-openssl
+HOST_PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 PYTHON3_INSTALL_STAGING = YES
@@ -72,83 +81,92 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
 PYTHON3_DEPENDENCIES += berkeleydb
 else
-PYTHON3_CONF_OPTS += --disable-berkeleydb
+PYTHON3_CONF_ENV += py_cv_module__dbm=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
+PYTHON3_CONF_OPTS += --with-readline
 PYTHON3_DEPENDENCIES += readline
 else
-PYTHON3_CONF_OPTS += --disable-readline
+PYTHON3_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_CURSES),y)
 PYTHON3_DEPENDENCIES += ncurses
 else
-PYTHON3_CONF_OPTS += --disable-curses
+PYTHON3_CONF_ENV += \
+	py_cv_module__curses=n/a \
+	py_cv_module__curses_panel=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_DECIMAL),y)
 PYTHON3_DEPENDENCIES += mpdecimal
-PYTHON3_CONF_OPTS += --with-libmpdec=system
+PYTHON3_CONF_OPTS += --with-system-libmpdec
 else
-PYTHON3_CONF_OPTS += --with-libmpdec=none
+PYTHON3_CONF_ENV += py_cv_module__decimal=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
 PYTHON3_DEPENDENCIES += expat
-PYTHON3_CONF_OPTS += --with-expat=system
+PYTHON3_CONF_OPTS += --with-system-expat
 else
-PYTHON3_CONF_OPTS += --with-expat=none
+PYTHON3_CONF_ENV += py_cv_module_pyexpat=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 else
-PYTHON3_CONF_OPTS += --disable-sqlite3
+PYTHON3_CONF_ENV += py_cv_module__sqlite3=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
 PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 else
-PYTHON3_CONF_OPTS += --disable-openssl
+PYTHON3_CONF_ENV += \
+	py_cv_module__hashlib=n/a \
+	py_cv_module__ssl=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
-PYTHON3_CONF_OPTS += --disable-codecs-cjk
+PYTHON3_CONF_ENV += \
+	py_cv_module__codecs_cn=n/a \
+	py_cv_module__codecs_hk=n/a \
+	py_cv_module__codecs_iso2022=n/a \
+	py_cv_module__codecs_jp=n/a \
+	py_cv_module__codecs_kr=n/a \
+	py_cv_module__codecs_tw=n/a
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
-PYTHON3_CONF_OPTS += --disable-unicodedata
+PYTHON3_CONF_ENV += py_cv_module_unicodedata=n/a
 endif
 
 # Disable auto-detection of uuid.h (util-linux)
 # which would add _uuid module support, instead
 # default to the pure python implementation
-PYTHON3_CONF_OPTS += --disable-uuid
+PYTHON3_CONF_ENV += py_cv_module__uuid=n/a
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
 PYTHON3_DEPENDENCIES += bzip2
 else
-PYTHON3_CONF_OPTS += --disable-bzip2
+PYTHON3_CONF_ENV += py_cv_module__bz2=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_XZ),y)
 PYTHON3_DEPENDENCIES += xz
 else
-PYTHON3_CONF_OPTS += --disable-xz
+PYTHON3_CONF_ENV += py_cv_module__lzma=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_ZLIB),y)
 PYTHON3_DEPENDENCIES += zlib
 else
-PYTHON3_CONF_OPTS += --disable-zlib
+PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_OPTS += --enable-ossaudiodev
-else
-PYTHON3_CONF_OPTS += --disable-ossaudiodev
+ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
+PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
 
 # Make python believe we don't have 'hg', so that it doesn't try to
@@ -158,6 +176,8 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \
+	py_cv_module_nis=n/a \
+	py_cv_module__tkinter=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
 # GCC is always compliant with IEEE754
@@ -185,7 +205,6 @@ PYTHON3_CONF_OPTS += \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
-	--disable-nis \
 	--disable-idle3 \
 	--disable-pyc-build
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
