Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55B9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 17:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 814444019D;
	Thu, 29 Dec 2022 17:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 814444019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZiIZj_O7mD3; Thu, 29 Dec 2022 17:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A790E40181;
	Thu, 29 Dec 2022 17:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A790E40181
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF701BF389
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 17:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45C564032E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 17:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45C564032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHi1_e-921ii for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 17:52:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 917E84032D
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 917E84032D
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 17:52:59 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 96B764194;
 Thu, 29 Dec 2022 18:52:56 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAx5L-1bFpUv0; Thu, 29 Dec 2022 18:52:55 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37934)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAx5K-0008KM-23;
 Thu, 29 Dec 2022 18:52:54 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 18:52:54 +0100
Message-Id: <20221229175254.224876-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672336375-EDFF0A26-7DC9EC62/0/0 CLEAN NORMAL
X-TOI-MSGID: 7cb5ca94-188b-4f8a-901a-e3db456a8a73
Subject: [Buildroot] [PATCH 1/1] package/libarchive: Only add "iconv" to the
 .pc file if needed
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

Fix broken build of the fwup package after bump of libarchive to version
3.6.2 in commit 380341b249175382691f268de4b41d3843ff0acc and upstream
commit https://github.com/libarchive/libarchive/commit/a83f3d327aefe8d628230f326621b014d82f55b4

checking for ARCHIVE... no
configure: error: Requires libarchive. Libarchive must be built with zlib support.

Fixes:
http://autobuild.buildroot.net/results/f5d/f5d549fb4f08156ba5952ce75926f7fd2242bfdf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This patch supersedes
http://patchwork.ozlabs.org/project/buildroot/patch/20221218130225.353325-1-fontaine.fabrice@gmail.com/
due to upstream commit of
https://github.com/libarchive/libarchive/pull/1825

 ...y-add-iconv-to-the-pc-file-if-needed.patch | 44 +++++++++++++++++++
 package/libarchive/libarchive.mk              |  2 +
 2 files changed, 46 insertions(+)
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
index cfc148d01d..e64ea7a69e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -11,6 +11,8 @@ LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
+# We're patching configure.ac
+LIBARCHIVE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
