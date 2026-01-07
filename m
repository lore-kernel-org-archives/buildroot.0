Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED3ECFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99CD18169A;
	Wed,  7 Jan 2026 14:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vaT2vqSzP4t; Wed,  7 Jan 2026 14:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF4A82051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794953;
	bh=h5OnQKxFvRkJ5Rg64oe67hXAQI7etDsfqZu4oHB6dMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lk3y46Dfob68Y4w6mjfBYyHfI9PaW4hrNb8tvCsmlNs+mQo+MU/hE54/GjEGHyIZ1
	 ixCe5uNV29pe8roQrRA9cWGHeayotHsUBEOLyUsZ9KQ9Ht0UmhnGKh8WV4+TIrzLpT
	 kJT2eDdvICzpNzWfEgr03tyrUznnJUqp9LW/InrIdH0y2wt1Qs3+S/uLEpwP4+56ic
	 GPcLYHGKN7ei1+MFYTpGj1cUDEt1o/ilUngaY/2ADyM3rG78MqAgCdSZF4ngFL+Dbm
	 kZUlSVLvgqNr7hhIistmRDM2lWFqXdqsdh4RpYucfCRPb0qmTRMneuWUVm4NZfKOua
	 2cpVEfYm7F/ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF4A82051;
	Wed,  7 Jan 2026 14:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F8AC970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76310409A2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi-jH2bMBbKL for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCAB34099D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCAB34099D
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCAB34099D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 36A171814B9; Wed,  7 Jan 2026 15:09:06 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Jan 2026 15:08:45 +0100
Message-ID: <20260107140858.129302-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1767794946; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=YQEJ4EFuQ1X1G4wHU9HYOUwMhzM216hSR790JXUgbFk=;
 b=KBt8Ryf/sCQUcT8iIaOvi6YYrek6WIhLhcGBxe8DqS6VbJns4zldeHkx7Ei+Y3KX82QAx2
 mQrGiFgBWUpKR8Reo5F/EGDYtspSAahLNZszDcWwPLp63rSK3nlG5hE37D7za7YIvBoUNh
 gqRCB4ozTh6cpULZl8tP6k5ifEAeaew=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=KBt8Ryf/
Subject: [Buildroot] [PATCH v2 1/3] package/collectd: enforce c++17
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

abseil since 20250512.0 and hence protobuf/grpc now need C++17.
collectd in the currently used version sets C++ to 11.
So bump the C++ Version used when building collectd like it was done
before to bump it to C++14 in commit 5fcc4e19602ad37d018ccf3543fe82a291837f43
with patch 0002.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

--

V2: reworded to be more clear that it is not fixing a currently happening issue
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
