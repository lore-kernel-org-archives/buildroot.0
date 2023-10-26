Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA47BC25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D0DB41770;
	Thu, 26 Oct 2023 09:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D0DB41770
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDCXaqsnXp6U; Thu, 26 Oct 2023 09:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B484415AE;
	Thu, 26 Oct 2023 09:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B484415AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27E941BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0058941780
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0058941780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IuvQKqYamXXe for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:39 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2261441746
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2261441746
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-9be7e3fa1daso106335366b.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312457; x=1698917257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdDNaSIVJ1clUSssRDLca/Q46ipqPkIxnr/icK56YtQ=;
 b=YKV6Dx96vcWQmcCcbC3cgEpjbqHin4CYYojUzRLmTl7xCcFBP+NhZ+quHPoN+6Vp13
 CYkIMjDMoQMj2nNouoJ91zEMY5YsOuutq41xosj8h+uYfR+wqxaVuzQQq1eRo1Mjs/mX
 sdHsDs542/CBtxkmRLghmtrQnEoxHQewlkNZ4JWzfgpxbO7GmRyBQfrhHX7i1hiOz5ib
 Z7hb3zFtMPm9upwhUVzdP2btNOw1ApY9rCRbGECtMMEIxrl1esf9hFHO11QmaA8ixC20
 6pWbCyFY+gmijgSbzYitQGb93m7bqhWdc/UcssHu6oAtqMXBV70TAVaswFpizdTBCXdf
 CQMw==
X-Gm-Message-State: AOJu0YxSRwCvfeLZ0we4xReh83ohyfiGPj7aDDjIHLDbFRel/AAe6/fy
 S6RSACva0sah+zfUsYINbg1Lzvgy19bBNXAkVf/IWsoBOEnwm6NO
X-Google-Smtp-Source: AGHT+IFVzwcG7J+lhDejd2pE69Z2AXfsc2TXW684Y42jOvkCm8b5c7PwHRRKtBsI1wZVWwHlDeuBJA==
X-Received: by 2002:a17:907:84d:b0:9ae:588e:142 with SMTP id
 ww13-20020a170907084d00b009ae588e0142mr13726755ejb.67.1698312455304; 
 Thu, 26 Oct 2023 02:27:35 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:33 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:27:01 +0200
Message-ID: <20231026092701.12345-31-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312457; x=1698917257;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdDNaSIVJ1clUSssRDLca/Q46ipqPkIxnr/icK56YtQ=;
 b=PImC44eYnmR084zjweFAUH15qMwKVGDtXlXiKcEEQXuyRBpLRYaBzZI6i6aylhL6ua
 D8SEcj7Uyc7p/NL+AMyMIvU+PGDknDijHoJP1jyxbTwrw5FrvvXuVab0Wl/LFiX5rz1p
 mwHdyR68S38vXqw7OmEDfmQUY9UTXpK09+08o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PImC44eY
Subject: [Buildroot] [PATCH 30/30] package/python3: bump version to 3.12.0
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
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python 3.12.0 has removed distutils support. As such, we remove the distutils
option from pkg-python.mk as well.

Tested on Fedora 38, 39, and Debian 11. All 68 package tests pass.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/pkg-python.mk                         |  44 +-
 ...e-the-build-of-pyc-files-conditional.patch |  24 +-
 ...taddrinfo-configure-test-when-cross-.patch |   2 +-
 ...y-header-paths-for-cross-compilation.patch |  31 +-
 ...ook-in-usr-lib-termcap-for-libraries.patch |  31 -
 ...tch => 0004-Serial-ioctl-workaround.patch} |   0
 .../0005-Don-t-add-multiarch-paths.patch      |  37 -
 ...g.sh.in-ensure-sed-invocations-only.patch} |   0
 .../0006-Abort-on-failed-module-build.patch   |  30 -
 ...0006-Add-an-option-to-disable-pydoc.patch} |  50 +-
 ...07-Add-an-option-to-disable-lib2to3.patch} |  74 +-
 ... 0008-Add-an-option-to-disable-IDLE.patch} |  43 +-
 ...e-shebang-of-Python-scripts-for-cros.patch |  35 -
 ...hon-config.sh-don-t-reassign-prefix.patch} |   0
 ...-an-option-to-disable-the-tk-module.patch} |  47 +-
 ...fix-building-on-older-distributions.patch} |  12 +-
 ...p-CC-print-multiarch-output-for-mus.patch} |   2 +-
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 ...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 -------
 .../0019-Port-_ctypes-to-PY_STDLIB_MOD.patch  | 441 -----------
 ...readline-and-curses-to-PY_STDLIB_MOD.patch | 718 ------------------
 package/python3/python3.hash                  |   6 +-
 package/python3/python3.mk                    |   4 +-
 23 files changed, 118 insertions(+), 1806 deletions(-)
 delete mode 100644 package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
 rename package/python3/{0007-Serial-ioctl-workaround.patch => 0004-Serial-ioctl-workaround.patch} (100%)
 delete mode 100644 package/python3/0005-Don-t-add-multiarch-paths.patch
 rename package/python3/{0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
 delete mode 100644 package/python3/0006-Abort-on-failed-module-build.patch
 rename package/python3/{0010-Add-an-option-to-disable-pydoc.patch => 0006-Add-an-option-to-disable-pydoc.patch} (54%)
 rename package/python3/{0011-Add-an-option-to-disable-lib2to3.patch => 0007-Add-an-option-to-disable-lib2to3.patch} (59%)
 rename package/python3/{0012-Add-an-option-to-disable-IDLE.patch => 0008-Add-an-option-to-disable-IDLE.patch} (57%)
 delete mode 100644 package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 rename package/python3/{0013-python-config.sh-don-t-reassign-prefix.patch => 0009-python-config.sh-don-t-reassign-prefix.patch} (100%)
 rename package/python3/{0014-Add-an-option-to-disable-the-tk-module.patch => 0010-Add-an-option-to-disable-the-tk-module.patch} (57%)
 rename package/python3/{0015-fix-building-on-older-distributions.patch => 0011-fix-building-on-older-distributions.patch} (82%)
 rename package/python3/{0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (97%)
 rename package/python3/{0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 28ee4cb85f..8f52372321 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -52,33 +52,6 @@ HOST_PKG_PYTHON_ENV = \
 	PYTHONNOUSERSITE=1 \
 	$(HOST_CONFIGURE_OPTS)
 
-# Target distutils-based packages
-PKG_PYTHON_DISTUTILS_ENV = \
-	$(PKG_PYTHON_ENV) \
-	LDSHARED="$(TARGET_CROSS)gcc -shared"
-
-PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
-	--executable=/usr/bin/python
-
-PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr
-
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
-	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
-	--root=$(TARGET_DIR)
-
-PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
-	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
-	--root=$(STAGING_DIR)
-
-# Host distutils-based packages
-HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
-
-HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
-	--prefix=$(HOST_DIR)
-
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -194,21 +167,8 @@ ifndef $(2)_SETUP_TYPE
  endif
 endif
 
-# Distutils
-ifeq ($$($(2)_SETUP_TYPE),distutils)
-ifeq ($(4),target)
-$(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_BUILD_OPTS = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
-$(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
-else
-$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
-$(2)_BASE_BUILD_CMD   = setup.py build
-$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
-endif
 # Setuptools
-else ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
+ifneq ($$(filter setuptools setuptools-rust,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
 ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
 $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_RUST_ENV)
@@ -255,7 +215,7 @@ $(2)_BASE_BUILD_CMD = -m flit_core.wheel
 $(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 
 # We need to vendor the Cargo crates at download time for pyo3 based
diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 92aa7274ba..6445068877 100644
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
+@@ -2305,6 +2305,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+ 		$(DESTDIR)$(LIBDEST); \
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
 +ifeq (@PYC_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
+@@ -2314,6 +2315,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
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
+@@ -1474,6 +1474,12 @@ fi
  
- AC_MSG_CHECKING(LDLIBRARY)
+ AC_MSG_CHECKING([LDLIBRARY])
  
 +AC_SUBST(PYC_BUILD)
 +
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 5389cb5d15..3e65c848c4 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
 index 0cf89ed641..830885fcb3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5086,7 +5086,7 @@ fi]))
+@@ -5391,7 +5391,7 @@ fi]))
  dnl if ac_cv_func_getaddrinfo
  ])
  
diff --git a/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
index 9a55d2582d..93f522008d 100644
--- a/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
@@ -15,34 +15,19 @@ values, and get correct header/library paths when cross-compiling
 third-party Python modules.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Refresh for 3.10.0
+[ Adam Duskett: ported to Python 3.12.0 ]
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
 
