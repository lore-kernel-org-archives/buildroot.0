Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5DEC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04AE81F77;
	Mon, 20 Feb 2023 20:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04AE81F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmtlGXYpTaXC; Mon, 20 Feb 2023 20:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D39D781F92;
	Mon, 20 Feb 2023 20:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D39D781F92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB9D1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77399400D1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77399400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsVHkbbtxHPP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:39:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 829B1400AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829B1400AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CA088643C; Mon, 20 Feb 2023 20:39:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:38:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8e461bba5942b4711b94a57799600fb4eb226c1
X-Git-Newrev: 1e8cce6f2b1936dbda9d63ddf4f41acf59a64113
X-Patchwork-Hint: ignore
Message-Id: <20230220203958.6CA088643C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: fix uclibc with
 libiconv build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e8cce6f2b1936dbda9d63ddf4f41acf59a64113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace patch added by commit 9525bc7e64e8f44c31ab9dfd3f516ecb35982429
as current patch is not correct, build failures are still raised by
uclibc-ng with libiconv on fwup/gvfs/...:

configure: error: Requires libarchive. Libarchive must be built with zlib support.

[...]

Run-time dependency libarchive found: NO (tried cmake)

../output-1/build/gvfs-1.48.1/meson.build:405:2: ERROR: Dependency lookup for libarchive with method 'pkgconfig' failed: Could not generate cargs for libarchive:
Package iconv was not found in the pkg-config search path.
Perhaps you should add the directory containing `iconv.pc'
to the PKG_CONFIG_PATH environment variable
Package 'iconv', required by 'libarchive', not found

Fixes:
 - http://autobuild.buildroot.org/results/05a5496495e51da2c9caf7570695cc95e1745e30
 - http://autobuild.buildroot.org/results/98dc4b415115cca65b53e4cd986144ef85bf17ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Only-add-iconv-to-the-pc-file-if-needed.patch | 44 ----------------------
 ...ols-do-not-add-iconv-for-Requires.private.patch | 28 ++++++++++++++
 2 files changed, 28 insertions(+), 44 deletions(-)

diff --git a/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch b/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
deleted file mode 100644
index c93944f789..0000000000
--- a/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1f35c466aaa9444335a1b854b0b7223b0d2346c2 Mon Sep 17 00:00:00 2001
-From: Peter Pentchev <roam@ringlet.net>
-Date: Thu, 29 Dec 2022 00:04:40 +0200
-Subject: [PATCH] Only add "iconv" to the .pc file if needed (#1825)
-
-Hi,
-
-Thanks for writing and maintaining libarchive!
-
-What do you think about this trivial change that does not add "iconv" to
-the pkg-config file's list of required packages unless it is actually
-needed? On at least Debian GNU/Linux systems, the iconv(3) function is
-part of the system C library and there is no Debian package that
-installs an iconv.pc file, so I had to make this change to the Debian
-package of libarchive.
-
-Thanks again, and keep up the great work!
-
-G'luck,
-Peter
-
-Downloaded from upstream commit:
-https://github.com/libarchive/libarchive/commit/1f35c466aaa9444335a1b854b0b7223b0d2346c2
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 99bff20d1..e2715cfde 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -378,7 +378,9 @@ if test "x$with_iconv" != "xno"; then
-     AC_CHECK_HEADERS([localcharset.h])
-     am_save_LIBS="$LIBS"
-     LIBS="${LIBS} ${LIBICONV}"
--    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-+    if test -n "$LIBICONV"; then
-+      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-+    fi
-     AC_CHECK_FUNCS([locale_charset])
-     LIBS="${am_save_LIBS}"
-     if test "x$ac_cv_func_locale_charset" != "xyes"; then
diff --git a/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch
new file mode 100644
index 0000000000..91903866ef
--- /dev/null
+++ b/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -0,0 +1,28 @@
+From 619c1be8d38ff79622db8f66f3b02832795315f9 Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 14 Dec 2022 09:04:39 +0100
+Subject: [PATCH] autotools: do not add iconv for Requires.private
+
+There is no pkgconfig file for iconv, thus things break with this
+change. Let's drop iconv from Requires.private.
+
+Fixes: a83f3d32 ("autotools: Fix static linking when openssl is enabled in windows")
+[Retrieved from:
+https://github.com/libarchive/libarchive/pull/1817/commits/619c1be8d38ff79622db8f66f3b02832795315f9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 99bff20d1..f245d0c55 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -378,7 +378,6 @@ if test "x$with_iconv" != "xno"; then
+     AC_CHECK_HEADERS([localcharset.h])
+     am_save_LIBS="$LIBS"
+     LIBS="${LIBS} ${LIBICONV}"
+-    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
+     AC_CHECK_FUNCS([locale_charset])
+     LIBS="${am_save_LIBS}"
+     if test "x$ac_cv_func_locale_charset" != "xyes"; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
