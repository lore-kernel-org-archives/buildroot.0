Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35777EB64D9
	for <buildroot@archiver.kernel.org>; Sat, 17 Jun 2023 21:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EEB760AD6;
	Sat, 17 Jun 2023 21:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EEB760AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0IkwNoYqwhk; Sat, 17 Jun 2023 21:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D143660AE3;
	Sat, 17 Jun 2023 21:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D143660AE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FC201BF5DB
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 21:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38D59400D9
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 21:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38D59400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcyXKwELjzsW for <buildroot@lists.busybox.net>;
 Sat, 17 Jun 2023 21:31:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ACEA4000B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ACEA4000B
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 21:31:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7835F40003;
 Sat, 17 Jun 2023 21:31:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qAdVc-000aZr-99; Sat, 17 Jun 2023 23:31:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jun 2023 23:30:56 +0200
Message-Id: <20230617213057.140556-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python3: security bump to version 3.11.4
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

Fixes the following security issues:

- gh-99889: Fixed a security in flaw in uu.decode() that could allow for
  directory traversal based on the input if no out_file was specified.

- gh-104049: Do not expose the local on-disk location in directory indexes
  produced by http.client.SimpleHTTPRequestHandler.

- gh-102153: urllib.parse.urlsplit() now strips leading C0 control and space
  characters following the specification for URLs defined by WHATWG in
  response to CVE-2023-24329.  Patch by Illia Volochii.

Refreshed patches to apply without fuzz after upstream reordered lines in
Makefile.pre.in:

https://github.com/python/cpython/commit/838bc90511330ac681e710edf5ded7b0b2c44430
https://github.com/python/cpython/commit/4219074127221fdbf545f908361da4ad98437b45

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-the-build-of-pyc-files-conditional.patch | 14 ++++----
 ...taddrinfo-configure-test-when-cross-.patch |  8 ++---
 ...re-to-disable-the-build-of-certain-e.patch | 14 ++++----
 ...y-header-paths-for-cross-compilation.patch |  4 +--
 ...ook-in-usr-lib-termcap-for-libraries.patch |  8 ++---
 .../0006-Don-t-add-multiarch-paths.patch      |  6 ++--
 .../0007-Abort-on-failed-module-build.patch   |  6 ++--
 .../0008-Serial-ioctl-workaround.patch        |  6 ++--
 ...e-shebang-of-Python-scripts-for-cros.patch |  4 +--
 ...ig.sh.in-ensure-sed-invocations-only.patch |  4 +--
 .../0011-Add-an-option-to-disable-pydoc.patch | 26 +++++++-------
 ...012-Add-an-option-to-disable-lib2to3.patch | 34 +++++++++---------
 ...option-to-disable-the-sqlite3-module.patch | 14 ++++----
 ...d-an-option-to-disable-the-tk-module.patch | 35 ++++++++++---------
 ...-option-to-disable-the-curses-module.patch | 14 ++++----
 .../0016-Add-an-option-to-disable-expat.patch | 14 ++++----
 ...-Add-an-option-to-disable-CJK-codecs.patch |  8 ++---
 .../0018-Add-an-option-to-disable-NIS.patch   | 12 +++----
 ...Add-an-option-to-disable-unicodedata.patch | 16 ++++-----
 .../0020-Add-an-option-to-disable-IDLE.patch  | 20 +++++------
 ...021-Add-an-option-to-disable-decimal.patch |  8 ++---
 ...on-to-disable-the-ossaudiodev-module.patch |  8 ++---
 ...an-option-to-disable-openssl-support.patch | 12 +++----
 ...ption-to-disable-the-readline-module.patch |  8 ++---
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  8 ++---
 ...thon-config.sh-don-t-reassign-prefix.patch |  4 +--
 ...Add-an-option-to-disable-uuid-module.patch |  8 ++---
 ...-fix-building-on-older-distributions.patch |  4 +--
 ...up-CC-print-multiarch-output-for-mus.patch |  8 ++---
 ...ion-to-disable-the-berkeleydb-module.patch |  8 ++---
 ...-ng-doesn-t-set-errno-when-encryptio.patch |  4 +--
 package/python3/python3.hash                  |  2 +-
 package/python3/python3.mk                    |  2 +-
 33 files changed, 176 insertions(+), 175 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 92aa7274ba..f723f79476 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 51ed7f93cc0333efa8fccd9b88db713c48993df9 Mon Sep 17 00:00:00 2001
