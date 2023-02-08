Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9765BC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46A1E70339;
	Tue, 21 Feb 2023 02:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46A1E70339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUvFxkZpXvqY; Tue, 21 Feb 2023 02:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56BC670341;
	Tue, 21 Feb 2023 02:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56BC670341
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 142BE1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D79D41804
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D79D41804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb1jSjBg_3fi for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69E3C417C2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E3C417C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61FDD8648F; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 16:24:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7df32882203fdd525156ddb785d171b193e5b282
X-Git-Newrev: e5a83df8da04f5854c2e248e23dea3af620954cd
X-Patchwork-Hint: ignore
Message-Id: <20230220205256.61FDD8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xz: patch configure
 due to microblaze patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5a83df8da04f5854c2e248e23dea3af620954cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit bed21bb9b added a patch to change configure.ac but failed to
update configure which caused build failures due to the timestamp
difference between configure and configure.ac and the makefile attempting
to run aclocal.

XZ_AUTORECONF = YES creates a circular dependency where the host autotools
need host-xz which also gets patched.  Because of this, we need to patch
xz's configure script manually and NOT patch configure.ac so its timestamp
stays older than Makefile.in.

While we're doing this, correct the language in the commit body of the
patch, remove a stray whitespace, and fix the offset for configure.ac

Fixes: bed21bb9b ("package/xz: fix microblaze compiles")
Fixes: http://autobuild.buildroot.net/results/958/9586f21e447ef9923606b1385ff333138406b685/

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
[Peter: Only patch configure]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xz/0001-Detect-symver-attribute-support.patch  | 71 ++++++++++++----------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/package/xz/0001-Detect-symver-attribute-support.patch b/package/xz/0001-Detect-symver-attribute-support.patch
index 9ec43ea7a0..462fa9d86b 100644
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
@@ -18,33 +18,16 @@ it is supported and define a variable to advertise support.
 Upstream: https://github.com/tukaani-project/xz/pull/32
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[Peter: patch configure instead of configure.ac so autoreconf isn't
+triggered at build time]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- configure.ac                | 9 +++++++++
- src/liblzma/common/common.h | 2 +-
- 2 files changed, 10 insertions(+), 1 deletion(-)
+ configure                   | 15 +++++++++++++++
+ src/liblzma/common/common.h |  2 +-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 5ad5589..08c623a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -791,6 +791,15 @@ else
- 				time with Libtool if neither --with-pic nor
- 				--without-pic is used). This define must be
- 				used together with liblzma_linux.map.])
-+			OLD_CFLAGS="$CFLAGS"
-+			CFLAGS="$CFLAGS -Werror"  # we need -Werror to make sure the attribute is not ignored
-+			AC_COMPILE_IFELSE([AC_LANG_SOURCE(
-+				[__attribute__ ((symver ("test@TEST"))) void foo(void) { }
-+				])],
-+				[AC_DEFINE([HAVE_SYMVER_ATTRIBUTE], [1],
-+					[Define to 1 if GCC supports the symver attribute])],
-+				[])
-+			CFLAGS="$OLD_CFLAGS"
- 			;;
- 		*)
- 			enable_symbol_versions=generic
 diff --git a/src/liblzma/common/common.h b/src/liblzma/common/common.h
-index 11fec52..1d2ef9c 100644
+index 671d3bc..27b56ee 100644
 --- a/src/liblzma/common/common.h
 +++ b/src/liblzma/common/common.h
 @@ -76,7 +76,7 @@
@@ -52,10 +35,36 @@ index 11fec52..1d2ef9c 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
