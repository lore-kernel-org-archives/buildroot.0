Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E68CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0CEC415DC;
	Thu, 30 Oct 2025 20:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnEkv8dDUs_V; Thu, 30 Oct 2025 20:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D9D415E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D9D415E4;
	Thu, 30 Oct 2025 20:27:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC760CD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9338384348
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htCBsVjPzaFb for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 20:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49D3E84344
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D3E84344
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49D3E84344
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:27:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2CFC8A4C5B1F
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:26:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37826)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEZEM-000000007vc-44po
 for buildroot@buildroot.org; Thu, 30 Oct 2025 20:26:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:26:44 +0100
Message-ID: <20251030202646.1825077-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030202646.1825077-1-bernd@kuhls.net>
References: <20251030202646.1825077-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761856007;
 bh=ugmzfwKWiD2Spo4oXaLwB1JvEXOkzt95+ojfUTYHNcU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ypaPWOeNGb3M/X6HHk90HBanzJaH8mD1dFwHWGAgB3qDKcoQwcgfElGZKZ7WaDm2v
 ZKgfbMq3blC/W8LVtIpaL8oyGype310rUvDGMKYqP0khhVXJaXIx4BAdA+6YmRIIEp
 4KX3rmZw3ZyCQDhFnnCUBep/55/4hNbvLwgoKWgYBu+52QKsJFzZ8fPYHLdPPM771h
 Pz2SmK9GVxQv1outcmb+i4rkHOwjo39n2o0WiLmBXQmx0FVXRN0yAMtq37CGoLogVy
 7mhUZHbkjVimHkkZ45642L16VCnPPhGbVrwMCp6xabuZakWzb//f7DV8wIkv6+CqMv
 UFog5zMt/Ua2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ypaPWOeN
Subject: [Buildroot] [PATCH 2/4] package/expect: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package is unmaintained and causes build errors with gcc >= 14.x:
https://sourceforge.net/p/expect/bugs/107

Fixes:
https://autobuild.buildroot.net/results/425/425dadaa4a75eae9331351172839402a197749a5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |   2 -
 Config.in.legacy                              |   6 +
 package/Config.in                             |   1 -
 .../0001-enable-cross-compilation.patch       | 120 ------------------
 .../0002-allow-tcl-build-directory.patch      |  34 -----
 package/expect/Config.in                      |   7 -
 package/expect/expect.hash                    |   4 -
 package/expect/expect.mk                      |  21 ---
 8 files changed, 6 insertions(+), 189 deletions(-)
 delete mode 100644 package/expect/0001-enable-cross-compilation.patch
 delete mode 100644 package/expect/0002-allow-tcl-build-directory.patch
 delete mode 100644 package/expect/Config.in
 delete mode 100644 package/expect/expect.hash
 delete mode 100644 package/expect/expect.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index e8c97c2d63..70d978a9e1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -366,8 +366,6 @@ package/exim/0001-Build-buildconfig-for-the-host.patch lib_patch.Upstream
 package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch lib_patch.Upstream
 package/exim/0003-Skip-version-check-and-symlink-installation.patch lib_patch.Upstream
 package/exim/S86exim lib_sysv.Indent lib_sysv.Variables
-package/expect/0001-enable-cross-compilation.patch lib_patch.Upstream
-package/expect/0002-allow-tcl-build-directory.patch lib_patch.Upstream
 package/fail2ban/S60fail2ban Shellcheck lib_sysv.Variables
 package/fakedate/fakedate Shellcheck
 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 26391bec23..a8aecad01b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_EXPECT
+	bool "expect has been removed"
+	select BR2_LEGACY
+	help
+	  expect is unmaintained and has been removed
+
 config BR2_PACKAGE_RAMSPEED
 	bool "ramspeed has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 47d56f813a..023fc8d31c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1524,7 +1524,6 @@ endif
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
 menu "Tcl libraries/modules"
-	source "package/expect/Config.in"
 	source "package/tcllib/Config.in"
 endmenu
 endif
