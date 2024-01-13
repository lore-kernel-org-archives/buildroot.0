Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C48C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F15EB41FAB;
	Sat, 13 Jan 2024 13:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F15EB41FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDfKz5V5PU91; Sat, 13 Jan 2024 13:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08D3941E1A;
	Sat, 13 Jan 2024 13:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08D3941E1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A45201BF868
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C12840125
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C12840125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Wt212_cWErM for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D01B40119
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D01B40119
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF17685FD5; Sat, 13 Jan 2024 13:51:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:32:59 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: acaf6162fdb0a446175685e44ccfeb9e3afc1b10
X-Git-Newrev: 7ebedf94b508274470e0380d01d18c486f27a0c8
X-Patchwork-Hint: ignore
Message-Id: <20240113135159.EF17685FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libarchive: fix
 uclibc build with libiconv (again)
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ebedf94b508274470e0380d01d18c486f27a0c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 wrongly removed patch
added by commit 1e8cce6f2b1936dbda9d63ddf4f41acf59a64113, advocating
that upstream applied a different "solution", this "solution" was
already tested on buildroot with commit
9525bc7e64e8f44c31ab9dfd3f516ecb35982429 and is utterly broken as stated
in:
https://github.com/libarchive/libarchive/pull/1825#issuecomment-1403537856
https://github.com/libarchive/libarchive/pull/1825#issuecomment-1437451472
https://github.com/libarchive/libarchive/issues/1819#issuecomment-1439962521
https://github.com/libarchive/libarchive/issues/1841#issuecomment-1426628554
https://github.com/libarchive/libarchive/pull/1813#issuecomment-1396373372

As a result, build failures are again raised by uclibc-ng with libiconv
on fwup/gvfs/...:

configure: error: Requires libarchive. Libarchive must be built with zlib support.

[...]

Run-time dependency libarchive found: NO (tried cmake)

../output-1/build/gvfs-1.48.1/meson.build:405:2: ERROR: Dependency lookup for libarchive with method 'pkgconfig' failed: Could not generate cargs for libarchive:
Package iconv was not found in the pkg-config search path.
Perhaps you should add the directory containing `iconv.pc'
to the PKG_CONFIG_PATH environment variable
Package 'iconv', required by 'libarchive', not found

So revert the upstream "solution", put back previous patch and let's
hope that upstream improve their skills in pkg-config and static
building but they probably don't really care about it...

Fixes:
 - http://autobuild.buildroot.org/results/0f5058634ecc2ffae3993f6f4513d8ce75e6c02f
 - http://autobuild.buildroot.org/results/20fc291ef7e37ee8bd553976cbe841e53345680b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9ac63a33609fd4fee17874bc9569688c78613e1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-add-iconv-to-the-.pc-file-if-needed-1825.patch | 31 ++++++++++++++++++++++
 ...ols-do-not-add-iconv-for-Requires.private.patch | 27 +++++++++++++++++++
 package/libarchive/libarchive.mk                   |  4 +++
 3 files changed, 62 insertions(+)

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
new file mode 100644
index 0000000000..a4dd7dad5c
--- /dev/null
+++ b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
@@ -0,0 +1,31 @@
+From 3879afd473a256173cc626e16293f3fe8875f2d6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Jan 2024 09:53:23 +0100
+Subject: [PATCH] Revert "Only add "iconv" to the .pc file if needed (#1825)"
+
+This reverts commit 1f35c466aaa9444335a1b854b0b7223b0d2346c2.
+
+Upstream: no dedicated PR for this revert but there is already plenty of PRs/issues to fix iconv build ...
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 93f7af94..204a4e69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -434,9 +434,7 @@ if test "x$with_iconv" != "xno"; then
+     AC_CHECK_HEADERS([localcharset.h])
+     am_save_LIBS="$LIBS"
+     LIBS="${LIBS} ${LIBICONV}"
+-    if test -n "$LIBICONV"; then
+-      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
+-    fi
++    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
+     AC_CHECK_FUNCS([locale_charset])
+     LIBS="${am_save_LIBS}"
+     if test "x$ac_cv_func_locale_charset" != "xyes"; then
+-- 
+2.43.0
+
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
new file mode 100644
index 0000000000..338dad46e0
--- /dev/null
+++ b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
@@ -0,0 +1,27 @@
+From 619c1be8d38ff79622db8f66f3b02832795315f9 Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 14 Dec 2022 09:04:39 +0100
+Subject: [PATCH] autotools: do not add iconv for Requires.private
+
+There is no pkgconfig file for iconv, thus things break with this
+change. Let's drop iconv from Requires.private.
+
+Fixes: a83f3d32 ("autotools: Fix static linking when openssl is enabled in windows")
+Upstream: https://github.com/libarchive/libarchive/pull/1817/commits/619c1be8d38ff79622db8f66f3b02832795315f9
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
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 2db36156b8..136f7a9c09 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -11,6 +11,10 @@ LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
+# We're patching configure.ac
+LIBARCHIVE_AUTORECONF = YES
+# needed for autoreconf
+LIBARCHIVE_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