+From f8c8c4d05fb5c6c2f583c0a850cdb052e565b6b2 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8fbcd7ac17..2957c8e5a1 100644
+index 3ea8653de0..941548c3b7 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2078,6 +2078,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2118,6 +2118,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 8fbcd7ac17..2957c8e5a1 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -2105,6 +2106,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2145,6 +2146,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -35,10 +35,10 @@ index 8fbcd7ac17..2957c8e5a1 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index ab5e1de6fa..0cf89ed641 100644
+index 1c25abd65a..0df64400d9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1441,6 +1441,12 @@ fi
+@@ -1451,6 +1451,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -52,5 +52,5 @@ index ab5e1de6fa..0cf89ed641 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 5389cb5d15..b41562b4fa 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From b180ab302e2a82be239af334382436628b81381e Mon Sep 17 00:00:00 2001
+From fd6383fc865831754fd5848087953b65756a5272 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0cf89ed641..830885fcb3 100644
+index 0df64400d9..9f48adff5b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5086,7 +5086,7 @@ fi]))
+@@ -5124,7 +5124,7 @@ fi]))
  dnl if ac_cv_func_getaddrinfo
  ])
  
@@ -23,5 +23,5 @@ index 0cf89ed641..830885fcb3 100644
    AS_VAR_IF([ipv6], [yes], [
      AC_MSG_ERROR([m4_normalize([
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 5b3911374e..a6f85a57ab 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From 8e02cebdac536dfb6748da2c50656a26f70d9da7 Mon Sep 17 00:00:00 2001
+From 45831aa4195d9a476e154642a9c4b5e9337efce9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,7 +44,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2957c8e5a1..c1cfb96767 100644
+index 941548c3b7..f3a653c58e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -239,6 +239,8 @@ FILEMODE=	644
@@ -64,7 +64,7 @@ index 2957c8e5a1..c1cfb96767 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
-@@ -2228,7 +2231,8 @@ libainstall: all python-config
+@@ -2268,7 +2271,8 @@ libainstall: all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: all
@@ -75,10 +75,10 @@ index 2957c8e5a1..c1cfb96767 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 830885fcb3..5a6a1fe608 100644
+index 9f48adff5b..992468f609 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3562,6 +3562,8 @@ LIBS="$withval $LIBS"
+@@ -3600,6 +3600,8 @@ LIBS="$withval $LIBS"
  ],
  [AC_MSG_RESULT(no)])
  
@@ -88,7 +88,7 @@ index 830885fcb3..5a6a1fe608 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 15d0d4576a..e496ee34c2 100644
+index 4f122b62e0..b6a8903fdf 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -56,7 +56,10 @@
@@ -104,5 +104,5 @@ index 15d0d4576a..e496ee34c2 100644
  # --list-module-names option used by Tools/scripts/generate_module_names.py
  LIST_MODULE_NAMES = False
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 9a55d2582d..71f71d830e 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 132b9dca3bb4d4682f7e318648ce11e1abb31b62 Mon Sep 17 00:00:00 2001
+From 342937bceca45b931415e8fff2c28f5add133c12 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -65,5 +65,5 @@ index ebe3711827..6328ec41af 100644
  _USER_BASE = None
  
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 78b3ae596d..c42cd838ef 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 5d13e384b30a2c0b1c7b65718590b7fb0c3ba55e Mon Sep 17 00:00:00 2001
+From 3025e8ecf8c668b8feaf355c999a9f3fa87b3214 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index e496ee34c2..1904898165 100644
+index b6a8903fdf..212a5ed38b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1107,12 +1107,9 @@ def detect_readline_curses(self):
+@@ -1110,12 +1110,9 @@ def detect_readline_curses(self):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -27,5 +27,5 @@ index e496ee34c2..1904898165 100644
          else:
              self.missing.append('readline')
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index 749e295df1..519e71f80b 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From ad463b5d58ae79f69b011fb048861bd874d34369 Mon Sep 17 00:00:00 2001
+From 275a5325993d4613fa1a678d530838fe9c1dde8b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,7 +17,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 1904898165..32294546b6 100644
+index 212a5ed38b..00b53b0608 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -852,10 +852,10 @@ def configure_compiler(self):
@@ -33,5 +33,5 @@ index 1904898165..32294546b6 100644
  
      def init_inc_lib_dirs(self):
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index a473896127..c555f1ca58 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 60b1664a7acebadb1a3d6df871145147f33b5afe Mon Sep 17 00:00:00 2001
+From adb8f41033b858765314612e6b6b881f47423ff9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,7 +14,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index 32294546b6..0e04944ce0 100644
+index 00b53b0608..12515945ea 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -579,6 +579,7 @@ def print_three_column(lst):
@@ -26,5 +26,5 @@ index 32294546b6..0e04944ce0 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index 7722a04f38..c422d447c7 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 90f3075b629d90d942da1d22ef7563f7149f4f6c Mon Sep 17 00:00:00 2001
+From df08f19004f65ff413c319b7faafff4a9b959644 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -15,7 +15,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  1 file changed, 2 insertions(+)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index 354e5ca18d..c08957c500 100644
+index fcc8f04267..c89d9509be 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -15,7 +15,9 @@
@@ -29,5 +29,5 @@ index 354e5ca18d..c08957c500 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (apparently used internally by some things
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index eff8fc7694..37ca79ff70 100644
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From 2439bd2ed5dbdd7e5fda15adefd0f6f1b047ec1b Mon Sep 17 00:00:00 2001
+From c797d34940f987155ac2d1755f09d91d7b944fd6 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
@@ -31,5 +31,5 @@ index ccc70e6465..d6d54195c1 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index f26ee85b61..ff89f14448 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From 55ef5552e4ee60266e3299f253bec3b13785e585 Mon Sep 17 00:00:00 2001
+From 1689dd0f176247532767a6c2c0eb3482e73d7405 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -63,5 +63,5 @@ index 2602fe24c0..a1bc3cd5f7 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch b/package/python3/0011-Add-an-option-to-disable-pydoc.patch
index f7bfd437bb..5d58617269 100644
--- a/package/python3/0011-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0011-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 38b7f7949258aeadf8bc45525be91340bb732a2a Mon Sep 17 00:00:00 2001
+From bcbebd5f7cc2b04ba3c7338392bbf0e800b03c47 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -19,10 +19,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  3 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c1cfb96767..403380e181 100644
+index f3a653c58e..1dfd20abd9 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1864,7 +1864,9 @@ bininstall: altbininstall
+@@ -1869,7 +1869,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -32,7 +32,7 @@ index c1cfb96767..403380e181 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1915,7 +1917,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1920,7 +1922,6 @@ LIBSUBDIRS=	asyncio \
  		lib2to3 lib2to3/fixes lib2to3/pgen2 \
  		logging \
  		multiprocessing multiprocessing/dummy \
@@ -40,9 +40,9 @@ index c1cfb96767..403380e181 100644
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2008,6 +2009,10 @@ TESTSUBDIRS=	ctypes/test \
- 		tkinter/test/test_ttk \
- 		unittest/test unittest/test/testmock
+@@ -2048,6 +2049,10 @@ TESTSUBDIRS=	ctypes/test \
+ 		unittest/test \
+ 		unittest/test/testmock
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
@@ -52,10 +52,10 @@ index c1cfb96767..403380e181 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 5a6a1fe608..f68ea72321 100644
+index 992468f609..79b4c85f1b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4171,6 +4171,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4210,6 +4210,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -69,10 +69,10 @@ index 5a6a1fe608..f68ea72321 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 0e04944ce0..3e55f5b2e0 100644
+index 12515945ea..e8b218d610 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1593,6 +1593,12 @@ class DummyProcess:
+@@ -1596,6 +1596,12 @@ class DummyProcess:
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -85,7 +85,7 @@ index 0e04944ce0..3e55f5b2e0 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -1617,8 +1623,7 @@ class DummyProcess:
+@@ -1620,8 +1626,7 @@ class DummyProcess:
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -96,5 +96,5 @@ index 0e04944ce0..3e55f5b2e0 100644
  
  # --install-platlib
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch b/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
index 0085d5a63f..736833693a 100644
--- a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
@@ -1,6 +1,6 @@
-From 0e4f0a525ea0a68f6d4c5349c301da2e9b0c8ac9 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:15:31 -0800
+From 4784058509521aa00ce430f1897447de41851280 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 17 Jun 2023 23:10:05 +0200
 Subject: [PATCH] Add an option to disable lib2to3
 
 lib2to3 is a library to convert Python 2.x code to Python 3.x. As
@@ -19,10 +19,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  3 files changed, 21 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 403380e181..f5d0573067 100644
+index 1dfd20abd9..6e809a6368 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1868,7 +1868,9 @@ ifeq (@PYDOC@,yes)
+@@ -1873,7 +1873,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -32,7 +32,7 @@ index 403380e181..f5d0573067 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1914,7 +1916,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1919,7 +1921,6 @@ LIBSUBDIRS=	asyncio \
  		idlelib idlelib/Icons \
  		importlib importlib/resources importlib/metadata \
  		json \
@@ -40,7 +40,7 @@ index 403380e181..f5d0573067 100644
  		logging \
  		multiprocessing multiprocessing/dummy \
  		re \
-@@ -1934,10 +1935,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1939,10 +1940,6 @@ LIBSUBDIRS=	asyncio \
  TESTSUBDIRS=	ctypes/test \
  		distutils/tests \
  		idlelib/idle_test \
@@ -48,10 +48,10 @@ index 403380e181..f5d0573067 100644
 -		lib2to3/tests/data \
 -		lib2to3/tests/data/fixers \
 -		lib2to3/tests/data/fixers/myfixes \
- 		test test/audiodata \
- 		test/capath test/cjkencodings \
- 		test/data test/decimaltestdata \
-@@ -2013,6 +2010,14 @@ ifeq (@PYDOC@,yes)
+ 		test \
+ 		test/audiodata \
+ 		test/capath \
+@@ -2053,6 +2050,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -66,7 +66,7 @@ index 403380e181..f5d0573067 100644
  TEST_MODULES=@TEST_MODULES@
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
-@@ -2115,10 +2120,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -2155,10 +2160,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -80,10 +80,10 @@ index 403380e181..f5d0573067 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index f68ea72321..d8e10cf2b2 100644
+index 79b4c85f1b..5000faf262 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7078,6 +7078,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
+@@ -7120,6 +7120,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -97,10 +97,10 @@ index f68ea72321..d8e10cf2b2 100644
  AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
  AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
 diff --git a/setup.py b/setup.py
-index 3e55f5b2e0..c490b0b08f 100644
+index e8b218d610..a40aa6b01f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1594,11 +1594,11 @@ class DummyProcess:
+@@ -1597,11 +1597,11 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -116,5 +116,5 @@ index 3e55f5b2e0..c490b0b08f 100644
            name = "Python",
            version = sys.version.split()[0],
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
index 795ea3b898..fba7c666ba 100644
--- a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From ef8c030e01b1be8be582e90c31298a5863094858 Mon Sep 17 00:00:00 2001
+From 58db443a0cd20d1a8fc23e98bf32ce2f7b989e6e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -15,10 +15,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f5d0573067..9f4cdf14cf 100644
+index 6e809a6368..d74f486bf4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1925,7 +1925,6 @@ LIBSUBDIRS=	asyncio \
  		multiprocessing multiprocessing/dummy \
  		re \
  		site-packages \
@@ -26,7 +26,7 @@ index f5d0573067..9f4cdf14cf 100644
  		tkinter \
  		tomllib \
  		turtledemo \
-@@ -2018,6 +2017,10 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -2058,6 +2057,10 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -38,10 +38,10 @@ index f5d0573067..9f4cdf14cf 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index d8e10cf2b2..4cc0951ab9 100644
+index 5000faf262..167c8725b7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4171,6 +4171,15 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4210,6 +4210,15 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -58,5 +58,5 @@ index d8e10cf2b2..4cc0951ab9 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
index 04f7e34435..5e6113955e 100644
--- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
@@ -1,6 +1,6 @@
-From bbbfe699d648a5cb191203b16e1786e8cf4ea908 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:23:42 -0800
+From 0ea6516ae40b71e832fc5f71cdd6bb97d5425d83 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 17 Jun 2023 23:11:25 +0200
 Subject: [PATCH] Add an option to disable the tk module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
@@ -10,15 +10,15 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 10 +++++++---
+ Makefile.pre.in | 11 +++++++----
  configure.ac    |  9 +++++++++
- 2 files changed, 16 insertions(+), 3 deletions(-)
+ 2 files changed, 16 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9f4cdf14cf..4f83911200 100644
+index d74f486bf4..834130c019 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1925,7 +1925,6 @@ LIBSUBDIRS=	asyncio \
  		multiprocessing multiprocessing/dummy \
  		re \
  		site-packages \
@@ -26,16 +26,17 @@ index 9f4cdf14cf..4f83911200 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2001,8 +2000,6 @@ TESTSUBDIRS=	ctypes/test \
- 		test/tracedmodules \
- 		test/xmltestdata test/xmltestdata/c14n-20 \
+@@ -2039,9 +2038,6 @@ TESTSUBDIRS=	ctypes/test \
+ 		test/xmltestdata \
+ 		test/xmltestdata/c14n-20 \
  		test/ziptestdata \
--		tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test \
+-		tkinter/test/test_tkinter \
 -		tkinter/test/test_ttk \
- 		unittest/test unittest/test/testmock
+ 		unittest/test \
+ 		unittest/test/testmock
  
- ifeq (@PYDOC@,yes)
-@@ -2021,6 +2018,13 @@ ifeq (@SQLITE3@,yes)
+@@ -2061,6 +2057,13 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -50,10 +51,10 @@ index 9f4cdf14cf..4f83911200 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 4cc0951ab9..f4ce506801 100644
+index 167c8725b7..615e9f6ed1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4180,6 +4180,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -4219,6 +4219,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -70,5 +71,5 @@ index 4cc0951ab9..f4ce506801 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
index da6f891104..f344d107ab 100644
--- a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 03e28cdd46dac1b7e4e9c8bbd2ea44b09e514205 Mon Sep 17 00:00:00 2001
+From 75022f455dc9a28d0382ff2d0bc9cf97508d426b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -15,10 +15,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4f83911200..8e879b35c6 100644
+index 834130c019..a1c1cb1e70 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1905,7 +1905,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1910,7 +1910,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures \
  		csv \
  		ctypes ctypes/macholib \
@@ -26,7 +26,7 @@ index 4f83911200..8e879b35c6 100644
  		dbm \
  		distutils distutils/command \
  		email email/mime \
-@@ -2024,6 +2023,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -2063,6 +2062,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -37,10 +37,10 @@ index 4f83911200..8e879b35c6 100644
  TEST_MODULES=@TEST_MODULES@
  libinstall:	all $(srcdir)/Modules/xxmodule.c
 diff --git a/configure.ac b/configure.ac
-index f4ce506801..0ae9863cd6 100644
+index 615e9f6ed1..f8ce418162 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4189,6 +4189,15 @@ if test "$TK" = "no"; then
+@@ -4228,6 +4228,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -57,5 +57,5 @@ index f4ce506801..0ae9863cd6 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0016-Add-an-option-to-disable-expat.patch b/package/python3/0016-Add-an-option-to-disable-expat.patch
index c30740762a..91e002c3d9 100644
--- a/package/python3/0016-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0016-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From c9a2ea3edacf57746517600ccc11c254a9fd6c48 Mon Sep 17 00:00:00 2001
+From 5940c3fa6d09ba402f3c73b64a2da1d331de09ba Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -21,10 +21,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 18 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8e879b35c6..80d617cf7f 100644
+index a1c1cb1e70..48ac62e8e8 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1925,7 +1925,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1930,7 +1930,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -32,7 +32,7 @@ index 8e879b35c6..80d617cf7f 100644
  		xmlrpc \
  		zoneinfo \
  		__phello__
-@@ -2027,6 +2026,10 @@ ifeq (@CURSES@,yes)
+@@ -2066,6 +2065,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -44,10 +44,10 @@ index 8e879b35c6..80d617cf7f 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 0ae9863cd6..201cad0bfc 100644
+index f8ce418162..a8d4f4f179 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3565,15 +3565,23 @@ LIBS="$withval $LIBS"
+@@ -3603,15 +3603,23 @@ LIBS="$withval $LIBS"
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -78,5 +78,5 @@ index 0ae9863cd6..201cad0bfc 100644
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
index 63a07fb514..6a00de9420 100644
--- a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From d8ef6a7a9f2b954cf1c1e37fc3c35055b42af0f5 Mon Sep 17 00:00:00 2001
+From 27745edcecd06cc38bbcbd056dcf5b8420d69683 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 201cad0bfc..ecdd7dbc07 100644
+index a8d4f4f179..c0575c7b19 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4188,6 +4188,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -4227,6 +4227,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index 201cad0bfc..ecdd7dbc07 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b/package/python3/0018-Add-an-option-to-disable-NIS.patch
index 977955d1cb..c1ee783bfe 100644
--- a/package/python3/0018-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0018-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From 09fc9f72ebe60bb65e80732a6bd4f12a84159f6d Mon Sep 17 00:00:00 2001
+From 279f865c9209d8fe99a22e417a38fff19cff410e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,22 +12,22 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ecdd7dbc07..1bdde7f69d 100644
+index c0575c7b19..9de5df3c8f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4194,6 +4194,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -4233,6 +4233,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
 +AC_ARG_ENABLE(nis,
 +	AS_HELP_STRING([--disable-nis], [disable NIS]),
 +	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-+  	  fi])
++		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
++	fi])
 +
  AC_SUBST(TK)
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
index 74702b67a5..e3b0841fbd 100644
--- a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From 4fe7f375a3d171d294caebdd7b7ce49bbc9ad9f3 Mon Sep 17 00:00:00 2001
+From 24c52e5989be3bab950867b5f2c210d100bf0e09 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,22 +9,22 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 1bdde7f69d..ba4b0e0c1c 100644
+index 9de5df3c8f..59482b986d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4200,6 +4200,12 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
+@@ -4239,6 +4239,12 @@ AC_ARG_ENABLE(nis,
+ 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
+ 	fi])
  
 +AC_ARG_ENABLE(unicodedata,
 +	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
 +	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-+  	  fi])
