Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56045D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 903E5409BA;
	Wed,  6 Nov 2024 21:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcqTIMEiWMS2; Wed,  6 Nov 2024 21:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F72040905
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F72040905;
	Wed,  6 Nov 2024 21:21:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F58F3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0023460A6B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0TfqMZ39dRz for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21CD60A51
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21CD60A51
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8B8B85E94; Wed,  6 Nov 2024 21:21:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 22:19:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2207e843b485b58cfc75f78dafc874ebfa91180f
X-Git-Newrev: bca077698f9c32775b31af554aaee068a1429479
X-Patchwork-Hint: ignore
Message-Id: <20241106212112.D8B8B85E94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosh: fix compatibility with newer
 protobuf versions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bca077698f9c32775b31af554aaee068a1429479
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to backport a patch to fix compatibility with newer protobuf
versions, prior to bumping protobuf.

Remove CFLAGS setting -std=c++11 and enable autoreconf so that
the patch is applied properly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosh/0001-Bump-C-version-to-C-17.patch | 49 ++++++++++++++++++++++++++
 package/mosh/mosh.mk                           |  4 +--
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/package/mosh/0001-Bump-C-version-to-C-17.patch b/package/mosh/0001-Bump-C-version-to-C-17.patch
new file mode 100644
index 0000000000..eea3889828
--- /dev/null
+++ b/package/mosh/0001-Bump-C-version-to-C-17.patch
@@ -0,0 +1,49 @@
+From eee1a8cf413051c2a9104e8158e699028ff56b26 Mon Sep 17 00:00:00 2001
+From: Alex Chernyakhovsky <alex@achernya.com>
+Date: Sun, 30 Jul 2023 16:19:46 -0400
+Subject: [PATCH] Bump C++ version to C++17
+
+Protobuf versions since 3.6.0 have long had a C++11 dependency; even
+more recent versions have picked up an Abseil dependency bumping that
+to C++14. Since it is now 2023, defaulting to C++17 is reasonable, so
+remove the conditional C++ standards version check that mosh
+previously had and replace it with an unconditional C++17 check.
+
+This means that all future commits can use C++17 features. According
+to https://en.cppreference.com/w/cpp/compiler_support/17 this means
+that minimum effective compiler versions for mosh become:
+
+gcc 7 (May 2017)
+clang 5 (September 2017)
+
+This, in turn, implies that future versions of mosh will no longer be
+available for RHEL/CentOS 7 (June 2014).
+
+Closes: #1267
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/mobile-shell/mosh/commit/eee1a8cf413051c2a9104e8158e699028ff56b26
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ee70c7b..7f7dc3b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,9 +22,9 @@ AS_IF([test x"$PROTOC" = x],
+ # automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 
+-# Protobuf 3.6+ requires C++11.
+-AS_IF([pkg-config --atleast-version 3.6.0 protobuf],
+-  [AX_CXX_COMPILE_STDCXX([11])])
++# Protobuf transitively requires at least C++14, get ahead of the
++# curve and require at least C++17.
++AX_CXX_COMPILE_STDCXX([17])
+ 
+ WARNING_CXXFLAGS=""
+ PICKY_CXXFLAGS=""
+-- 
+2.34.1
+
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index c938f70719..3c41a17401 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -9,9 +9,7 @@ MOSH_SITE = https://mosh.org
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
-
-# protobuf needs c++11 (since 3.6.0)
-MOSH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+MOSH_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MOSH_CONF_OPTS += --with-crypto-library=openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
