Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6EEC433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBECE6F4D7;
	Thu,  2 Dec 2021 17:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ze5BChxP75f; Thu,  2 Dec 2021 17:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C496F4CE;
	Thu,  2 Dec 2021 17:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7C771BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A92ED83EFA
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pa6gxY-f5Nt for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E7BF83F03
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5DF6192280; Thu,  2 Dec 2021 17:10:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:14:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43e36f3acd720a1cfc4250909ff966d5dd647cd3
X-Git-Newrev: 76e66240da9b5dac8177fca4deb0f66c3c994023
X-Patchwork-Hint: ignore
Message-Id: <20211202171048.5DF6192280@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: fix build failure with
 -latomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=76e66240da9b5dac8177fca4deb0f66c3c994023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.4.10 in
commit 0ce776942d34d5d3bea6c11913cac38ea3e52f8b:

/usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.0.0
collect2: error: ld returned 1 exit status
make[3]: *** [run/lemon] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/02ea7d76a683b039fb37e005578644108bd1e3b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...emon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch} | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
similarity index 56%
rename from package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
rename to package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
index 51875fd267..edf24fc6d0 100644
--- a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
+++ b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch
@@ -1,26 +1,27 @@
-From 982e5ab072816e29f6f2dc84d9a00ee7c4fdee40 Mon Sep 17 00:00:00 2001
+From 33270f56477542dedf978e660cf8d08464f28797 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 26 Nov 2021 17:45:23 +0100
-Subject: [PATCH] cmake: lemon: wipe CMAKE_SYSROOT if needed
+Subject: [PATCH] cmake: lemon: wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} if needed
 
-Wipe CMAKE_SYSROOT when LEMON_C_COMPILER is set to avoid a build failure
-when cross-compiling (e.g. with buildroot)
+Wipe CMAKE_{EXE_LINKER_FLAGS,SYSROOT} when LEMON_C_COMPILER is set to
+avoid a build failure when cross-compiling (e.g. with buildroot)
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status:
 https://gitlab.com/wireshark/wireshark/-/merge_requests/5224]
 ---
- tools/lemon/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
+ tools/lemon/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/tools/lemon/CMakeLists.txt b/tools/lemon/CMakeLists.txt
-index 8742aa9fc9..7c8cc23a35 100644
+index 8742aa9fc9..7a9263fe0d 100644
 --- a/tools/lemon/CMakeLists.txt
 +++ b/tools/lemon/CMakeLists.txt
-@@ -12,6 +12,7 @@ add_executable(lemon lemon.c)
+@@ -12,6 +12,8 @@ add_executable(lemon lemon.c)
  if(DEFINED LEMON_C_COMPILER)
  	set(CMAKE_C_COMPILER "${LEMON_C_COMPILER}")
  	set(CMAKE_C_FLAGS "")
++	set(CMAKE_EXE_LINKER_FLAGS "")
 +	set(CMAKE_SYSROOT "")
  endif()
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
