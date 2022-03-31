Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3A6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 11:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA75612E3;
	Thu, 31 Mar 2022 11:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIlbbSi4U_uA; Thu, 31 Mar 2022 11:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C2E612EC;
	Thu, 31 Mar 2022 11:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 243101BF3D2
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1177F41DF7
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NoX0sSStV2H6 for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 11:37:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 128AD41DF3
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 11:37:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A9CF86034; Thu, 31 Mar 2022 11:27:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 13:35:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a28617d676bd223c7440c1c00d58a1869e5a121c
X-Git-Newrev: 90d633e632636b77dd5c7ce0dd23eec3692f20b5
X-Patchwork-Hint: ignore
Message-Id: <20220331112752.1A9CF86034@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/protozero: fix
 build with clang-tidy
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

commit: https://git.buildroot.net/buildroot/commit/?id=90d633e632636b77dd5c7ce0dd23eec3692f20b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure if clang-tidy is found on host (and
protobuf is built before protozero) which is raised since tests are
disabled in commit be4869f393561aa5c297b631efc62dfd5e1c3f3f:

CMake Error at CMakeLists.txt:77 (add_dependencies):
  The dependency target "writer_tests" of target "clang-tidy" does not exist.

Fixes:
 - http://autobuild.buildroot.org/results/c3ae3b5caf79eb30c8a1786f58abea4f2b41a26e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e54b82306d005eeb4ed013a4cbd39e59e5ea8f19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sts.txt-protobuf-is-only-needed-for-tests.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
new file mode 100644
index 0000000000..3033e24aa2
--- /dev/null
+++ b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
@@ -0,0 +1,35 @@
+From 1c16d3ffccd9e415c6ea3681f23231cd5184043c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 16 Feb 2022 00:11:38 +0100
+Subject: [PATCH] CMakeLists.txt: protobuf is only needed for tests
+
+Don't check for protobuf if tests are disabled. As a side effect, this
+will avoid a build failure if clang-tidy and protobuf are found but
+tests are disabled
+
+Fix #109
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mapbox/protozero/pull/110]
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b975d49..df2ca15 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,7 +52,9 @@ endif()
+ #
+ #-----------------------------------------------------------------------------
+ 
+-find_package(Protobuf)
++if(BUILD_TESTING)
++    find_package(Protobuf)
++endif()
+ 
+ 
+ #-----------------------------------------------------------------------------
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