++		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
++	fi])
 +
  AC_SUBST(TK)
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch b/package/python3/0020-Add-an-option-to-disable-IDLE.patch
index 09b5f13cdb..a367316611 100644
--- a/package/python3/0020-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0020-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 2c9dbd6d49744aa8da8ebf8d0187d6b06f93c2b5 Mon Sep 17 00:00:00 2001
+From 2e60f0f28dc8ad5d04e10e8b0b832234a3606977 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -18,10 +18,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  3 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 80d617cf7f..8d1ba1356c 100644
+index 48ac62e8e8..28be9f8fdb 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1862,7 +1862,9 @@ bininstall: altbininstall
+@@ -1867,7 +1867,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -31,7 +31,7 @@ index 80d617cf7f..8d1ba1356c 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1912,7 +1914,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1917,7 +1919,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -39,7 +39,7 @@ index 80d617cf7f..8d1ba1356c 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2030,6 +2031,10 @@ ifeq (@EXPAT@,yes)
+@@ -2069,6 +2070,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -51,10 +51,10 @@ index 80d617cf7f..8d1ba1356c 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index ba4b0e0c1c..5e6d72f7db 100644
+index 59482b986d..80f32e30ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7137,6 +7137,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -7179,6 +7179,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -68,10 +68,10 @@ index ba4b0e0c1c..5e6d72f7db 100644
  AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
  AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
 diff --git a/setup.py b/setup.py
