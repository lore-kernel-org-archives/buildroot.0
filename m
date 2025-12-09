Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C23D3B7F3
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 20:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B535408A3;
	Tue,  9 Dec 2025 20:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCupyJxmAh1j; Tue,  9 Dec 2025 20:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 717D740893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765311549;
	bh=2Ulif49IqWWlDa9fB2HYJuIOz2AfQvesiWDmb7eMaCQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=gRpqIwy6pUuVQUD5SIpaYeGq4DU4xan56ab7UjqKlt9v8g7UqzLXpLMWtRP3PIRNM
	 gisnGtomkBnYiv6jH4JZjVa1sAG7FqeBp+oYEoUbnFSVEvJdXAkg9aJxTVNFCS0rAR
	 JwOXOtVb3m9GiACrkEg3+jEEfMlLQYM4WthOPqiVKsVsP9o3IhWoLtH1iXRCIepiR3
	 kNUujGKbozQ/Z59hM5soN/P8y1tYd+DNX9kwQxc9GjZ/3Z1eT/4quSFtUpGUUS/bYc
	 LVHwE+vH9IQdwUMUxVNpsrVVvFKPAJie+19yFHpoGzqjha4yFyME+63tvqDU/E+Nl3
	 V+WOKvA5eJkAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 717D740893;
	Tue,  9 Dec 2025 20:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 002E4237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9E17405D8
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAbMIJO7-GL9 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 20:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B20E240028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B20E240028
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B20E240028
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBED71814B9; Tue,  9 Dec 2025 21:18:59 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 21:18:42 +0100
Message-ID: <20251209201851.1023802-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1765311541; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=zBVtNOKgzvODuBFU5Xwyf9dWvJci5HnsUa1cLKlFBsY=;
 b=lWrm6KEgshPNCAROqRbD/WielC3gBfEqcQP42rgXLvDzRe/5/il+bICB/Q3dwpfvuRAgfT
 8irvDbPf6Z7oOaIJs8dsKp8SLJjgneDbYOygKnnR6FtapCQ0W3IYPS9Gp3c4cuSsEjObbQ
 eAiEbNJja9xq+Hl0xPWrpVB7m6JmHTc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=lWrm6KEg
Subject: [Buildroot] [PATCH 1/4] package/collectd: fix build with grpc
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

abseil and hence protobuf/grpc now need C++17.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...005-configure.ax-fix-grpc-build-2025.patch | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 package/collectd/0005-configure.ax-fix-grpc-build-2025.patch

diff --git a/package/collectd/0005-configure.ax-fix-grpc-build-2025.patch b/package/collectd/0005-configure.ax-fix-grpc-build-2025.patch
new file mode 100644
index 0000000000..e750483135
--- /dev/null
+++ b/package/collectd/0005-configure.ax-fix-grpc-build-2025.patch
@@ -0,0 +1,73 @@
+From 42b2ede4dadcf88293e408bcdf5645995b61b148 Mon Sep 17 00:00:00 2001
+From: Michael Nosthoff <buildroot@heine.tech>
+Date: Wed, 29 Oct 2025 16:48:20 +0100
+Subject: [PATCH] configure.ac: fix grpc build
+
+Similar to the previous "configure.ac: fix grpc build" commit:
+Google bumped it's compiler requirements again [1], hence the c++ version needs to be adjusted to c++17 to be able to build with the latest grpc versions.
+
+[1] https://github.com/google/oss-policies-info/blob/a5e3ed43d45ad615a20201cea8f7282f595555da/foundational-cxx-support-matrix.md
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+Upstream: https://github.com/collectd/collectd/commit/42b2ede4dadcf88293e408bcdf5645995b61b148
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8aa03fce63..eb6cbbc5d5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2844,20 +2844,20 @@ PKG_CHECK_MODULES([GRPCPP], [grpc++],
+ fi
+ 
+ if test "x$withval" != "xno"; then
+-  AC_MSG_CHECKING([whether $CXX accepts -std=c++14])
+-  if test_cxx_flags -std=c++14; then
++  AC_MSG_CHECKING([whether $CXX accepts -std=c++17])
++  if test_cxx_flags -std=c++17; then
+     AC_MSG_RESULT([yes])
+   else
+     AC_MSG_RESULT([no])
+-    with_libgrpcpp="no (requires C++14 support)"
+-    with_libprotobuf="no (<absl/base/policy_checks.h> requires C++14 support)"
++    with_libgrpcpp="no (requires C++17 support)"
++    with_libprotobuf="no (<absl/base/policy_checks.h> requires C++17 support)"
+   fi
+ fi
+ 
+ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_PUSH(C++)
+   SAVE_CPPFLAGS="$CPPFLAGS"
+-  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++17 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   AC_CHECK_HEADERS([grpc++/grpc++.h],
+     [with_libgrpcpp="yes"],
+     [with_libgrpcpp="no (<grpc++/grpc++.h> not found)"]
+@@ -2871,7 +2871,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   SAVE_CPPFLAGS="$CPPFLAGS"
+   SAVE_LDFLAGS="$LDFLAGS"
+   SAVE_LIBS="$LIBS"
+-  CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
++  CPPFLAGS="-std=c++17 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS $CPPFLAGS"
+   LDFLAGS="$with_libgrpcpp_ldflags"
+   if test "x$GRPCPP_LIBS" = "x"; then
+     LIBS="-lgrpc++"
+@@ -2899,7 +2899,7 @@ if test "x$with_libgrpcpp" = "xyes"; then
+   AC_LANG_POP(C++)
+ fi
+ 
+-BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++14 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
++BUILD_WITH_LIBGRPCPP_CPPFLAGS="-std=c++17 $with_libgrpcpp_cppflags $GRPCPP_CFLAGS"
+ BUILD_WITH_LIBGRPCPP_LDFLAGS="$with_libgrpcpp_ldflags"
+ BUILD_WITH_LIBGRPCPP_LIBS="$GRPCPP_LIBS"
+ AC_SUBST([BUILD_WITH_LIBGRPCPP_CPPFLAGS])
+@@ -4843,7 +4843,7 @@ if test "x$withval" != "xno"; then
+   AC_CHECK_LIB([protobuf], [main],
+     [
+       SAVE_CPPFLAGS="$CPPFLAGS"
+-      CPPFLAGS="-std=c++14 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
++      CPPFLAGS="-std=c++17 $with_libprotobuf_cppflags $PROTOBUF_CFLAGS"
+       if test "x$PROTOBUF_LIBS" = "x"
+       then
+         PROTOBUF_LIBS="-lprotobuf"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