diff --git a/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
deleted file mode 100644
index 78b3ae596d..0000000000
--- a/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
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
diff --git a/package/python3/0007-Serial-ioctl-workaround.patch b/package/python3/0004-Serial-ioctl-workaround.patch
similarity index 100%
rename from package/python3/0007-Serial-ioctl-workaround.patch
rename to package/python3/0004-Serial-ioctl-workaround.patch
diff --git a/package/python3/0005-Don-t-add-multiarch-paths.patch b/package/python3/0005-Don-t-add-multiarch-paths.patch
deleted file mode 100644
index 749e295df1..0000000000
--- a/package/python3/0005-Don-t-add-multiarch-paths.patch
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
diff --git a/package/python3/0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
similarity index 100%
rename from package/python3/0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
rename to package/python3/0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
diff --git a/package/python3/0006-Abort-on-failed-module-build.patch b/package/python3/0006-Abort-on-failed-module-build.patch
deleted file mode 100644
index a473896127..0000000000
--- a/package/python3/0006-Abort-on-failed-module-build.patch
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
diff --git a/package/python3/0010-Add-an-option-to-disable-pydoc.patch b/package/python3/0006-Add-an-option-to-disable-pydoc.patch
similarity index 54%
rename from package/python3/0010-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0006-Add-an-option-to-disable-pydoc.patch
index f7bfd437bb..43d47e9a10 100644
--- a/package/python3/0010-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0006-Add-an-option-to-disable-pydoc.patch
@@ -12,17 +12,18 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Adam Duskett: ported to Python 3.12.0 ]
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
+@@ -2045,7 +2045,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -32,7 +33,7 @@ index c1cfb96767..403380e181 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1915,7 +1917,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2097,7 +2099,6 @@ LIBSUBDIRS=	asyncio \
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
+@@ -2233,6 +2234,10 @@ TESTSUBDIRS=	idlelib/idle_test \
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
+@@ -4475,6 +4475,12 @@ AS_VAR_IF([posix_threads], [stub], [
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
 
diff --git a/package/python3/0011-Add-an-option-to-disable-lib2to3.patch b/package/python3/0007-Add-an-option-to-disable-lib2to3.patch
similarity index 59%
rename from package/python3/0011-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0007-Add-an-option-to-disable-lib2to3.patch
index 228b86a90b..06766fc5ab 100644
--- a/package/python3/0011-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0007-Add-an-option-to-disable-lib2to3.patch
@@ -14,17 +14,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Bernd Kuhls: ported to Python 3.11.4]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[ Adam Duskett: ported to Python 3.12.0 ]
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
+@@ -2049,7 +2049,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -34,7 +35,7 @@ index 403380e181..f5d0573067 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1914,7 +1916,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2096,7 +2098,6 @@ LIBSUBDIRS=	asyncio \
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
+@@ -2190,10 +2191,6 @@ TESTSUBDIRS=	idlelib/idle_test \
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
+@@ -2238,6 +2235,14 @@ ifeq (@PYDOC@,yes)
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
+@@ -2321,10 +2326,12 @@ ifeq (@PYC_BUILD@,yes)
+ 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
 +ifeq (@LIB2TO3@,yes)
@@ -85,7 +86,7 @@ diff --git a/configure.ac b/configure.ac
 index f68ea72321..d8e10cf2b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7078,6 +7078,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
+@@ -7510,6 +7510,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
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
 
diff --git a/package/python3/0012-Add-an-option-to-disable-IDLE.patch b/package/python3/0008-Add-an-option-to-disable-IDLE.patch
similarity index 57%
rename from package/python3/0012-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0008-Add-an-option-to-disable-IDLE.patch
index 09b5f13cdb..7bfeec8015 100644
--- a/package/python3/0012-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0008-Add-an-option-to-disable-IDLE.patch
@@ -11,17 +11,18 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Adam Duskett: ported to Python 3.12.0 ]
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
+@@ -2043,7 +2043,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -31,7 +32,7 @@ index 80d617cf7f..8d1ba1356c 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1912,7 +1914,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2095,7 +2097,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -39,8 +40,8 @@ index 80d617cf7f..8d1ba1356c 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2030,6 +2031,10 @@ ifeq (@EXPAT@,yes)
- LIBSUBDIRS += $(XMLLIBSUBDIRS)
+@@ -2243,6 +2244,10 @@ TESTSUBDIRS += test/test_lib2to3			\
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
+@@ -7516,6 +7516,12 @@ AC_ARG_ENABLE(lib2to3,
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
 
diff --git a/package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
deleted file mode 100644
index eff8fc7694..0000000000
--- a/package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
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
diff --git a/package/python3/0013-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0009-python-config.sh-don-t-reassign-prefix.patch
similarity index 100%
rename from package/python3/0013-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0009-python-config.sh-don-t-reassign-prefix.patch
diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
similarity index 57%
rename from package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
index 1ed8959dba..ff2d94a391 100644
--- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
@@ -11,16 +11,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Bernd Kuhls: ported to Python 3.11.4]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[ Adam Duskett: ported to Python 3.12.0 ]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- Makefile.pre.in | 10 +++++++---
- configure.ac    |  9 +++++++++
- 2 files changed, 16 insertions(+), 3 deletions(-)
+ Makefile.pre.in | 8 +++++---
+ configure.ac    | 5 +++++
+ 2 files changed, 10 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 9f4cdf14cf..4f83911200 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1921,7 +1921,6 @@
+@@ -2104,7 +2104,6 @@ LIBSUBDIRS=	asyncio \
  		re \
  		site-packages \
  		sqlite3 \
@@ -28,30 +30,39 @@ index 9f4cdf14cf..4f83911200 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2039,12 +2038,15 @@
- 		test/xmltestdata \
+@@ -2195,7 +2194,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_module \
+ 		test/test_peg_generator \
+ 		test/test_sqlite3 \
+-		test/test_tkinter \
+ 		test/test_tomllib \
+ 		test/test_tomllib/data \
+ 		test/test_tomllib/data/invalid \
+@@ -2215,7 +2213,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_tomllib/data/valid/dates-and-times \
+ 		test/test_tomllib/data/valid/multiline-basic-str \
+ 		test/test_tools \
+-		test/test_ttk \
+ 		test/test_unittest \
+ 		test/test_unittest/testmock \
+ 		test/test_warnings \
+@@ -2230,6 +2227,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
- 		test/ziptestdata \
--		tkinter/test \
--		tkinter/test/test_tkinter \
--		tkinter/test/test_ttk \
- 		unittest/test \
- 		unittest/test/testmock
+ 		test/ziptestdata
  
 +ifeq (@TK@,yes)
 +LIBSUBDIRS += tkinter
-+TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
-+	tkinter/test/test_ttk
++TESTSUBDIRS += test/test_tkinter test/test_ttk
 +endif
 +
+ COMPILEALL_OPTS=-j0
+ 
  ifeq (@PYDOC@,yes)
- LIBSUBDIRS += pydoc_data
- endif
 diff --git a/configure.ac b/configure.ac
 index 4cc0951ab9..f4ce506801 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4202,6 +4202,11 @@
+@@ -4481,6 +4481,11 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -61,7 +72,7 @@ index 4cc0951ab9..f4ce506801 100644
 +	[ TK="${enableval}" ], [ TK=yes ])
 +
  # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
+ AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
 2.34.1
diff --git a/package/python3/0015-fix-building-on-older-distributions.patch b/package/python3/0011-fix-building-on-older-distributions.patch
similarity index 82%
rename from package/python3/0015-fix-building-on-older-distributions.patch
rename to package/python3/0011-fix-building-on-older-distributions.patch
index 4541b31c5f..e22e85bd66 100644
--- a/package/python3/0015-fix-building-on-older-distributions.patch
+++ b/package/python3/0011-fix-building-on-older-distributions.patch
@@ -16,14 +16,16 @@ This change fixes building on older systems such as CentOS7, that only come
 with python 2.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Adam Duskett: ported to Python 3.12.0 ]
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
diff --git a/package/python3/0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 97%
rename from package/python3/0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 5253076d90..d689b7f7a3 100644
--- a/package/python3/0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -33,7 +33,7 @@ diff --git a/configure.ac b/configure.ac
 index ed03b27fb1..841fd6732c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1086,7 +1086,11 @@ AC_MSG_CHECKING([for multiarch])
