Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34902C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF93881971;
	Tue, 14 May 2024 21:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aS7Q-2-ZbJW1; Tue, 14 May 2024 21:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29AC81A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29AC81A5F;
	Tue, 14 May 2024 21:54:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4651BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C6760708
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLvUnjvMBI_P for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79C61606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79C61606D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79C61606D9
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:54:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09e6.dip0.t-ipconnect.de [91.58.9.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA4C0A4C48E9;
 Tue, 14 May 2024 23:54:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59422)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s7065-000000000Dp-2OYI;
 Tue, 14 May 2024 21:54:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:54:04 +0200
Message-Id: <20240514215406.2866563-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514215406.2866563-1-bernd@kuhls.net>
References: <20240514215406.2866563-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715723649;
 bh=v+yJsM4i/6AqgXRB2+nB7R06jaw2w//J3XjV1N/RzbI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C4nGo1HNQAyoZHWt5Osh7OM9XP6r6IleSrr7E11Ux2ttCtsXchKlzUcKmWMIzyfDQ
 ClX8U6+bYxJ1GuQ6OfaqRTpJHgXxGEOs8b7igaf/gUIMfE6VEOzWuGrxmnrsNYbAdz
 1Cx5aGOFyN2i7ZcScM2o7FmGmuV/mLdI1skH3HGOhxnwxJvsC0RUXC7JEl21MrbXPB
 vyzGqhe4HY+nXyyXAexSikcDMdRUJ2kC8pLkuCwLNY5QKyUOxEwUFn/sQCYTUzarxt
 ZHXeLOPGPL1FRRJlf1yCPJN0xkWskFtNR8gnFlv+IZsg2AWgClVNqBhMB5BLpQsxUI
 f2mHQtIkF4g8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=C4nGo1HN
Subject: [Buildroot] [PATCH 3/5] package/collectd: fix build with gcc 14.x
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...c-nut-c-detect-int-types-required-by.patch | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 package/collectd/0003-configure.ac-src-nut-c-detect-int-types-required-by.patch

