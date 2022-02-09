Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73267C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D19883134;
	Wed,  9 Feb 2022 21:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RK2xAWTIsB4N; Wed,  9 Feb 2022 21:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4373981366;
	Wed,  9 Feb 2022 21:34:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DC3E1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B6B60E3F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dch7EzgeLiC1 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44C10600C5
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 48F1E8323C; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f697096a770ff4704ac6917d7841dfaa02a945a0
X-Git-Newrev: 306839586bbff4b026aae7fee5a8d551f223f63f
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.48F1E8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python: drop target package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=306839586bbff4b026aae7fee5a8d551f223f63f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 2.7 is EOL since April 2020, so drop support for the target package.

https://www.python.org/dev/peps/pep-0373/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy         |   8 +++
 package/Config.in        |   3 +-
 package/python/Config.in | 139 -----------------------------------------------
 3 files changed, 9 insertions(+), 141 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 34d8c71cc8..6bc3803a5c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON
+	bool "python2.7 package removed"
+	select BR2_LEGACY
+	help
+	  Python 2.7 is EOL since April 2020 and has been removed.
+
+	  https://www.python.org/dev/peps/pep-0373/
+
 config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	bool "Generate image for Xilinx Zynq"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d631ed784a..ca2fb363e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -897,9 +897,8 @@ if BR2_STATIC_LIBS
 comment "External PHP extensions need a toolchain w/ dynamic library"
 endif
 endif
-	source "package/python/Config.in"
 	source "package/python3/Config.in"
-if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+if BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-aenum/Config.in"
 	source "package/python-aexpect/Config.in"
diff --git a/package/python/Config.in b/package/python/Config.in
deleted file mode 100644
index ab6950cae8..0000000000
--- a/package/python/Config.in
+++ /dev/null
@@ -1,139 +0,0 @@
-comment "python needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_PYTHON
-	bool "python2.7 (deprecated)"
-	depends on BR2_USE_WCHAR
-	# uses fork()
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBFFI
-	help
-	  The python language interpreter.
-
-	  http://www.python.org/
-
-if BR2_PACKAGE_PYTHON
-
-choice
-	prompt "python module format to install"
-	default BR2_PACKAGE_PYTHON_PYC_ONLY
-	help
-	  Select Python module format to install on target (py, pyc or
-	  both)
-
-config BR2_PACKAGE_PYTHON_PY_ONLY
-	bool ".py sources only"
-
-config BR2_PACKAGE_PYTHON_PYC_ONLY
-	bool ".pyc compiled sources only"
-
-config BR2_PACKAGE_PYTHON_PY_PYC
-	bool ".py sources and .pyc compiled"
-
-endchoice
-
-menu "core python modules"
-
-comment "The following modules are unusual or require extra libraries"
-
-config BR2_PACKAGE_PYTHON_2TO3
-	bool "2to3 module"
-	help
-	  code translation from python 2 to 3
-
-config BR2_PACKAGE_PYTHON_BZIP2
-	bool "bzip2 module"
-	select BR2_PACKAGE_BZIP2
-	help
-	  bzip2 module for Python
-
-config BR2_PACKAGE_PYTHON_BSDDB
-	bool "bsddb module"
-	select BR2_PACKAGE_BERKELEYDB
-	help
-	  bsddb module for Python.
-
-config BR2_PACKAGE_PYTHON_CODECSCJK
-	bool "codecscjk module"
-	help
-	  Chinese/Japanese/Korean codecs module for Python (large).
-
-config BR2_PACKAGE_PYTHON_CURSES
-	bool "curses module"
-	select BR2_PACKAGE_NCURSES
-	help
-	  curses module for Python.
-
-config BR2_PACKAGE_PYTHON_OSSAUDIODEV
-	bool "ossaudiodev module"
-	help
-	  ossaudiodev module for Python.
-
-config BR2_PACKAGE_PYTHON_READLINE
-	bool "readline"
-	select BR2_PACKAGE_READLINE
-	help
-	  readline module for Python (required for command-line
-	  editing in the Python shell).
-
-config BR2_PACKAGE_PYTHON_SSL
-	bool "ssl"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  _ssl module for Python (required for https in urllib etc).
-
-config BR2_PACKAGE_PYTHON_UNICODEDATA
-	bool "unicodedata module"
-	default y
-	help
-	  Unicode character database (used by stringprep module)
-	  (large).
-
-if BR2_PACKAGE_PYTHON_UNICODEDATA
-
-choice
-	prompt "Python unicode database format"
-	default BR2_PACKAGE_PYTHON_UCS2
-	help
-	  Select Python unicode database format for target
-
-config BR2_PACKAGE_PYTHON_UCS2
-	bool "Universal Character Set 2-byte (UCS2)"
-
-config BR2_PACKAGE_PYTHON_UCS4
-	bool "Universal Character Set 4-byte (UCS4)"
-
-endchoice
-
-endif
-
-config BR2_PACKAGE_PYTHON_SQLITE
-	bool "sqlite module"
-	select BR2_PACKAGE_SQLITE
-	help
-	  SQLite database support
-
-config BR2_PACKAGE_PYTHON_PYEXPAT
-	bool "xml module"
-	select BR2_PACKAGE_EXPAT
-	help
-	  pyexpat and xml libraries for Python
-
-config BR2_PACKAGE_PYTHON_ZLIB
-	bool "zlib module"
-	select BR2_PACKAGE_ZLIB
-	help
-	  zlib support in Python
-
-config BR2_PACKAGE_PYTHON_HASHLIB
-	bool "hashlib module"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  hashlib support in Python
-
-endmenu
-
-endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
