Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7BDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E221F83386;
	Mon, 11 Jul 2022 17:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E221F83386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gBxS8oYAHtt; Mon, 11 Jul 2022 17:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A93CB83148;
	Mon, 11 Jul 2022 17:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A93CB83148
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCA091BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8664D40939
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8664D40939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eo8eglBVQjEj for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E98740983
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E98740983
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BE9EE83747; Mon, 11 Jul 2022 17:14:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:22:23 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c2777b8fa5f762f6addfef7e68c5008a58d3c6f6
X-Git-Newrev: 34aec9d246c0426b11c87a7094b8666880e5d531
X-Patchwork-Hint: ignore
Message-Id: <20220711171457.BE9EE83747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/gtest: needs gcc
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

commit: https://git.buildroot.net/buildroot/commit/?id=34aec9d246c0426b11c87a7094b8666880e5d531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
 package/falcosecurity-libs/Config.in |  2 +-
 package/gtest/Config.in              | 13 ++++++-------
 package/libcamera/Config.in          |  7 +++----
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 157bc8ef6d..f101883384 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc, gtest
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # protobuf, tbb
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
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
