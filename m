Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29014C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5DE760FAC;
	Tue,  7 Jun 2022 15:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvRMBtBm8NPe; Tue,  7 Jun 2022 15:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D2360F49;
	Tue,  7 Jun 2022 15:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70C6D1BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6067B83E54
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UELWemQOUS-w for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:45:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E65582DD9
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:45:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E044886C16; Tue,  7 Jun 2022 15:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 17:44:57 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ac5b6028cd0a93c9b271d8a8b6d2a95a5aebc55d
X-Git-Newrev: 00e09cb2e22e0ea595273389a9de4ec5c1c0ddb5
X-Patchwork-Hint: ignore
Message-Id: <20220607153342.E044886C16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gtest: gmock
 needs host gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=00e09cb2e22e0ea595273389a9de4ec5c1c0ddb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

gtest unconditionally uses is_trivially_copy_constructible since
version 1.11.0 and
https://github.com/google/googletest/commit/c13c27a513ecd1cbf5700a45fe590e85e8ae6770

So add a dependency on host gcc >= 4.9 for gmock to avoid the following
build failure since commit 9dfbbbb4105c47602da048c9bb9499fb8862e768:

In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
                 from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
                 from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest.h:64,
                 from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/src/gtest-all.cc:38:
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
            std::is_trivially_copy_constructible<M>::value &&
            ^

Fixes:
 - http://autobuild.buildroot.org/results/9d19a47deb80824eaa718d80f14b0afd5f9eb054

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 480d76342df775fe36d987f597224fd7cfa18111)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index d8bcf6343f..35fc9fea7b 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -26,6 +26,7 @@ if BR2_PACKAGE_GTEST
 
 config BR2_PACKAGE_GTEST_GMOCK
 	bool "gmock"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-gtest
 	help
 	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
 	  C++'s specifics in mind, Google C++ Mocking Framework (or
@@ -47,6 +48,9 @@ config BR2_PACKAGE_GTEST_GMOCK
 	  libraries required to link/run them. The host package installs
 	  gmock_gen, a Python script used to generate code mocks.
 
+comment "gmock needs host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+
 endif # BR2_PACKAGE_GTEST
 
 comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