+@@ -1118,7 +1118,11 @@ AC_MSG_CHECKING([for multiarch])
  AS_CASE([$ac_sys_system],
    [Darwin*], [MULTIARCH=""],
    [FreeBSD*], [MULTIARCH=""],
diff --git a/package/python3/0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
diff --git a/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
deleted file mode 100644
index 92d2594eef..0000000000
--- a/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-From ec5e253556875640b1ac514e85c545346ac3f1e0 Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Fri, 1 Jul 2022 21:48:38 +0200
-Subject: [PATCH] gh-90005: Port _dbm module to PY_STDLIB_MOD (GH-94433)
-
-Upstream: https://github.com/python/cpython/commit/ec5e253556875640b1ac514e85c545346ac3f1e0
-
-[Bernd: backported to 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- ...2-06-30-09-57-39.gh-issue-90005.9-pQyR.rst |   1 +
- Modules/Setup.stdlib.in                       |   2 +-
- configure                                     | 295 ++++++++++++------
- configure.ac                                  | 100 ++++--
- pyconfig.h.in                                 |   6 -
- setup.py                                      |  72 +----
- 6 files changed, 278 insertions(+), 198 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
-
-diff --git a/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
-new file mode 100644
-index 0000000000000..9b14f767847da
---- /dev/null
-+++ b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
-@@ -0,0 +1 @@
-+``_dbm`` module dependencies are now detected by configure.
-diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
-index a199aefc51011..ad34f85e25451 100644
---- a/Modules/Setup.stdlib.in
-+++ b/Modules/Setup.stdlib.in
-@@ -68,7 +68,7 @@
- 
- # dbm/gdbm
- # dbm needs either libndbm, libgdbm_compat, or libdb 5.x
--#@MODULE__DBM_TRUE@_dbm _dbmmodule.c
-+@MODULE__DBM_TRUE@_dbm _dbmmodule.c
- # gdbm module needs -lgdbm
- @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c
- 
-diff --git a/configure.ac b/configure.ac
-index 12ae2ae8d87eb..b03ead3bdefa0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3956,17 +3956,30 @@ WITH_SAVE_ENV([
-   ], [have_gdbm=no])
- ])
- 
--# check for _dbmmodule.c dependencies
-+dnl check for _dbmmodule.c dependencies
-+dnl ndbm, gdbm_compat, libdb
- AC_CHECK_HEADERS([ndbm.h], [
--  LIBS_SAVE="$LIBS"
--  AC_CHECK_LIB([ndbm], [dbm_open])
--  LIBS="$LIBS_SAVE"
--  AC_CHECK_LIB([gdbm_compat], [dbm_open])
--  LIBS="$LIBS_SAVE"
-+  WITH_SAVE_ENV([
-+    AC_SEARCH_LIBS([dbm_open], [ndbm gdbm_compat])
-+  ])
- ])
- 
--# "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to "gdbm_ndbm_h"
--# unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits.
-+AC_MSG_CHECKING([for ndbm presence and linker args])
-+AS_CASE([$ac_cv_search_dbm_open],
-+  [*ndbm*|*gdbm_compat*], [
-+    dbm_ndbm="$ac_cv_search_dbm_open"
-+    have_ndbm=yes
-+  ],
-+  [none*], [
-+    dbm_ndbm=""
-+    have_ndbm=yes
-+  ],
-+  [no], [have_ndbm=no]
-+)
-+AC_MSG_RESULT([$have_ndbm ($dbm_ndbm)])
-+
-+dnl "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to "gdbm_ndbm_h"
-+dnl unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits.
- AS_UNSET([ac_cv_header_gdbm_ndbm_h])
- AC_CACHE_VAL([ac_cv_header_gdbm_slash_ndbm_h], [
-   AC_CHECK_HEADER(
-@@ -3991,26 +4004,26 @@ AS_VAR_IF([ac_cv_header_gdbm_dash_ndbm_h], [yes], [
- AS_UNSET([ac_cv_header_gdbm_ndbm_h])
- 
- if test "$ac_cv_header_gdbm_slash_ndbm_h" = yes -o "$ac_cv_header_gdbm_dash_ndbm_h" = yes; then
--  LIBS_SAVE="$LIBS"
--  AC_CHECK_LIB([gdbm_compat], [dbm_open])
--  LIBS="$LIBS_SAVE"
-+  WITH_SAVE_ENV([
-+    AC_SEARCH_LIBS([dbm_open], [gdbm_compat])
-+  ])
- fi
- 
- # Check for libdb >= 5 with dbm_open()
- # db.h re-defines the name of the function
- AC_CHECK_HEADERS([db.h], [
-   AC_CACHE_CHECK([for libdb], [ac_cv_have_libdb], [
--    LIBS_SAVE="$LIBS"
--    LIBS="$LIBS -ldb"
--    AC_LINK_IFELSE([AC_LANG_PROGRAM([
--      #define DB_DBM_HSEARCH 1
--      #include <db.h>
--      #if DB_VERSION_MAJOR < 5
--        #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
--      #endif
--      ], [DBM *dbm = dbm_open(NULL, 0, 0)])
--    ], [ac_cv_have_libdb=yes], [ac_cv_have_libdb=no])
--    LIBS="$LIBS_SAVE"
-+    WITH_SAVE_ENV([
-+      LIBS="$LIBS -ldb"
-+      AC_LINK_IFELSE([AC_LANG_PROGRAM([
-+        #define DB_DBM_HSEARCH 1
-+        #include <db.h>
-+        #if DB_VERSION_MAJOR < 5
-+          #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
-+        #endif
-+        ], [DBM *dbm = dbm_open(NULL, 0, 0)])
-+      ], [ac_cv_have_libdb=yes], [ac_cv_have_libdb=no])
-+    ])
-   ])
-   AS_VAR_IF([ac_cv_have_libdb], [yes], [
-     AC_DEFINE([HAVE_LIBDB], [1], [Define to 1 if you have the `db' library (-ldb).])
-@@ -4018,7 +4031,7 @@ AC_CHECK_HEADERS([db.h], [
- ])
- 
- # Check for --with-dbmliborder
--AC_MSG_CHECKING(for --with-dbmliborder)
-+AC_MSG_CHECKING([for --with-dbmliborder])
- AC_ARG_WITH(dbmliborder,
-             AS_HELP_STRING([--with-dbmliborder=db1:db2:...], [override order to check db backends for dbm; a valid value is a colon separated string with the backend names `ndbm', `gdbm' and `bdb'.]),
- [], [with_dbmliborder=gdbm:ndbm:bdb])
-@@ -4038,7 +4051,42 @@ IFS=$as_save_IFS
- AS_VAR_IF([with_dbmliborder], [error], [
-   AC_MSG_ERROR([proper usage is --with-dbmliborder=db1:db2:... (gdbm:ndbm:bdb)])
- ])
--AC_MSG_RESULT($with_dbmliborder)
-+AC_MSG_RESULT([$with_dbmliborder])
-+
-+AC_MSG_CHECKING([for _dbm module CFLAGS and LIBS])
-+have_dbm=no
-+as_save_IFS=$IFS
-+IFS=:
-+for db in $with_dbmliborder; do
-+  case "$db" in
-+    ndbm)
-+      if test "$have_ndbm" = yes; then
-+        DBM_CFLAGS="-DUSE_NDBM"
-+        DBM_LIBS="$dbm_ndbm"
-+        have_dbm=yes
-+        break
-+      fi
-+      ;;
-+    gdbm)
-+      if test "$have_gdbm_compat" = yes; then
-+        DBM_CFLAGS="-DUSE_GDBM_COMPAT"
-+        DBM_LIBS="-lgdbm_compat"
-+        have_dbm=yes
-+        break
-+      fi
-+      ;;
-+    bdb)
-+      if test "$ac_cv_have_libdb" = yes; then
-+        DBM_CFLAGS="-DUSE_BERKDB"
-+        DBM_LIBS="-ldb"
-+        have_dbm=yes
-+        break
-+      fi
-+     ;;
-+  esac
-+done
-+IFS=$as_save_IFS
-+AC_MSG_RESULT([$DBM_CFLAGS $DBM_LIBS])
- 
- # Templates for things AC_DEFINEd more than once.
- # For a single AC_DEFINE, no template is needed.
-@@ -6940,7 +6988,9 @@ PY_STDLIB_MOD([_ctypes],
- dnl PY_STDLIB_MOD([_curses], [], [], [], [])
- dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
- PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDFLAGS])
--dnl PY_STDLIB_MOD([_dbm], [], [], [], [])
-+PY_STDLIB_MOD([_dbm],
-+  [test -n "$with_dbmliborder"], [test "$have_dbm" != "no"],
-+  [$DBM_CFLAGS], [$DBM_LIBS])
- PY_STDLIB_MOD([_gdbm],
-   [test "$have_gdbm_dbmliborder" = yes], [test "$have_gdbm" = yes],
-   [$GDBM_CFLAGS], [$GDBM_LIBS])
-diff --git a/pyconfig.h.in b/pyconfig.h.in
-index 15933e75b1b07..b05ddd41c2bba 100644
---- a/pyconfig.h.in
-+++ b/pyconfig.h.in
-@@ -640,18 +640,12 @@
- /* Define to 1 if you have the `dld' library (-ldld). */
- #undef HAVE_LIBDLD
- 
--/* Define to 1 if you have the `gdbm_compat' library (-lgdbm_compat). */
--#undef HAVE_LIBGDBM_COMPAT
--
- /* Define to 1 if you have the `ieee' library (-lieee). */
- #undef HAVE_LIBIEEE
- 
- /* Define to 1 if you have the <libintl.h> header file. */
- #undef HAVE_LIBINTL_H
- 
--/* Define to 1 if you have the `ndbm' library (-lndbm). */
--#undef HAVE_LIBNDBM
--
- /* Define to build the readline module. */
- #undef HAVE_LIBREADLINE
- 
-diff --git a/setup.py b/setup.py
-index 843ec35effe10..cc11dedee1b2e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1163,77 +1163,7 @@ def detect_crypt(self):
-         self.addext(Extension('_crypt', ['_cryptmodule.c']))
- 
-     def detect_dbm_gdbm(self):
--        # Modules that provide persistent dictionary-like semantics.  You will
--        # probably want to arrange for at least one of them to be available on
--        # your machine, though none are defined by default because of library
--        # dependencies.  The Python module dbm/__init__.py provides an
--        # implementation independent wrapper for these; dbm/dumb.py provides
--        # similar functionality (but slower of course) implemented in Python.
--
--        dbm_setup_debug = False   # verbose debug prints from this script?
--        dbm_order = ['gdbm']
--
--        # libdb, gdbm and ndbm headers and libraries
--        have_ndbm_h = sysconfig.get_config_var("HAVE_NDBM_H")
--        have_gdbm_ndbm_h = sysconfig.get_config_var("HAVE_GDBM_NDBM_H")
--        have_gdbm_dash_ndbm_h = sysconfig.get_config_var("HAVE_GDBM_DASH_NDBM_H")
--        have_libndbm = sysconfig.get_config_var("HAVE_LIBNDBM")
--        have_libgdbm_compat = sysconfig.get_config_var("HAVE_LIBGDBM_COMPAT")
--        have_libdb = sysconfig.get_config_var("HAVE_LIBDB")
--
--        # The standard Unix dbm module:
--        if not CYGWIN:
--            config_args = [arg.strip("'")
--                           for arg in sysconfig.get_config_var("CONFIG_ARGS").split()]
--            dbm_args = [arg for arg in config_args
--                        if arg.startswith('--with-dbmliborder=')]
--            if dbm_args:
--                dbm_order = [arg.split('=')[-1] for arg in dbm_args][-1].split(":")
--            else:
--                dbm_order = "gdbm:ndbm:bdb".split(":")
--            dbmext = None
--            for cand in dbm_order:
--                if cand == "ndbm":
--                    if have_ndbm_h:
--                        # Some systems have -lndbm, others have -lgdbm_compat,
--                        # others don't have either
--                        if have_libndbm:
--                            ndbm_libs = ['ndbm']
--                        elif have_libgdbm_compat:
--                            ndbm_libs = ['gdbm_compat']
--                        else:
--                            ndbm_libs = []
--                        if dbm_setup_debug: print("building dbm using ndbm")
--                        dbmext = Extension(
--                            '_dbm', ['_dbmmodule.c'],
--                            define_macros=[('USE_NDBM', None)],
--                            libraries=ndbm_libs
--                        )
--                        break
--                elif cand == "gdbm":
--                    # dbm_open() is provided by libgdbm_compat, which wraps libgdbm
--                    if have_libgdbm_compat and (have_gdbm_ndbm_h or have_gdbm_dash_ndbm_h):
--                        if dbm_setup_debug: print("building dbm using gdbm")
--                        dbmext = Extension(
--                            '_dbm', ['_dbmmodule.c'],
--                            define_macros=[('USE_GDBM_COMPAT', None)],
--                            libraries=['gdbm_compat']
--                        )
--                        break
--                elif cand == "bdb":
--                    if have_libdb:
--                        if dbm_setup_debug: print("building dbm using bdb")
--                        dbmext = Extension(
--                            '_dbm', ['_dbmmodule.c'],
--                            define_macros=[('USE_BERKDB', None)],
--                            libraries=['db']
--                        )
--                        break
--            if dbmext is not None:
--                self.add(dbmext)
--            else:
--                self.missing.append('_dbm')
--
-+        self.addext(Extension('_dbm', ['_dbmmodule.c']))
-         # Anthony Baxter's gdbm module.  GNU dbm(3) will require -lgdbm:
-         self.addext(Extension('_gdbm', ['_gdbmmodule.c']))
- 
diff --git a/package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch b/package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
deleted file mode 100644
index f8e3e43927..0000000000
--- a/package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
+++ /dev/null
@@ -1,441 +0,0 @@
-From bb8b931385ba9df4e01f7dd3ce4575d49f60efdf Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Sun, 26 Jun 2022 13:04:43 +0200
-Subject: [PATCH] gh-90005: Port _ctypes to PY_STDLIB_MOD (GH-32229)
-
-Co-authored-by: Erlend Egeberg Aasland <erlend.aasland@innova.no>
-
-Automerge-Triggered-By: GH:tiran
-
-Upstream: https://github.com/python/cpython/commit/bb8b931385ba9df4e01f7dd3ce4575d49f60efdf
-
-[Bernd: backported to 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Makefile.pre.in                               |   9 +-
- ...2-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst |   1 +
- Modules/Setup.stdlib.in                       |   2 +-
- Modules/_ctypes/callproc.c                    |   3 +
- Modules/_ctypes/malloc_closure.c              |   3 +
- configure                                     | 540 +++++++++++++++++-
- configure.ac                                  | 125 +++-
- pyconfig.h.in                                 |   9 +
- setup.py                                      | 115 +---
- 9 files changed, 660 insertions(+), 147 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 102cd752c39cd..c0333cea48cd7 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -340,10 +340,6 @@ IO_OBJS=	\
- 		Modules/_io/bytesio.o \
- 		Modules/_io/stringio.o
- 
--##########################################################################
--
--LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
--
- ##########################################################################
- # Parser
- 
-@@ -2595,7 +2595,8 @@
- MODULE_PYEXPAT_DEPS=@LIBEXPAT_INTERNAL@
- MODULE_UNICODEDATA_DEPS=$(srcdir)/Modules/unicodedata_db.h $(srcdir)/Modules/unicodename_db.h
- MODULE__BLAKE2_DEPS=$(srcdir)/Modules/_blake2/impl/blake2-config.h $(srcdir)/Modules/_blake2/impl/blake2-impl.h $(srcdir)/Modules/_blake2/impl/blake2.h $(srcdir)/Modules/_blake2/impl/blake2b-load-sse2.h $(srcdir)/Modules/_blake2/impl/blake2b-load-sse41.h $(srcdir)/Modules/_blake2/impl/blake2b-ref.c $(srcdir)/Modules/_blake2/impl/blake2b-round.h $(srcdir)/Modules/_blake2/impl/blake2b.c $(srcdir)/Modules/_blake2/impl/blake2s-load-sse2.h $(srcdir)/Modules/_blake2/impl/blake2s-load-sse41.h $(srcdir)/Modules/_blake2/impl/blake2s-load-xop.h $(srcdir)/Modules/_blake2/impl/blake2s-ref.c $(srcdir)/Modules/_blake2/impl/blake2s-round.h $(srcdir)/Modules/_blake2/impl/blake2s.c $(srcdir)/Modules/_blake2/blake2module.h $(srcdir)/Modules/hashlib.h
--MODULE__CTYPES_DEPS=$(srcdir)/Modules/_ctypes/ctypes.h
-+MODULE__CTYPES_DEPS=$(srcdir)/Modules/_ctypes/ctypes.h $(srcdir)/Modules/_ctypes/darwin/dlfcn.h
-+MODULE__CTYPES_MALLOC_CLOSURE=@MODULE__CTYPES_MALLOC_CLOSURE@
- MODULE__DECIMAL_DEPS=$(srcdir)/Modules/_decimal/docstrings.h @LIBMPDEC_INTERNAL@
- MODULE__ELEMENTTREE_DEPS=$(srcdir)/Modules/pyexpat.c @LIBEXPAT_INTERNAL@
- MODULE__HASHLIB_DEPS=$(srcdir)/Modules/hashlib.h
-diff --git a/Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst b/Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst
-new file mode 100644
-index 0000000000000..ef6a881a4d094
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst
-@@ -0,0 +1 @@
-+:mod:`ctypes` dependency ``libffi`` is now detected with ``pkg-config``.
-diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
-index 2730030a15650..a199aefc51011 100644
---- a/Modules/Setup.stdlib.in
-+++ b/Modules/Setup.stdlib.in
-@@ -136,7 +136,7 @@
- #
- 
- # needs -lffi and -ldl
--#@MODULE__CTYPES_TRUE@_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c
-+@MODULE__CTYPES_TRUE@_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c @MODULE__CTYPES_MALLOC_CLOSURE@
- 
- # needs -lncurses, -lncursesw or -lcurses, sometimes -ltermcap
- #@MODULE__CURSES_TRUE@_curses _cursesmodule.c
-diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
-index 3fab9ad0c1e7b..fa1dfac6c7d94 100644
---- a/Modules/_ctypes/callproc.c
-+++ b/Modules/_ctypes/callproc.c
-@@ -54,6 +54,9 @@
- 
-  */
- 
-+#ifndef Py_BUILD_CORE_BUILTIN
-+#  define Py_BUILD_CORE_MODULE 1
-+#endif
- #define NEEDS_PY_IDENTIFIER
- 
- #include "Python.h"
-diff --git a/Modules/_ctypes/malloc_closure.c b/Modules/_ctypes/malloc_closure.c
-index 38edc90e70763..d47153f1d7f3e 100644
---- a/Modules/_ctypes/malloc_closure.c
-+++ b/Modules/_ctypes/malloc_closure.c
-@@ -1,3 +1,6 @@
-+#ifndef Py_BUILD_CORE_BUILTIN
-+#  define Py_BUILD_CORE_MODULE 1
-+#endif
- #include <Python.h>
- #include <ffi.h>
- #ifdef MS_WIN32
-diff --git a/configure.ac b/configure.ac
-index f9abd851ea5cb..6a8a0a963afa2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -49,6 +49,26 @@ AC_DEFUN([WITH_SAVE_ENV],
- [RESTORE_ENV]
- )dnl
- 
-+dnl PY_CHECK_FUNC(FUNCTION, [INCLUDES], [AC_DEFINE-VAR])
-+AC_DEFUN([PY_CHECK_FUNC],
-+[ AS_VAR_PUSHDEF([py_var], [ac_cv_func_$1])
-+  AS_VAR_PUSHDEF([py_define], m4_ifblank([$3], [[HAVE_]m4_toupper($1)], [$3]))
-+  AC_CACHE_CHECK(
-+    [for $1],
-+    [py_var],
-+    [AC_COMPILE_IFELSE(
-+      [AC_LANG_PROGRAM([$2], [void *x=$1])],
-+      [AS_VAR_SET([py_var], [yes])],
-+      [AS_VAR_SET([py_var], [no])])]
-+  )
-+  AS_VAR_IF(
-+    [py_var],
-+    [yes],
-+    [AC_DEFINE([py_define], [1], [Define if you have the '$1' function.])])
-+  AS_VAR_POPDEF([py_var])
-+  AS_VAR_POPDEF([py_define])
-+])
-+
- AC_SUBST(BASECPPFLAGS)
- if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
-     # If we're building out-of-tree, we need to make sure the following
-@@ -713,6 +733,21 @@ fi
- 
- if test "$ac_sys_system" = "Darwin"
- then
-+  dnl look for SDKROOT
-+  AC_CHECK_PROG([HAS_XCRUN], [xcrun], [yes], [missing])
-+  AC_MSG_CHECKING([macOS SDKROOT])
-+  if test -z "$SDKROOT"; then
-+    dnl SDKROOT not set
-+    if test "$HAS_XCRUN" = "yes"; then
-+      dnl detect with Xcode
-+      SDKROOT=$(xcrun --show-sdk-path)
-+    else
-+      dnl default to root
-+      SDKROOT="/"
-+    fi
-+  fi
-+  AC_MSG_RESULT([$SDKROOT])
-+
- 	# Compiler selection on MacOSX is more complicated than
- 	# AC_PROG_CC can handle, see Mac/README for more
- 	# information
-@@ -1101,7 +1136,7 @@ AC_DEFINE_UNQUOTED([PY_SUPPORT_TIER], [$PY_SUPPORT_TIER], [PEP 11 Support tier (
- 
- AC_CACHE_CHECK([for -Wl,--no-as-needed], [ac_cv_wl_no_as_needed], [
-   save_LDFLAGS="$LDFLAGS"
--  AS_VAR_APPEND([LDFLAGS], [-Wl,--no-as-needed])
-+  AS_VAR_APPEND([LDFLAGS], [" -Wl,--no-as-needed"])
-   AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
-     [NO_AS_NEEDED="-Wl,--no-as-needed"
-      ac_cv_wl_no_as_needed=yes],
-@@ -3564,12 +3599,60 @@ else
-     with_system_ffi="yes"
- fi
- 
--if test "$with_system_ffi" = "yes" && test -n "$PKG_CONFIG"; then
--    LIBFFI_INCLUDEDIR="`"$PKG_CONFIG" libffi --cflags-only-I 2>/dev/null | sed -e 's/^-I//;s/ *$//'`"
--else
--    LIBFFI_INCLUDEDIR=""
--fi
--AC_SUBST(LIBFFI_INCLUDEDIR)
-+dnl detect libffi
-+have_libffi=missing
-+AS_VAR_IF([with_system_ffi], [yes], [
-+  PKG_CHECK_MODULES([LIBFFI], [libffi], [have_libffi=yes], [
-+    AC_CHECK_HEADER([ffi.h], [
-+      WITH_SAVE_ENV([
-+        AC_CHECK_LIB([ffi], [ffi_call], [have_libffi=yes], [have_libffi=no])
-+      ])
-+    ])
-+  ])
-+], [
-+  AS_VAR_IF([ac_sys_system], [Darwin], [
-+    WITH_SAVE_ENV([
-+      CFLAGS="-I${SDKROOT}/usr/include/ffi $CFLAGS"
-+      AC_CHECK_HEADER([ffi.h], [
-+        AC_CHECK_LIB([ffi], [ffi_call], [
-+          dnl use ffi from SDK root
-+          have_libffi=yes
-+          LIBFFI_CFLAGS="-I${SDKROOT}/usr/include/ffi -DUSING_APPLE_OS_LIBFFI=1"
-+          LIBFFI_LIBS="-lffi"
-+        ], [have_libffi=no])
-+      ])
-+    ])
-+  ])
-+])
-+
-+AS_VAR_IF([have_libffi], [yes], [
-+  ctypes_malloc_closure=no
-+  AS_CASE([$ac_sys_system],
-+    [Darwin], [
-+      dnl when do we need USING_APPLE_OS_LIBFFI?
-+      AS_VAR_APPEND([LIBFFI_CFLAGS], [" -I\$(srcdir)/Modules/_ctypes/darwin -DMACOSX"])
-+      ctypes_malloc_closure=yes
-+    ],
-+    [sunos5], [AS_VAR_APPEND([LIBFFI_LIBS], [" -mimpure-text"])]
-+  )
-+  AS_VAR_IF([ctypes_malloc_closure], [yes], [
-+    MODULE__CTYPES_MALLOC_CLOSURE=_ctypes/malloc_closure.c
-+    AS_VAR_APPEND([LIBFFI_CFLAGS], [" -DUSING_MALLOC_CLOSURE_DOT_C=1"])
-+  ])
-+  AC_SUBST([MODULE__CTYPES_MALLOC_CLOSURE])
-+
-+  dnl HAVE_LIBDL: for dlopen, see gh-76828
-+  AS_VAR_IF([ac_cv_lib_dl_dlopen], [yes], [AS_VAR_APPEND([LIBFFI_LIBS], [" -ldl"])])
-+
-+  WITH_SAVE_ENV([
-+    CFLAGS="$LIBFFI_CFLAGS $CFLAGS"
-+    LDFLAGS="$LIBFFI_LIBS $LDFLAGS"
-+
-+    PY_CHECK_FUNC([ffi_prep_cif_var], [#include <ffi.h>])
-+    PY_CHECK_FUNC([ffi_prep_closure_loc], [#include <ffi.h>])
-+    PY_CHECK_FUNC([ffi_closure_alloc], [#include <ffi.h>])
-+  ])
-+])
- 
- # Check for use of the system libmpdec library
- AC_MSG_CHECKING(for --with-system-libmpdec)
-@@ -4526,26 +4609,6 @@ AC_CHECK_DECL(dirfd,
-       [#include <sys/types.h>
-        #include <dirent.h>])
- 
--dnl PY_CHECK_FUNC(FUNCTION, [INCLUDES], [AC_DEFINE-VAR])
--AC_DEFUN([PY_CHECK_FUNC],
--[ AS_VAR_PUSHDEF([py_var], [ac_cv_func_$1])
--  AS_VAR_PUSHDEF([py_define], m4_ifblank([$3], [[HAVE_]m4_toupper($1)], [$3]))
--  AC_CACHE_CHECK(
--    [for $1],
--    [py_var],
--    [AC_COMPILE_IFELSE(
--      [AC_LANG_PROGRAM([$2], [void *x=$1])],
--      [AS_VAR_SET([py_var], [yes])],
--      [AS_VAR_SET([py_var], [no])])]
--  )
--  AS_VAR_IF(
--    [py_var],
--    [yes],
--    [AC_DEFINE([py_define], [1], [Define if you have the '$1' function.])])
--  AS_VAR_POPDEF([py_var])
--  AS_VAR_POPDEF([py_define])
--])
--
- # For some functions, having a definition is not sufficient, since
- # we want to take their address.
- PY_CHECK_FUNC([chroot], [#include <unistd.h>])
-@@ -6868,7 +6931,9 @@ PY_STDLIB_MOD([_blake2],
- PY_STDLIB_MOD([_crypt],
-   [], [test "$ac_cv_crypt_crypt" = yes],
-   [$LIBCRYPT_CFLAGS], [$LIBCRYPT_LIBS])
--dnl PY_STDLIB_MOD([_ctypes], [], [], [], [])
-+PY_STDLIB_MOD([_ctypes],
-+  [], [test "$have_libffi" = yes],
-+  [$LIBFFI_CFLAGS], [$LIBFFI_LIBS])
- dnl PY_STDLIB_MOD([_curses], [], [], [], [])
- dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
- PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDFLAGS])
-@@ -6914,7 +6979,9 @@ PY_STDLIB_MOD([_testbuffer], [test "$TEST_MODULES" = yes])
- PY_STDLIB_MOD([_testimportmultiple], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_dlopen" = yes])
- PY_STDLIB_MOD([_testmultiphase], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_dlopen" = yes])
- PY_STDLIB_MOD([_xxtestfuzz], [test "$TEST_MODULES" = yes])
--PY_STDLIB_MOD([_ctypes_test], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_dlopen" = yes], [], [-lm])
-+PY_STDLIB_MOD([_ctypes_test],
-+  [test "$TEST_MODULES" = yes], [test "$have_libffi" = yes -a "$ac_cv_func_dlopen" = yes],
-+  [], [$LIBM])
- 
- dnl Limited API template modules.
- dnl The limited C API is not compatible with the Py_TRACE_REFS macro.
-diff --git a/pyconfig.h.in b/pyconfig.h.in
-index a09652ec15e53..15933e75b1b07 100644
---- a/pyconfig.h.in
-+++ b/pyconfig.h.in
-@@ -356,6 +356,15 @@
- /* Define to 1 if you have the `fexecve' function. */
- #undef HAVE_FEXECVE
- 
-+/* Define if you have the 'ffi_closure_alloc' function. */
-+#undef HAVE_FFI_CLOSURE_ALLOC
-+
-+/* Define if you have the 'ffi_prep_cif_var' function. */
-+#undef HAVE_FFI_PREP_CIF_VAR
-+
-+/* Define if you have the 'ffi_prep_closure_loc' function. */
-+#undef HAVE_FFI_PREP_CLOSURE_LOC
-+
- /* Define to 1 if you have the `flock' function. */
- #undef HAVE_FLOCK
- 
-diff --git a/setup.py b/setup.py
-index bba344c3af07c..af2800744091c 100644
---- a/setup.py
-+++ b/setup.py
-@@ -395,11 +395,6 @@ def remove_disabled(self):
-         # Remove modules that are present on the disabled list
-         extensions = [ext for ext in self.extensions
-                       if ext.name not in DISABLED_MODULE_LIST]
--        # move ctypes to the end, it depends on other modules
--        ext_map = dict((ext.name, i) for i, ext in enumerate(extensions))
--        if "_ctypes" in ext_map:
--            ctypes = extensions.pop(ext_map["_ctypes"])
--            extensions.append(ctypes)
-         self.extensions = extensions
- 
-     def update_sources_depends(self):
-@@ -600,12 +595,6 @@ def print_three_column(lst):
-             raise RuntimeError("Failed to build some stdlib modules")
- 
-     def build_extension(self, ext):
--
--        if ext.name == '_ctypes':
--            if not self.configure_ctypes(ext):
--                self.failed.append(ext.name)
--                return
--
-         try:
-             build_ext.build_extension(self, ext)
-         except (CCompilerError, DistutilsError) as why:
-@@ -1370,102 +1359,24 @@ def detect_modules(self):
-     def detect_tkinter(self):
-         self.addext(Extension('_tkinter', ['_tkinter.c', 'tkappinit.c']))
- 
--    def configure_ctypes(self, ext):
--        return True
--
-     def detect_ctypes(self):
-         # Thomas Heller's _ctypes module
-+        src = [
-+            '_ctypes/_ctypes.c',
-+            '_ctypes/callbacks.c',
-+            '_ctypes/callproc.c',
-+            '_ctypes/stgdict.c',
-+            '_ctypes/cfield.c',
-+        ]
-+        malloc_closure = sysconfig.get_config_var(
-+            "MODULE__CTYPES_MALLOC_CLOSURE"
-+        )
-+        if malloc_closure:
-+            src.append(malloc_closure)
- 
--        if (not sysconfig.get_config_var("LIBFFI_INCLUDEDIR") and MACOS):
--            self.use_system_libffi = True
--        else:
--            self.use_system_libffi = '--with-system-ffi' in sysconfig.get_config_var("CONFIG_ARGS")
--
--        include_dirs = []
--        extra_compile_args = []
--        extra_link_args = []
--        sources = ['_ctypes/_ctypes.c',
--                   '_ctypes/callbacks.c',
--                   '_ctypes/callproc.c',
--                   '_ctypes/stgdict.c',
--                   '_ctypes/cfield.c']
--
--        if MACOS:
--            sources.append('_ctypes/malloc_closure.c')
--            extra_compile_args.append('-DUSING_MALLOC_CLOSURE_DOT_C=1')
--            extra_compile_args.append('-DMACOSX')
--            include_dirs.append('_ctypes/darwin')
--
--        elif HOST_PLATFORM == 'sunos5':
--            # XXX This shouldn't be necessary; it appears that some
--            # of the assembler code is non-PIC (i.e. it has relocations
--            # when it shouldn't. The proper fix would be to rewrite
--            # the assembler code to be PIC.
--            # This only works with GCC; the Sun compiler likely refuses
--            # this option. If you want to compile ctypes with the Sun
--            # compiler, please research a proper solution, instead of
--            # finding some -z option for the Sun compiler.
--            extra_link_args.append('-mimpure-text')
--
--        ext = Extension('_ctypes',
--                        include_dirs=include_dirs,
--                        extra_compile_args=extra_compile_args,
--                        extra_link_args=extra_link_args,
--                        libraries=[],
--                        sources=sources)
--        self.add(ext)
--        # function my_sqrt() needs libm for sqrt()
-+        self.addext(Extension('_ctypes', src))
-         self.addext(Extension('_ctypes_test', ['_ctypes/_ctypes_test.c']))
- 
--        ffi_inc = sysconfig.get_config_var("LIBFFI_INCLUDEDIR")
--        ffi_lib = None
--
--        ffi_inc_dirs = self.inc_dirs.copy()
--        if MACOS:
--            ffi_in_sdk = os.path.join(macosx_sdk_root(), "usr/include/ffi")
--
--            if not ffi_inc:
--                if os.path.exists(ffi_in_sdk):
--                    ext.extra_compile_args.append("-DUSING_APPLE_OS_LIBFFI=1")
--                    ffi_inc = ffi_in_sdk
--                    ffi_lib = 'ffi'
--                else:
--                    # OS X 10.5 comes with libffi.dylib; the include files are
--                    # in /usr/include/ffi
--                    ffi_inc_dirs.append('/usr/include/ffi')
--
--        if not ffi_inc:
--            found = find_file('ffi.h', [], ffi_inc_dirs)
--            if found:
--                ffi_inc = found[0]
--        if ffi_inc:
--            ffi_h = ffi_inc + '/ffi.h'
--            if not os.path.exists(ffi_h):
--                ffi_inc = None
--                print('Header file {} does not exist'.format(ffi_h))
--        if ffi_lib is None and ffi_inc:
--            for lib_name in ('ffi', 'ffi_pic'):
--                if (self.compiler.find_library_file(self.lib_dirs, lib_name)):
--                    ffi_lib = lib_name
--                    break
--
--        if ffi_inc and ffi_lib:
--            ffi_headers = glob(os.path.join(ffi_inc, '*.h'))
--            if grep_headers_for('ffi_prep_cif_var', ffi_headers):
--                ext.extra_compile_args.append("-DHAVE_FFI_PREP_CIF_VAR=1")
--            if grep_headers_for('ffi_prep_closure_loc', ffi_headers):
--                ext.extra_compile_args.append("-DHAVE_FFI_PREP_CLOSURE_LOC=1")
--            if grep_headers_for('ffi_closure_alloc', ffi_headers):
--                ext.extra_compile_args.append("-DHAVE_FFI_CLOSURE_ALLOC=1")
--
--            ext.include_dirs.append(ffi_inc)
--            ext.libraries.append(ffi_lib)
--            self.use_system_libffi = True
--
--        if sysconfig.get_config_var('HAVE_LIBDL'):
--            # for dlopen, see bpo-32647
--            ext.libraries.append('dl')
--
-     def detect_decimal(self):
-         # Stefan Krah's _decimal module
-         self.addext(
---- Makefile.pre.in.orig	2023-08-07 20:50:54.600398448 +0200
-+++ Makefile.pre.in	2023-08-07 20:53:37.130317846 +0200
diff --git a/package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch b/package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
deleted file mode 100644
index 43a5eb07ef..0000000000
--- a/package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
+++ /dev/null
@@ -1,718 +0,0 @@
-From e925241d95d8095adf67f492042f97254ff82ec1 Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Wed, 6 Jul 2022 11:56:25 +0200
-Subject: [PATCH] gh-90005: Port readline and curses to PY_STDLIB_MOD
- (GH-94452)
-
-Co-authored-by: Erlend Egeberg Aasland <erlend.aasland@protonmail.com>
-
-Upstream: https://github.com/python/cpython/commit/e925241d95d8095adf67f492042f97254ff82ec1
-
-[Bernd: backported to 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- ...2-06-30-17-18-23.gh-issue-90005.EIOOla.rst |    5 +
- Modules/Setup.stdlib.in                       |   12 +-
- configure                                     | 1977 ++++++++++++++---
- configure.ac                                  |  388 +++-
- pyconfig.h.in                                 |   17 +-
- setup.py                                      |  146 +-
- 6 files changed, 2015 insertions(+), 530 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst
-
-diff --git a/Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst b/Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst
-new file mode 100644
-index 0000000000000..90a2dd486c195
---- /dev/null
-+++ b/Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst
-@@ -0,0 +1,5 @@
-+Dependencies of :mod:`readline` and :mod:`curses` module are now detected in
-+``configure`` script with ``pkg-config``. Only ``ncurses`` / ``ncursesw``
-+are detected automatically. The old ``curses`` library is not configured
-+automatically. Workaround for missing ``termcap`` or ``tinfo`` library
-+has been removed.
-diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
-index ad34f85e25451..7357aacd7267a 100644
---- a/Modules/Setup.stdlib.in
-+++ b/Modules/Setup.stdlib.in
-@@ -72,8 +72,8 @@
- # gdbm module needs -lgdbm
- @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c
- 
--# needs -lreadline or -leditline, sometimes termcap, termlib, or tinfo
--#@MODULE_READLINE_TRUE@readline readline.c
-+# needs -lreadline or -ledit, sometimes termcap, termlib, or tinfo
-+@MODULE_READLINE_TRUE@readline readline.c
- 
- # hashing builtins, can be disabled with --without-builtin-hashlib-hashes
- @MODULE__MD5_TRUE@_md5 md5module.c
-@@ -138,10 +138,10 @@
- # needs -lffi and -ldl
- @MODULE__CTYPES_TRUE@_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c @MODULE__CTYPES_MALLOC_CLOSURE@
- 
--# needs -lncurses, -lncursesw or -lcurses, sometimes -ltermcap
--#@MODULE__CURSES_TRUE@_curses _cursesmodule.c
--# needs -lncurses and -lpanel
--#@MODULE__CURSES_PANEL_TRUE@_curses_panel _curses_panel.c
-+# needs -lncurses[w], sometimes -ltermcap/tinfo
-+@MODULE__CURSES_TRUE@_curses _cursesmodule.c
-+# needs -lncurses[w] and -lpanel[w]
-+@MODULE__CURSES_PANEL_TRUE@_curses_panel _curses_panel.c
- 
- @MODULE__SQLITE3_TRUE@_sqlite3 _sqlite/blob.c _sqlite/connection.c _sqlite/cursor.c _sqlite/microprotocols.c _sqlite/module.c _sqlite/prepare_protocol.c _sqlite/row.c _sqlite/statement.c _sqlite/util.c
- 
-diff --git a/configure.ac b/configure.ac
-index b03ead3bdefa0..42e181bca9dac 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -5780,127 +5780,169 @@ then
-   [Define this if you have flockfile(), getc_unlocked(), and funlockfile()])
- fi
- 
--AC_ARG_WITH([readline],
--  [AS_HELP_STRING([--with(out)-readline@<:@=editline@:>@],
--    [use Editline for backend or disable readline module])],
--    [],
--    [with_readline=yes])
-+dnl Check for libreadline and libedit
-+dnl - libreadline provides "readline/readline.h" header and "libreadline"
-+dnl   shared library. pkg-config file is readline.pc
-+dnl - libedit provides "editline/readline.h" header and "libedit" shared
-+dnl   library. pkg-config file ins libedit.pc
-+dnl - editline is not supported ("readline.h" and "libeditline" shared library)
-+dnl
-+dnl NOTE: In the past we checked if readline needs an additional termcap
-+dnl library (tinfo ncursesw ncurses termcap). We now assume that libreadline
-+dnl or readline.pc provide correct linker information.
- 
--# check where readline lives
--py_cv_lib_readline=no
--# save the value of LIBS so we don't actually link Python with readline
--LIBS_no_readline=$LIBS
-+AH_TEMPLATE([WITH_EDITLINE], [Define to build the readline module against libedit.])
- 
--if test "$with_readline" != no; then
--  case "$with_readline" in
--  editline|edit)
--    LIBREADLINE=edit
--    AC_DEFINE(WITH_EDITLINE, 1,
--      [Define to build the readline module against Editline.])
--    ;;
--  yes|readline)
-+AC_ARG_WITH(
-+  [readline],
-+  [AS_HELP_STRING([--with(out)-readline@<:@=editline|readline|no@:>@],
-+                  [use libedit for backend or disable readline module])],
-+  [
-+    AS_CASE([$with_readline],
-+      [editline|edit], [with_readline=edit],
-+      [yes|readline], [with_readline=readline],
-+      [no], [],
-+      [AC_MSG_ERROR([proper usage is --with(out)-readline@<:@=editline|readline|no@:>@])]
-+    )
-+  ],
-+  [with_readline=readline]
-+)
-+
-+AS_VAR_IF([with_readline], [readline], [
-+  PKG_CHECK_MODULES([LIBREADLINE], [readline], [
-     LIBREADLINE=readline
--    ;;
--  *)
--    AC_MSG_ERROR([proper usage is --with(out)-readline@<:@=editline@:>@])
--    ;;
--  esac
-+    READLINE_CFLAGS=$LIBREADLINE_CFLAGS
-+    READLINE_LIBS=$LIBREADLINE_LIBS
-+  ], [
-+    AC_CHECK_HEADERS([readline/readline.h], [
-+      WITH_SAVE_ENV([
-+        AC_CHECK_LIB([readline], [readline], [
-+          LIBREADLINE=readline
-+          READLINE_CFLAGS=${LIBREADLINE_CFLAGS-""}
-+          READLINE_LIBS=${LIBREADLINE_LIBS-"-lreadline"}
-+        ], [
-+          with_readline=no
-+        ])
-+      ])
-+    ], [with_readline=no])
-+  ])
-+])
- 
--  # On some systems we need to link readline to a termcap compatible
--  # library.  NOTE: Keep the precedence of listed libraries synchronised
--  # with setup.py.
--  AC_MSG_CHECKING([how to link readline libs])
--  for py_libtermcap in "" tinfo ncursesw ncurses curses termcap; do
--    if test -z "$py_libtermcap"; then
--      READLINE_LIBS="-l$LIBREADLINE"
--    else
--      READLINE_LIBS="-l$LIBREADLINE -l$py_libtermcap"
--    fi
--    LIBS="$READLINE_LIBS $LIBS_no_readline"
--    AC_LINK_IFELSE(
--      [AC_LANG_CALL([],[readline])],
--      [py_cv_lib_readline=yes])
--    if test $py_cv_lib_readline = yes; then
--      break
--    fi
--  done
-+AS_VAR_IF([with_readline], [edit], [
-+  PKG_CHECK_MODULES([LIBEDIT], [libedit], [
-+    AC_DEFINE([WITH_EDITLINE], [1])
-+    LIBREADLINE=edit
-+    READLINE_CFLAGS=$LIBEDIT_CFLAGS
-+    READLINE_LIBS=$LIBEDIT_LIBS
-+  ], [
-+    AC_CHECK_HEADERS([editline/readline.h], [
-+      WITH_SAVE_ENV([
-+        AC_CHECK_LIB([edit], [readline], [
-+          LIBREADLINE=edit
-+          AC_DEFINE([WITH_EDITLINE], [1])
-+          READLINE_CFLAGS=${LIBEDIT_CFLAGS-""}
-+          READLINE_LIBS=${LIBEDIT_LIBS-"-ledit"}
-+        ], [
-+          with_readline=no
-+        ])
-+      ])
-+    ], [with_readline=no])
-+  ])
-+])
- 
--  # Uncomment this line if you want to use READLINE_LIBS in Makefile or scripts
--  #AC_SUBST([READLINE_LIBS])
--  if test $py_cv_lib_readline = no; then
--    AC_MSG_RESULT([none])
--  else
--    AC_MSG_RESULT([$READLINE_LIBS])
--    AC_DEFINE(HAVE_LIBREADLINE, 1,
--      [Define to build the readline module.])
--  fi
--fi
- 
--if test "$py_cv_lib_readline" = yes; then
--  # check for readline 2.2
--  AC_CHECK_DECL(rl_completion_append_character,
--    AC_DEFINE(HAVE_RL_COMPLETION_APPEND_CHARACTER, 1,
--      [Define if you have readline 2.2]),,
--    [
--#include <stdio.h> /* Must be first for Gnu Readline */
--#ifdef WITH_EDITLINE
--# include <editline/readline.h>
--#else
--# include <readline/readline.h>
--#endif
-+AC_MSG_CHECKING([how to link readline])
-+AS_VAR_IF([with_readline], [no], [
-+  AC_MSG_RESULT([no])
-+], [
-+  AC_MSG_RESULT([$with_readline (CFLAGS: $READLINE_CFLAGS, LIBS: $READLINE_LIBS)])
-+
-+  WITH_SAVE_ENV([
-+    CPPFLAGS="$READLINE_CFLAGS $CFLAGS"
-+    LIBS="$READLINE_LIBS $LIBS"
-+    LIBS_SAVE=$LIBS
-+
-+    m4_define([readline_includes], [
-+      #include <stdio.h> /* Must be first for Gnu Readline */
-+      #ifdef WITH_EDITLINE
-+      # include <editline/readline.h>
-+      #else
-+      # include <readline/readline.h>
-+      # include <readline/history.h>
-+      #endif
-     ])
--  AC_CHECK_DECL(rl_completion_suppress_append,
--    AC_DEFINE(HAVE_RL_COMPLETION_SUPPRESS_APPEND, 1,
--      [Define if you have rl_completion_suppress_append]),,
--    [
--#include <stdio.h> /* Must be first for Gnu Readline */
--#ifdef WITH_EDITLINE
--# include <editline/readline.h>
--#else
--# include <readline/readline.h>
--#endif
-+
-+    # check for readline 2.2
-+    AC_CHECK_DECL([rl_completion_append_character], [
-+      AC_DEFINE([HAVE_RL_COMPLETION_APPEND_CHARACTER], [1], [Define if you have readline 2.2])
-+    ], [], [readline_includes])
-+
-+    AC_CHECK_DECL([rl_completion_suppress_append], [
-+      AC_DEFINE([HAVE_RL_COMPLETION_SUPPRESS_APPEND], [1], [Define if you have rl_completion_suppress_append])
-+    ], [], [readline_includes])
-+
-+    # check for readline 4.0
-+    AC_CACHE_CHECK([for rl_pre_input_hook in -l$LIBREADLINE], [ac_cv_readline_rl_pre_input_hook], [
-+      AC_LINK_IFELSE(
-+        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_pre_input_hook])],
-+        [ac_cv_readline_rl_pre_input_hook=yes], [ac_cv_readline_rl_pre_input_hook=no]
-+      )
-+    ])
-+    AS_VAR_IF([ac_cv_readline_rl_pre_input_hook], [yes], [
-+      AC_DEFINE([HAVE_RL_PRE_INPUT_HOOK], [1], [Define if you have readline 4.0])
-     ])
- 
--  # check for readline 4.0
--  AC_CHECK_LIB($LIBREADLINE, rl_pre_input_hook,
--    AC_DEFINE(HAVE_RL_PRE_INPUT_HOOK, 1,
--      [Define if you have readline 4.0]),,$READLINE_LIBS)
--
--  # also in 4.0
--  AC_CHECK_LIB($LIBREADLINE, rl_completion_display_matches_hook,
--    AC_DEFINE(HAVE_RL_COMPLETION_DISPLAY_MATCHES_HOOK, 1,
--      [Define if you have readline 4.0]),,$READLINE_LIBS)
--
--  # also in 4.0, but not in editline
--  AC_CHECK_LIB($LIBREADLINE, rl_resize_terminal,
--    AC_DEFINE(HAVE_RL_RESIZE_TERMINAL, 1,
--      [Define if you have readline 4.0]),,$READLINE_LIBS)
--
--  # check for readline 4.2
--  AC_CHECK_LIB($LIBREADLINE, rl_completion_matches,
--    AC_DEFINE(HAVE_RL_COMPLETION_MATCHES, 1,
--      [Define if you have readline 4.2]),,$READLINE_LIBS)
--
--  # also in readline 4.2
--  AC_CHECK_DECL(rl_catch_signals,
--    AC_DEFINE(HAVE_RL_CATCH_SIGNAL, 1,
--      [Define if you can turn off readline's signal handling.]),,
--    [
--#include <stdio.h> /* Must be first for Gnu Readline */
--#ifdef WITH_EDITLINE
--# include <editline/readline.h>
--#else
--# include <readline/readline.h>
--#endif
-+    # also in 4.0
-+    AC_CACHE_CHECK([for rl_completion_display_matches_hook in -l$LIBREADLINE], [ac_cv_readline_rl_completion_display_matches_hook], [
-+      AC_LINK_IFELSE(
-+        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_completion_display_matches_hook])],
-+        [ac_cv_readline_rl_completion_display_matches_hook=yes], [ac_cv_readline_rl_completion_display_matches_hook=no]
-+      )
-+    ])
-+    AS_VAR_IF([ac_cv_readline_rl_completion_display_matches_hook], [yes], [
-+      AC_DEFINE([HAVE_RL_COMPLETION_DISPLAY_MATCHES_HOOK], [1], [Define if you have readline 4.0])
-     ])
- 
--  AC_CHECK_LIB($LIBREADLINE, append_history,
--    AC_DEFINE(HAVE_RL_APPEND_HISTORY, 1,
--      [Define if readline supports append_history]),,$READLINE_LIBS)
--fi
-+    # also in 4.0, but not in editline
-+      AC_CACHE_CHECK([for rl_resize_terminal in -l$LIBREADLINE], [ac_cv_readline_rl_resize_terminal], [
-+      AC_LINK_IFELSE(
-+        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_resize_terminal])],
-+        [ac_cv_readline_rl_resize_terminal=yes], [ac_cv_readline_rl_resize_terminal=no]
-+      )
-+    ])
-+    AS_VAR_IF([ac_cv_readline_rl_resize_terminal], [yes], [
-+      AC_DEFINE([HAVE_RL_RESIZE_TERMINAL], [1], [Define if you have readline 4.0])
-+    ])
- 
--# End of readline checks: restore LIBS
--LIBS=$LIBS_no_readline
-+    # check for readline 4.2
-+    AC_CACHE_CHECK([for rl_completion_matches in -l$LIBREADLINE], [ac_cv_readline_rl_completion_matches], [
-+      AC_LINK_IFELSE(
-+        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_completion_matches])],
-+        [ac_cv_readline_rl_completion_matches=yes], [ac_cv_readline_rl_completion_matches=no]
-+      )
-+    ])
-+    AS_VAR_IF([ac_cv_readline_rl_completion_matches], [yes], [
-+      AC_DEFINE([HAVE_RL_COMPLETION_MATCHES], [1], [Define if you have readline 4.2])
-+    ])
-+
-+    # also in readline 4.2
-+    AC_CHECK_DECL([rl_catch_signals], [
-+      AC_DEFINE([HAVE_RL_CATCH_SIGNAL], [1], [Define if you can turn off readline's signal handling.])
-+    ], [], [readline_includes])
-+
-+    AC_CACHE_CHECK([for append_history in -l$LIBREADLINE], [ac_cv_readline_append_history], [
-+      AC_LINK_IFELSE(
-+        [AC_LANG_PROGRAM([readline_includes], [void *x = append_history])],
-+        [ac_cv_readline_append_history=yes], [ac_cv_readline_append_history=no]
-+      )
-+    ])
-+    AS_VAR_IF([ac_cv_readline_append_history], [yes], [
-+      AC_DEFINE([HAVE_RL_APPEND_HISTORY], [1], [Define if readline supports append_history])
-+    ])
-+
-+    m4_undefine([readline_includes])
-+  ])dnl WITH_SAVE_ENV()
-+])
- 
- AC_CACHE_CHECK([for broken nice()], [ac_cv_broken_nice], [
- AC_RUN_IFELSE([AC_LANG_SOURCE([[
-@@ -6056,14 +6098,124 @@ then
-   [Define if you have struct stat.st_mtimensec])
- fi
- 
-+dnl check for ncurses/ncursesw and panel/panelw
-+dnl NOTE: old curses is not detected.
-+dnl have_curses=[no, ncursesw, ncurses]
-+dnl have_panel=[no, panelw, panel]
-+have_curses=no
-+have_panel=no
-+
-+AH_TEMPLATE([HAVE_NCURSESW], [Define to 1 if you have the `ncursesw' library.])
-+AC_CHECK_HEADERS([curses.h ncurses.h])
-+
-+AS_VAR_IF([ac_cv_header_ncurses_h], [yes], [
-+  if test "$ac_sys_system" != "Darwin"; then
-+    dnl On macOS, there is no separate /usr/lib/libncursesw nor libpanelw.
-+    PKG_CHECK_MODULES([CURSES], [ncursesw], [
-+      have_curses=ncursesw
-+    ], [
-+      WITH_SAVE_ENV([
-+        AC_CHECK_LIB([ncursesw], [initscr], [
-+          AC_DEFINE([HAVE_NCURSESW], [1])
-+          have_curses=ncursesw
-+          CURSES_CFLAGS=${CURSES_CFLAGS-""}
-+          CURSES_LIBS=${CURSES_LIBS-"-lncursesw"}
-+        ])
-+      ])
-+    ])
-+  fi
-+
-+  AS_VAR_IF([have_curses], [no], [
-+    PKG_CHECK_MODULES([CURSES], [ncurses], [
-+      have_curses=ncurses
-+    ], [
-+      WITH_SAVE_ENV([
-+        AC_CHECK_LIB([ncurses], [initscr], [
-+          have_curses=ncurses
-+          CURSES_CFLAGS=${CURSES_CFLAGS-""}
-+          CURSES_LIBS=${CURSES_LIBS-"-lncurses"}
-+        ])
-+      ])
-+    ])
-+  ])
-+
-+])dnl ac_cv_header_ncurses_h = yes
-+
-+dnl remove _XOPEN_SOURCE macro from curses cflags. pyconfig.h sets
-+dnl the macro to 700.
-+CURSES_CFLAGS=$(echo $CURSES_CFLAGS | sed 's/-D_XOPEN_SOURCE=600//')
-+
-+if test "$have_curses" = no -a "$ac_sys_system" = "Darwin"; then
-+  dnl On macOS, there is no separate /usr/lib/libncursesw nor libpanelw.
-+  dnl If we are here, we found a locally-supplied version of libncursesw.
-+  dnl There should also be a libpanelw.
-+  dnl _XOPEN_SOURCE defines are usually excluded for macOS, but we need
-+  dnl _XOPEN_SOURCE_EXTENDED here for ncurses wide char support.
-+
-+  AS_VAR_APPEND([CURSES_CFLAGS], [" -D_XOPEN_SOURCE_EXTENDED=1"])
-+  AC_DEFINE([HAVE_NCURSESW], [1])
-+fi
-+
-+dnl TODO: detect "curses" and special cases tinfo, terminfo, or termcap
-+
-+AC_MSG_CHECKING([curses module flags])
-+AS_VAR_IF([have_curses], [no], [
-+  AC_MSG_RESULT([no])  
-+], [
-+  AC_MSG_RESULT([$have_curses (CFLAGS: $CURSES_CFLAGS, LIBS: $CURSES_LIBS)])
-+])
-+
-+dnl check for ncurses' panel/panelw library
-+AC_CHECK_HEADERS([panel.h])
-+
-+AS_VAR_IF([ac_cv_header_panel_h], [yes], [
-+
-+  if test "$ac_sys_system" != "Darwin"; then
-+    dnl On macOS, there is no separate /usr/lib/libncursesw nor libpanelw.
-+    AS_VAR_IF([have_curses], [ncursesw], [
-+      PKG_CHECK_MODULES([PANEL], [panelw], [
-+        have_panel=panelw
-+      ], [
-+        WITH_SAVE_ENV([
-+          AC_CHECK_LIB([panelw], [update_panels], [
-+            have_panel=panelw
-+            PANEL_CFLAGS=${PANEL_CFLAGS-""}
-+            PANEL_LIBS=${PANEL_LIBS-"-lpanelw"}
-+          ])
-+        ])
-+      ])
-+    ])
-+  fi
-+
-+  AS_VAR_IF([have_curses], [ncurses], [
-+    PKG_CHECK_MODULES([PANEL], [panel], [
-+      have_panel=panel
-+    ], [
-+      WITH_SAVE_ENV([
-+        AC_CHECK_LIB([panel], [update_panels], [
-+          have_panel=panel
-+          PANEL_CFLAGS=${PANEL_CFLAGS-""}
-+          PANEL_LIBS=${PANEL_LIBS-"-lpanel"}
-+        ])
-+      ])
-+    ])
-+  ])
-+
-+])dnl ac_cv_header_panel_h = yes
-+
-+AC_MSG_CHECKING([panel flags])
-+AS_VAR_IF([have_panel], [no], [
-+  AC_MSG_RESULT([no])  
-+], [
-+  AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
-+])
-+
- # first curses header check
- ac_save_cppflags="$CPPFLAGS"
- if test "$cross_compiling" = no; then
-   CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
- fi
- 
--AC_CHECK_HEADERS(curses.h ncurses.h)
--
- # On Solaris, term.h requires curses.h
- AC_CHECK_HEADERS(term.h,,,[
- #ifdef HAVE_CURSES_H
-@@ -6985,8 +7137,14 @@ PY_STDLIB_MOD([_crypt],
- PY_STDLIB_MOD([_ctypes],
-   [], [test "$have_libffi" = yes],
-   [$LIBFFI_CFLAGS], [$LIBFFI_LIBS])
--dnl PY_STDLIB_MOD([_curses], [], [], [], [])
--dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
-+PY_STDLIB_MOD([_curses],
-+  [], [test "$have_curses" != "no"],
-+  [$CURSES_CFLAGS], [$CURSES_LIBS]
-+)
-+PY_STDLIB_MOD([_curses_panel],
-+  [], [test "$have_panel" != "no"],
-+  [$PANEL_CFLAGS $CURSES_CFLAGS], [$PANEL_LIBS $CURSES_LIBS]
-+)
- PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDFLAGS])
- PY_STDLIB_MOD([_dbm],
-   [test -n "$with_dbmliborder"], [test "$have_dbm" != "no"],
-@@ -6997,7 +7155,9 @@ PY_STDLIB_MOD([_gdbm],
- PY_STDLIB_MOD([nis],
-   [], [test "$have_nis" = yes -a "$ac_cv_header_rpc_rpc_h" = yes],
-   [$LIBNSL_CFLAGS], [$LIBNSL_LIBS])
--dnl PY_STDLIB_MOD([readline], [], [], [], [])
-+ PY_STDLIB_MOD([readline],
-+  [], [test "$with_readline" != "no"],
-+  [$READLINE_CFLAGS], [$READLINE_LIBS])
- PY_STDLIB_MOD([_sqlite3],
-   [test "$have_sqlite3" = "yes"],
-   [test "$have_supported_sqlite3" = "yes"],
-diff --git a/pyconfig.h.in b/pyconfig.h.in
-index b05ddd41c2bba..aa9fc559fa251 100644
---- a/pyconfig.h.in
-+++ b/pyconfig.h.in
-@@ -290,6 +290,9 @@
- /* Defined when any dynamic module loading is enabled. */
- #undef HAVE_DYNAMIC_LOADING
- 
-+/* Define to 1 if you have the <editline/readline.h> header file. */
-+#undef HAVE_EDITLINE_READLINE_H
-+
- /* Define to 1 if you have the <endian.h> header file. */
- #undef HAVE_ENDIAN_H
- 
-@@ -646,9 +649,6 @@
- /* Define to 1 if you have the <libintl.h> header file. */
- #undef HAVE_LIBINTL_H
- 
--/* Define to build the readline module. */
--#undef HAVE_LIBREADLINE
--
- /* Define to 1 if you have the `resolv' library (-lresolv). */
- #undef HAVE_LIBRESOLV
- 
-@@ -784,6 +784,9 @@
- /* Define to 1 if you have the `nanosleep' function. */
- #undef HAVE_NANOSLEEP
- 
-+/* Define to 1 if you have the `ncursesw' library. */
-+#undef HAVE_NCURSESW
-+
- /* Define to 1 if you have the <ncurses.h> header file. */
- #undef HAVE_NCURSES_H
- 
-@@ -821,6 +824,9 @@
- /* Define to 1 if you have the `openpty' function. */
- #undef HAVE_OPENPTY
- 
-+/* Define to 1 if you have the <panel.h> header file. */
-+#undef HAVE_PANEL_H
-+
- /* Define to 1 if you have the `pathconf' function. */
- #undef HAVE_PATHCONF
- 
-@@ -905,6 +911,9 @@
- /* Define to 1 if you have the `pwritev2' function. */
- #undef HAVE_PWRITEV2
- 
-+/* Define to 1 if you have the <readline/readline.h> header file. */
-+#undef HAVE_READLINE_READLINE_H
-+
- /* Define to 1 if you have the `readlink' function. */
- #undef HAVE_READLINK
- 
-@@ -1662,7 +1671,7 @@
-    Dyld is necessary to support frameworks. */
- #undef WITH_DYLD
- 
--/* Define to build the readline module against Editline. */
-+/* Define to build the readline module against libedit. */
- #undef WITH_EDITLINE
- 
- /* Define if you want to compile in object freelists optimization */
-diff --git a/setup.py b/setup.py
-index cc11dedee1b2e..2edcb08b4fd7f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1027,146 +1027,9 @@
-         ))
- 
-     def detect_readline_curses(self):
--        # readline
--        readline_termcap_library = ""
--        curses_library = ""
--        # Cannot use os.popen here in py3k.
--        tmpfile = os.path.join(self.build_temp, 'readline_termcap_lib')
--        if not os.path.exists(self.build_temp):
--            os.makedirs(self.build_temp)
--        # Determine if readline is already linked against curses or tinfo.
--        if sysconfig.get_config_var('HAVE_LIBREADLINE'):
--            if sysconfig.get_config_var('WITH_EDITLINE'):
--                readline_lib = 'edit'
--            else:
--                readline_lib = 'readline'
--            do_readline = self.compiler.find_library_file(self.lib_dirs,
--                readline_lib)
--            if CROSS_COMPILING:
--                ret = run_command("%s -d %s | grep '(NEEDED)' > %s"
--                                % (sysconfig.get_config_var('READELF'),
--                                   do_readline, tmpfile))
--            elif find_executable('ldd'):
--                ret = run_command("ldd %s > %s" % (do_readline, tmpfile))
--            else:
--                ret = 1
--            if ret == 0:
--                with open(tmpfile) as fp:
--                    for ln in fp:
--                        if 'curses' in ln:
--                            readline_termcap_library = re.sub(
--                                r'.*lib(n?cursesw?)\.so.*', r'\1', ln
--                            ).rstrip()
--                            break
--                        # termcap interface split out from ncurses
--                        if 'tinfo' in ln:
--                            readline_termcap_library = 'tinfo'
--                            break
--            if os.path.exists(tmpfile):
--                os.unlink(tmpfile)
--        else:
--            do_readline = False
--        # Issue 7384: If readline is already linked against curses,
--        # use the same library for the readline and curses modules.
--        if 'curses' in readline_termcap_library:
--            curses_library = readline_termcap_library
--        elif self.compiler.find_library_file(self.lib_dirs, 'ncursesw'):
--            curses_library = 'ncursesw'
--        # Issue 36210: OSS provided ncurses does not link on AIX
--        # Use IBM supplied 'curses' for successful build of _curses
--        elif AIX and self.compiler.find_library_file(self.lib_dirs, 'curses'):
--            curses_library = 'curses'
--        elif self.compiler.find_library_file(self.lib_dirs, 'ncurses'):
--            curses_library = 'ncurses'
--        elif self.compiler.find_library_file(self.lib_dirs, 'curses'):
--            curses_library = 'curses'
--
--        if MACOS:
--            os_release = int(os.uname()[2].split('.')[0])
--            dep_target = sysconfig.get_config_var('MACOSX_DEPLOYMENT_TARGET')
--            if (dep_target and
--                    (tuple(int(n) for n in dep_target.split('.')[0:2])
--                        < (10, 5) ) ):
--                os_release = 8
--            if os_release < 9:
--                # MacOSX 10.4 has a broken readline. Don't try to build
--                # the readline module unless the user has installed a fixed
--                # readline package
--                if find_file('readline/rlconf.h', self.inc_dirs, []) is None:
--                    do_readline = False
--        if do_readline:
--            readline_libs = [readline_lib]
--            if readline_termcap_library:
--                pass # Issue 7384: Already linked against curses or tinfo.
--            elif curses_library:
--                readline_libs.append(curses_library)
--            elif self.compiler.find_library_file(self.lib_dirs, 'termcap'):
--                readline_libs.append('termcap')
--            self.add(Extension('readline', ['readline.c'],
--                               libraries=readline_libs))
--        else:
--            self.missing.append('readline')
--
--        # Curses support, requiring the System V version of curses, often
--        # provided by the ncurses library.
--        curses_defines = []
--        curses_includes = []
--        panel_library = 'panel'
--        if curses_library == 'ncursesw':
--            curses_defines.append(('HAVE_NCURSESW', '1'))
--            if not CROSS_COMPILING:
--                curses_includes.append('/usr/include/ncursesw')
--            # Bug 1464056: If _curses.so links with ncursesw,
--            # _curses_panel.so must link with panelw.
--            panel_library = 'panelw'
--            if MACOS:
--                # On OS X, there is no separate /usr/lib/libncursesw nor
--                # libpanelw.  If we are here, we found a locally-supplied
--                # version of libncursesw.  There should also be a
--                # libpanelw.  _XOPEN_SOURCE defines are usually excluded
--                # for OS X but we need _XOPEN_SOURCE_EXTENDED here for
--                # ncurses wide char support
--                curses_defines.append(('_XOPEN_SOURCE_EXTENDED', '1'))
--        elif MACOS and curses_library == 'ncurses':
--            # Building with the system-suppied combined libncurses/libpanel
--            curses_defines.append(('HAVE_NCURSESW', '1'))
--            curses_defines.append(('_XOPEN_SOURCE_EXTENDED', '1'))
--
--        curses_enabled = True
--        if curses_library.startswith('ncurses'):
--            curses_libs = [curses_library]
--            self.add(Extension('_curses', ['_cursesmodule.c'],
--                               include_dirs=curses_includes,
--                               define_macros=curses_defines,
--                               libraries=curses_libs))
--        elif curses_library == 'curses' and not MACOS:
--                # OSX has an old Berkeley curses, not good enough for
--                # the _curses module.
--            if (self.compiler.find_library_file(self.lib_dirs, 'terminfo')):
--                curses_libs = ['curses', 'terminfo']
--            elif (self.compiler.find_library_file(self.lib_dirs, 'termcap')):
--                curses_libs = ['curses', 'termcap']
--            else:
--                curses_libs = ['curses']
--
--            self.add(Extension('_curses', ['_cursesmodule.c'],
--                               define_macros=curses_defines,
--                               libraries=curses_libs))
--        else:
--            curses_enabled = False
--            self.missing.append('_curses')
--
--        # If the curses module is enabled, check for the panel module
--        # _curses_panel needs some form of ncurses
--        skip_curses_panel = True if AIX else False
--        if (curses_enabled and not skip_curses_panel and
--                self.compiler.find_library_file(self.lib_dirs, panel_library)):
--            self.add(Extension('_curses_panel', ['_curses_panel.c'],
--                           include_dirs=curses_includes,
--                           define_macros=curses_defines,
--                           libraries=[panel_library, *curses_libs]))
--        elif not skip_curses_panel:
--            self.missing.append('_curses_panel')
-+        self.addext(Extension('readline', ['readline.c']))
-+        self.addext(Extension('_curses', ['_cursesmodule.c']))
-+        self.addext(Extension('_curses_panel', ['_curses_panel.c']))
- 
-     def detect_crypt(self):
-         self.addext(Extension('_crypt', ['_cryptmodule.c']))
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 39a16c1f71..debdedd413 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3116/
-md5  d0c5a1a31efe879723e51addf56dd206  Python-3.11.6.tar.xz
+# From https://www.python.org/downloads/release/python-3120/
+md5  f6f4616584b23254d165f4db90c247d6  Python-3.12.0.tar.xz
 # Locally computed
-sha256  0fab78fa7f133f4f38210c6260d90d7c0d5c7198446419ce057ec7ac2e6f5f38  Python-3.11.6.tar.xz
+sha256  795c34f44df45a0e9b9710c8c71c15c671871524cd412ca14def212e8ccb155d  Python-3.12.0.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 04105289d6..3df8f8c87a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION_MAJOR = 3.12
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.41.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

