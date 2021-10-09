Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F10C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:59:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C403A60F5A
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C403A60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D8586069A;
	Sat,  9 Oct 2021 20:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6ST4LRlAQFx; Sat,  9 Oct 2021 20:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59244607D5;
	Sat,  9 Oct 2021 20:59:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89AEE1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B9E405F7
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytYWoVYovPgg for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED59E40012
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:49 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s11so6769288pgr.11
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoM7rJHJXJRmiWQe9ZwkAHQfe4kEI9tNtbLOwfBbUjE=;
 b=fV0akWBxI/4bi8bdr2zirhEhizrtZFYhDlw4B78OXcp4AWEvGNFtf7s7LCvmf0RnA8
 vEDKd5/ymY3WfGzT26AwaMY+bID/r9ONhRF3tbsg5EY5oldRpYk0wlKJHYnpRBCh9Psm
 ZmlG4QS7N/MXGzbmsGYUhmmiND/atRbFVuNKWf1AEX3/qMmSLUuP1nPhwXj8kkX6ERC/
 +VuY/m8cNdi93mBZ/JtTFyRk9EylcUJIHONcHGAFR//Z/+GFk7xyBoSN00Crv2lolbDq
 m0WQBSc38Y8HHgsJKCQwggJMrTOtmOO+uvk9bI6+4QaCM9QnD6m111dvbuptDUuzTcOt
 UwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoM7rJHJXJRmiWQe9ZwkAHQfe4kEI9tNtbLOwfBbUjE=;
 b=GxHy0/ki+J7LXENZAjdUdn2pt0LpPmrzMuW3qV0Y6qbiy4uAKgyOwA0dc+zHJ7lrlS
 kYlH6C0cdWb6pMtGoMK+DY357Yw3Wcc+6nFiNVh3X9z0Hi92+fm1sMXJk+25OzD1QgFa
 p2nFLiIhwpEUTKMVgv++f6lZ8svndUX6pnE1Qzp2Lt8MadbfSWQhXmb8riaCV3zHQxLK
 uzgGRUUl7JVpwuEdTuYnV+zxUvSijK7TdJXOyovOlTnobXDxqGrUrFfqnY5CJd2YrG+u
 7gC/L62+EUNipmzkQlk8/f/u0c3pylapasPGknrmAitfjJNWssTx1bwpQ1NMHIVYV/h3
 GSxw==
X-Gm-Message-State: AOAM532D7r5zKFiTh6Il0IG8ieNbvekY0IB2BJMZVUWvg8yGJD++rBSc
 2uM6KImnVdfdLAMpmQwqB9CzzXgZZwc8Yg==
X-Google-Smtp-Source: ABdhPJwvoFipfL6zAjPipq/cEp8YCBVLvL6kB28YOPjB9yKhVZgdFFJoQAKPkNmr4KbwJ969hfoomA==
X-Received: by 2002:a62:5804:0:b0:44b:b75b:ec8f with SMTP id
 m4-20020a625804000000b0044bb75bec8fmr17238528pfb.63.1633812948208; 
 Sat, 09 Oct 2021 13:55:48 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:47 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:23 -0700
Message-Id: <20211009205523.3137859-21-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 20/20] package/python3: bump to version 3.10
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Remove 0013-Add-an-option-to-disable-installation-of-test-module.patch as
  it is now upstreamed.

