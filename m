Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B50C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95F0083DF3;
	Mon, 11 Jul 2022 17:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F0083DF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgPPfTTAxefl; Mon, 11 Jul 2022 17:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82EC583DF2;
	Mon, 11 Jul 2022 17:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82EC583DF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E66641BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CDC460F46
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CDC460F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7z1RKEopj4L2 for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5148260F4D
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5148260F4D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 83E91837E7; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:25:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7f77ffccedc18e984e0bf1b6ddd9b5f9f7d69bc2
X-Git-Newrev: b3067072b949ec29aea79a9f5288d265890e493d
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.83E91837E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gtest: needs gcc
 >= 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3067072b949ec29aea79a9f5288d265890e493d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit be38432532b23275869a3a914c0ad0031323259c wrongly assumed that
is_trivially_copy_constructible was available since gcc 4.9 but it
wasn't fully available until gcc 5.1 and
https://github.com/gcc-mirror/gcc/commit/f5e523b76d1bdaf0df15f6bfdee602a3e153be68
resulting in the following build failure with gcc 4.9.1:

In file included from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
                 from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
                 from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest.h:64,
                 from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/src/gtest-all.cc:38:
/nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
/nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
            std::is_trivially_copy_constructible<M>::value &&
            ^

Fixes:
 - http://autobuild.buildroot.org/results/1723705cb7aea5f6fcc7e6722d866ed3bd098115

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3dd5b65681b35cadb08ac064eb97768ceba62909)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/Config.in     | 13 ++++++-------
 package/libcamera/Config.in |  7 +++----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 35fc9fea7b..4355e9c9c5 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
@@ -26,7 +26,7 @@ if BR2_PACKAGE_GTEST
 
 config BR2_PACKAGE_GTEST_GMOCK
 	bool "gmock"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-gtest
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-gtest
 	help
 	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
 	  C++'s specifics in mind, Google C++ Mocking Framework (or
@@ -48,13 +48,12 @@ config BR2_PACKAGE_GTEST_GMOCK
 	  libraries required to link/run them. The host package installs
 	  gmock_gen, a Python script used to generate code mocks.
 
-comment "gmock needs host gcc >= 4.9"
-	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+comment "gmock needs host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
 
 endif # BR2_PACKAGE_GTEST
 
-comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 23a0040abf..fd7b3c92c4 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -77,18 +77,17 @@ config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
 	depends on BR2_USE_WCHAR # gtest
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
 	depends on BR2_INSTALL_LIBSTDCPP # gtest
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gtest
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # gtest
 	depends on BR2_USE_MMU # gtest
 	select BR2_PACKAGE_GTEST
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  lc-compliance test application
 
-comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 endif # BR2_PACKAGE_LIBCAMERA
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