diff --git a/package/expect/0001-enable-cross-compilation.patch b/package/expect/0001-enable-cross-compilation.patch
deleted file mode 100644
index fd31a01f11..0000000000
--- a/package/expect/0001-enable-cross-compilation.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-Subject: [PATCH] enable cross compilation for expect
-
-This patch was created by running ./configure on a modern Linux machine
-and inserting the results into the cross compilation section of
-each AC_MSG_CHECKING that bombed out with an error.
-
-Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
----
-
-Index: expect-5.45/configure.in
-===================================================================
---- expect-5.45.orig/configure.in	2013-11-14 07:59:58.732100595 -0600
-+++ expect-5.45/configure.in	2013-11-14 07:59:58.732100595 -0600
-@@ -481,7 +481,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- AC_MSG_CHECKING([if any value exists for WNOHANG])
-@@ -506,7 +506,8 @@
- 	AC_MSG_RESULT(no)
- 	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(yes)
-+	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
- )
- 
- #
-@@ -574,7 +575,7 @@
- 	AC_DEFINE(REARM_SIG)
- ,
- 	AC_MSG_RESULT(no)
--, AC_MSG_WARN([Expect can't be cross compiled])
-+, AC_MSG_RESULT(no)
- )
- 
- # HPUX7 has trouble with the big cat so split it
-@@ -725,7 +726,7 @@
- ,
-         AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- # mach systems have include files for unimplemented features
-@@ -749,7 +750,9 @@
- ,
-         AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+    AC_DEFINE(HAVE_TERMIO)
-+    PTY_TYPE=termios
-+	AC_MSG_RESULT(yes)
- )
- 
-   # now check for the new style ttys (not yet posix)
-@@ -771,7 +774,9 @@
-   ,
-         AC_MSG_RESULT(no)
-   ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+        AC_DEFINE(HAVE_TERMIOS)
-+        PTY_TYPE=termios
-+        AC_MSG_RESULT(yes)
-   )
- fi
- 
-@@ -794,7 +799,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])
-@@ -816,7 +821,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- # finally check for Cray style ttys
-@@ -837,7 +842,7 @@
- ,
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(no)
- )
- 
- #
-@@ -869,7 +874,9 @@
- AC_HAVE_FUNCS(getpty)
- 
- # following test sets SETPGRP_VOID if setpgrp takes 0 args, else takes 2
--AC_FUNC_SETPGRP
-+cat >>expect_cf.h <<\_ACEOF
-+#define SETPGRP_VOID 1
-+_ACEOF
- 
- #
- # check for timezones
-@@ -889,7 +896,7 @@
- 	AC_MSG_RESULT(yes),
- 	AC_MSG_RESULT(no)
- ,
--	AC_MSG_ERROR([Expect can't be cross compiled])
-+	AC_MSG_RESULT(yes)
- )
- 
- 
diff --git a/package/expect/0002-allow-tcl-build-directory.patch b/package/expect/0002-allow-tcl-build-directory.patch
deleted file mode 100644
index 83ede7acb6..0000000000
--- a/package/expect/0002-allow-tcl-build-directory.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-Subject: [PATCH] Allow tcl build directory for linking
-
-Some small changes to use TCL_BUILD_LIB_SPEC instead of TCL_LIB_SPEC for
-linking against tcl directly out of its build directory.
-
-Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
----
-
-Index: expect-5.45/Makefile.in
-===================================================================
---- expect-5.45.orig/Makefile.in	2013-11-14 07:59:58.732100595 -0600
-+++ expect-5.45/Makefile.in	2013-11-14 07:59:58.732100595 -0600
-@@ -393,7 +393,7 @@
- 		@LDFLAGS_DEFAULT@ \
- 		-o expect exp_main_exp.o \
- 		@EXP_BUILD_LIB_SPEC@ \
--		@TCL_LIB_SPEC@ \
-+		@TCL_BUILD_LIB_SPEC@ \
- 		@TCL_DL_LIBS@ @PKG_LIBS@ @MATH_LIBS@ \
- 		@TCL_CC_SEARCH_FLAGS@ \
- 		@EXP_CC_SEARCH_FLAGS@
-Index: expect-5.45/tclconfig/tcl.m4
-===================================================================
---- expect-5.45.orig/tclconfig/tcl.m4	2010-11-09 13:42:10.000000000 -0600
-+++ expect-5.45/tclconfig/tcl.m4	2013-11-14 08:02:08.424100580 -0600
-@@ -412,6 +412,7 @@
-     AC_SUBST(TCL_LIB_FILE)
-     AC_SUBST(TCL_LIB_FLAG)
-     AC_SUBST(TCL_LIB_SPEC)
-+    AC_SUBST(TCL_BUILD_LIB_SPEC)
- 
-     AC_SUBST(TCL_STUB_LIB_FILE)
-     AC_SUBST(TCL_STUB_LIB_FLAG)
diff --git a/package/expect/Config.in b/package/expect/Config.in
deleted file mode 100644
index 67dfe643b2..0000000000
--- a/package/expect/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_EXPECT
-	bool "expect"
-	help
-	  Expect is a tool for automating interactive applications
-	  such as telnet, ftp, passwd, fsck, rlogin, ssh, tip, etc.
-
-	  https://core.tcl.tk/expect/
diff --git a/package/expect/expect.hash b/package/expect/expect.hash
deleted file mode 100644
index c4815abb07..0000000000
--- a/package/expect/expect.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://sourceforge.net/projects/expect/files/Expect/5.45.4/expect5.45.4.tar.gz.SHA256
-sha256  49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34  expect5.45.4.tar.gz
-# Locally calculated
-sha256  b2415b17dc8d9a287f4509047ef5ac3436baef7ba7c50faef5222dcdf61a2bab  README
diff --git a/package/expect/expect.mk b/package/expect/expect.mk
deleted file mode 100644
index 44bf74af46..0000000000
--- a/package/expect/expect.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# expect
-#
-################################################################################
-
-EXPECT_VERSION = 5.45.4
-EXPECT_SITE = https://sourceforge.net/projects/expect/files/Expect/$(EXPECT_VERSION)
-EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
-EXPECT_LICENSE = Public domain
-EXPECT_LICENSE_FILES = README
-
-# 0001-enable-cross-compilation.patch
-EXPECT_AUTORECONF = YES
-EXPECT_DEPENDENCIES = tcl
-EXPECT_CONF_OPTS = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
-
-# Since we don't want examples installed
-EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
