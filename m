Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A473ECCD193
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 10:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6759A82B3E;
	Sun, 26 Oct 2025 10:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIFz1esmhalx; Sun, 26 Oct 2025 10:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A9282B51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A9282B51;
	Sun, 26 Oct 2025 10:22:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2DED15F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C928D60F9A
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S75l4sgq4HeW for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 10:22:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB99560F90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB99560F90
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB99560F90
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 10:22:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F497A4C4029
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 11:22:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54866)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCxtO-000000003hK-19pO
 for buildroot@buildroot.org; Sun, 26 Oct 2025 10:22:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 11:22:29 +0100
Message-ID: <20251026102229.1323577-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251026102229.1323577-1-bernd@kuhls.net>
References: <20251026102229.1323577-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761474150;
 bh=bizuf4On997FyiLwHM9hH7ZVtiI78pv5rgRY7L8J5KE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=DrQzr8rVKSkAR1Jt/O9PFDZKKT6gHM6XhJpH6vOGfOYzKfr566LfKr3TjSIxHFydc
 Bov1EjrHZr/mLmSyXD/+aWkcgjHa6F6LlqvjGOwqVbG2Doh1QBoKTjljTxhQKIjHV6
 kRPn752PFdsTm2hnz33nCtCBf+Dekerw+dmnf7gmsHubGS5dGzZ3xazj1ccNIKHhiO
 RX8uqhjf9gUAEt/cDDO0kbwDhTsJtiUuxrLN2m9JuGWWiVoEFhfPHVPeP3Nj1XYRU/
 KLgajMy61FSglhO6Vek3TgJZy82H7dur1WA2k7aSrVCAa9zbL/bFwqKeRKp2ZQUJA8
 XLV3+Jf4qgijQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=DrQzr8rV
Subject: [Buildroot] [PATCH 2/2] package/libiconv: bump version to 1.18
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

Removed patch 0001 which is included in this release.

Updated license hash and _LICENSE due to switch to LGPL-2.1+:
https://savannah.gnu.org/news/?id=10139
https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff;h=3acb1179dd057fa37b733eb2827822f95d1e31c3

Our libtool patch does not apply due to the shipped file being patched
upstream:
https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff;h=2f2b617f0334cd8b4313bcd84ce6a49713a7d848

* build-aux/ltmain.sh: Update from libtool-2.5.4, with modifications:
2017-07-15  Bruno Haible  <bruno@clisp.org>
Allow building statically linked binaries, through
LDFLAGS="-static". Apply patch from
<https://lists.gnu.org/archive/html/bug-libtool/2017-07/msg00000.html>.
* build-aux/ltmain.sh (func_mode_help, func_mode_link): In the
link mode, accept option '-static-uninstalled-libs' in place of
'-static', and make '-static' an equivalent of '-all-static'.
* libcharset/build-aux/ltmain.sh: Likewise.

Added 0001-libtool.patch as rebased version of
support/libtool/buildroot-libtool-v2.4.4.patch

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...tion-declaration-without-a-prototype.patch | 34 -----------
 package/libiconv/0001-libtool.patch           | 57 +++++++++++++++++++
 package/libiconv/libiconv.hash                |  4 +-
 package/libiconv/libiconv.mk                  |  8 ++-
 4 files changed, 65 insertions(+), 38 deletions(-)
 delete mode 100644 package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
 create mode 100644 package/libiconv/0001-libtool.patch

diff --git a/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch b/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
deleted file mode 100644
index f859f7e014..0000000000
--- a/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Bruno Haible <bruno@clisp.org>
-Date: Sun, 29 Jan 2023 19:07:21 +0000 (+0100)
-Subject: Fix a clang warning "a function declaration without a prototype...".
-X-Git-Tag: v1.18~57
-X-Git-Url: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff_plain;h=e46dee2f581c1167137bcd045e114e96a9f00483
-
-Fix a clang warning "a function declaration without a prototype...".
-
-* lib/loop_wchar.h (mbrtowc): Don't declare. Drop portability to BeOS.
-
-Upstream: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff;h=e46dee2f581c1167137bcd045e114e96a9f00483
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
-
-diff --git a/lib/loop_wchar.h b/lib/loop_wchar.h
-index b3edc29..9eb508e 100644
---- a/lib/loop_wchar.h
-+++ b/lib/loop_wchar.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011 Free Software Foundation, Inc.
-+ * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011, 2023 Free Software Foundation, Inc.
-  * This file is part of the GNU LIBICONV Library.
-  *
-  * The GNU LIBICONV Library is free software; you can redistribute it
-@@ -36,7 +36,6 @@
- # include <wchar.h>
- # define BUF_SIZE 64  /* assume MB_LEN_MAX <= 64 */
-   /* Some systems, like BeOS, have multibyte encodings but lack mbstate_t.  */
--  extern size_t mbrtowc ();
- # ifdef mbstate_t
- #  define mbrtowc(pwc, s, n, ps) (mbrtowc)(pwc, s, n, 0)
- #  define mbsinit(ps) 1
diff --git a/package/libiconv/0001-libtool.patch b/package/libiconv/0001-libtool.patch
new file mode 100644
index 0000000000..7c72781b4e
--- /dev/null
+++ b/package/libiconv/0001-libtool.patch
@@ -0,0 +1,57 @@
+Libtool fixes for cross-compilation, many past contributors/authors.
+Update based on libtool-2.4.4, useful for 2.4.3 as well but not 2.4.2.
+
+Upstream: Not applicable (Buildroot specific)
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased for version 1.18]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/build-aux/ltmain.sh	2014-12-16 09:51:23.068441045 -0300
++++ b/build-aux/ltmain.sh	2014-12-16 09:57:10.509430339 -0300
+@@ -2687,8 +2687,8 @@
+ 	# was found and let the user know that the "--tag" command
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+-	  func_echo "unable to infer tagged configuration"
+-	  func_fatal_error "specify a tag with '--tag'"
++	  func_echo "defaulting to \`CC'"
++	  func_echo "if this is not correct, specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
+ 	fi
+@@ -4277,8 +4277,12 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
++
++	  #
++	  # This breaks install into our staging area.  -PB
++	  #
++	  #test "$inst_prefix_dir" = "$destdir" && \
++	  #  func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -8112,7 +8112,7 @@
+ 	  *)
+ 	    if test no = "$installed"; then
+ 	      func_append notinst_deplibs " $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -10710,6 +10710,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++	      # Replacing uninstalled with installed can easily break crosscompilation,
++	      # since the installed path is generally the wrong architecture.  -CL
++	      newdependency_libs="$newdependency_libs $deplib"
++	      continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"
diff --git a/package/libiconv/libiconv.hash b/package/libiconv/libiconv.hash
index e3a6125e25..9fa38c567b 100644
--- a/package/libiconv/libiconv.hash
+++ b/package/libiconv/libiconv.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256  ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178  libiconv-1.15.tar.gz
+sha256  3b08f5f4f9b4eb82f151a7040bfd6fe6c6fb922efe4b1659c66ea933276965e8  libiconv-1.18.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 40763a92f8..a102ff18a4 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-LIBICONV_VERSION = 1.15
+LIBICONV_VERSION = 1.18
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
-LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
+LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.1+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
+# libiconv uses a patched version of libtool 2.5.4
+# we use a package-specific patch instead
+LIBICONV_LIBTOOL_PATCH = NO
+
 ifeq ($(BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS),y)
 LIBICONV_CONF_OPTS += --enable-extra-encodings
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
