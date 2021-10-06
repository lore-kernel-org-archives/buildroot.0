Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3261C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:52:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FEEE610A2
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FEEE610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 419264079B;
	Wed,  6 Oct 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8E9Ql-i3bJ4k; Wed,  6 Oct 2021 19:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8450440243;
	Wed,  6 Oct 2021 19:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71D5A1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E5C34090C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWIoI6Eb5O5l for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:52:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABCA040910
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:52:21 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id t11so4007736ilf.11
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fI3m3FRXOk0MwsWwQiF6kdqDze+hNsliMeVZNW4SIzM=;
 b=d6f13MbQkDX4rRpN/wZmlY7W6ZaL1no82AzaqW2sMpkOC5qR847wy3yKy0tf2NbMCC
 Llrx8hVR6bXeDQJY3s3ypeNJPW7dvG05F/1Fs1/ObitDu7Jrd5BgNRxyPRVCt/oycCih
 0TipHl2fkdy5Cz7ddOPjjBA5ukg3mE2vLPZdnlAh1trh77AdkVmfMrMaMgt8t1Kk0FNw
 n++Z6AGq4qRaymwsDaXRVxQTDs0Yx2cKCxeuMVvs+Hw/MAkl0R0LDGS9G69zkF1/P3+5
 muK1YvmsEHsMDYL0eYjt7WmFYMfJQ+8j5AvMtEQ88ZCyb92VDJwSKd5HAMQiBqmIxQTn
 PDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fI3m3FRXOk0MwsWwQiF6kdqDze+hNsliMeVZNW4SIzM=;
 b=rSPgbnL2eXM+iahRruP8OzFdUr3K/JwUyPAlcqWzNWt5xBuZhRiuiQP8ur3qFHi1e+
 4lsP3mxX6IV13A3gcY7+k9aGu+pfaOCTvQW8OMzdnYU9zhWrBbHFW8NyjYOq6nIpIuy4
 1fGgjLQpogksLXRSAFEYmxH5VgYMUjVnSQlBWbBn5cnHNYKG8vrFH/nZUVKbT0tsRL9T
 s1XSgxcmRwb/jHuP8kdFda1UmYkRDTC6Vn8zfN811FFFtT32WgTerA1Wke6paRifRVmC
 N7acClEob/4fhXM9zW4RJ+yanUA4aOtyNfnH4AVAXaLxumpx9QkUX7o3cj4ErjzAnGf8
 DZvA==
X-Gm-Message-State: AOAM533unNZ/sjuLK/d4ta7RTnwcbvk9sTeCGdnt9tXqFTe/5flMZ+gd
 ZejMsMPMcpvr7+reXlqH4FFFC8zqjM4=
X-Google-Smtp-Source: ABdhPJx8p/lBsWK8kQdw46bICCO5uSOR5WeGr4f/va6aZZWoKcYZuWKaqgiAmEHcmUBXRnQRiqNyEA==
X-Received: by 2002:a05:6e02:174e:: with SMTP id
 y14mr23998ill.189.1633549940216; 
 Wed, 06 Oct 2021 12:52:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id v4sm1586941ile.24.2021.10.06.12.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:52:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:52:17 -0600
Message-Id: <20211006195217.2365351-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.10.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop Add an option to disable installation of test modules patch
which is now upstream.

Rebase remaining patches.

