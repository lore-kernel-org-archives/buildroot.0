Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5785C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FB056FBF6;
	Tue, 21 Feb 2023 01:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FB056FBF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6lqGhLLHNFUt; Tue, 21 Feb 2023 01:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919FD6FBFD;
	Tue, 21 Feb 2023 01:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919FD6FBFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B01B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BF976FBBA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF976FBBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qs9rWRBCjX-x for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60CE36FBE4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CE36FBE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46BA886496; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Feb 2023 15:52:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 28ca1da23433d58112304c191c319ac11edc5d77
X-Git-Newrev: 9525bc7e64e8f44c31ab9dfd3f516ecb35982429
X-Patchwork-Hint: ignore
Message-Id: <20230220205245.46BA886496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libarchive: Only add
 "iconv" to the .pc file if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=9525bc7e64e8f44c31ab9dfd3f516ecb35982429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with fwup raised since bump to version
3.6.2 in commit 380341b249175382691f268de4b41d3843ff0acc and
https://github.com/libarchive/libarchive/commit/a83f3d327aefe8d628230f326621b014d82f55b4

checking for pkg-config... /tmp/instance-19/output-1/host/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for ARCHIVE... no
configure: error: Requires libarchive. Libarchive must be built with zlib support.

Fixes:
http://autobuild.buildroot.net/results/f5d/f5d549fb4f08156ba5952ce75926f7fd2242bfdf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...1-Only-add-iconv-to-the-pc-file-if-needed.patch | 44 ++++++++++++++++++++++
 package/libarchive/libarchive.mk                   |  4 ++
 2 files changed, 48 insertions(+)

diff --git a/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch b/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
new file mode 100644
index 0000000000..c93944f789
--- /dev/null
+++ b/package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
@@ -0,0 +1,44 @@
+From 1f35c466aaa9444335a1b854b0b7223b0d2346c2 Mon Sep 17 00:00:00 2001
+From: Peter Pentchev <roam@ringlet.net>
+Date: Thu, 29 Dec 2022 00:04:40 +0200
+Subject: [PATCH] Only add "iconv" to the .pc file if needed (#1825)
+
+Hi,
+
+Thanks for writing and maintaining libarchive!
+
+What do you think about this trivial change that does not add "iconv" to
+the pkg-config file's list of required packages unless it is actually
+needed? On at least Debian GNU/Linux systems, the iconv(3) function is
+part of the system C library and there is no Debian package that
+installs an iconv.pc file, so I had to make this change to the Debian
+package of libarchive.
+
+Thanks again, and keep up the great work!
+
+G'luck,
+Peter
+
+Downloaded from upstream commit:
+https://github.com/libarchive/libarchive/commit/1f35c466aaa9444335a1b854b0b7223b0d2346c2
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 99bff20d1..e2715cfde 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -378,7 +378,9 @@ if test "x$with_iconv" != "xno"; then
+     AC_CHECK_HEADERS([localcharset.h])
+     am_save_LIBS="$LIBS"
+     LIBS="${LIBS} ${LIBICONV}"
+-    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
++    if test -n "$LIBICONV"; then
++      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
++    fi
+     AC_CHECK_FUNCS([locale_charset])
+     LIBS="${am_save_LIBS}"
+     if test "x$ac_cv_func_locale_charset" != "xyes"; then
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index cfc148d01d..cd7c13fbed 100644
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
