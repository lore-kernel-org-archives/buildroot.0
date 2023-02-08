Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EC3C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8742E610F4;
	Wed,  8 Feb 2023 14:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8742E610F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzSNfTzkiU7A; Wed,  8 Feb 2023 14:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B55610E5;
	Wed,  8 Feb 2023 14:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B55610E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD4361BF395
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 230104035A
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 230104035A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYlXP9D0N0Q1 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:24:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A447440066
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A447440066
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:24:36 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 71FD2206CE;
 Wed,  8 Feb 2023 08:24:35 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 08:23:58 -0600
Message-Id: <20230208142358.2721276-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1675866275; bh=S1eIc502Sqo8sZSzpN+mb99/5O39fhWe5KYpQVB986c=;
 h=From:To:Cc:Subject:Date:From;
 b=nAvttdiYIL28EkUcBiY9ALhSJZJeHxma5FMT6JyFuHjyGMShan43IvU3x4hBOMtNc
 B32ExXG/mmma1YtQBm+fMI1CzNGkvtWA1hdcIJaXlWf6hPJ9e7vDVOhbx9Pu8HHldt
 PzDFE2cRIl77OoSf/O/FgUW5bAA4pErVAEIsSu8E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=nAvttdiY
Subject: [Buildroot] [PATCH 1/1] package/xz: patch configure due to
 microblaze patch
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit bed21bb9b added a patch to change configure.ac but failed to
update configure which caused build failures due to the timestamp
difference between configure and configure.ac and the makefile attempting
to run aclocal.

XZ_AUTORECONF = YES creates a circular dependency where the host
autotools need host-xz which also gets patched. Because of this, we need
to patch xz's configure script manually.

While we're doing this, correct the language in the commit body of the
patch, remove a stray whitespace, and fix the offset for configure.ac

Fixes: bed21bb9b ("package/xz: fix microblaze compiles")
Fixes: http://autobuild.buildroot.net/results/958/9586f21e447ef9923606b1385ff333138406b685//

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 ...0001-Detect-symver-attribute-support.patch | 54 ++++++++++++++-----
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/package/xz/0001-Detect-symver-attribute-support.patch b/package/xz/0001-Detect-symver-attribute-support.patch
index 9ec43ea7a0..8016de83ab 100644
--- a/package/xz/0001-Detect-symver-attribute-support.patch
+++ b/package/xz/0001-Detect-symver-attribute-support.patch
@@ -1,11 +1,11 @@
-From 231add523328ad9e021d8f2b02697b6a11719430 Mon Sep 17 00:00:00 2001
+From f0e0e8bd08b4d4e7c89a5a3b7d9a3c083f7e5432 Mon Sep 17 00:00:00 2001
 From: Vincent Fazio <vfazio@gmail.com>
-Date: Tue, 7 Feb 2023 08:51:24 -0600
+Date: Wed, 8 Feb 2023 12:58:37 +0000
 Subject: [PATCH] Detect symver attribute support
 
-On non-ELF platforms, such as microblaze, builds will fail when trying
-to add symver information because  __attribute__((symver ..)) is not
-supported even though __has_attribute(__symver__) returns true.
+On Microblaze, builds will fail when trying to add symver information
+because  __attribute__((symver ..)) is not supported even though
+__has_attribute(__symver__) returns true.
 
 Support for symver needs to be detected via a compile test since
 __has_attribute can report false positives [0].
@@ -19,15 +19,17 @@ Upstream: https://github.com/tukaani-project/xz/pull/32
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
- configure.ac                | 9 +++++++++
- src/liblzma/common/common.h | 2 +-
- 2 files changed, 10 insertions(+), 1 deletion(-)
+---
+ configure                   | 15 +++++++++++++++
+ configure.ac                |  9 +++++++++
+ src/liblzma/common/common.h |  2 +-
+ 3 files changed, 25 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5ad5589..08c623a 100644
+index dfec76c..7b01f2e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -791,6 +791,15 @@ else
+@@ -697,6 +697,15 @@ else
  				time with Libtool if neither --with-pic nor
  				--without-pic is used). This define must be
  				used together with liblzma_linux.map.])
@@ -44,7 +46,7 @@ index 5ad5589..08c623a 100644
  		*)
  			enable_symbol_versions=generic
 diff --git a/src/liblzma/common/common.h b/src/liblzma/common/common.h
-index 11fec52..1d2ef9c 100644
+index 671d3bc..27b56ee 100644
 --- a/src/liblzma/common/common.h
 +++ b/src/liblzma/common/common.h
 @@ -76,7 +76,7 @@
@@ -52,10 +54,36 @@ index 11fec52..1d2ef9c 100644
  // is available. This should be far more reliable than looking at compiler
  // version macros as nowadays especially __GNUC__ is defined by many compilers.
 -#	if lzma_has_attribute(__symver__)
-+#	if defined(HAVE_SYMVER_ATTRIBUTE) 
++#	if defined(HAVE_SYMVER_ATTRIBUTE)
  #		define LZMA_SYMVER_API(extnamever, type, intname) \
  			extern __attribute__((__symver__(extnamever))) \
  					LZMA_API(type) intname
+diff --git a/configure b/configure
+index ff0eed5..e685b30 100755
+--- a/configure
++++ b/configure
+@@ -16687,6 +16687,21 @@ printf "%s\n" "" >&6; }
+ 
+ printf "%s\n" "#define HAVE_SYMBOL_VERSIONS_LINUX $have_symbol_versions_linux" >>confdefs.h
+ 
++			OLD_CFLAGS="$CFLAGS"
++			CFLAGS="$CFLAGS -Werror"  # we need -Werror to make sure the attribute is not ignored
++			cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++__attribute__ ((symver ("test@TEST"))) void foo(void) { }
++
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"
++then :
++
++printf "%s\n" "#define HAVE_SYMVER_ATTRIBUTE 1" >>confdefs.h
++
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.beam conftest.$ac_ext
++			CFLAGS="$OLD_CFLAGS"
+ 			;;
+ 		*)
+ 			enable_symbol_versions=generic
 -- 
-2.25.1
+2.34.1
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
