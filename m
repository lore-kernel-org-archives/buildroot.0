Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F10C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 13:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BBF80B5A;
	Tue, 25 Oct 2022 13:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73BBF80B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EP9fQJUn6tfZ; Tue, 25 Oct 2022 13:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81976812B2;
	Tue, 25 Oct 2022 13:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81976812B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 168B51BF425
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 13:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2356812B2
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 13:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2356812B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oO2SyzNhE7ST for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 13:58:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 308F281287
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 308F281287
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 13:58:23 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id x16so4302167ilm.5
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l0bebCrZd1cOobKEvpq1tXM9K6ijhk6KUHuuuYW0RqM=;
 b=PErOKqPA3eujxoyOM0hD8tI4MjWj1fTo629EJZHqr8c/fDtyUYm1lfQd6KnSvp02xg
 VKVDAtkCmasB5exHm7dQWQjZhgIzlOwe/dDvHcQLq9I4hcLOro/AB0mzPhZAxP3AxMl6
 FQclFLnSKTSA3hNSZ3IUNrOCbLwMN3eM2cIO9g5yyqJgUI2e3hPG4IUYFdmoxYVjYKpt
 A/2NfOapc0pyIVWI/tYhuuqF6jUN7HRDo6j64UTQ2gI3fkK5XSoDpx4Ysu0CloZa4UFj
 85pdFOnX3Ztw+EvcNYqG5ZcRmH+hAMss+qzFK5NJMXmY8BcRNo9P/O8OQ03Udgj9wo1W
 afdA==
X-Gm-Message-State: ACrzQf2VNMYNUhBBNsIstugHOE8/ndUs7GHLqxP99LfTCyGCD8decQkx
 h+/eC8riNTY6p233pwBhNwcCYcpNvFY2IQ==
X-Google-Smtp-Source: AMsMyM5J7PIsTL3EG3M2sJlCoVwxuH9RId3oaKWD2UentWv5a1NREOYgL321Z4K4sJRQWQ1zxowaeg==
X-Received: by 2002:a05:6e02:194e:b0:2f8:fa94:9da1 with SMTP id
 x14-20020a056e02194e00b002f8fa949da1mr23707733ilu.102.1666706301460; 
 Tue, 25 Oct 2022 06:58:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056e02101100b002f584a19a79sm1031307ilj.34.2022.10.25.06.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 06:58:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 07:58:13 -0600
Message-Id: <20221025135813.2387865-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l0bebCrZd1cOobKEvpq1tXM9K6ijhk6KUHuuuYW0RqM=;
 b=UPIpBi6Qehu9kT3s8QLs/Bv1drwBW93mSb8gXdMRn9hfCI43++1o7hhXmrCcj0auba
 1kRq+VzGtbTeI1Dk/uPzfRAWu+d5FrZ2MDqEvz8CXzEhvjppwqyObBrMXJeOGZZ5qMT7
 fA/NZGC/HGabvwYKdEIpPK3iHClS9AH7Am5rnzxLfnE9kbqVfc1yOKdfL4yqnPLdP84Y
 F7E+/HrPIY2EOjZtDgZu+CbTq8vhoOru8saVH8eASwwysCCz6AZTtj420EELh9OOSs6M
 addnHcPqXlCcAlPjABwdhGjI5pq0syExWDlimGppjfjvTxswRHI9jlglrNyqXwbjh0+o
 CXOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UPIpBi6Q
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.11.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-pkgconf host python3 dependency.

Set new --with-build-python conf options for target python build.

Drop Fix cross compiling the uuid module patch which is no longer
required as pkgconfig is now used for include directory detection.

Refresh patches.

License hash changed due to year update:
https://github.com/python/cpython/commit/ba00f0d93a4aea85ae8089f139856a7c450584d7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...e-the-build-of-pyc-files-conditional.patch | 14 +++---
 ...taddrinfo-configure-test-when-cross-.patch | 20 ++++----
 ...re-to-disable-the-build-of-certain-e.patch | 32 ++++++------
 ...y-header-paths-for-cross-compilation.patch | 12 ++---
 ...ook-in-usr-lib-termcap-for-libraries.patch | 10 ++--
 .../0006-Don-t-add-multiarch-paths.patch      |  8 +--
 .../0007-Abort-on-failed-module-build.patch   |  8 +--
 .../0008-Serial-ioctl-workaround.patch        |  6 +--
 ...e-shebang-of-Python-scripts-for-cros.patch |  6 +--
 ...ig.sh.in-ensure-sed-invocations-only.patch |  4 +-
 .../0011-Add-an-option-to-disable-pydoc.patch | 32 ++++++------
 ...012-Add-an-option-to-disable-lib2to3.patch | 43 ++++++++--------
 ...option-to-disable-the-sqlite3-module.patch | 37 ++++++--------
 ...d-an-option-to-disable-the-tk-module.patch | 24 ++++-----
 ...-option-to-disable-the-curses-module.patch | 18 +++----
 .../0016-Add-an-option-to-disable-expat.patch | 49 +++++++------------
 ...-Add-an-option-to-disable-CJK-codecs.patch |  8 +--
 .../0018-Add-an-option-to-disable-NIS.patch   |  8 +--
 ...Add-an-option-to-disable-unicodedata.patch |  8 +--
 .../0020-Add-an-option-to-disable-IDLE.patch  | 26 +++++-----
 ...021-Add-an-option-to-disable-decimal.patch | 36 +++++---------
 ...on-to-disable-the-ossaudiodev-module.patch | 14 +++---
 ...an-option-to-disable-openssl-support.patch |  8 +--
 ...ption-to-disable-the-readline-module.patch |  8 +--
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  8 +--
 ...thon-config.sh-don-t-reassign-prefix.patch |  6 +--
 ...dd-an-option-to-disable-uuid-module.patch} |  8 +--
 ...-Fix-cross-compiling-the-uuid-module.patch | 43 ----------------
 ...-fix-building-on-older-distributions.patch | 47 ++++++++++++++++++
 ...p-CC-print-multiarch-output-for-mus.patch} |  8 +--
 ...-fix-building-on-older-distributions.patch | 38 --------------
 ...on-to-disable-the-berkeleydb-module.patch} |  8 +--
 ...ng-doesn-t-set-errno-when-encryptio.patch} |  8 +--
 package/python3/python3.hash                  |  4 +-
 package/python3/python3.mk                    | 12 +++--
 35 files changed, 285 insertions(+), 344 deletions(-)
 rename package/python3/{0028-Add-an-option-to-disable-uuid-module.patch => 0027-Add-an-option-to-disable-uuid-module.patch} (81%)
 delete mode 100644 package/python3/0027-Fix-cross-compiling-the-uuid-module.patch
 create mode 100644 package/python3/0028-fix-building-on-older-distributions.patch
 rename package/python3/{0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (91%)
 delete mode 100644 package/python3/0029-fix-building-on-older-distributions.patch
 rename package/python3/{0031-Add-an-option-to-disable-the-berkeleydb-module.patch => 0030-Add-an-option-to-disable-the-berkeleydb-module.patch} (80%)
 rename package/python3/{0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (89%)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index d3b5368903..92aa7274ba 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 322724e166d7ec0393aec577c12fdf6ef2b61e1d Mon Sep 17 00:00:00 2001
+From 51ed7f93cc0333efa8fccd9b88db713c48993df9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 77f91e72b1..0c809f3d8a 100644
+index 8fbcd7ac17..2957c8e5a1 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1600,6 +1600,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -2078,6 +2078,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 77f91e72b1..0c809f3d8a 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -1627,6 +1628,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -2105,6 +2106,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -35,10 +35,10 @@ index 77f91e72b1..0c809f3d8a 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index d60f05251a..1ee5a09588 100644
+index ab5e1de6fa..0cf89ed641 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1110,6 +1110,12 @@ fi
+@@ -1441,6 +1441,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -52,5 +52,5 @@ index d60f05251a..1ee5a09588 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 411b8dae4e..5389cb5d15 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 72e20220f3a592b3ab9f440fbe74efa9f9e82d49 Mon Sep 17 00:00:00 2001
+From b180ab302e2a82be239af334382436628b81381e Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,18 +10,18 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1ee5a09588..c2445edc88 100644
+index 0cf89ed641..830885fcb3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4230,7 +4230,7 @@ fi
+@@ -5086,7 +5086,7 @@ fi]))
+ dnl if ac_cv_func_getaddrinfo
+ ])
  
- AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
- 
--if test $have_getaddrinfo = no || test "$ac_cv_buggy_getaddrinfo" = yes
-+if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
+-if test "$ac_cv_func_getaddrinfo" = no -o "$ac_cv_buggy_getaddrinfo" = yes
++if test "$ac_cv_func_getaddrinfo" = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
  then
- 	if test $ipv6 = yes
- 	then
+   AS_VAR_IF([ipv6], [yes], [
+     AC_MSG_ERROR([m4_normalize([
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 7ac0f39d06..5b3911374e 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From df7c95b4ceecf390b961d843a556c470ac9080b2 Mon Sep 17 00:00:00 2001
+From 8e02cebdac536dfb6748da2c50656a26f70d9da7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,10 +44,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0c809f3d8a..7c3dde8dd4 100644
+index 2957c8e5a1..c1cfb96767 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -218,6 +218,8 @@ FILEMODE=	644
+@@ -239,6 +239,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,18 +56,18 @@ index 0c809f3d8a..7c3dde8dd4 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -628,6 +630,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -739,6 +741,7 @@ sharedmods: $(PYTHON_FOR_BUILD_DEPS) pybuilddir.txt @LIBMPDEC_INTERNAL@ @LIBEXPA
+ 	    *) quiet="";; \
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
 +		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1748,7 +1751,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+ 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
+@@ -2228,7 +2231,8 @@ libainstall: all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
- sharedinstall: sharedmods
+ sharedinstall: all
 -	$(RUNSHARED) $(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
 +	$(RUNSHARED) DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
 +		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
@@ -75,12 +75,12 @@ index 0c809f3d8a..7c3dde8dd4 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index c2445edc88..73d66167de 100644
+index 830885fcb3..5a6a1fe608 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3091,6 +3091,8 @@ LIBS="$withval $LIBS"
- 
- PKG_PROG_PKG_CONFIG
+@@ -3562,6 +3562,8 @@ LIBS="$withval $LIBS"
+ ],
+ [AC_MSG_RESULT(no)])
  
 +AC_SUBST(DISABLED_EXTENSIONS)
 +
@@ -88,11 +88,11 @@ index c2445edc88..73d66167de 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 770866bca7..b6c829b3a5 100644
+index 15d0d4576a..e496ee34c2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -58,7 +58,10 @@ with warnings.catch_warnings():
- TEST_EXTENSIONS = (sysconfig.get_config_var('TEST_MODULES') == 'yes')
+@@ -56,7 +56,10 @@
+ 
  
  # This global variable is used to hold the list of modules to be disabled.
 -DISABLED_MODULE_LIST = []
@@ -104,5 +104,5 @@ index 770866bca7..b6c829b3a5 100644
  # --list-module-names option used by Tools/scripts/generate_module_names.py
  LIST_MODULE_NAMES = False
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 0311348405..9a55d2582d 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 61af65485f1dade4aa08d0cf2b24082aeda24c51 Mon Sep 17 00:00:00 2001
+From 132b9dca3bb4d4682f7e318648ce11e1abb31b62 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -23,10 +23,10 @@ Refresh for 3.10.0
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index 1a9bd12..3cf7d67 100644
+index f287b34998..298234d6a1 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -234,7 +234,10 @@ class build_ext(Command):
+@@ -234,7 +234,10 @@ def finalize_options(self):
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
              if not sysconfig.python_build:
                  # building third party extensions
@@ -39,10 +39,10 @@ index 1a9bd12..3cf7d67 100644
                  # building python standard extensions
                  self.library_dirs.append('.')
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 95b48f6..9fb1956 100644
+index ebe3711827..6328ec41af 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -123,10 +123,17 @@ _SCHEME_KEYS = ('stdlib', 'platstdlib', 'purelib', 'platlib', 'include',
+@@ -168,10 +168,17 @@ def joinuser(*args):
  _PY_VERSION = sys.version.split()[0]
  _PY_VERSION_SHORT = f'{sys.version_info[0]}.{sys.version_info[1]}'
  _PY_VERSION_SHORT_NO_DOT = f'{sys.version_info[0]}{sys.version_info[1]}'
@@ -65,5 +65,5 @@ index 95b48f6..9fb1956 100644
  _USER_BASE = None
  
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 3e224995a5..78b3ae596d 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 60d71e37d167ea89445250be436170a6cfee84e7 Mon Sep 17 00:00:00 2001
+From 5d13e384b30a2c0b1c7b65718590b7fb0c3ba55e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 66d372a..e632b6f 100644
+index e496ee34c2..1904898165 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1147,12 +1147,9 @@ class PyBuildExt(build_ext):
+@@ -1107,12 +1107,9 @@ def detect_readline_curses(self):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -23,9 +23,9 @@ index 66d372a..e632b6f 100644
                  readline_libs.append('termcap')
              self.add(Extension('readline', ['readline.c'],
 -                               library_dirs=['/usr/lib/termcap'],
-                                extra_link_args=readline_extra_link_args,
                                 libraries=readline_libs))
          else:
+             self.missing.append('readline')
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index 48d8cc790e..749e295df1 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From f5933b8f973cd11698b52d535a10d0474e49f5a5 Mon Sep 17 00:00:00 2001
+From ad463b5d58ae79f69b011fb048861bd874d34369 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index ec3ba60607..e27620035c 100644
+index 1904898165..32294546b6 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -830,10 +830,10 @@ class PyBuildExt(build_ext):
+@@ -852,10 +852,10 @@ def configure_compiler(self):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
@@ -33,5 +33,5 @@ index ec3ba60607..e27620035c 100644
  
      def init_inc_lib_dirs(self):
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 32e2261a05..a473896127 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 188c0ebfdb71f5252fa7701013b8d1209f28aef7 Mon Sep 17 00:00:00 2001
+From 60b1664a7acebadb1a3d6df871145147f33b5afe Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index e27620035c..d3f0e663f2 100644
+index 32294546b6..0e04944ce0 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -561,6 +561,7 @@ class PyBuildExt(build_ext):
+@@ -579,6 +579,7 @@ def print_three_column(lst):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
@@ -26,5 +26,5 @@ index e27620035c..d3f0e663f2 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index df31cd6220..7722a04f38 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 9e6211b0d6d4610e5fb7d2c7e1152eb7c64d968b Mon Sep 17 00:00:00 2001
+From 90f3075b629d90d942da1d22ef7563f7149f4f6c Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -15,7 +15,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  1 file changed, 2 insertions(+)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index 75e5e52320..eefbddfe69 100644
+index 354e5ca18d..c08957c500 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -15,7 +15,9 @@
@@ -29,5 +29,5 @@ index 75e5e52320..eefbddfe69 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (apparently used internally by some things
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 8a77fe3708..eff8fc7694 100644
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From cb595a591c71e0bf7c63a3706b0be45ac6a642e3 Mon Sep 17 00:00:00 2001
+From 2439bd2ed5dbdd7e5fda15adefd0f6f1b047ec1b Mon Sep 17 00:00:00 2001
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
  
@@ -31,5 +31,5 @@ index ccc70e6465..d6d54195c1 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index a1f9ab6cd9..f26ee85b61 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From eb51497e4b5799f8ab0277426d3e54414acb9d4b Mon Sep 17 00:00:00 2001
+From 55ef5552e4ee60266e3299f253bec3b13785e585 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -63,5 +63,5 @@ index 2602fe24c0..a1bc3cd5f7 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch b/package/python3/0011-Add-an-option-to-disable-pydoc.patch
index a843c8c126..f7bfd437bb 100644
--- a/package/python3/0011-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0011-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From a65e5d3caf8e076d531191164c23c6240461f675 Mon Sep 17 00:00:00 2001
+From 38b7f7949258aeadf8bc45525be91340bb732a2a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -19,10 +19,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  3 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c0d5511..32b3df7 100644
+index c1cfb96767..403380e181 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1391,7 +1391,9 @@ bininstall: altbininstall
+@@ -1864,7 +1864,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -32,15 +32,15 @@ index c0d5511..32b3df7 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1442,7 +1444,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1915,7 +1917,6 @@ LIBSUBDIRS=	asyncio \
  		lib2to3 lib2to3/fixes lib2to3/pgen2 \
  		logging \
  		multiprocessing multiprocessing/dummy \
 -		pydoc_data \
+ 		re \
  		site-packages \
  		sqlite3 \
- 		tkinter \
-@@ -1530,6 +1531,10 @@ TESTSUBDIRS=	ctypes/test \
+@@ -2008,6 +2009,10 @@ TESTSUBDIRS=	ctypes/test \
  		tkinter/test/test_ttk \
  		unittest/test unittest/test/testmock
  
@@ -49,15 +49,15 @@ index c0d5511..32b3df7 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 083a12d..9079531 100644
+index 5a6a1fe608..f68ea72321 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3373,6 +3373,12 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_getcpuclockid)
- fi
+@@ -4171,6 +4171,12 @@ AS_VAR_IF([posix_threads], [stub], [
+   AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
+ ])
  
 +AC_SUBST(PYDOC)
 +
@@ -65,14 +65,14 @@ index 083a12d..9079531 100644
 +	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
 +	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
 +
- 
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
+ AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index d00d389..d23f148 100644
+index 0e04944ce0..3e55f5b2e0 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2721,6 +2721,12 @@ def main():
+@@ -1593,6 +1593,12 @@ class DummyProcess:
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -85,7 +85,7 @@ index d00d389..d23f148 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2746,8 +2752,7 @@ def main():
+@@ -1617,8 +1623,7 @@ class DummyProcess:
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -96,5 +96,5 @@ index d00d389..d23f148 100644
  
  # --install-platlib
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch b/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
index c8f2e528bf..0085d5a63f 100644
--- a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From f034b1b0f33a7bd4dde23f0bc1fa8e00e3518c9d Mon Sep 17 00:00:00 2001
+From 0e4f0a525ea0a68f6d4c5349c301da2e9b0c8ac9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -14,15 +14,15 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 17 ++++++++++++-----
- configure.ac    |  5 +++++
+ configure.ac    |  6 ++++++
  setup.py        |  6 +++---
- 3 files changed, 20 insertions(+), 8 deletions(-)
+ 3 files changed, 21 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 28cf88e..63fa9fb 100644
+index 403380e181..f5d0573067 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1395,7 +1395,9 @@ ifeq (@PYDOC@,yes)
+@@ -1868,7 +1868,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -32,15 +32,15 @@ index 28cf88e..63fa9fb 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1441,7 +1443,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1914,7 +1916,6 @@ LIBSUBDIRS=	asyncio \
  		idlelib idlelib/Icons \
- 		importlib importlib/metadata \
+ 		importlib importlib/resources importlib/metadata \
  		json \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 \
  		logging \
  		multiprocessing multiprocessing/dummy \
- 		site-packages \
-@@ -1458,10 +1459,6 @@ LIBSUBDIRS=	asyncio \
+ 		re \
+@@ -1934,10 +1935,6 @@ LIBSUBDIRS=	asyncio \
  TESTSUBDIRS=	ctypes/test \
  		distutils/tests \
  		idlelib/idle_test \
@@ -48,10 +48,10 @@ index 28cf88e..63fa9fb 100644
 -		lib2to3/tests/data \
 -		lib2to3/tests/data/fixers \
 -		lib2to3/tests/data/fixers/myfixes \
- 		sqlite3/test \
  		test test/audiodata \
  		test/capath test/cjkencodings \
-@@ -1535,6 +1532,14 @@ ifeq (@PYDOC@,yes)
+ 		test/data test/decimaltestdata \
+@@ -2013,6 +2010,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -64,9 +64,9 @@ index 28cf88e..63fa9fb 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
-@@ -1637,10 +1642,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -2115,10 +2120,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -80,26 +80,27 @@ index 28cf88e..63fa9fb 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 9079531..34c2ba9 100644
+index f68ea72321..d8e10cf2b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6014,6 +6014,11 @@ else
- fi
- AC_SUBST(TEST_MODULES)
+@@ -7078,6 +7078,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
+ # substitute multiline block, must come after last PY_STDLIB_MOD()
+ AC_SUBST([MODULE_BLOCK])
  
 +AC_SUBST(LIB2TO3)
 +
 +AC_ARG_ENABLE(lib2to3,
 +	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
 +	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
- 
++
  # generate output files
  AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
+ AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
 diff --git a/setup.py b/setup.py
-index d23f148..663fd44 100644
+index 3e55f5b2e0..c490b0b08f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2722,11 +2722,11 @@ def main():
+@@ -1594,11 +1594,11 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -115,5 +116,5 @@ index d23f148..663fd44 100644
            name = "Python",
            version = sys.version.split()[0],
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
index 81fa52bb73..795ea3b898 100644
--- a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From dd2722dec08eb9c72c36313e93661eeca3ad64d8 Mon Sep 17 00:00:00 2001
+From ef8c030e01b1be8be582e90c31298a5863094858 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -10,49 +10,40 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 7 +++++--
+ Makefile.pre.in | 5 ++++-
  configure.ac    | 9 +++++++++
- 2 files changed, 14 insertions(+), 2 deletions(-)
+ 2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5847029..5628860 100644
+index f5d0573067..9f4cdf14cf 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1446,7 +1446,6 @@ LIBSUBDIRS=	asyncio \
- 		logging \
+@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
  		multiprocessing multiprocessing/dummy \
+ 		re \
  		site-packages \
 -		sqlite3 \
  		tkinter \
+ 		tomllib \
  		turtledemo \
- 		unittest \
-@@ -1459,7 +1458,6 @@ LIBSUBDIRS=	asyncio \
- TESTSUBDIRS=	ctypes/test \
- 		distutils/tests \
- 		idlelib/idle_test \
--		sqlite3/test \
- 		test test/audiodata \
- 		test/capath test/cjkencodings \
- 		test/data test/decimaltestdata \
-@@ -1540,6 +1538,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -2018,6 +2017,10 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
 +ifeq (@SQLITE3@,yes)
 +LIBSUBDIRS += sqlite3
-+TESTSUBDIRS += sqlite3/test
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 34c2ba9..dfee472 100644
+index d8e10cf2b2..4cc0951ab9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3373,6 +3373,15 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_getcpuclockid)
- fi
+@@ -4171,6 +4171,15 @@ AS_VAR_IF([posix_threads], [stub], [
+   AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
+ ])
  
 +AC_SUBST(SQLITE3)
 +AC_ARG_ENABLE(sqlite3,
@@ -67,5 +58,5 @@ index 34c2ba9..dfee472 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
index db79f5691f..04f7e34435 100644
--- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From ad6b66b34f71ff6b60b3be5f6fd3e781cdeecd59 Mon Sep 17 00:00:00 2001
+From bbbfe699d648a5cb191203b16e1786e8cf4ea908 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -15,18 +15,18 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 16 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5628860..c968113 100644
+index 9f4cdf14cf..4f83911200 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1446,7 +1446,6 @@ LIBSUBDIRS=	asyncio \
- 		logging \
+@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
  		multiprocessing multiprocessing/dummy \
+ 		re \
  		site-packages \
 -		tkinter \
+ 		tomllib \
  		turtledemo \
  		unittest \
- 		urllib \
-@@ -1522,8 +1521,6 @@ TESTSUBDIRS=	ctypes/test \
+@@ -2001,8 +2000,6 @@ TESTSUBDIRS=	ctypes/test \
  		test/tracedmodules \
  		test/xmltestdata test/xmltestdata/c14n-20 \
  		test/ziptestdata \
@@ -35,8 +35,8 @@ index 5628860..c968113 100644
  		unittest/test unittest/test/testmock
  
  ifeq (@PYDOC@,yes)
-@@ -1543,6 +1540,13 @@ LIBSUBDIRS += sqlite3
- TESTSUBDIRS += sqlite3/test
+@@ -2021,6 +2018,13 @@ ifeq (@SQLITE3@,yes)
+ LIBSUBDIRS += sqlite3
  endif
  
 +ifeq (@TK@,yes)
@@ -47,13 +47,13 @@ index 5628860..c968113 100644
 +
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index dfee472..dc76dff 100644
+index 4cc0951ab9..f4ce506801 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3382,6 +3382,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -4180,6 +4180,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -70,5 +70,5 @@ index dfee472..dc76dff 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
index 35d92fb7d1..da6f891104 100644
--- a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 962deb43f5f340a8472d432ae8e6d61186f9040e Mon Sep 17 00:00:00 2001
+From 03e28cdd46dac1b7e4e9c8bbd2ea44b09e514205 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -10,15 +10,15 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in |  4 +++-
+ Makefile.pre.in | 4 +++-
  configure.ac    | 9 +++++++++
  2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c968113..f89f155 100644
+index 4f83911200..8e879b35c6 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1432,7 +1432,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1905,7 +1905,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures \
  		csv \
  		ctypes ctypes/macholib \
@@ -26,7 +26,7 @@ index c968113..f89f155 100644
  		dbm \
  		distutils distutils/command \
  		email email/mime \
-@@ -1546,6 +1545,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -2024,6 +2023,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -35,12 +35,12 @@ index c968113..f89f155 100644
 +endif
  
  TEST_MODULES=@TEST_MODULES@
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ libinstall:	all $(srcdir)/Modules/xxmodule.c
 diff --git a/configure.ac b/configure.ac
-index dc76dff..4f1cda5 100644
+index f4ce506801..0ae9863cd6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3391,6 +3391,15 @@ if test "$TK" = "no"; then
+@@ -4189,6 +4189,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -57,5 +57,5 @@ index dc76dff..4f1cda5 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0016-Add-an-option-to-disable-expat.patch b/package/python3/0016-Add-an-option-to-disable-expat.patch
index 83c89e1f68..c30740762a 100644
--- a/package/python3/0016-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0016-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 7e0e7dc25f50acd6922493ae620ee5cbf107a79a Mon Sep 17 00:00:00 2001
+From c9a2ea3edacf57746517600ccc11c254a9fd6c48 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -17,23 +17,22 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in |  5 ++++-
- configure.ac    | 18 +++++++++++++-----
- setup.py        |  2 +-
- 3 files changed, 18 insertions(+), 7 deletions(-)
+ configure.ac    | 20 ++++++++++++++------
+ 2 files changed, 18 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f89f155..08c5e8a 100644
+index 8e879b35c6..80d617cf7f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1450,7 +1450,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1925,7 +1925,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
 -		$(XMLLIBSUBDIRS) \
  		xmlrpc \
- 		zoneinfo
- TESTSUBDIRS=	ctypes/test \
-@@ -1549,6 +1548,10 @@ ifeq (@CURSES@,yes)
+ 		zoneinfo \
+ 		__phello__
+@@ -2027,6 +2026,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -42,13 +41,13 @@ index f89f155..08c5e8a 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 4f1cda5..e99a174 100644
+index 0ae9863cd6..201cad0bfc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3094,13 +3094,21 @@ PKG_PROG_PKG_CONFIG
+@@ -3565,15 +3565,23 @@ LIBS="$withval $LIBS"
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -64,7 +63,8 @@ index 4f1cda5..e99a174 100644
  
 -AC_MSG_RESULT($with_system_expat)
 +AC_MSG_RESULT($with_expat)
-+
+ 
+-AS_VAR_IF([with_system_expat], [yes], [
 +if test "$with_expat" != "none"; then
 +   EXPAT=yes
 +else
@@ -72,22 +72,11 @@ index 4f1cda5..e99a174 100644
 +   EXPAT=no
 +fi
 +AC_SUBST(EXPAT)
- 
- # Check for use of the system libffi library
- AC_MSG_CHECKING(for --with-system-ffi)
-diff --git a/setup.py b/setup.py
-index 663fd44..e30ed52 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1764,7 +1764,7 @@ class PyBuildExt(build_ext):
-         #
-         # More information on Expat can be found at www.libexpat.org.
-         #
--        if '--with-system-expat' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        if '--with-expat=system' in sysconfig.get_config_var("CONFIG_ARGS"):
-             expat_inc = []
-             define_macros = []
-             extra_compile_args = []
++
++AS_VAR_IF([with_expat], [system], [
+   LIBEXPAT_CFLAGS=${LIBEXPAT_CFLAGS-""}
+   LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
+   LIBEXPAT_INTERNAL=
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
index 2afcf4526d..63a07fb514 100644
--- a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From 2c0d31bb91fc7f94283c3ab632925fbbe24e94d6 Mon Sep 17 00:00:00 2001
+From d8ef6a7a9f2b954cf1c1e37fc3c35055b42af0f5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 9ef0ecd42f..18e6fd70a0 100644
+index 201cad0bfc..ecdd7dbc07 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3390,6 +3390,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -4188,6 +4188,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index 9ef0ecd42f..18e6fd70a0 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b/package/python3/0018-Add-an-option-to-disable-NIS.patch
index d8fe3616c0..977955d1cb 100644
--- a/package/python3/0018-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0018-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From 2041d0c8dba87991edaf088b16e37b5189a3466d Mon Sep 17 00:00:00 2001
+From 09fc9f72ebe60bb65e80732a6bd4f12a84159f6d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 18e6fd70a0..46d2a8131e 100644
+index ecdd7dbc07..1bdde7f69d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3396,6 +3396,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -4194,6 +4194,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index 18e6fd70a0..46d2a8131e 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
index 3519377b5e..74702b67a5 100644
--- a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From dd82a401ff6ba4ba116bf4d520e981a1808ed443 Mon Sep 17 00:00:00 2001
+From 4fe7f375a3d171d294caebdd7b7ce49bbc9ad9f3 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 46d2a8131e..5844e3b73f 100644
+index 1bdde7f69d..ba4b0e0c1c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3402,6 +3402,12 @@ AC_ARG_ENABLE(nis,
+@@ -4200,6 +4200,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index 46d2a8131e..5844e3b73f 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch b/package/python3/0020-Add-an-option-to-disable-IDLE.patch
index f09037f7db..09b5f13cdb 100644
--- a/package/python3/0020-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0020-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From f1b15834045d0641c43014b970721df066fa71f7 Mon Sep 17 00:00:00 2001
+From 2c9dbd6d49744aa8da8ebf8d0187d6b06f93c2b5 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -18,10 +18,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  3 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 08c5e8a..461c5e3 100644
+index 80d617cf7f..8d1ba1356c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1389,7 +1389,9 @@ bininstall: altbininstall
+@@ -1862,7 +1862,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -31,15 +31,15 @@ index 08c5e8a..461c5e3 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1439,7 +1441,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1912,7 +1914,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
 -		idlelib idlelib/Icons \
- 		importlib importlib/metadata \
+ 		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -1552,6 +1553,10 @@ ifeq (@EXPAT@,yes)
+@@ -2030,6 +2031,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -48,13 +48,13 @@ index 08c5e8a..461c5e3 100644
 +endif
 +
  TEST_MODULES=@TEST_MODULES@
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index e99a174..baaa743 100644
+index ba4b0e0c1c..5e6d72f7db 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6073,6 +6073,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -7137,6 +7137,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -66,12 +66,12 @@ index e99a174..baaa743 100644
 +
  # generate output files
  AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
- AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
+ AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
 diff --git a/setup.py b/setup.py
-index e30ed52..4dff249 100644
+index c490b0b08f..4d49a792f7 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2722,11 +2722,14 @@ def main():
+@@ -1594,11 +1594,14 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -88,5 +88,5 @@ index e30ed52..4dff249 100644
            name = "Python",
            version = sys.version.split()[0],
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.patch b/package/python3/0021-Add-an-option-to-disable-decimal.patch
index fd1887d603..d683565f94 100644
--- a/package/python3/0021-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0021-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From d5fe81cbd51da2a84ed89d1e4c80d921d4efce26 Mon Sep 17 00:00:00 2001
+From 7091fdf77f612425c178a75148560f9c3514e8b8 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -14,15 +14,14 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [james.hilliard1@gmail.com: adapt to python 3.9]
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
- configure.ac | 17 ++++++++++++-----
- setup.py     |  2 +-
- 2 files changed, 13 insertions(+), 6 deletions(-)
+ configure.ac | 19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7bd4623ccd..e513ef6a20 100644
+index 5e6d72f7db..e6b1f1e9de 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3145,13 +3145,20 @@ fi
+@@ -3630,14 +3630,21 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -34,9 +33,8 @@ index 7bd4623ccd..e513ef6a20 100644
 +            AS_HELP_STRING([--with-libmpdec], [select which libmpdec version to use: system, builtin, none]),
              [],
 -            [with_system_libmpdec="no"])
-+            [with_libmpdec="builtin"])
- 
 -AC_MSG_RESULT($with_system_libmpdec)
++            [with_libmpdec="builtin"])
 +AC_MSG_RESULT($with_libmpdec)
 +if test "$with_libmpdec" != "none"; then
 +   MPDEC=yes
@@ -46,21 +44,11 @@ index 7bd4623ccd..e513ef6a20 100644
 +fi
 +AC_SUBST(MPDEC)
  
- # Check whether _decimal should use a coroutine-local or thread-local context
- AC_MSG_CHECKING(for --with-decimal-contextvar)
-diff --git a/setup.py b/setup.py
-index c4ee989ba3..3d0c74bb7f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -2321,7 +2321,7 @@ class PyBuildExt(build_ext):
-         # Stefan Krah's _decimal module
-         extra_compile_args = []
-         undef_macros = []
--        if '--with-system-libmpdec' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        if '--with-libmpdec=system' in sysconfig.get_config_var("CONFIG_ARGS"):
-             include_dirs = []
-             libraries = ['mpdec']
-             sources = ['_decimal/_decimal.c']
+-AS_VAR_IF([with_system_libmpdec], [yes], [
++AS_VAR_IF([with_libmpdec], [system], [
+   LIBMPDEC_CFLAGS=${LIBMPDEC_CFLAGS-""}
+   LIBMPDEC_LDFLAGS=${LIBMPDEC_LDFLAGS-"-lmpdec"}
+   LIBMPDEC_INTERNAL=
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 0459b5a14d..56713a7f8f 100644
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From 9bedc56d2a4b8856162650a11c1fcb6ec38f160b Mon Sep 17 00:00:00 2001
+From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e513ef6a20..c07505e89e 100644
+index e6b1f1e9de..db33d567ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3175,6 +3175,12 @@ fi
+@@ -3678,6 +3678,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
@@ -22,9 +22,9 @@ index e513ef6a20..c07505e89e 100644
 +	  DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
 +	  fi])
 +
- # Check for support for loadable sqlite extensions
- AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
- AC_ARG_ENABLE(loadable-sqlite-extensions,
+ # Check for libmpdec machine flavor
+ AC_MSG_CHECKING(for decimal libmpdec machine)
+ AS_CASE([$ac_sys_system],
 -- 
-2.25.1
+2.34.1
 
diff --git a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
index 4801a27300..d4c9fd43be 100644
--- a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 90ed5c692b8b5596ca0b3ae1436276c8181251d8 Mon Sep 17 00:00:00 2001
+From 25c900e81a2fc0bbe35e7c94e2e5028cfbf6582a Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 08c148c..a81a24c 100644
+index db33d567ad..42fe6c8f5a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3421,6 +3421,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -4219,6 +4219,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index 08c148c..a81a24c 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
index adb04d69ea..9250007dae 100644
--- a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From 049e7a51e1ffd0d28d6608c707ab4b54e816d338 Mon Sep 17 00:00:00 2001
+From 9082468ca620db77b670ccf568a96bbabb865f80 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index a81a24c..41a21ff 100644
+index 42fe6c8f5a..19875d7d30 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3427,6 +3427,12 @@ AC_ARG_ENABLE(openssl,
+@@ -4225,6 +4225,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index a81a24c..41a21ff 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index d466bc3a76..70a0d6cd15 100644
--- a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 146730a04dfe98e3d7971ebf5410801ceae88e11 Mon Sep 17 00:00:00 2001
+From 988a335cb34b5fc25ea345ba04ff5ddffe2e946c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 41a21ff..fa81bc7 100644
+index 19875d7d30..ca6c16491a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3433,6 +3433,24 @@ AC_ARG_ENABLE(readline,
+@@ -4231,6 +4231,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index 41a21ff..fa81bc7 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
index 814a9d42e5..b6bfb010a0 100644
--- a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
@@ -1,4 +1,4 @@
-From 106d9378c61e7fa9cad0a63ba068668d54cd11b8 Mon Sep 17 00:00:00 2001
+From 755fb526a62df2a73560f42184db8aadb6899bb0 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 6 Oct 2017 09:54:15 -0500
 Subject: [PATCH] python-config.sh: don't reassign ${prefix}
@@ -27,7 +27,7 @@ Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index a1bc3cd..164d2d3 100644
+index a1bc3cd5f7..164d2d3603 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
 @@ -31,7 +31,7 @@ prefix_real=$(installed_prefix "$0")
@@ -49,5 +49,5 @@ index a1bc3cd..164d2d3 100644
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0028-Add-an-option-to-disable-uuid-module.patch b/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
similarity index 81%
rename from package/python3/0028-Add-an-option-to-disable-uuid-module.patch
rename to package/python3/0027-Add-an-option-to-disable-uuid-module.patch
index fc4b64dc64..a9501ec189 100644
--- a/package/python3/0028-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
@@ -1,4 +1,4 @@
-From 3bb693408eda77dda145ec5fecee56ea73031e9f Mon Sep 17 00:00:00 2001
+From 58027d25c3cabcf654cb0b31a61d7cbd53dc68c0 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 18 Aug 2018 10:54:56 +0200
 Subject: [PATCH] Add an option to disable uuid module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index fa81bc7..4e733f6 100644
+index ca6c16491a..ed03b27fb1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3469,6 +3469,15 @@ if test "$CURSES" = "no"; then
+@@ -4267,6 +4267,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -29,5 +29,5 @@ index fa81bc7..4e733f6 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0027-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0027-Fix-cross-compiling-the-uuid-module.patch
deleted file mode 100644
index d19aedb6c1..0000000000
--- a/package/python3/0027-Fix-cross-compiling-the-uuid-module.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d7b90b157eddefbd0ed59e35c90b083c0c03b644 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Fri, 20 Jul 2018 10:17:39 -0400
-Subject: [PATCH] Fix cross compiling the uuid module
-
-Python 3.7 has a new _uuid module, however, the include directory
-search path for uuid.h is hardcoded to /usr/include/uuid, which should
-not be used when cross-compiling.
-
-To fix this, use the same solution as the one used by the NIS
-detection: append "uuid" to each of the include directories in
-"inc_dirs", instead of hardcoding /usr/include/uuid.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[Thomas: drop STAGING_DIR based solution, use a solution similar to
-the one used for the NIS detection.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 3d0c74bb7f..c7be85f352 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1866,10 +1866,10 @@ class PyBuildExt(build_ext):
- 
-     def detect_uuid(self):
-         # Build the _uuid module if possible
--        uuid_h = sysconfig.get_config_var("HAVE_UUID_H")
--        uuid_uuid_h = sysconfig.get_config_var("HAVE_UUID_UUID_H")
--        if uuid_h or uuid_uuid_h:
--            if sysconfig.get_config_var("HAVE_LIBUUID"):
-+        uuid_h = find_file("uuid.h", self.inc_dirs,
-+                               [os.path.join(inc_dir, 'uuid') for inc_dir in self.inc_dirs])
-+        if uuid_h is not None:
-+            if self.compiler.find_library_file(self.lib_dirs, 'uuid'):
-                 uuid_libs = ["uuid"]
-             else:
-                 uuid_libs = []
--- 
-2.25.1
-
diff --git a/package/python3/0028-fix-building-on-older-distributions.patch b/package/python3/0028-fix-building-on-older-distributions.patch
new file mode 100644
index 0000000000..4541b31c5f
--- /dev/null
+++ b/package/python3/0028-fix-building-on-older-distributions.patch
@@ -0,0 +1,47 @@
+From e52e2c5e3df4bc3d2ff07ecb3b8e2a9099ea1631 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Thu, 16 Aug 2018 14:52:37 -0700
+Subject: [PATCH] fix building on older distributions
+
+Python > 3.6.3 calls os.replace in the update_file.py script, during the
+regen-importlib phase of the build process.
+
+According to Doc/whatsnew/3.3.rst line 1631, os.replace acts in the same
+way as os.rename, however, it is now cross-platform compatible for Windows.
+
+Because BuildRoot is guaranteed only to be built in  POSIX environment, it is
+safe to change os.replace back to os.rename.
+
+This change fixes building on older systems such as CentOS7, that only come
+with python 2.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ Tools/scripts/update_file.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Tools/scripts/update_file.py b/Tools/scripts/update_file.py
+index b4182c1d0c..ab443cb1a6 100644
+--- a/Tools/scripts/update_file.py
++++ b/Tools/scripts/update_file.py
+@@ -53,7 +53,7 @@ def update_file_with_tmpfile(filename, tmpfile, *, create=False):
+         if not create:
+             raise  # re-raise
+         outcome = 'created'
+-        os.replace(tmpfile, filename)
++        os.rename(tmpfile, filename)
+     else:
+         with targetfile:
+             old_contents = targetfile.read()
+@@ -62,7 +62,7 @@ def update_file_with_tmpfile(filename, tmpfile, *, create=False):
+         # Now compare!
+         if old_contents != new_contents:
+             outcome = 'updated'
+-            os.replace(tmpfile, filename)
++            os.rename(tmpfile, filename)
+         else:
+             outcome = 'same'
+             os.unlink(tmpfile)
+-- 
+2.34.1
+
diff --git a/package/python3/0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 91%
rename from package/python3/0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index eff010fa22..5253076d90 100644
--- a/package/python3/0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From d009b0142f77881dd75ff760fec728dbc8581a03 Mon Sep 17 00:00:00 2001
+From 07b950aadd570b9f96a1f128505a959b32f40962 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -30,10 +30,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 913051c276..aba03f3779 100644
+index ed03b27fb1..841fd6732c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -876,7 +876,11 @@ AC_MSG_CHECKING([for multiarch])
+@@ -1086,7 +1086,11 @@ AC_MSG_CHECKING([for multiarch])
  AS_CASE([$ac_sys_system],
    [Darwin*], [MULTIARCH=""],
    [FreeBSD*], [MULTIARCH=""],
@@ -47,5 +47,5 @@ index 913051c276..aba03f3779 100644
  AC_SUBST([MULTIARCH])
  AC_MSG_RESULT([$MULTIARCH])
 -- 
-2.20.1
+2.34.1
 
diff --git a/package/python3/0029-fix-building-on-older-distributions.patch b/package/python3/0029-fix-building-on-older-distributions.patch
deleted file mode 100644
index fb59e593f4..0000000000
--- a/package/python3/0029-fix-building-on-older-distributions.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 94c62f96ca61f1a28124c837d7ec5ed0b9ae8786 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Thu, 16 Aug 2018 14:52:37 -0700
-Subject: [PATCH] fix building on older distributions
-
-Python > 3.6.3 calls os.replace in the update_file.py script, during the
-regen-importlib phase of the build process.
-
-According to Doc/whatsnew/3.3.rst line 1631, os.replace acts in the same
-way as os.rename, however, it is now cross-platform compatible for Windows.
-
-Because BuildRoot is guaranteed only to be built in  POSIX environment, it is
-safe to change os.replace back to os.rename.
-
-This change fixes building on older systems such as CentOS7, that only come
-with python 2.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Tools/scripts/update_file.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Tools/scripts/update_file.py b/Tools/scripts/update_file.py
-index 224585c69b..ef458c0c63 100644
---- a/Tools/scripts/update_file.py
-+++ b/Tools/scripts/update_file.py
-@@ -16,7 +16,7 @@ def main(old_path, new_path):
-     with open(new_path, 'rb') as f:
-         new_contents = f.read()
-     if old_contents != new_contents:
--        os.replace(new_path, old_path)
-+        os.rename(new_path, old_path)
-     else:
-         os.unlink(new_path)
- 
--- 
-2.25.1
-
diff --git a/package/python3/0031-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
similarity index 80%
rename from package/python3/0031-Add-an-option-to-disable-the-berkeleydb-module.patch
rename to package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
index 0c0d51a7eb..5fb436db59 100644
--- a/package/python3/0031-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -1,4 +1,4 @@
-From cf4d7fd9f7cb6c1ced32ee323b2b5755640051b7 Mon Sep 17 00:00:00 2001
+From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 11 Apr 2020 22:01:40 +0200
 Subject: [PATCH] Add an option to disable the berkeleydb module
@@ -9,10 +9,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 4e733f6..1e52f30 100644
+index 841fd6732c..06c9a81f95 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3480,6 +3480,12 @@ if test "$UUID" = "no"; then
+@@ -4280,6 +4280,12 @@ if test "$UUID" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
  fi
  
@@ -26,5 +26,5 @@ index 4e733f6..1e52f30 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 89%
rename from package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 0458283c18..712fd08fb1 100644
--- a/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -1,4 +1,4 @@
-From 3c83eedcc2df3ecf6c4a17953ca24dff60c1378e Mon Sep 17 00:00:00 2001
+From 3edeed879871a10acbe802f4a68cff3d4869dbde Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 12 Nov 2020 00:16:18 +0100
 Subject: [PATCH] lib/crypt: uClibc-ng doesn't set errno when encryption method
@@ -23,10 +23,10 @@ Signed-off-by: Daniel Lang <d.lang@abatec.at>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/crypt.py b/Lib/crypt.py
-index 33dbc46bb3..4692a5270c 100644
+index de4a14a388..ba482487a7 100644
 --- a/Lib/crypt.py
 +++ b/Lib/crypt.py
-@@ -94,7 +94,9 @@ def _add_method(name, *args, rounds=None):
+@@ -98,7 +98,9 @@ def _add_method(name, *args, rounds=None):
          result = crypt('', salt)
      except OSError as e:
          # Not all libc libraries support all encryption methods.
@@ -38,5 +38,5 @@ index 33dbc46bb3..4692a5270c 100644
          raise
      if result and len(result) == method.total_size:
 -- 
-2.25.4
+2.34.1
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index f9b8e2ec8d..c4ee79305d 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a30ecde59c47048013eb5a658c9b5dec277203d2793667f578df7671f7f03f3  Python-3.10.8.tar.xz
-sha256  d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b  LICENSE
+sha256  a57dc82d77358617ba65b9841cee1e3b441f386c3789ddc0676eca077f2951c3  Python-3.11.0.tar.xz
+sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4131941e11..50d125ba16 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION_MAJOR = 3.11
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -41,7 +41,12 @@ HOST_PYTHON3_CONF_ENV += \
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
-HOST_PYTHON3_DEPENDENCIES = host-autoconf-archive host-expat host-zlib host-libffi
+HOST_PYTHON3_DEPENDENCIES = \
+	host-autoconf-archive \
+	host-expat \
+	host-libffi \
+	host-pkgconf \
+	host-zlib
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
 HOST_PYTHON3_DEPENDENCIES += host-bzip2
@@ -174,6 +179,7 @@ endif
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
+	--with-build-python=$(HOST_DIR)/bin/python3 \
 	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