diff --git a/package/collectd/0003-configure.ac-src-nut-c-detect-int-types-required-by.patch b/package/collectd/0003-configure.ac-src-nut-c-detect-int-types-required-by.patch
new file mode 100644
index 0000000000..f08dc1b731
--- /dev/null
+++ b/package/collectd/0003-configure.ac-src-nut-c-detect-int-types-required-by.patch
@@ -0,0 +1,153 @@
+From d409ffa2a64cac3fc2abe2bb86ec3a80cb34d0a6 Mon Sep 17 00:00:00 2001
+From: Jim Klimov <jimklimov+nut@gmail.com>
+Date: Wed, 31 Aug 2022 11:40:01 +0200
+Subject: [PATCH] configure.ac, src/nut.c: detect int types required by NUT API
+ we build against
+
+Either use the stricter int types required by NUT headers since v2.8.0 release,
+or the relaxed (arch-dependent) types required by older NUT releases - depending
+on which NUT API version the collectd is building against at the moment.
+
+Inspired by discussion at https://github.com/networkupstools/nut/issues/1638
+
+Upstream: https://github.com/collectd/collectd/commit/d409ffa2a64cac3fc2abe2bb86ec3a80cb34d0a6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/nut.c    |   4 +--
+ 2 files changed, 102 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1737aff316..f88ed26505 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5881,6 +5881,106 @@ if test "x$with_libupsclient" = "xyes"; then
+   CPPFLAGS="$SAVE_CPPFLAGS"
+ fi
+ 
++if test "x$with_libupsclient" = "xyes"; then
++  dnl The m4 script logic below is modelled after NUT_FUNC_GETNAMEINFO_ARGTYPES
++  dnl further originating in curl autoconf scripts or beyond. See there for an
++  dnl example of general-case logic to handle matching of numerous possible
++  dnl data types for each argument in supported API variants.
++  dnl Note: techically compiler complains here not about int types themselves,
++  dnl but about pointers to such data. We know "out of band" that e.g. NUT
++  dnl change to "size_t" happened at once for all arguments in the API, so
++  dnl simplify the handling here and now with that assumption.
++  AC_LANG_PUSH([C])
++  SAVE_CPPFLAGS="$CPPFLAGS"
++  SAVE_LDFLAGS="$LDFLAGS"
++  SAVE_CFLAGS="$CFLAGS"
++  CPPFLAGS="$CPPFLAGS $with_libupsclient_cflags"
++  LDFLAGS="$LDFLAGS $with_libupsclient_libs"
++  CFLAGS="$CFLAGS $with_libupsclient_cflags"
++  if test "x$GCC" = "xyes"; then
++    CFLAGS="$CFLAGS -Wall -Werror"
++  fi
++
++  dnl upscli_splitname() *is* there forever (2007 or older)
++  dnl but int types e.g. "port" changed in NUT 2.8.0
++  dnl Also this is the UPSCONN_t::port field type:
++  AC_CACHE_CHECK([int type of port argument for NUT upscli_splitname],
++    [collectd_cv_func_upscli_splitname_args], [
++     collectd_cv_func_upscli_splitname_args="unknown"
++     for port_arg in 'uint16_t' 'int' ; do
++        AC_COMPILE_IFELSE([
++            AC_LANG_PROGRAM([
++#include <upsclient.h>
++/* int upscli_splitname(const char *buf, char **upsname, char **hostname, <port_arg> *port); */
++            ],[
++const char *origname = "ups@localhost:3493";
++$port_arg port=0;
++char *hostname;
++char *upsname;
++int res = upscli_splitname(origname, &upsname, &hostname, &port);
++return(res);
++            ])
++        ],[
++            collectd_cv_func_upscli_splitname_args="$port_arg"
++            break
++        ])
++     done
++    ])
++
++  AS_IF([test x"$collectd_cv_func_upscli_splitname_args" = xunknown],
++    [AC_MSG_WARN([Can not find proper port type for upscli_splitname()])
++     with_libupsclient="no (required data types for NUT API were not detected)"],
++    [AC_DEFINE_UNQUOTED(NUT_PORT_TYPE, $collectd_cv_func_upscli_splitname_args,
++        [Define to the integer type for TCP/IP ports used by NUT API we build against])
++    ])
++
++
++  AC_CACHE_CHECK([int type of length/numbering arguments for NUT upscli_list_next],
++    [collectd_cv_func_upscli_list_next_args], [
++     collectd_cv_func_upscli_list_next_args="unknown"
++     for size_arg in 'size_t' 'unsigned int' 'int' ; do
++        AC_COMPILE_IFELSE([
++            AC_LANG_PROGRAM([
++#include <upsclient.h>
++/* int upscli_list_next(UPSCONN_t *ups, <size_arg> numq, const char **query, <size_arg> *numa, char ***answer); */
++
++#if HAVE_UPSCONN_T
++typedef UPSCONN_t collectd_upsconn_t;
++#elif HAVE_UPSCONN
++typedef UPSCONN collectd_upsconn_t;
++#else
++#error "Unable to determine the UPS connection type."
++#endif
++            ],[
++$size_arg query_num=0;
++$size_arg answer_num=0;
++const char * query;
++char** answer;
++collectd_upsconn_t ups;
++int res = upscli_list_next(&ups, query_num, &query, &answer_num, &answer);
++return(res);
++            ])
++        ],[
++            collectd_cv_func_upscli_list_next_args="$size_arg"
++            break
++        ])
++     done
++    ])
++
++  AS_IF([test x"$collectd_cv_func_upscli_list_next_args" = xunknown],
++    [AC_MSG_WARN([Can not find proper type for array sizes and string lengths used by upscli_list_next()])
++     with_libupsclient="no (required data types for NUT API were not detected)"],
++    [AC_DEFINE_UNQUOTED(NUT_SIZE_TYPE, $collectd_cv_func_upscli_list_next_args,
++        [Define to the integer type for array sizes and string lengths used by NUT API we build against])
++    ])
++
++
++  CPPFLAGS="$SAVE_CPPFLAGS"
++  LDFLAGS="$SAVE_LDFLAGS"
++  CFLAGS="$SAVE_CFLAGS"
++  AC_LANG_POP([C])
++fi
++
+ if test "x$with_libupsclient" = "xyes"; then
+   BUILD_WITH_LIBUPSCLIENT_CFLAGS="$with_libupsclient_cflags"
+   BUILD_WITH_LIBUPSCLIENT_LIBS="$with_libupsclient_libs"
+diff --git a/src/nut.c b/src/nut.c
+index a9a6c98380..1a29438b07 100644
+--- a/src/nut.c
++++ b/src/nut.c
+@@ -46,7 +46,7 @@ struct nut_ups_s {
+   collectd_upsconn_t *conn;
+   char *upsname;
+   char *hostname;
+-  int port;
++  NUT_PORT_TYPE port;
+   nut_ups_t *next;
+ };
+ 
+@@ -250,7 +250,7 @@ static int nut_read(user_data_t *user_data) {
+   const char *query[3] = {"VAR", ups->upsname, NULL};
+   unsigned int query_num = 2;
+   char **answer;
+-  unsigned int answer_num;
++  NUT_SIZE_TYPE answer_num;
+   int status;
+ 
+   /* (Re-)Connect if we have no connection */
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
