Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC671C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8808D813D7;
	Mon, 27 Dec 2021 10:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 46laKIds3EyP; Mon, 27 Dec 2021 10:25:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0AEF813BA;
	Mon, 27 Dec 2021 10:25:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A34F1BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58E6B60AAB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9ccLbe_3-9O for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:25:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BF186079E
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:25:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD50B82ACF; Mon, 27 Dec 2021 10:19:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:25:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac3bb80b1ff80296c6495393e2465b511a7a605f
X-Git-Newrev: c9b43105b580ba7ef1cf8ff74af18e7cd2ca5833
X-Patchwork-Hint: ignore
Message-Id: <20211227101929.AD50B82ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: disable -Werror compile
 flag
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
Content-Type: multipart/mixed; boundary="===============3300392500863846854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3300392500863846854==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c9b43105b580ba7ef1cf8ff74af18e7cd2ca5833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to disable -Werror compile flag.

Fixes:

  - http://autobuild.buildroot.net/results/49beb264b8454b9af092278074c4087013692052/

  .../build/assimp-5.1.3/code/PostProcessing/TriangulateProcess.cpp:285:50: error: argument 1 value ‘4294967294’ exceeds maximum object size 2147483647 [-Werror=alloc-size-larger-than=]
    285 |     std::unique_ptr<bool[]> done(new bool[max_out]);
        |                                                  ^
  [...]
  .../host/opt/ext-toolchain/powerpc-buildroot-linux-uclibc/include/c++/9.3.0/new:127:26: note: in a call to allocation function ‘void* operator new [](std::size_t)’ declared here
    127 | _GLIBCXX_NODISCARD void* operator new[](std::size_t) _GLIBCXX_THROW (std::bad_alloc)
        |                          ^~~~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/assimp/0001-code-disable-Werror.patch | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/assimp/0001-code-disable-Werror.patch b/package/assimp/0001-code-disable-Werror.patch
new file mode 100644
index 0000000000..33867e61c3
--- /dev/null
+++ b/package/assimp/0001-code-disable-Werror.patch
@@ -0,0 +1,39 @@
+From 5146e1c4d58174e302dbdcf2a85c2023be1cffc6 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 10 Dec 2021 15:15:30 +0100
+Subject: [PATCH] code: disable -Werror
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  .../build/assimp-5.1.3/code/PostProcessing/TriangulateProcess.cpp:285:50: error: argument 1 value ‘4294967294’ exceeds maximum object size 2147483647 [-Werror=alloc-size-larger-than=]
+    285 |     std::unique_ptr<bool[]> done(new bool[max_out]);
+        |                                                  ^
+  [...]
+  .../host/opt/ext-toolchain/powerpc-buildroot-linux-uclibc/include/c++/9.3.0/new:127:26: note: in a call to allocation function ‘void* operator new [](std::size_t)’ declared here
+    127 | _GLIBCXX_NODISCARD void* operator new[](std::size_t) _GLIBCXX_THROW (std::bad_alloc)
+        |                          ^~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ code/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/code/CMakeLists.txt b/code/CMakeLists.txt
+index e45bf8a2a..f71b6583d 100644
+--- a/code/CMakeLists.txt
++++ b/code/CMakeLists.txt
+@@ -1167,8 +1167,6 @@ TARGET_USE_COMMON_OUTPUT_DIRECTORY(assimp)
+ # enable warnings as errors ########################################
+ IF (MSVC)
+   TARGET_COMPILE_OPTIONS(assimp PRIVATE /WX)
+-ELSE()
+-  TARGET_COMPILE_OPTIONS(assimp PRIVATE -Werror)
+ ENDIF()
+ 
+ # adds C_FLAGS required to compile zip.c on old GCC 4.x compiler
+-- 
+2.34.1
+

--===============3300392500863846854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3300392500863846854==--
