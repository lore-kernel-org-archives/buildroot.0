Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DB9EE49A8
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BC0F40BB9;
	Mon, 21 Aug 2023 20:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC0F40BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c98-AQQx3G0J; Mon, 21 Aug 2023 20:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF8740BC0;
	Mon, 21 Aug 2023 20:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF8740BC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD47E1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C9FE61125
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C9FE61125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkE4FedVbKd5 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A53960E82
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A53960E82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE16E86024; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 21:46:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0ed334b4635f11fd326d9cbbbd5c3e59db8eb938
X-Git-Newrev: ee93213d18bc473e7639d0d0db3376cd2f5a3a83
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.EE16E86024@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/check: fix compile
 issue due to missing source file
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee93213d18bc473e7639d0d0db3376cd2f5a3a83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The release tarball of check 0.15.2 lacks a source file, causing a
build failure, as reported at
https://github.com/libcheck/check/issues/303. This failures happens
when thread support is not available, as the file missing is getting
compiled in when thread support is not there:

if(NOT HAVE_PTHREAD)
  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/pthread_mutex.c)
  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/pthread_mutex.c)
endif()

This issue started appearing when we moved from the autotools build
system to the CMake build system in commit
6dfc789f4f21367bc5f4b5454db0922821a765bc. One might wonder why
changing the build system can cause this kind of issue: the file was
in fact already missing. Turns out that the missing file is never used
with the autotools build system: this file provides some Win32
compatibility layer for pthread functions, so the autotools build
system never compiled this file as the autotools build system was only
used on Unix platforms. With CMake it now gets compiled to support
Windows platform. But on Linux, the entire contents of the file is
ignored as it is within a HAVE_WIN32_INIT_ONCE ifdef...endif. Still,
with the file missing, the build fails.

Until upstream publishes a new release with a complete tarball, switch
to fetching the Github-generated tarball, which does contain the
missing file.

Fixes:

  http://autobuild.buildroot.net/results/b1087e9a67ff0382632b73f280fabe92cd863593/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/check/check.hash | 2 +-
 package/check/check.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index 543e78f317..9b380ddc28 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a  check-0.15.2.tar.gz
+sha256  998d355294bb94072f40584272cf4424571c396c631620ce463f6ea97aa67d2e  check-0.15.2.tar.gz
 # License files, locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index d3977154df..0bdc9b93ef 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CHECK_VERSION = 0.15.2
-CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
+CHECK_SITE = $(call github,libcheck,check,$(CHECK_VERSION))
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
