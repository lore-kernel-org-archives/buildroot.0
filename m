Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8095CC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 18:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B61C8138A;
	Wed,  1 Feb 2023 18:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B61C8138A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkyTrhQHD43T; Wed,  1 Feb 2023 18:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442BF81430;
	Wed,  1 Feb 2023 18:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442BF81430
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB9561BF29D
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 18:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39C3812F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 18:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39C3812F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2qKtOLNqwrc for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 18:10:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7646D81378
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7646D81378
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 18:10:09 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout08.t-online.de (Postfix) with SMTP id 9306810226;
 Wed,  1 Feb 2023 19:10:06 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.195.67]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pNHYc-2L4Oi90; Wed, 1 Feb 2023 19:10:06 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:47604)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pNHYb-0004E5-39;
 Wed, 01 Feb 2023 19:10:06 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 19:10:05 +0100
Message-Id: <20230201181005.731564-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675275006-B182A007-F75F4133/0/0 CLEAN NORMAL
X-TOI-MSGID: 7aaba33a-155a-4f4d-87c1-1acadffaacc1
Subject: [Buildroot] [PATCH v2 1/1] package/libarchive: Only add "iconv" to
 the .pc file if needed
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
v2: added dependency to host-pkgconf to fix autoconf error

 ...y-add-iconv-to-the-pc-file-if-needed.patch | 44 +++++++++++++++++++
 package/libarchive/libarchive.mk              |  4 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch

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
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
