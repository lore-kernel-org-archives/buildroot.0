Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EE9C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC27840B9F;
	Tue, 14 Feb 2023 17:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC27840B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9duGi8YlsPB; Tue, 14 Feb 2023 17:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FDC40BE0;
	Tue, 14 Feb 2023 17:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31FDC40BE0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB991BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 560E9402EC
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560E9402EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZZKkMFHX3zB for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D61E406E0
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D61E406E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4725685E1B; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 17:59:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a1a765f8155c796d655d6f0c28d7bc349bc6e2cc
X-Git-Newrev: 2461817ad61503646b4c33dcb69822db8781aca5
X-Patchwork-Hint: ignore
Message-Id: <20230214170848.4725685E1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libks: disable
 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=2461817ad61503646b4c33dcb69822db8781aca5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disables tests to avoid the following build failure with
BR2_SHARED_STATIC_LIBS:

[ 42%] Linking C executable teststring
../libks.so.1: undefined reference to `dlsym'

Fixes:
 - http://autobuild.buildroot.org/results/e61a683928795402375165adf686687f3305e0c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 267e39413ed09876c61eac1c5d7ee3042061b6f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-CMakeLists.txt-honour-BUILD_TESTING.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
new file mode 100644
index 0000000000..fbe6cabd86
--- /dev/null
+++ b/package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
@@ -0,0 +1,41 @@
+From c850e04898a9498d447b43bf346365646ff1b19c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 13 May 2022 23:12:31 +0200
+Subject: [PATCH] CMakeLists.txt:  honour BUILD_TESTING
+
+Allow the user to disable tests through the standard BUILD_TESTING
+option: https://cmake.org/cmake/help/latest/module/CTest.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/signalwire/libks/pull/125]
+---
+ CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5bbac31..37e6bcd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,6 @@
+ cmake_minimum_required(VERSION 3.7.2)
+ 
++option(BUILD_TESTING "Build tests" ON)
+ option(KS_DEBUG_MUTEX "Debug mutexes, only works on linux for now" OFF)
+ option(KS_DEBUG_SPINLOCK "Debug spinlocks" OFF)
+ option(KS_DEBUG_POOL "Track pool allocations and provide hooks for rendering them" OFF)
+@@ -609,8 +610,10 @@ endif()
+ #cotire(ks)
+ 
+ # Add tests
+-enable_testing()
+-add_subdirectory(tests)
++if (BUILD_TESTING)
++	enable_testing()
++	add_subdirectory(tests)
++endif()
+ 
+ if (WITH_KS_TEST)
+ 	enable_testing()
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
