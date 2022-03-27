Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A6DD829BB;
	Sun, 27 Mar 2022 16:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_mXb8VIkDzE; Sun, 27 Mar 2022 16:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D3B82BD6;
	Sun, 27 Mar 2022 16:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8331BF9A4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B618660AD0
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKzy8q9cwSyp for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF2B60625
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6B90C85E90; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cbe5a540f04ef29ecf00fb23bc26068c3a718ca
X-Git-Newrev: e54b82306d005eeb4ed013a4cbd39e59e5ea8f19
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.6B90C85E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protozero: fix build with
 clang-tidy
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

commit: https://git.buildroot.net/buildroot/commit/?id=e54b82306d005eeb4ed013a4cbd39e59e5ea8f19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