- Refactor and rename all other patches as necessary.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...e-the-build-of-pyc-files-conditional.patch |   6 +-
 ...taddrinfo-configure-test-when-cross-.patch |   2 +-
 ...re-to-disable-the-build-of-certain-e.patch |  16 +--
 ...y-header-paths-for-cross-compilation.patch |  52 ++++----
 ...ook-in-usr-lib-termcap-for-libraries.patch |   4 +-
 .../0006-Don-t-add-multiarch-paths.patch      |   2 +-
 .../0007-Abort-on-failed-module-build.patch   |   2 +-
 ...locale-and-set-to-default-when-addin.patch |   2 +-
 ...Add-importlib-fix-for-PEP-3147-issue.patch |   6 +-
 ...-disable-installation-of-test-module.patch | 117 ------------------
 ...0013-Add-an-option-to-disable-pydoc.patch} |  49 ++++----
 ...14-Add-an-option-to-disable-lib2to3.patch} |  83 +++++++------
 ...ption-to-disable-the-sqlite3-module.patch} |  46 +++----
 ...-an-option-to-disable-the-tk-module.patch} |  61 ++++-----
 ...option-to-disable-the-curses-module.patch} |  37 +++---
 ...0018-Add-an-option-to-disable-expat.patch} |  43 +++----
 ...Add-an-option-to-disable-CJK-codecs.patch} |   2 +-
 ...> 0020-Add-an-option-to-disable-NIS.patch} |   2 +-
 ...dd-an-option-to-disable-unicodedata.patch} |   2 +-
 ... 0022-Add-an-option-to-disable-IDLE.patch} |  51 ++++----
 ...23-Add-an-option-to-disable-decimal.patch} |   6 +-
 ...n-to-disable-the-ossaudiodev-module.patch} |   2 +-
 ...n-option-to-disable-openssl-support.patch} |   6 +-
 ...tion-to-disable-the-readline-module.patch} |   6 +-
 ...o-disable-zlib-bzip2-and-xz-modules.patch} |   6 +-
 ...hon-config.sh-don-t-reassign-prefix.patch} |   4 +-
 ...Fix-cross-compiling-the-uuid-module.patch} |   2 +-
 ...dd-an-option-to-disable-uuid-module.patch} |   6 +-
 ...fix-building-on-older-distributions.patch} |   0
 ...p-CC-print-multiarch-output-for-mus.patch} |   2 +-
 ...on-to-disable-the-berkeleydb-module.patch} |   6 +-
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 ...eration-error-in-_ExecutorManagerTh.patch} |   0
 package/python3/python3.hash                  |   8 +-
 package/python3/python3.mk                    |   4 +-
 35 files changed, 270 insertions(+), 373 deletions(-)
 delete mode 100644 package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
 rename package/python3/{0014-Add-an-option-to-disable-pydoc.patch => 0013-Add-an-option-to-disable-pydoc.patch} (74%)
 rename package/python3/{0015-Add-an-option-to-disable-lib2to3.patch => 0014-Add-an-option-to-disable-lib2to3.patch} (67%)
 rename package/python3/{0016-Add-option-to-disable-the-sqlite3-module.patch => 0015-Add-option-to-disable-the-sqlite3-module.patch} (63%)
 rename package/python3/{0017-Add-an-option-to-disable-the-tk-module.patch => 0016-Add-an-option-to-disable-the-tk-module.patch} (52%)
 rename package/python3/{0018-Add-an-option-to-disable-the-curses-module.patch => 0017-Add-an-option-to-disable-the-curses-module.patch} (64%)
 rename package/python3/{0019-Add-an-option-to-disable-expat.patch => 0018-Add-an-option-to-disable-expat.patch} (76%)
 rename package/python3/{0020-Add-an-option-to-disable-CJK-codecs.patch => 0019-Add-an-option-to-disable-CJK-codecs.patch} (94%)
 rename package/python3/{0021-Add-an-option-to-disable-NIS.patch => 0020-Add-an-option-to-disable-NIS.patch} (95%)
 rename package/python3/{0022-Add-an-option-to-disable-unicodedata.patch => 0021-Add-an-option-to-disable-unicodedata.patch} (95%)
 rename package/python3/{0023-Add-an-option-to-disable-IDLE.patch => 0022-Add-an-option-to-disable-IDLE.patch} (69%)
 rename package/python3/{0024-Add-an-option-to-disable-decimal.patch => 0023-Add-an-option-to-disable-decimal.patch} (95%)
 rename package/python3/{0025-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0024-Add-an-option-to-disable-the-ossaudiodev-module.patch} (97%)
 rename package/python3/{0026-Add-an-option-to-disable-openssl-support.patch => 0025-Add-an-option-to-disable-openssl-support.patch} (89%)
 rename package/python3/{0027-Add-an-option-to-disable-the-readline-module.patch => 0026-Add-an-option-to-disable-the-readline-module.patch} (90%)
 rename package/python3/{0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (92%)
 rename package/python3/{0029-python-config.sh-don-t-reassign-prefix.patch => 0028-python-config.sh-don-t-reassign-prefix.patch} (97%)
 rename package/python3/{0030-Fix-cross-compiling-the-uuid-module.patch => 0029-Fix-cross-compiling-the-uuid-module.patch} (96%)
 rename package/python3/{0031-Add-an-option-to-disable-uuid-module.patch => 0030-Add-an-option-to-disable-uuid-module.patch} (88%)
 rename package/python3/{0032-fix-building-on-older-distributions.patch => 0031-fix-building-on-older-distributions.patch} (100%)
 rename package/python3/{0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (98%)
 rename package/python3/{0034-Add-an-option-to-disable-the-berkeleydb-module.patch => 0033-Add-an-option-to-disable-the-berkeleydb-module.patch} (88%)
 rename package/python3/{0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 rename package/python3/{0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch => 0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch} (100%)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 44902725d7..a661ef6435 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 77f91e72b1..0c809f3d8a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1550,6 +1550,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1601,6 +1601,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 77f91e72b1..0c809f3d8a 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -1577,6 +1578,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1628,6 +1629,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -38,7 +38,7 @@ diff --git a/configure.ac b/configure.ac
 index d60f05251a..1ee5a09588 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1121,6 +1121,12 @@ fi
+@@ -1108,6 +1108,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 00177814cc..e2e5970237 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
 index 1ee5a09588..c2445edc88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4210,7 +4210,7 @@ fi
+@@ -4208,7 +4208,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 7cccc588e9..12dd85d80e 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -47,7 +47,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 0c809f3d8a..7c3dde8dd4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -216,6 +216,8 @@ FILEMODE=	644
+@@ -219,6 +219,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index 0c809f3d8a..7c3dde8dd4 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -632,6 +634,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -629,6 +631,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index 0c809f3d8a..7c3dde8dd4 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1696,7 +1699,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1749,7 +1752,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -78,7 +78,7 @@ diff --git a/configure.ac b/configure.ac
 index c2445edc88..73d66167de 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3081,6 +3081,8 @@ LIBS="$withval $LIBS"
+@@ -3069,6 +3069,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -91,8 +91,8 @@ diff --git a/setup.py b/setup.py
 index 770866bca7..b6c829b3a5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -44,7 +44,10 @@ from distutils.spawn import find_executable
- TEST_EXTENSIONS = True
+@@ -58,7 +58,10 @@ with warnings.catch_warnings():
+ TEST_EXTENSIONS = (sysconfig.get_config_var('TEST_MODULES') == 'yes')
  
  # This global variable is used to hold the list of modules to be disabled.
 -DISABLED_MODULE_LIST = []
@@ -101,8 +101,8 @@ index 770866bca7..b6c829b3a5 100644
 +except KeyError:
 +    DISABLED_MODULE_LIST = list()
  
- 
- def get_platform():
+ # --list-module-names option used by Tools/scripts/generate_module_names.py
+ LIST_MODULE_NAMES = False
 -- 
 2.25.1
 
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 24f369f87f..0311348405 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -15,13 +15,15 @@ values, and get correct header/library paths when cross-compiling
 third-party Python modules.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 3.10.0
 ---
  Lib/distutils/command/build_ext.py |  5 ++++-
- Lib/distutils/sysconfig.py         | 15 +++++++++++----
+ Lib/sysconfig.py                   | 15 +++++++++++----
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index 1a9bd1200f..3cf7d6746e 100644
+index 1a9bd12..3cf7d67 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
 @@ -234,7 +234,10 @@ class build_ext(Command):
@@ -36,32 +38,32 @@ index 1a9bd1200f..3cf7d6746e 100644
              else:
                  # building python standard extensions
                  self.library_dirs.append('.')
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 37feae5df7..e9c3a27856 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -17,10 +17,17 @@ import sys
- from .errors import DistutilsPlatformError
- 
- # These are needed in a couple of spots, so just compute them once.
--PREFIX = os.path.normpath(sys.prefix)
--EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
--BASE_PREFIX = os.path.normpath(sys.base_prefix)
--BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index 95b48f6..9fb1956 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -123,10 +123,17 @@ _SCHEME_KEYS = ('stdlib', 'platstdlib', 'purelib', 'platlib', 'include',
+ _PY_VERSION = sys.version.split()[0]
+ _PY_VERSION_SHORT = f'{sys.version_info[0]}.{sys.version_info[1]}'
+ _PY_VERSION_SHORT_NO_DOT = f'{sys.version_info[0]}{sys.version_info[1]}'
+-_PREFIX = os.path.normpath(sys.prefix)
+-_BASE_PREFIX = os.path.normpath(sys.base_prefix)
+-_EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
+-_BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
 +if "_python_sysroot" in os.environ:
 +    _sysroot=os.environ.get('_python_sysroot')
-+    PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
-+    EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
-+    BASE_PREFIX = PREFIX
-+    BASE_EXEC_PREFIX = EXEC_PREFIX
++    _PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
++    _EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
++    _BASE_PREFIX = _PREFIX
++    _BASE_EXEC_PREFIX = _EXEC_PREFIX
 +else:
-+    PREFIX = os.path.normpath(sys.prefix)
-+    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+    BASE_PREFIX = os.path.normpath(sys.base_prefix)
-+    BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
++    _PREFIX = os.path.normpath(sys.prefix)
++    _EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++    _BASE_PREFIX = os.path.normpath(sys.base_prefix)
++    _BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
+ _CONFIG_VARS = None
+ _USER_BASE = None
  
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCbuild/win32 or project/PCbuild/amd64.
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index c5abcfd786..3134923d28 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index b6c829b3a5..ec3ba60607 100644
+index 66d372a..e632b6f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1041,12 +1041,9 @@ class PyBuildExt(build_ext):
+@@ -1133,12 +1133,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index bb861612b1..a770b022b1 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -20,7 +20,7 @@ diff --git a/setup.py b/setup.py
 index ec3ba60607..e27620035c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -734,10 +734,10 @@ class PyBuildExt(build_ext):
+@@ -816,10 +816,10 @@ class PyBuildExt(build_ext):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 856fcaac21..4a688c9748 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -17,7 +17,7 @@ diff --git a/setup.py b/setup.py
 index e27620035c..d3f0e663f2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -524,6 +524,7 @@ class PyBuildExt(build_ext):
+@@ -556,6 +556,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 8b0d4f4c4d..d34870784d 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -25,7 +25,7 @@ diff --git a/setup.py b/setup.py
 index d3f0e663f2..926c16f58f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -680,7 +680,7 @@ class PyBuildExt(build_ext):
+@@ -759,7 +759,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'ccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index 7a885303cb..b18f94ab4e 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -28,7 +28,7 @@ diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_ext
 index 25a3f8c0e0..2cb9a9aa52 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
-@@ -373,8 +373,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -392,8 +392,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      a True value is the same as setting 'optimization' to the empty string
      while a False value is equivalent to setting 'optimization' to '1'.
  
@@ -37,7 +37,7 @@ index 25a3f8c0e0..2cb9a9aa52 100644
      """
      if debug_override is not None:
          _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -386,10 +384,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -405,10 +403,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      path = _os.fspath(path)
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
@@ -49,7 +49,7 @@ index 25a3f8c0e0..2cb9a9aa52 100644
      if optimization is None:
          if sys.flags.optimize == 0:
              optimization = ''
-@@ -426,46 +421,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -445,46 +440,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
              head.lstrip(path_separators),
              filename,
          )
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
deleted file mode 100644
index 8c1b989361..0000000000
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 0337342d413d13f437fd089de91faee70a8bf3f9 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:01:18 -0800
-Subject: [PATCH] Add an option to disable installation of test modules
-
-The Python standard distribution comes with many test modules, that
-are not necessarly useful on embedded targets.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[james.hilliard1@gmail.com: adapt to python 3.9]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- Makefile.pre.in | 56 ++++++++++++++++++++++++++++++++-----------------
- configure.ac    |  5 +++++
- 2 files changed, 42 insertions(+), 19 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7c3dde8dd4..204f293d53 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1406,8 +1406,29 @@ maninstall:	altmaninstall
- 
- # Install the library
- XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
--LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
--		tkinter/test/test_ttk site-packages test \
-+
-+LIBSUBDIRS=	tkinter site-packages \
-+		asyncio \
-+		collections concurrent concurrent/futures encodings \
-+		email email/mime \
-+		ensurepip ensurepip/_bundled \
-+		html json http dbm xmlrpc \
-+		sqlite3 \
-+		logging csv wsgiref urllib \
-+		lib2to3 lib2to3/fixes lib2to3/pgen2 \
-+		ctypes ctypes/macholib \
-+		idlelib idlelib/Icons \
-+		distutils distutils/command $(XMLLIBSUBDIRS) \
-+		importlib \
-+		turtledemo \
-+		multiprocessing multiprocessing/dummy \
-+		unittest \
-+		venv venv/scripts venv/scripts/common venv/scripts/posix \
-+		curses pydoc_data \
-+		zoneinfo
-+
-+TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
-+		tkinter/test/test_ttk test \
- 		test/audiodata \
- 		test/capath test/data \
- 		test/cjkencodings test/decimaltestdata \
-@@ -1468,28 +1489,25 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
- 		test/test_importlib/zipdata02 \
- 		test/test_zoneinfo test/test_zoneinfo/data \
- 		test/ziptestdata \
--		asyncio \
- 		test/test_asyncio \
--		collections concurrent concurrent/futures encodings \
--		email email/mime test/test_email test/test_email/data \
--		ensurepip ensurepip/_bundled \
--		html json test/test_json http dbm xmlrpc \
--		sqlite3 sqlite3/test \
--		logging csv wsgiref urllib \
--		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
-+		test/test_email test/test_email/data \
-+		test/test_json \
-+		sqlite3/test \
-+		lib2to3/tests \
- 		lib2to3/tests/data lib2to3/tests/data/fixers \
- 		lib2to3/tests/data/fixers/myfixes \
--		ctypes ctypes/test ctypes/macholib \
--		idlelib idlelib/Icons idlelib/idle_test \
--		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
-+		ctypes/test \
-+		idlelib/idle_test \
-+		distutils/tests \
- 		test/test_peg_generator \
-+		test/test_importlib test/test_importlib/builtin \
- 		test/test_tools test/test_warnings test/test_warnings/data \
--		turtledemo \
--		multiprocessing multiprocessing/dummy \
--		unittest unittest/test unittest/test/testmock \
--		venv venv/scripts venv/scripts/common venv/scripts/posix \
--		curses pydoc_data \
--		zoneinfo
-+		unittest/test unittest/test/testmock
-+
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += $(TESTSUBDIRS)
-+endif
-+
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index 73d66167de..92e28d02ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3358,6 +3358,11 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_getcpuclockid)
- fi
- 
-+AC_SUBST(TEST_MODULES)
-+
-+AC_ARG_ENABLE(test-modules,
-+	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
-+	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
- 
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
--- 
-2.25.1
-
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0013-Add-an-option-to-disable-pydoc.patch
similarity index 74%
rename from package/python3/0014-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0013-Add-an-option-to-disable-pydoc.patch
index 0c928a0bb2..a540a3c9a2 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0013-Add-an-option-to-disable-pydoc.patch
@@ -10,17 +10,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 8 +++++++-
+ Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
  setup.py        | 9 +++++++--
- 3 files changed, 20 insertions(+), 3 deletions(-)
+ 3 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 204f293d53..63e3df0470 100644
+index c0d5511..32b3df7 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1374,7 +1374,9 @@ bininstall: altbininstall
+@@ -1392,7 +1392,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,31 +32,30 @@ index 204f293d53..63e3df0470 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1424,7 +1426,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1443,7 +1445,6 @@ LIBSUBDIRS=	asyncio \
+ 		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		logging \
  		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		venv venv/scripts venv/scripts/common venv/scripts/posix \
--		curses pydoc_data \
-+		curses \
- 		zoneinfo
- 
- TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
-@@ -1508,6 +1510,10 @@ ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+-		pydoc_data \
+ 		site-packages \
+ 		sqlite3 \
+ 		tkinter \
+@@ -1531,6 +1532,10 @@ TESTSUBDIRS=	ctypes/test \
+ 		tkinter/test/test_ttk \
+ 		unittest/test unittest/test/testmock
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
 +endif
 +
+ TEST_MODULES=@TEST_MODULES@
  libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
 diff --git a/configure.ac b/configure.ac
-index 92e28d02ee..174ed85a7c 100644
+index 083a12d..9079531 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3351,6 +3351,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -64,14 +65,14 @@ index 92e28d02ee..174ed85a7c 100644
 +	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
 +	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
 +
- AC_SUBST(TEST_MODULES)
  
- AC_ARG_ENABLE(test-modules,
+ # Check for enable-ipv6
+ AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 926c16f58f..1fc5fac90c 100644
+index d00d389..d23f148 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2565,6 +2565,12 @@ def main():
+@@ -2708,6 +2708,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +85,7 @@ index 926c16f58f..1fc5fac90c 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2589,8 +2595,7 @@ def main():
+@@ -2733,8 +2739,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -95,5 +96,5 @@ index 926c16f58f..1fc5fac90c 100644
  
  # --install-platlib
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0014-Add-an-option-to-disable-lib2to3.patch
similarity index 67%
rename from package/python3/0015-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0014-Add-an-option-to-disable-lib2to3.patch
index fe94cdfded..f150dabc27 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0014-Add-an-option-to-disable-lib2to3.patch
@@ -10,17 +10,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 16 ++++++++++++----
- configure.ac    |  6 ++++++
- setup.py        |  5 +++--
- 3 files changed, 21 insertions(+), 6 deletions(-)
+ Makefile.pre.in | 17 ++++++++++++-----
+ configure.ac    |  5 +++++
+ setup.py        |  6 +++---
+ 3 files changed, 20 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 63e3df0470..8b7de12999 100644
+index 28cf88e..63fa9fb 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1378,7 +1378,9 @@ ifeq (@PYDOC@,yes)
+@@ -1396,7 +1396,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,27 +32,28 @@ index 63e3df0470..8b7de12999 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1417,7 +1419,6 @@ LIBSUBDIRS=	tkinter site-packages \
- 		html json http dbm xmlrpc \
- 		sqlite3 \
- 		logging csv wsgiref urllib \
--		lib2to3 lib2to3/fixes lib2to3/pgen2 \
- 		ctypes ctypes/macholib \
+@@ -1442,7 +1444,6 @@ LIBSUBDIRS=	asyncio \
  		idlelib idlelib/Icons \
- 		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1495,9 +1496,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_email test/test_email/data \
- 		test/test_json \
- 		sqlite3/test \
+ 		importlib importlib/metadata \
+ 		json \
+-		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		logging \
+ 		multiprocessing multiprocessing/dummy \
+ 		site-packages \
+@@ -1459,10 +1460,6 @@ LIBSUBDIRS=	asyncio \
+ TESTSUBDIRS=	ctypes/test \
+ 		distutils/tests \
+ 		idlelib/idle_test \
 -		lib2to3/tests \
--		lib2to3/tests/data lib2to3/tests/data/fixers \
+-		lib2to3/tests/data \
+-		lib2to3/tests/data/fixers \
 -		lib2to3/tests/data/fixers/myfixes \
- 		ctypes/test \
- 		idlelib/idle_test \
- 		distutils/tests \
-@@ -1506,6 +1504,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_tools test/test_warnings test/test_warnings/data \
- 		unittest/test unittest/test/testmock
+ 		sqlite3/test \
+ 		test test/audiodata \
+ 		test/capath test/cjkencodings \
+@@ -1536,6 +1533,14 @@ ifeq (@PYDOC@,yes)
+ LIBSUBDIRS += pydoc_data
+ endif
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
@@ -60,10 +63,10 @@ index 63e3df0470..8b7de12999 100644
 +	lib2to3/tests/data/fixers/myfixes
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
-@@ -1606,10 +1612,12 @@ ifeq (@PYC_BUILD@,yes)
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+@@ -1638,10 +1643,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -77,27 +80,26 @@ index 63e3df0470..8b7de12999 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 174ed85a7c..f1f5e9a7b0 100644
+index 9079531..34c2ba9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3370,6 +3370,12 @@ AC_ARG_ENABLE(test-modules,
- 	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
- 	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
+@@ -5950,6 +5950,11 @@ else
+ fi
+ AC_SUBST(TEST_MODULES)
  
 +AC_SUBST(LIB2TO3)
 +
 +AC_ARG_ENABLE(lib2to3,
 +	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
 +	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
-+
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
+ 
+ # generate output files
+ AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
 diff --git a/setup.py b/setup.py
-index 1fc5fac90c..4063d7ffa5 100644
+index d23f148..663fd44 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2566,10 +2566,11 @@ def main():
+@@ -2709,11 +2709,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -106,11 +108,12 @@ index 1fc5fac90c..4063d7ffa5 100644
 +    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
      if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
          scripts += [ 'Tools/scripts/pydoc3' ]
+-
 +    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
 +        scripts += [ 'Tools/scripts/2to3' ]
- 
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
+           version = sys.version.split()[0],
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
similarity index 63%
rename from package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
index d6c9bccd45..68aac7bfae 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
@@ -7,32 +7,34 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8b7de12999..d826d8ac4b 100644
+index 5847029..5628860 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1417,7 +1417,6 @@ LIBSUBDIRS=	tkinter site-packages \
- 		email email/mime \
- 		ensurepip ensurepip/_bundled \
- 		html json http dbm xmlrpc \
+@@ -1447,7 +1447,6 @@ LIBSUBDIRS=	asyncio \
+ 		logging \
+ 		multiprocessing multiprocessing/dummy \
+ 		site-packages \
 -		sqlite3 \
- 		logging csv wsgiref urllib \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
-@@ -1495,7 +1494,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_asyncio \
- 		test/test_email test/test_email/data \
- 		test/test_json \
--		sqlite3/test \
- 		ctypes/test \
- 		idlelib/idle_test \
+ 		tkinter \
+ 		turtledemo \
+ 		unittest \
+@@ -1460,7 +1459,6 @@ LIBSUBDIRS=	asyncio \
+ TESTSUBDIRS=	ctypes/test \
  		distutils/tests \
-@@ -1512,6 +1510,11 @@ TESTSUBDIRS += lib2to3/tests			\
+ 		idlelib/idle_test \
+-		sqlite3/test \
+ 		test test/audiodata \
+ 		test/capath test/cjkencodings \
+ 		test/data test/decimaltestdata \
+@@ -1541,6 +1539,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -41,14 +43,14 @@ index 8b7de12999..d826d8ac4b 100644
 +TESTSUBDIRS += sqlite3/test
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index f1f5e9a7b0..8b5c65974c 100644
+index 34c2ba9..dfee472 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3351,6 +3351,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -65,5 +67,5 @@ index f1f5e9a7b0..8b5c65974c 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
similarity index 52%
rename from package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
index b798eb56a5..e675edc18b 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
@@ -7,52 +7,53 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 11 ++++++++---
+ Makefile.pre.in | 10 +++++++---
  configure.ac    |  9 +++++++++
- 2 files changed, 17 insertions(+), 3 deletions(-)
+ 2 files changed, 16 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d826d8ac4b..dc84384680 100644
+index 5628860..c968113 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1411,7 +1411,7 @@ maninstall:	altmaninstall
- # Install the library
- XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
- 
--LIBSUBDIRS=	tkinter site-packages \
-+LIBSUBDIRS=	site-packages \
- 		asyncio \
- 		collections concurrent concurrent/futures encodings \
- 		email email/mime \
-@@ -1429,8 +1429,7 @@ LIBSUBDIRS=	tkinter site-packages \
- 		curses \
- 		zoneinfo
- 
--TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
--		tkinter/test/test_ttk test \
-+TESTSUBDIRS=	test \
- 		test/audiodata \
- 		test/capath test/data \
- 		test/cjkencodings test/decimaltestdata \
-@@ -1502,6 +1501,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_tools test/test_warnings test/test_warnings/data \
+@@ -1447,7 +1447,6 @@ LIBSUBDIRS=	asyncio \
+ 		logging \
+ 		multiprocessing multiprocessing/dummy \
+ 		site-packages \
+-		tkinter \
+ 		turtledemo \
+ 		unittest \
+ 		urllib \
+@@ -1523,8 +1522,6 @@ TESTSUBDIRS=	ctypes/test \
+ 		test/tracedmodules \
+ 		test/xmltestdata test/xmltestdata/c14n-20 \
+ 		test/ziptestdata \
+-		tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test/test_ttk \
  		unittest/test unittest/test/testmock
  
+ ifeq (@PYDOC@,yes)
+@@ -1544,6 +1541,13 @@ LIBSUBDIRS += sqlite3
+ TESTSUBDIRS += sqlite3/test
+ endif
+ 
 +ifeq (@TK@,yes)
 +LIBSUBDIRS += tkinter
 +TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
 +	tkinter/test/test_ttk
 +endif
 +
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
++
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 8b5c65974c..4c72dae960 100644
+index dfee472..dc76dff 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3367,6 +3367,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3360,6 +3360,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -69,5 +70,5 @@ index 8b5c65974c..4c72dae960 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
similarity index 64%
rename from package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
index 93dfac26ec..43dbf1f010 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
@@ -7,39 +7,40 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 5 ++++-
+ Makefile.pre.in |  4 +++-
  configure.ac    | 9 +++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
+ 2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dc84384680..2a82f3308f 100644
+index c968113..f89f155 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1426,7 +1426,6 @@ LIBSUBDIRS=	site-packages \
- 		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+@@ -1433,7 +1433,6 @@ LIBSUBDIRS=	asyncio \
+ 		concurrent concurrent/futures \
+ 		csv \
+ 		ctypes ctypes/macholib \
 -		curses \
- 		zoneinfo
- 
- TESTSUBDIRS=	test \
-@@ -1507,6 +1506,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+ 		dbm \
+ 		distutils distutils/command \
+ 		email email/mime \
+@@ -1547,6 +1546,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
 +ifeq (@CURSES@,yes)
 +LIBSUBDIRS += curses
 +endif
-+
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
+ 
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
 diff --git a/configure.ac b/configure.ac
-index 4c72dae960..acd98381a3 100644
+index dc76dff..4f1cda5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3376,6 +3376,15 @@ if test "$TK" = "no"; then
+@@ -3369,6 +3369,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -56,5 +57,5 @@ index 4c72dae960..acd98381a3 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0018-Add-an-option-to-disable-expat.patch
similarity index 76%
rename from package/python3/0019-Add-an-option-to-disable-expat.patch
rename to package/python3/0018-Add-an-option-to-disable-expat.patch
index e7349058c8..7adfe1a2ad 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0018-Add-an-option-to-disable-expat.patch
@@ -13,26 +13,27 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in |  6 +++++-
+ Makefile.pre.in |  5 ++++-
  configure.ac    | 18 +++++++++++++-----
  setup.py        |  2 +-
- 3 files changed, 19 insertions(+), 7 deletions(-)
+ 3 files changed, 18 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2a82f3308f..e678c8817e 100644
+index f89f155..08c5e8a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1420,7 +1420,7 @@ LIBSUBDIRS=	site-packages \
- 		logging csv wsgiref urllib \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
--		distutils distutils/command $(XMLLIBSUBDIRS) \
-+		distutils distutils/command \
- 		importlib \
- 		turtledemo \
- 		multiprocessing multiprocessing/dummy \
-@@ -1510,6 +1510,10 @@ ifeq (@CURSES@,yes)
+@@ -1451,7 +1451,6 @@ LIBSUBDIRS=	asyncio \
+ 		urllib \
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+ 		wsgiref \
+-		$(XMLLIBSUBDIRS) \
+ 		xmlrpc \
+ 		zoneinfo
+ TESTSUBDIRS=	ctypes/test \
+@@ -1550,6 +1549,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -40,14 +41,14 @@ index 2a82f3308f..e678c8817e 100644
 +LIBSUBDIRS += $(XMLLIBSUBDIRS)
 +endif
 +
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index acd98381a3..9ef0ecd42f 100644
+index 4f1cda5..e99a174 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3084,13 +3084,21 @@ PKG_PROG_PKG_CONFIG
+@@ -3072,13 +3072,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -75,10 +76,10 @@ index acd98381a3..9ef0ecd42f 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index 4063d7ffa5..211a160f29 100644
+index 663fd44..e30ed52 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1666,7 +1666,7 @@ class PyBuildExt(build_ext):
+@@ -1750,7 +1750,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -88,5 +89,5 @@ index 4063d7ffa5..211a160f29 100644
              define_macros = []
              extra_compile_args = []
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
similarity index 94%
rename from package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
index 4e22543096..9df8d58420 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 9ef0ecd42f..18e6fd70a0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3375,6 +3375,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3368,6 +3368,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0020-Add-an-option-to-disable-NIS.patch
similarity index 95%
rename from package/python3/0021-Add-an-option-to-disable-NIS.patch
rename to package/python3/0020-Add-an-option-to-disable-NIS.patch
index 9cd54df180..3db145ed6e 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0020-Add-an-option-to-disable-NIS.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 18e6fd70a0..46d2a8131e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3381,6 +3381,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3374,6 +3374,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0021-Add-an-option-to-disable-unicodedata.patch
similarity index 95%
rename from package/python3/0022-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0021-Add-an-option-to-disable-unicodedata.patch
index 2ddf606a70..95f9b30c23 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0021-Add-an-option-to-disable-unicodedata.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 46d2a8131e..5844e3b73f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3387,6 +3387,12 @@ AC_ARG_ENABLE(nis,
+@@ -3380,6 +3380,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0022-Add-an-option-to-disable-IDLE.patch
similarity index 69%
rename from package/python3/0023-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0022-Add-an-option-to-disable-IDLE.patch
index 0e35eea699..e34f27969a 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0022-Add-an-option-to-disable-IDLE.patch
@@ -9,17 +9,19 @@ much sense to have it into our build.
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
- setup.py        | 4 +++-
- 3 files changed, 15 insertions(+), 2 deletions(-)
+ setup.py        | 5 ++++-
+ 3 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e678c8817e..1148bd8708 100644
+index 08c5e8a..461c5e3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1372,7 +1372,9 @@ bininstall: altbininstall
+@@ -1390,7 +1390,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,15 +31,15 @@ index e678c8817e..1148bd8708 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1419,7 +1421,6 @@ LIBSUBDIRS=	site-packages \
- 		html json http dbm xmlrpc \
- 		logging csv wsgiref urllib \
- 		ctypes ctypes/macholib \
+@@ -1440,7 +1442,6 @@ LIBSUBDIRS=	asyncio \
+ 		ensurepip ensurepip/_bundled \
+ 		html \
+ 		http \
 -		idlelib idlelib/Icons \
- 		distutils distutils/command \
- 		importlib \
- 		turtledemo \
-@@ -1514,6 +1515,10 @@ ifeq (@EXPAT@,yes)
+ 		importlib importlib/metadata \
+ 		json \
+ 		logging \
+@@ -1553,6 +1554,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -45,14 +47,14 @@ index e678c8817e..1148bd8708 100644
 +LIBSUBDIRS += idlelib idlelib/Icons
 +endif
 +
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 5844e3b73f..7bd4623ccd 100644
+index e99a174..baaa743 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3429,6 +3429,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -6009,6 +6009,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -62,14 +64,14 @@ index 5844e3b73f..7bd4623ccd 100644
 +	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
 +	[ IDLE="${enableval}" ], [ IDLE=yes ])
 +
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
+ # generate output files
+ AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
+ AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
 diff --git a/setup.py b/setup.py
-index 211a160f29..c4ee989ba3 100644
+index e30ed52..4dff249 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2566,11 +2566,13 @@ def main():
+@@ -2709,11 +2709,14 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -81,9 +83,10 @@ index 211a160f29..c4ee989ba3 100644
          scripts += [ 'Tools/scripts/2to3' ]
 +    if not '--disable-idle3' in sysconfig.get_config_var("CONFIG_ARGS"):
 +        scripts += [ 'Tools/scripts/idle3' ]
- 
++
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
+           version = sys.version.split()[0],
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0023-Add-an-option-to-disable-decimal.patch
similarity index 95%
rename from package/python3/0024-Add-an-option-to-disable-decimal.patch
rename to package/python3/0023-Add-an-option-to-disable-decimal.patch
index b5a12f7f38..484f321c25 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0023-Add-an-option-to-disable-decimal.patch
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 7bd4623ccd..e513ef6a20 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3135,13 +3135,20 @@ fi
+@@ -3123,13 +3123,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -52,14 +52,14 @@ diff --git a/setup.py b/setup.py
 index c4ee989ba3..3d0c74bb7f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2195,7 +2195,7 @@ class PyBuildExt(build_ext):
+@@ -2308,7 +2308,7 @@ class PyBuildExt(build_ext):
          # Stefan Krah's _decimal module
          extra_compile_args = []
          undef_macros = []
 -        if '--with-system-libmpdec' in sysconfig.get_config_var("CONFIG_ARGS"):
 +        if '--with-libmpdec=system' in sysconfig.get_config_var("CONFIG_ARGS"):
              include_dirs = []
-             libraries = [':libmpdec.so.2']
+             libraries = ['mpdec']
              sources = ['_decimal/_decimal.c']
 -- 
 2.25.1
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 97%
rename from package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 0f68a08356..86bb5ea435 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index e513ef6a20..c07505e89e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3165,6 +3165,12 @@ fi
+@@ -3153,6 +3153,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0025-Add-an-option-to-disable-openssl-support.patch
similarity index 89%
rename from package/python3/0026-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0025-Add-an-option-to-disable-openssl-support.patch
index 44d1d3d6b3..6e043030e6 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0025-Add-an-option-to-disable-openssl-support.patch
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index c07505e89e..612e32faf5 100644
+index 08c148c..a81a24c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3406,6 +3406,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3399,6 +3399,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index c07505e89e..612e32faf5 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
similarity index 90%
rename from package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
index 1597a2a560..f73f2feacf 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 612e32faf5..2a6aaeff60 100644
+index a81a24c..41a21ff 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3412,6 +3412,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3405,6 +3405,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index 612e32faf5..2a6aaeff60 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 92%
rename from package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index a1d2ef3255..1197d18d7d 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 2a6aaeff60..21479bbd7d 100644
+index 41a21ff..fa81bc7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3418,6 +3418,24 @@ AC_ARG_ENABLE(readline,
+@@ -3411,6 +3411,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index 2a6aaeff60..21479bbd7d 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
similarity index 97%
rename from package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
index 4478b40162..814a9d42e5 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
@@ -27,7 +27,7 @@ Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index a1bc3cd5f7..164d2d3603 100644
+index a1bc3cd..164d2d3 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
 @@ -31,7 +31,7 @@ prefix_real=$(installed_prefix "$0")
@@ -49,5 +49,5 @@ index a1bc3cd5f7..164d2d3603 100644
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
similarity index 96%
rename from package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
rename to package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
index 1bf5fc6db4..f5a3294dfc 100644
--- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
+++ b/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index 3d0c74bb7f..c7be85f352 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1764,7 +1764,8 @@ class PyBuildExt(build_ext):
+@@ -1850,7 +1850,8 @@ class PyBuildExt(build_ext):
  
      def detect_uuid(self):
          # Build the _uuid module if possible
diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
similarity index 88%
rename from package/python3/0031-Add-an-option-to-disable-uuid-module.patch
rename to package/python3/0030-Add-an-option-to-disable-uuid-module.patch
index 92b24b211d..ca83011084 100644
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 21479bbd7d..615c16aced 100644
+index fa81bc7..4e733f6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3454,6 +3454,15 @@ if test "$CURSES" = "no"; then
+@@ -3447,6 +3447,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -29,5 +29,5 @@ index 21479bbd7d..615c16aced 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.30.2
 
diff --git a/package/python3/0032-fix-building-on-older-distributions.patch b/package/python3/0031-fix-building-on-older-distributions.patch
similarity index 100%
rename from package/python3/0032-fix-building-on-older-distributions.patch
rename to package/python3/0031-fix-building-on-older-distributions.patch
diff --git a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 98%
rename from package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index f70990b254..07d24fdeee 100644
--- a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -32,7 +32,7 @@ diff --git a/configure.ac b/configure.ac
 index 615c16aced..241298e6cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -727,7 +727,9 @@ then
+@@ -717,7 +717,9 @@ then
  fi
  
  
diff --git a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
similarity index 88%
rename from package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
rename to package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
index a4e8baf4dd..8bd237d56e 100644
--- a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -9,10 +9,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 72c1d86e82..8c3912d237 100644
+index 4e733f6..1e52f30 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3465,6 +3465,12 @@ if test "$UUID" = "no"; then
+@@ -3458,6 +3458,12 @@ if test "$UUID" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
  fi
  
@@ -26,5 +26,5 @@ index 72c1d86e82..8c3912d237 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.0
+2.30.2
 
diff --git a/package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
diff --git a/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch b/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
similarity index 100%
rename from package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
rename to package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 444dbd982a..cf7ef43238 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-397/
-md5  fddb060b483bc01850a3f412eea1d954  Python-3.9.7.tar.xz
+# From https://www.python.org/downloads/release/python-310/
+md5  3e7035d272680f80e3ce4e8eb492d580  Python-3.10.0.tar.xz
 # Locally computed
-sha256  f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57  Python-3.9.7.tar.xz
-sha256  599826df92bfdcd2702eac691072498bb096c55af04ee984cf90f70ed77b5a70  LICENSE
+sha256  5a99f8e7a6a11a7b98b4e75e0d1303d3832cada5534068f69c7b6222a7b1b002  Python-3.10.0.tar.xz
+sha256  d0285b61e1a8e420c7deb95836738a5d4a0d26463138b17601f5971212684c4b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3e88bc0ff4..5b51d9c176 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION_MAJOR = 3.10
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
