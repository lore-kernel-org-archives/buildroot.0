Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA487CCF9FC
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 12:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6768B41056;
	Thu, 30 Oct 2025 12:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2mW4sXTLJ08; Thu, 30 Oct 2025 12:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745CF41238
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745CF41238;
	Thu, 30 Oct 2025 12:02:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8061A160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6383041238
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79OvkFjXVyMD for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 12:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 626C941056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626C941056
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 626C941056
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:02:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28FE41814B9; Thu, 30 Oct 2025 13:02:08 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 13:01:32 +0100
Message-ID: <20251030120150.2458324-4-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120150.2458324-1-buildroot@heine.tech>
References: <20251030120150.2458324-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1761825728; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=/OaaAcAaxR26rlgzseiVR0jVTuuPbUVbUpz4lmEKSco=;
 b=Jm4hmSHo1C++/wkKQX2InqRws917C23zUIx7xAfkXRqT3BhssHXxM5/OKDOJOSMEJR1RME
 Lm34TYwIoOwSgCn78N4W+ZAnL1Kk6ugcxWK9KM3h14Wzoz6ejALdkeYUqIays6AgNPBzcc
 1bZFxRLrhtPVnjLaz2r4a1sHU41p+Zc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=Jm4hmSHo
Subject: [Buildroot] [PATCH 4/4] package/collectd: fix build with grpc
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
index 0000000000..feb2d41ad4
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
+Upstream: https://github.com/collectd/collectd/pull/4386
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