License hash change due to formatting changes:
https://github.com/python/cpython/commit/11749e2dc20ad6a76e9a39e948853e89b2b4bbed

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...e-the-build-of-pyc-files-conditional.patch |  12 +-
 ...taddrinfo-configure-test-when-cross-.patch |   6 +-
 ...re-to-disable-the-build-of-certain-e.patch |  24 ++--
 ...y-header-paths-for-cross-compilation.patch |  50 ++++----
 ...ook-in-usr-lib-termcap-for-libraries.patch |   6 +-
 .../0006-Don-t-add-multiarch-paths.patch      |   6 +-
 .../0007-Abort-on-failed-module-build.patch   |   6 +-
 .../0008-Serial-ioctl-workaround.patch        |   4 +-
 ...e-shebang-of-Python-scripts-for-cros.patch |   4 +-
 ...ig.sh.in-ensure-sed-invocations-only.patch |   2 +-
 ...locale-and-set-to-default-when-addin.patch |   6 +-
 ...Add-importlib-fix-for-PEP-3147-issue.patch |  10 +-
 ...-disable-installation-of-test-module.patch | 117 ------------------
 ...0013-Add-an-option-to-disable-pydoc.patch} |  47 ++++---
 ...14-Add-an-option-to-disable-lib2to3.patch} |  65 +++++-----
 ...ption-to-disable-the-sqlite3-module.patch} |  42 +++----
 ...-an-option-to-disable-the-tk-module.patch} |  51 ++++----
 ...option-to-disable-the-curses-module.patch} |  24 ++--
 ...0018-Add-an-option-to-disable-expat.patch} |  35 +++---
 ...Add-an-option-to-disable-CJK-codecs.patch} |   6 +-
 ...> 0020-Add-an-option-to-disable-NIS.patch} |   6 +-
 ...dd-an-option-to-disable-unicodedata.patch} |   6 +-
 ... 0022-Add-an-option-to-disable-IDLE.patch} |  43 ++++---
 ...23-Add-an-option-to-disable-decimal.patch} |  12 +-
 ...n-to-disable-the-ossaudiodev-module.patch} |   6 +-
 ...n-option-to-disable-openssl-support.patch} |   6 +-
 ...tion-to-disable-the-readline-module.patch} |   6 +-
 ...o-disable-zlib-bzip2-and-xz-modules.patch} |   6 +-
 ...hon-config.sh-don-t-reassign-prefix.patch} |   2 +-
 ...Fix-cross-compiling-the-uuid-module.patch} |   6 +-
 ...dd-an-option-to-disable-uuid-module.patch} |   6 +-
 ...fix-building-on-older-distributions.patch} |   2 +-
 ...p-CC-print-multiarch-output-for-mus.patch} |   6 +-
 ...on-to-disable-the-berkeleydb-module.patch} |   8 +-
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   4 +-
 ...eration-error-in-_ExecutorManagerTh.patch} |   8 +-
 package/python3/python3.hash                  |   8 +-
 package/python3/python3.mk                    |   4 +-
 38 files changed, 277 insertions(+), 391 deletions(-)
 delete mode 100644 package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
 rename package/python3/{0014-Add-an-option-to-disable-pydoc.patch => 0013-Add-an-option-to-disable-pydoc.patch} (74%)
 rename package/python3/{0015-Add-an-option-to-disable-lib2to3.patch => 0014-Add-an-option-to-disable-lib2to3.patch} (70%)
 rename package/python3/{0016-Add-option-to-disable-the-sqlite3-module.patch => 0015-Add-option-to-disable-the-sqlite3-module.patch} (63%)
 rename package/python3/{0017-Add-an-option-to-disable-the-tk-module.patch => 0016-Add-an-option-to-disable-the-tk-module.patch} (53%)
 rename package/python3/{0018-Add-an-option-to-disable-the-curses-module.patch => 0017-Add-an-option-to-disable-the-curses-module.patch} (73%)
 rename package/python3/{0019-Add-an-option-to-disable-expat.patch => 0018-Add-an-option-to-disable-expat.patch} (77%)
 rename package/python3/{0020-Add-an-option-to-disable-CJK-codecs.patch => 0019-Add-an-option-to-disable-CJK-codecs.patch} (83%)
 rename package/python3/{0021-Add-an-option-to-disable-NIS.patch => 0020-Add-an-option-to-disable-NIS.patch} (85%)
 rename package/python3/{0022-Add-an-option-to-disable-unicodedata.patch => 0021-Add-an-option-to-disable-unicodedata.patch} (84%)
 rename package/python3/{0023-Add-an-option-to-disable-IDLE.patch => 0022-Add-an-option-to-disable-IDLE.patch} (73%)
 rename package/python3/{0024-Add-an-option-to-disable-decimal.patch => 0023-Add-an-option-to-disable-decimal.patch} (89%)
 rename package/python3/{0025-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0024-Add-an-option-to-disable-the-ossaudiodev-module.patch} (86%)
 rename package/python3/{0026-Add-an-option-to-disable-openssl-support.patch => 0025-Add-an-option-to-disable-openssl-support.patch} (83%)
 rename package/python3/{0027-Add-an-option-to-disable-the-readline-module.patch => 0026-Add-an-option-to-disable-the-readline-module.patch} (83%)
 rename package/python3/{0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (88%)
 rename package/python3/{0029-python-config.sh-don-t-reassign-prefix.patch => 0028-python-config.sh-don-t-reassign-prefix.patch} (96%)
 rename package/python3/{0030-Fix-cross-compiling-the-uuid-module.patch => 0029-Fix-cross-compiling-the-uuid-module.patch} (89%)
 rename package/python3/{0031-Add-an-option-to-disable-uuid-module.patch => 0030-Add-an-option-to-disable-uuid-module.patch} (82%)
 rename package/python3/{0032-fix-building-on-older-distributions.patch => 0031-fix-building-on-older-distributions.patch} (95%)
 rename package/python3/{0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (93%)
 rename package/python3/{0034-Add-an-option-to-disable-the-berkeleydb-module.patch => 0033-Add-an-option-to-disable-the-berkeleydb-module.patch} (80%)
 rename package/python3/{0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (95%)
 rename package/python3/{0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch => 0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch} (85%)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 44902725d7..86692d79d7 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 322724e166d7ec0393aec577c12fdf6ef2b61e1d Mon Sep 17 00:00:00 2001
+From 0e57c0a342d90c3f8691a6c5d2b26b05087f33cb Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 77f91e72b1..0c809f3d8a 100644
+index 790d974b96..647675d786 100644
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
@@ -35,10 +35,10 @@ index 77f91e72b1..0c809f3d8a 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index d60f05251a..1ee5a09588 100644
+index 3e6c07c279..b0d4b32397 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1121,6 +1121,12 @@ fi
+@@ -1108,6 +1108,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 00177814cc..3ec80588d0 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 72e20220f3a592b3ab9f440fbe74efa9f9e82d49 Mon Sep 17 00:00:00 2001
+From abb15ac67a28b8dd628aa5743bbaffbd264195c9 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1ee5a09588..c2445edc88 100644
+index b0d4b32397..5bb57887b8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4210,7 +4210,7 @@ fi
+@@ -4208,7 +4208,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 7cccc588e9..338b85e582 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From df7c95b4ceecf390b961d843a556c470ac9080b2 Mon Sep 17 00:00:00 2001
+From f5190d53382d51c83186a7add87eef68a7266acb Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,10 +44,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0c809f3d8a..7c3dde8dd4 100644
+index 647675d786..c0d5511c01 100644
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
@@ -75,10 +75,10 @@ index 0c809f3d8a..7c3dde8dd4 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index c2445edc88..73d66167de 100644
+index 5bb57887b8..083a12d05f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3081,6 +3081,8 @@ LIBS="$withval $LIBS"
+@@ -3069,6 +3069,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -88,11 +88,11 @@ index c2445edc88..73d66167de 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 770866bca7..b6c829b3a5 100644
+index 3d250e7249..66d372a63d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -44,7 +44,10 @@ from distutils.spawn import find_executable
- TEST_EXTENSIONS = True
+@@ -58,7 +58,10 @@
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
index 24f369f87f..85b3b633ad 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 61af65485f1dade4aa08d0cf2b24082aeda24c51 Mon Sep 17 00:00:00 2001
+From 9896cfdde3e8a18cb83e4d2cb59a0fa59e8c74b6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -17,14 +17,14 @@ third-party Python modules.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  Lib/distutils/command/build_ext.py |  5 ++++-
- Lib/distutils/sysconfig.py         | 15 +++++++++++----
+ Lib/sysconfig.py                   | 15 +++++++++++----
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
 index 1a9bd1200f..3cf7d6746e 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -234,7 +234,10 @@ class build_ext(Command):
+@@ -234,7 +234,10 @@ def finalize_options(self):
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
              if not sysconfig.python_build:
                  # building third party extensions
@@ -36,32 +36,32 @@ index 1a9bd1200f..3cf7d6746e 100644
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
+index 95b48f6429..49239673ea 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -123,10 +123,17 @@ def joinuser(*args):
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
++    _BASE_PREFIX = _PREFIX
++    _EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
++    _BASE_EXEC_PREFIX = _EXEC_PREFIX
 +else:
-+    PREFIX = os.path.normpath(sys.prefix)
-+    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+    BASE_PREFIX = os.path.normpath(sys.base_prefix)
-+    BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
++    _PREFIX = os.path.normpath(sys.prefix)
++    _BASE_PREFIX = os.path.normpath(sys.base_prefix)
++    _EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++    _BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
+ _CONFIG_VARS = None
+ _USER_BASE = None
  
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCbuild/win32 or project/PCbuild/amd64.
 -- 
 2.25.1
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index c5abcfd786..519a018e8e 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 60d71e37d167ea89445250be436170a6cfee84e7 Mon Sep 17 00:00:00 2001
+From 8b6ba835142adfa609cb4fec10b8c522e67b0a41 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index b6c829b3a5..ec3ba60607 100644
+index 66d372a63d..e632b6fe10 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1041,12 +1041,9 @@ class PyBuildExt(build_ext):
+@@ -1133,12 +1133,9 @@ def detect_readline_curses(self):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index bb861612b1..bbe4251fbb 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From f5933b8f973cd11698b52d535a10d0474e49f5a5 Mon Sep 17 00:00:00 2001
+From aecc1dd06ecc77369b40e7e7507d3905ef3e6a8e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index ec3ba60607..e27620035c 100644
+index e632b6fe10..6824e53b9f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -734,10 +734,10 @@ class PyBuildExt(build_ext):
+@@ -816,10 +816,10 @@ def configure_compiler(self):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 856fcaac21..5bc56c01d9 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 188c0ebfdb71f5252fa7701013b8d1209f28aef7 Mon Sep 17 00:00:00 2001
+From 9f9ab461a9c746bdc28374d07cf88104c66ee829 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index e27620035c..d3f0e663f2 100644
+index 6824e53b9f..beacd49e83 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -524,6 +524,7 @@ class PyBuildExt(build_ext):
+@@ -556,6 +556,7 @@ def print_three_column(lst):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index df31cd6220..ca7cea5cfa 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 9e6211b0d6d4610e5fb7d2c7e1152eb7c64d968b Mon Sep 17 00:00:00 2001
+From bde6fe53a9be5d4d7c4c16b5d283fbfe7bad2446 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -15,7 +15,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  1 file changed, 2 insertions(+)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index 75e5e52320..eefbddfe69 100644
+index fdfe589eb8..b8f6743996 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -15,7 +15,9 @@
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 8a77fe3708..ed8a9bfc53 100644
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From cb595a591c71e0bf7c63a3706b0be45ac6a642e3 Mon Sep 17 00:00:00 2001
+From 5fa48ea409c1f9f1d1e0a9ce6b3580dfdad292b4 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
@@ -21,7 +21,7 @@ diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/buil
 index ccc70e6465..d6d54195c1 100644
 --- a/Lib/distutils/command/build_scripts.py
 +++ b/Lib/distutils/command/build_scripts.py
-@@ -91,7 +91,7 @@ class build_scripts(Command):
+@@ -91,7 +91,7 @@ def copy_scripts(self):
                      adjust = True
                      post_interp = match.group(1) or b''
  
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index a1f9ab6cd9..8a7939028f 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From eb51497e4b5799f8ab0277426d3e54414acb9d4b Mon Sep 17 00:00:00 2001
+From 57da862f3e50491fc15fb4cf51f44b90dd240053 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 8b0d4f4c4d..bf3998058f 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,4 @@
-From e4ae670e3489544a49dabd1618c32fe73504a7ba Mon Sep 17 00:00:00 2001
+From db5f7fa9552cefb0c5419a03557b2d237316a450 Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
 Subject: [PATCH] Override system locale and set to default when adding gcc
@@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index d3f0e663f2..926c16f58f 100644
+index beacd49e83..d00d389406 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -680,7 +680,7 @@ class PyBuildExt(build_ext):
+@@ -759,7 +759,7 @@ def add_cross_compiling_paths(self):
          tmpfile = os.path.join(self.build_temp, 'ccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index 7a885303cb..931a5a0326 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,4 +1,4 @@
-From e2ea659eac1849db471d3c01a0d0af9d6fca2e9a Mon Sep 17 00:00:00 2001
+From b3b464e4982895b4b1d6d2ddada8e4889f6e4eca Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 22 Feb 2017 16:48:49 -0800
 Subject: [PATCH] Add importlib fix for PEP 3147 issue
@@ -25,10 +25,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  1 file changed, 5 insertions(+), 39 deletions(-)
 
 diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index 25a3f8c0e0..2cb9a9aa52 100644
+index 9a73c7b43a..c83d4a0cc4 100644
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
index 0c928a0bb2..f2793547f9 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0013-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From a65e5d3caf8e076d531191164c23c6240461f675 Mon Sep 17 00:00:00 2001
+From ab03b11651a9f56032f2196af129bdae988bdc9f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -12,15 +12,15 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 8 +++++++-
- configure.ac    | 6 ++++++
+ configure.ac    | 5 +++++
  setup.py        | 9 +++++++--
- 3 files changed, 20 insertions(+), 3 deletions(-)
+ 3 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 204f293d53..63e3df0470 100644
+index c0d5511c01..4620f6a2a9 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1374,7 +1374,9 @@ bininstall: altbininstall
+@@ -1392,7 +1392,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,19 +30,19 @@ index 204f293d53..63e3df0470 100644
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
+@@ -1532,6 +1533,11 @@ TESTSUBDIRS=	ctypes/test \
+ 		unittest/test unittest/test/testmock
  
+ TEST_MODULES=@TEST_MODULES@
++
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
 +endif
@@ -51,10 +51,10 @@ index 204f293d53..63e3df0470 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 92e28d02ee..174ed85a7c 100644
+index 083a12d05f..530ba4790f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3351,6 +3351,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -63,15 +63,14 @@ index 92e28d02ee..174ed85a7c 100644
 +AC_ARG_ENABLE(pydoc,
 +	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
 +	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
-+
- AC_SUBST(TEST_MODULES)
  
- AC_ARG_ENABLE(test-modules,
+ # Check for enable-ipv6
+ AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 926c16f58f..1fc5fac90c 100644
+index d00d389406..d23f1485fc 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2565,6 +2565,12 @@ def main():
+@@ -2708,6 +2708,12 @@ class DummyProcess:
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +83,7 @@ index 926c16f58f..1fc5fac90c 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2589,8 +2595,7 @@ def main():
+@@ -2733,8 +2739,7 @@ class DummyProcess:
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0014-Add-an-option-to-disable-lib2to3.patch
similarity index 70%
rename from package/python3/0015-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0014-Add-an-option-to-disable-lib2to3.patch
index fe94cdfded..f83959e07d 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0014-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From f034b1b0f33a7bd4dde23f0bc1fa8e00e3518c9d Mon Sep 17 00:00:00 2001
+From 1c2c3c0bce71c8b26cf87f9d849e8e67f343570a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -11,16 +11,16 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in | 16 ++++++++++++----
+ Makefile.pre.in | 17 ++++++++++++-----
  configure.ac    |  6 ++++++
  setup.py        |  5 +++--
- 3 files changed, 21 insertions(+), 6 deletions(-)
+ 3 files changed, 21 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 63e3df0470..8b7de12999 100644
+index 4620f6a2a9..e9955376e8 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1378,7 +1378,9 @@ ifeq (@PYDOC@,yes)
+@@ -1396,7 +1396,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,27 +30,28 @@ index 63e3df0470..8b7de12999 100644
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
+@@ -1534,6 +1531,14 @@ TESTSUBDIRS=	ctypes/test \
+ 
+ TEST_MODULES=@TEST_MODULES@
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
@@ -60,10 +61,10 @@ index 63e3df0470..8b7de12999 100644
 +	lib2to3/tests/data/fixers/myfixes
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
+ ifeq (@PYDOC@,yes)
+ LIBSUBDIRS += pydoc_data
  endif
-@@ -1606,10 +1612,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1639,10 +1644,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -77,12 +78,12 @@ index 63e3df0470..8b7de12999 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 174ed85a7c..f1f5e9a7b0 100644
+index 530ba4790f..d5558d4d84 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3370,6 +3370,12 @@ AC_ARG_ENABLE(test-modules,
- 	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
- 	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
+@@ -3357,6 +3357,12 @@ AC_ARG_ENABLE(pydoc,
+ 	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
+ 	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
 +AC_SUBST(LIB2TO3)
 +
@@ -94,10 +95,10 @@ index 174ed85a7c..f1f5e9a7b0 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 1fc5fac90c..4063d7ffa5 100644
+index d23f1485fc..baec656e2b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2566,10 +2566,11 @@ def main():
+@@ -2709,10 +2709,11 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
similarity index 63%
rename from package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
index d6c9bccd45..37808ab132 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From dd2722dec08eb9c72c36313e93661eeca3ad64d8 Mon Sep 17 00:00:00 2001
+From d830be9612e7a5a43d51758ef4a82079e195c019 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -13,26 +13,26 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8b7de12999..d826d8ac4b 100644
+index e9955376e8..5b930af007 100644
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
+@@ -1539,6 +1537,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -41,14 +41,14 @@ index 8b7de12999..d826d8ac4b 100644
 +TESTSUBDIRS += sqlite3/test
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
+ ifeq (@PYDOC@,yes)
+ LIBSUBDIRS += pydoc_data
  endif
 diff --git a/configure.ac b/configure.ac
-index f1f5e9a7b0..8b5c65974c 100644
+index d5558d4d84..d04da50ec7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3351,6 +3351,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
similarity index 53%
rename from package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
index b798eb56a5..a4f421c933 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From ad6b66b34f71ff6b60b3be5f6fd3e781cdeecd59 Mon Sep 17 00:00:00 2001
+From c0ae44ff856bf0746c1e2b0e17d4b4ca3d966ea7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -8,37 +8,32 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in | 11 ++++++++---
- configure.ac    |  9 +++++++++
- 2 files changed, 17 insertions(+), 3 deletions(-)
+ Makefile.pre.in | 9 ++++++---
+ configure.ac    | 9 +++++++++
+ 2 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d826d8ac4b..dc84384680 100644
+index 5b930af007..e5ca8476dc 100644
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
+@@ -1523,12 +1522,16 @@ TESTSUBDIRS=	ctypes/test \
+ 		test/tracedmodules \
+ 		test/xmltestdata test/xmltestdata/c14n-20 \
+ 		test/ziptestdata \
+-		tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test/test_ttk \
  		unittest/test unittest/test/testmock
  
+ TEST_MODULES=@TEST_MODULES@
+ 
 +ifeq (@TK@,yes)
 +LIBSUBDIRS += tkinter
 +TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
@@ -49,10 +44,10 @@ index d826d8ac4b..dc84384680 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 8b5c65974c..4c72dae960 100644
+index d04da50ec7..e63fa8e4d0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3367,6 +3367,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3360,6 +3360,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
similarity index 73%
rename from package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
index 93dfac26ec..bd5bdee63a 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 962deb43f5f340a8472d432ae8e6d61186f9040e Mon Sep 17 00:00:00 2001
+From 6da73d818a405ed92c4b526f0339cc508630033e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -13,18 +13,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dc84384680..2a82f3308f 100644
+index e5ca8476dc..c5493216e0 100644
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
+@@ -1532,6 +1531,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -36,10 +36,10 @@ index dc84384680..2a82f3308f 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 4c72dae960..acd98381a3 100644
+index e63fa8e4d0..67d06ee4a1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3376,6 +3376,15 @@ if test "$TK" = "no"; then
+@@ -3369,6 +3369,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0018-Add-an-option-to-disable-expat.patch
similarity index 77%
rename from package/python3/0019-Add-an-option-to-disable-expat.patch
rename to package/python3/0018-Add-an-option-to-disable-expat.patch
index e7349058c8..78bcfdcd28 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0018-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 7e0e7dc25f50acd6922493ae620ee5cbf107a79a Mon Sep 17 00:00:00 2001
+From a8044be550339231b59e5855edac613ec743a1e4 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -14,25 +14,24 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in |  6 +++++-
+ Makefile.pre.in |  5 ++++-
  configure.ac    | 18 +++++++++++++-----
  setup.py        |  2 +-
- 3 files changed, 19 insertions(+), 7 deletions(-)
+ 3 files changed, 18 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2a82f3308f..e678c8817e 100644
+index c5493216e0..6ce25e4146 100644
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
+@@ -1535,6 +1534,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -44,10 +43,10 @@ index 2a82f3308f..e678c8817e 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index acd98381a3..9ef0ecd42f 100644
+index 67d06ee4a1..dd09cbf364 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3084,13 +3084,21 @@ PKG_PROG_PKG_CONFIG
+@@ -3072,13 +3072,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -75,10 +74,10 @@ index acd98381a3..9ef0ecd42f 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index 4063d7ffa5..211a160f29 100644
+index baec656e2b..4dc65de930 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1666,7 +1666,7 @@ class PyBuildExt(build_ext):
+@@ -1750,7 +1750,7 @@ def detect_expat_elementtree(self):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
similarity index 83%
rename from package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
index 4e22543096..bc6c55d788 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From 2c0d31bb91fc7f94283c3ab632925fbbe24e94d6 Mon Sep 17 00:00:00 2001
+From db9bcac8f119bbd160dac5fc254f2041f0042d55 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 9ef0ecd42f..18e6fd70a0 100644
+index dd09cbf364..9837a4de56 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3375,6 +3375,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3368,6 +3368,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0020-Add-an-option-to-disable-NIS.patch
similarity index 85%
rename from package/python3/0021-Add-an-option-to-disable-NIS.patch
rename to package/python3/0020-Add-an-option-to-disable-NIS.patch
index 9cd54df180..e3ab5dc7ae 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0020-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From 2041d0c8dba87991edaf088b16e37b5189a3466d Mon Sep 17 00:00:00 2001
+From 734e5daee4457893799c8d524c05e4b754c7b4da Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 18e6fd70a0..46d2a8131e 100644
+index 9837a4de56..728e3df482 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3381,6 +3381,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3374,6 +3374,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0021-Add-an-option-to-disable-unicodedata.patch
similarity index 84%
rename from package/python3/0022-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0021-Add-an-option-to-disable-unicodedata.patch
index 2ddf606a70..b63aba53fa 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0021-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From dd82a401ff6ba4ba116bf4d520e981a1808ed443 Mon Sep 17 00:00:00 2001
+From 68228e12e8c315f6d82976786971322b4f2a4f1f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 46d2a8131e..5844e3b73f 100644
+index 728e3df482..4723901496 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3387,6 +3387,12 @@ AC_ARG_ENABLE(nis,
+@@ -3380,6 +3380,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0022-Add-an-option-to-disable-IDLE.patch
similarity index 73%
rename from package/python3/0023-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0022-Add-an-option-to-disable-IDLE.patch
index 0e35eea699..4f562954aa 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0022-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From f1b15834045d0641c43014b970721df066fa71f7 Mon Sep 17 00:00:00 2001
+From db4462843f8f220dcd4d9e26bd8b1995ff835dc4 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -10,16 +10,16 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in | 7 ++++++-
+ Makefile.pre.in | 9 +++++++--
  configure.ac    | 6 ++++++
  setup.py        | 4 +++-
- 3 files changed, 15 insertions(+), 2 deletions(-)
+ 3 files changed, 16 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e678c8817e..1148bd8708 100644
+index 6ce25e4146..af554cc0a5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1372,7 +1372,9 @@ bininstall: altbininstall
+@@ -1390,7 +1390,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,30 +29,39 @@ index e678c8817e..1148bd8708 100644
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
+@@ -1455,7 +1456,6 @@ LIBSUBDIRS=	asyncio \
+ 		zoneinfo
+ TESTSUBDIRS=	ctypes/test \
+ 		distutils/tests \
+-		idlelib/idle_test \
+ 		test test/audiodata \
+ 		test/capath test/cjkencodings \
+ 		test/data test/decimaltestdata \
+@@ -1538,6 +1538,11 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
 +ifeq (@IDLE@,yes)
 +LIBSUBDIRS += idlelib idlelib/Icons
++TESTSUBDIRS += idlelib/idle_test
 +endif
 +
  ifeq (@LIB2TO3@,yes)
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 5844e3b73f..7bd4623ccd 100644
+index 4723901496..77d1c9b05e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3429,6 +3429,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3416,6 +3416,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -66,10 +75,10 @@ index 5844e3b73f..7bd4623ccd 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 211a160f29..c4ee989ba3 100644
+index 4dc65de930..4dff2493fc 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2566,11 +2566,13 @@ def main():
+@@ -2709,11 +2709,13 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0023-Add-an-option-to-disable-decimal.patch
similarity index 89%
rename from package/python3/0024-Add-an-option-to-disable-decimal.patch
rename to package/python3/0023-Add-an-option-to-disable-decimal.patch
index b5a12f7f38..74708f4b71 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0023-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From d5fe81cbd51da2a84ed89d1e4c80d921d4efce26 Mon Sep 17 00:00:00 2001
+From c71d06bf34a986125c7b49e655b86cecedff573d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -19,10 +19,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7bd4623ccd..e513ef6a20 100644
+index 77d1c9b05e..6b153872ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3135,13 +3135,20 @@ fi
+@@ -3123,13 +3123,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -49,17 +49,17 @@ index 7bd4623ccd..e513ef6a20 100644
  # Check whether _decimal should use a coroutine-local or thread-local context
  AC_MSG_CHECKING(for --with-decimal-contextvar)
 diff --git a/setup.py b/setup.py
-index c4ee989ba3..3d0c74bb7f 100644
+index 4dff2493fc..fd1edac1e5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2195,7 +2195,7 @@ class PyBuildExt(build_ext):
+@@ -2308,7 +2308,7 @@ def detect_decimal(self):
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
similarity index 86%
rename from package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 0f68a08356..d211a00f42 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From 9bedc56d2a4b8856162650a11c1fcb6ec38f160b Mon Sep 17 00:00:00 2001
+From 41513399b24cb09acb20c7b6843afe0ed062da04 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e513ef6a20..c07505e89e 100644
+index 6b153872ad..f666a096df 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3165,6 +3165,12 @@ fi
+@@ -3153,6 +3153,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0025-Add-an-option-to-disable-openssl-support.patch
similarity index 83%
rename from package/python3/0026-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0025-Add-an-option-to-disable-openssl-support.patch
index 44d1d3d6b3..d86847a363 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0025-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 90ed5c692b8b5596ca0b3ae1436276c8181251d8 Mon Sep 17 00:00:00 2001
+From 30ce038b032cf210c00b1783d4abb4c762abe991 Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index c07505e89e..612e32faf5 100644
+index f666a096df..2c8bdf5c77 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3406,6 +3406,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3399,6 +3399,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
similarity index 83%
rename from package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
index 1597a2a560..f5c646ccc4 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From 049e7a51e1ffd0d28d6608c707ab4b54e816d338 Mon Sep 17 00:00:00 2001
+From 5f0e4a4335c22c18353c2b1941b4f6189cfacc36 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 612e32faf5..2a6aaeff60 100644
+index 2c8bdf5c77..8cc3ca6f56 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3412,6 +3412,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3405,6 +3405,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 88%
rename from package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index a1d2ef3255..9a80d3812c 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 146730a04dfe98e3d7971ebf5410801ceae88e11 Mon Sep 17 00:00:00 2001
+From 905eb83fff4f109c41c6e65fffe1a385d8b5763a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 2a6aaeff60..21479bbd7d 100644
+index 8cc3ca6f56..036ebfecf3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3418,6 +3418,24 @@ AC_ARG_ENABLE(readline,
+@@ -3411,6 +3411,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
similarity index 96%
rename from package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
index 4478b40162..85e6fab6bb 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
@@ -1,4 +1,4 @@
-From 106d9378c61e7fa9cad0a63ba068668d54cd11b8 Mon Sep 17 00:00:00 2001
+From 51769fc22d5767a89f37e0a0c4340f27bfa706b2 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 6 Oct 2017 09:54:15 -0500
 Subject: [PATCH] python-config.sh: don't reassign ${prefix}
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
similarity index 89%
rename from package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
rename to package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
index 1bf5fc6db4..0f1ebbdfe5 100644
--- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
+++ b/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
@@ -1,4 +1,4 @@
-From d7b90b157eddefbd0ed59e35c90b083c0c03b644 Mon Sep 17 00:00:00 2001
+From 4d58e2de03b68652c94be39df97532cbc7e23745 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Fri, 20 Jul 2018 10:17:39 -0400
 Subject: [PATCH] Fix cross compiling the uuid module
@@ -20,10 +20,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 3d0c74bb7f..c7be85f352 100644
+index fd1edac1e5..36a4103fd1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1764,7 +1764,8 @@ class PyBuildExt(build_ext):
+@@ -1850,7 +1850,8 @@ def detect_multiprocessing(self):
  
      def detect_uuid(self):
          # Build the _uuid module if possible
diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
similarity index 82%
rename from package/python3/0031-Add-an-option-to-disable-uuid-module.patch
rename to package/python3/0030-Add-an-option-to-disable-uuid-module.patch
index 92b24b211d..c431f9c21b 100644
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
@@ -1,4 +1,4 @@
-From 3bb693408eda77dda145ec5fecee56ea73031e9f Mon Sep 17 00:00:00 2001
+From 9b01122b4d924ddc4c81103224501489dc0af50f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 18 Aug 2018 10:54:56 +0200
 Subject: [PATCH] Add an option to disable uuid module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 21479bbd7d..615c16aced 100644
+index 036ebfecf3..2f1d515aa2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3454,6 +3454,15 @@ if test "$CURSES" = "no"; then
+@@ -3447,6 +3447,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
diff --git a/package/python3/0032-fix-building-on-older-distributions.patch b/package/python3/0031-fix-building-on-older-distributions.patch
similarity index 95%
rename from package/python3/0032-fix-building-on-older-distributions.patch
rename to package/python3/0031-fix-building-on-older-distributions.patch
index fb59e593f4..fe92df268b 100644
--- a/package/python3/0032-fix-building-on-older-distributions.patch
+++ b/package/python3/0031-fix-building-on-older-distributions.patch
@@ -1,4 +1,4 @@
-From 94c62f96ca61f1a28124c837d7ec5ed0b9ae8786 Mon Sep 17 00:00:00 2001
+From 08a1665c6c3caae31973e8489351c57d723a5343 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 16 Aug 2018 14:52:37 -0700
 Subject: [PATCH] fix building on older distributions
diff --git a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 93%
rename from package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index f70990b254..cd73c93f9f 100644
--- a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From edc0757c56090364e0a95aabfa9f645a16a27569 Mon Sep 17 00:00:00 2001
+From a1318185911e51c9a2766e66943301ba15cd378a Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -29,10 +29,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 615c16aced..241298e6cf 100644
+index 2f1d515aa2..92a36eb05e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -727,7 +727,9 @@ then
+@@ -717,7 +717,9 @@ then
  fi
  
  
diff --git a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
similarity index 80%
rename from package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
rename to package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
index a4e8baf4dd..8d4f4b8005 100644
--- a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -1,4 +1,4 @@
-From cf4d7fd9f7cb6c1ced32ee323b2b5755640051b7 Mon Sep 17 00:00:00 2001
+From 7e2393c5f9153eb83a288090ff577d5bf719df52 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 11 Apr 2020 22:01:40 +0200
 Subject: [PATCH] Add an option to disable the berkeleydb module
@@ -9,10 +9,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 72c1d86e82..8c3912d237 100644
+index 92a36eb05e..cb045ef0c2 100644
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
+2.25.1
 
diff --git a/package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 95%
rename from package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 880277eb1d..207dc2edf1 100644
--- a/package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -1,4 +1,4 @@
-From 3c83eedcc2df3ecf6c4a17953ca24dff60c1378e Mon Sep 17 00:00:00 2001
+From f0f7480c7b22513350f1f0339fe8845a8b59b452 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 12 Nov 2020 00:16:18 +0100
 Subject: [PATCH] lib/crypt: uClibc-ng doesn't set errno when encryption method
@@ -36,5 +36,5 @@ index 33dbc46bb3..4692a5270c 100644
          raise
      if result and len(result) == method.total_size:
 -- 
-2.25.4
+2.25.1
 
diff --git a/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch b/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
similarity index 85%
rename from package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
rename to package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
index fbe44c7753..d5dbd19335 100644
--- a/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
+++ b/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
@@ -1,4 +1,4 @@
-From 331966be70c371b268a4fcce9e97280cd869f137 Mon Sep 17 00:00:00 2001
+From 18ab8835f41494830c6661a9081faa96458cb4e9 Mon Sep 17 00:00:00 2001
 From: Jakub Kulik <kulikjak@gmail.com>
 Date: Mon, 15 Mar 2021 08:49:28 +0100
 Subject: [PATCH] Fix dictionary iteration error in _ExecutorManagerThread
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/concurrent/futures/process.py b/Lib/concurrent/futures/process.py
-index 90bc98bf2ec..e3b36dff572 100644
+index 764719859f..9c4a6e3dd0 100644
 --- a/Lib/concurrent/futures/process.py
 +++ b/Lib/concurrent/futures/process.py
-@@ -373,7 +373,7 @@ class _ExecutorManagerThread(threading.Thread):
+@@ -373,7 +373,7 @@ def wait_result_broken_or_wakeup(self):
          assert not self.thread_wakeup._closed
          wakeup_reader = self.thread_wakeup._reader
          readers = [result_reader, wakeup_reader]
@@ -25,5 +25,5 @@ index 90bc98bf2ec..e3b36dff572 100644
  
          cause = None
 -- 
-2.31.1
+2.25.1
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 444dbd982a..f79b042dfe 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-397/
-md5  fddb060b483bc01850a3f412eea1d954  Python-3.9.7.tar.xz
+# From https://www.python.org/downloads/release/python-3100/
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
