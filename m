Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B97C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D5940866;
	Tue, 13 Sep 2022 14:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D5940866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLt0FZUoZOD0; Tue, 13 Sep 2022 14:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CFD414CE;
	Tue, 13 Sep 2022 14:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14CFD414CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0C121C113E
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CFB460E21
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CFB460E21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFFAbs1ftvEH for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85D4F60BF8
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D4F60BF8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 75CC3837D2; Tue, 13 Sep 2022 14:21:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:16:53 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: b88e5b2fa1f6aa6742e211218b8f767544c1961f
X-Git-Newrev: 3689482faf8eda758514e59ce6b5c4d2e87b0ab0
X-Patchwork-Hint: ignore
Message-Id: <20220913142155.75CC3837D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/zziplib: create
 symlinks only if target is missing
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

commit: https://git.buildroot.net/buildroot/commit/?id=3689482faf8eda758514e59ce6b5c4d2e87b0ab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Symlink creation to base file names is only needed for versioned libraries.
Modify CMake rules to prevent overwriting existing libraties with recursive
links.

Fixes the following autobuild failures:
http://autobuild.buildroot.net/results/dd1/dd1974dbc1a22a96a3cedb117417e66119821514/
http://autobuild.buildroot.net/results/df8/df8406402ccff7cec34ae5858b8da57d1a4ae9c1/
http://autobuild.buildroot.net/results/743/7433a2ad111e2f014c81f196d3d1e2f63dffa858/
http://autobuild.buildroot.net/results/79f/79f88e9ec14cda7d07cf689eee864791ba949892/
...
http://autobuild.buildroot.net/results/892/8922efbbbfe79e8286a411acce4086b5c77c57c0/
http://autobuild.buildroot.net/results/dfa/dfa8ade3a4c1750e6dd58e652f60af2a44f80dd8/
http://autobuild.buildroot.net/results/9cd/9cd4147486f32d642513ba14efca3a02d5745ab9/

Regression test cases:
http://autobuild.buildroot.net/results/ba7/ba711034c0abe980f677e26de41739223e2f66e9/
http://autobuild.buildroot.net/results/032/032aaff121fb114f388c67dbca3ad2b02f670e38/
http://autobuild.buildroot.net/results/6c5/6c56b645a2b723920f07b98474452824fba5e2c1/

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3e15fe6a5e91def9fce5b7d19b1f78c072bdab41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...EST-create-symlinks-only-if-target-is-mis.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
new file mode 100644
index 0000000000..c8ccd48dba
--- /dev/null
+++ b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
@@ -0,0 +1,72 @@
+From 5977725ecea038f32a86938703ca1ed2b080b31c Mon Sep 17 00:00:00 2001
+From: Andreas Ziegler <br015@umbiko.net>
+Date: Fri, 29 Jul 2022 12:32:27 +0200
+Subject: [PATCH] ZZIP_LIBLATEST: create symlinks only if target is missing
+
+zzip/CMakeList.txt uses custom build targets to create symlinks to the
+(normally versioned) build results from unversioned file names. These
+targets are executed unconditionally, every time a build is started,
+regardless of the existence of the symlink.
+
+Debug builds, however, generate unversioned libraries. The build targets
+therefore overwrite existing files with recursive links.
+
+Create custom targets depending on the target file plus custom build
+commands containing the symlink creation, thereby ensuring that symlinks
+are only created if the link target is missing.
+
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+Upstream: https://github.com/gdraheim/zziplib/pull/138
+---
+ zzip/CMakeLists.txt | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
+index 4fa6b9c..dd1e56a 100644
+--- a/zzip/CMakeLists.txt
++++ b/zzip/CMakeLists.txt
+@@ -350,8 +350,12 @@ if(ZZIP_LIBLATEST)
+   endif()
+     get_target_property(libname libzzip OUTPUT_NAME)
+     get_target_property(librelease libzzip RELEASE_POSTFIX)
++    set(libzzip_target "${lib}${libname}${dll}")
++    add_custom_command(OUTPUT ${libzzip_target} 
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${libzzip_target}
++        )
+     add_custom_target(libzzip_latest ALL
+-        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
++        DEPENDS ${libzzip_target}
+         )
+     install(FILES
+         ${outdir}/${lib}${libname}${dll}
+@@ -359,8 +363,12 @@ if(ZZIP_LIBLATEST)
+     if(ZZIPFSEEKO)
+     get_target_property(libname libzzipfseeko OUTPUT_NAME)
+     get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
++    set(libzzipfseeko_target "${lib}${libname}${dll}")
++    add_custom_command(OUTPUT ${libzzipfseeko_target} 
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${libzzipfseeko_target}
++        )
+     add_custom_target(libzzipfseeko_latest ALL
+-        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
++        DEPENDS ${libzzipfseeko_target}
+         )
+     install(FILES
+         ${outdir}/${lib}${libname}${dll}
+@@ -369,8 +377,12 @@ if(ZZIP_LIBLATEST)
+     if(ZZIPMMAPPED)
+     get_target_property(libname libzzipmmapped OUTPUT_NAME)
+     get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
++    set(libzzipmmapped_target "${lib}${libname}${dll}")
++    add_custom_command(OUTPUT ${libzzipmmapped_target} 
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${libzzipmmapped_target}
++        )
+     add_custom_target(libzzipmmaped_latest ALL
+-        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
++        DEPENDS ${libzzipmmapped_target}
+         )
+     install(FILES
+         ${outdir}/${lib}${libname}${dll}
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