-index c490b0b08f..4d49a792f7 100644
+index a40aa6b01f..21173db7dc 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1594,11 +1594,14 @@ class DummyProcess:
+@@ -1597,11 +1597,14 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -88,5 +88,5 @@ index c490b0b08f..4d49a792f7 100644
            name = "Python",
            version = sys.version.split()[0],
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.patch b/package/python3/0021-Add-an-option-to-disable-decimal.patch
index d683565f94..3f7d7359fc 100644
--- a/package/python3/0021-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0021-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From 7091fdf77f612425c178a75148560f9c3514e8b8 Mon Sep 17 00:00:00 2001
+From fc03b39e008d298a06152a6012cf6d18a7bcdbdd Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -18,10 +18,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  1 file changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5e6d72f7db..e6b1f1e9de 100644
+index 80f32e30ee..82f7f50ba0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3630,14 +3630,21 @@ fi
+@@ -3668,14 +3668,21 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -50,5 +50,5 @@ index 5e6d72f7db..e6b1f1e9de 100644
    LIBMPDEC_LDFLAGS=${LIBMPDEC_LDFLAGS-"-lmpdec"}
    LIBMPDEC_INTERNAL=
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 56713a7f8f..5ba80aea01 100644
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
+From 97943a1a737998648a08e8948301f29fd90afa28 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e6b1f1e9de..db33d567ad 100644
+index 82f7f50ba0..994f47ab45 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3678,6 +3678,12 @@ fi
+@@ -3716,6 +3716,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
@@ -26,5 +26,5 @@ index e6b1f1e9de..db33d567ad 100644
  AC_MSG_CHECKING(for decimal libmpdec machine)
  AS_CASE([$ac_sys_system],
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
index d4c9fd43be..d8c671b15e 100644
--- a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 25c900e81a2fc0bbe35e7c94e2e5028cfbf6582a Mon Sep 17 00:00:00 2001
+From 5767a63cc5787e682cd280fc5a2b1896a267f0dc Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,12 +9,12 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index db33d567ad..42fe6c8f5a 100644
+index 994f47ab45..c8f5438cdc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4219,6 +4219,12 @@ AC_ARG_ENABLE(unicodedata,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-   	  fi])
+@@ -4258,6 +4258,12 @@ AC_ARG_ENABLE(unicodedata,
+ 		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
+ 	fi])
  
 +AC_ARG_ENABLE(openssl,
 +	AS_HELP_STRING([--disable-openssl], [disable openssl support]),
@@ -26,5 +26,5 @@ index db33d567ad..42fe6c8f5a 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
index 9250007dae..f0e5395c33 100644
--- a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From 9082468ca620db77b670ccf568a96bbabb865f80 Mon Sep 17 00:00:00 2001
+From 4a4c7d23b0d09653250e7435c5df6b3b0397f721 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 42fe6c8f5a..19875d7d30 100644
+index c8f5438cdc..2d6f91b4c7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4225,6 +4225,12 @@ AC_ARG_ENABLE(openssl,
+@@ -4264,6 +4264,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index 42fe6c8f5a..19875d7d30 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 70a0d6cd15..dbcfd273ab 100644
--- a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 988a335cb34b5fc25ea345ba04ff5ddffe2e946c Mon Sep 17 00:00:00 2001
+From 1bcd7911ad7884268774b3bb69457f32c73122ba Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 19875d7d30..ca6c16491a 100644
+index 2d6f91b4c7..5a1b94b603 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4231,6 +4231,24 @@ AC_ARG_ENABLE(readline,
+@@ -4270,6 +4270,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index 19875d7d30..ca6c16491a 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
index b6bfb010a0..ac051f2dd1 100644
--- a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
@@ -1,4 +1,4 @@
-From 755fb526a62df2a73560f42184db8aadb6899bb0 Mon Sep 17 00:00:00 2001
+From ac89185a75b880fed85ef0c45a7bf44b33dd382a Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 6 Oct 2017 09:54:15 -0500
 Subject: [PATCH] python-config.sh: don't reassign ${prefix}
@@ -49,5 +49,5 @@ index a1bc3cd5f7..164d2d3603 100644
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch b/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
index a9501ec189..35de7b48bb 100644
--- a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
@@ -1,4 +1,4 @@
-From 58027d25c3cabcf654cb0b31a61d7cbd53dc68c0 Mon Sep 17 00:00:00 2001
+From d6178fe3d0b885dfe428f2f501dd4f6ff7c403cb Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 18 Aug 2018 10:54:56 +0200
 Subject: [PATCH] Add an option to disable uuid module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ca6c16491a..ed03b27fb1 100644
+index 5a1b94b603..6ab6223c24 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4267,6 +4267,15 @@ if test "$CURSES" = "no"; then
+@@ -4306,6 +4306,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -29,5 +29,5 @@ index ca6c16491a..ed03b27fb1 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0028-fix-building-on-older-distributions.patch b/package/python3/0028-fix-building-on-older-distributions.patch
index 4541b31c5f..fd1349c7be 100644
--- a/package/python3/0028-fix-building-on-older-distributions.patch
+++ b/package/python3/0028-fix-building-on-older-distributions.patch
@@ -1,4 +1,4 @@
-From e52e2c5e3df4bc3d2ff07ecb3b8e2a9099ea1631 Mon Sep 17 00:00:00 2001
+From b003b1b153cd486646294a81f1cba2e462abdb1c Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 16 Aug 2018 14:52:37 -0700
 Subject: [PATCH] fix building on older distributions
@@ -43,5 +43,5 @@ index b4182c1d0c..ab443cb1a6 100644
              outcome = 'same'
              os.unlink(tmpfile)
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 5253076d90..ed6c19f0a2 100644
--- a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From 07b950aadd570b9f96a1f128505a959b32f40962 Mon Sep 17 00:00:00 2001
+From c240974e78e209b889549d65aa2caa32c4ab08f7 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -30,10 +30,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ed03b27fb1..841fd6732c 100644
+index 6ab6223c24..516f86e2de 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1086,7 +1086,11 @@ AC_MSG_CHECKING([for multiarch])
+@@ -1096,7 +1096,11 @@ AC_MSG_CHECKING([for multiarch])
  AS_CASE([$ac_sys_system],
    [Darwin*], [MULTIARCH=""],
    [FreeBSD*], [MULTIARCH=""],
@@ -47,5 +47,5 @@ index ed03b27fb1..841fd6732c 100644
  AC_SUBST([MULTIARCH])
  AC_MSG_RESULT([$MULTIARCH])
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
index 5fb436db59..212a128612 100644
--- a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -1,4 +1,4 @@
-From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001
+From 44767bc0efe7272ee4b98ecdf56c020059d32620 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 11 Apr 2020 22:01:40 +0200
 Subject: [PATCH] Add an option to disable the berkeleydb module
@@ -9,10 +9,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 841fd6732c..06c9a81f95 100644
+index 516f86e2de..7799c1b74f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4280,6 +4280,12 @@ if test "$UUID" = "no"; then
+@@ -4319,6 +4319,12 @@ if test "$UUID" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
  fi
  
@@ -26,5 +26,5 @@ index 841fd6732c..06c9a81f95 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 712fd08fb1..da1a76f518 100644
--- a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -1,4 +1,4 @@
-From 3edeed879871a10acbe802f4a68cff3d4869dbde Mon Sep 17 00:00:00 2001
+From d268f3d12fed74d78588e0467a160d0a3211db1a Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 12 Nov 2020 00:16:18 +0100
 Subject: [PATCH] lib/crypt: uClibc-ng doesn't set errno when encryption method
@@ -38,5 +38,5 @@ index de4a14a388..ba482487a7 100644
          raise
      if result and len(result) == method.total_size:
 -- 
-2.34.1
+2.30.2
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b04ee7fa2c..6c43e01a44 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e  Python-3.11.3.tar.xz
+sha256  2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6  Python-3.11.4.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ece5cad93e..bdb7cfd22f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
