Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 19:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7D6D41084;
	Wed, 30 Mar 2022 19:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdkedG44237m; Wed, 30 Mar 2022 19:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8873041099;
	Wed, 30 Mar 2022 19:43:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0354E1BF40D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5A67849A9
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-JA3ifPeEnZ for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 19:43:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04C8E849A6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 19:43:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8843A85FE0; Wed, 30 Mar 2022 19:34:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 21:40:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6c129d19ac2a657044b98b0c4e4f7515646bffe8
X-Git-Newrev: 43fd3fd836d142a7c5d16c8b25366d59bdb6d8fc
X-Patchwork-Hint: ignore
Message-Id: <20220330193409.8843A85FE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zziplib: fix
 static build failure with mpd
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

commit: https://git.buildroot.net/buildroot/commit/?id=43fd3fd836d142a7c5d16c8b25366d59bdb6d8fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The current released version of zziplib copies static libraries with appended
major version, but omits creating the necessary links to the base file names.
This prevents the linker to find the libraries via the search path.

The issue (https://github.com/gdraheim/zziplib/issues/117) has been
fixed upstream; this patch extracts the necessary part of commit 0e8d35f92efb680c81f6ec1fca9f11d173dce389, to enable creation of symlinks.

This resolves the following autobuild issues:

http://autobuild.buildroot.net/results/6c56b645a2b723920f07b98474452824fba5e2c1
http://autobuild.buildroot.net/results/032aaff121fb114f388c67dbca3ad2b02f670e38
http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0f3d6d2e6a924b9075accb27cf5d7351a30d8f17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
new file mode 100644
index 0000000000..780d990ab7
--- /dev/null
+++ b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
@@ -0,0 +1,75 @@
+From 0e8d35f92efb680c81f6ec1fca9f11d173dce389 Mon Sep 17 00:00:00 2001
+From: Guido Draheim <guidod@gmx.de>
+Date: Sat, 22 May 2021 15:13:28 +0200
+Subject: [PATCH] #117 implant ZZIP_LIBLATEST for zzip.lib
+
+[Andreas: Extract link creation for versioned libraries from commit
+0e8d35f92efb680c81f6ec1fca9f11d173dce389.]
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+---
+ zzip/CMakeLists.txt | 57 +++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 45 insertions(+), 12 deletions(-)
+
+diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
+index a966d5f..ccd08b6 100644
+--- a/zzip/CMakeLists.txt
++++ b/zzip/CMakeLists.txt
+@@ -28,6 +28,12 @@ option(ZZIP_LIBTOOL "Ensure binary compatibility with libtool" OFF)
+ option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" OFF)
+ endif()
+ 
++if(ZZIP_LIBTOOL OR ZZIP_PKGCONFIG)
++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" ON)
++else()
++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" OFF)
++endif()
++
+ # used in zzip/_config.h
+ set(ZZIP_PACKAGE "${PROJECT_NAME}lib")
+ set(ZZIP_VERSION "${PROJECT_VERSION}")
+@@ -346,6 +340,45 @@ if(ZZIP_LIBTOOL)
+   endif(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
+ endif(ZZIP_LIBTOOL)
+ 
++if(ZZIP_LIBLATEST)
++  if(BUILD_SHARED_LIBS)
++    set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
++    set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
++  else()
++    set(lib ${CMAKE_STATIC_LIBRARY_PREFIX})
++    set(dll ${CMAKE_STATIC_LIBRARY_SUFFIX})
++  endif()
++    get_target_property(libname libzzip OUTPUT_NAME)
++    get_target_property(librelease libzzip RELEASE_POSTFIX)
++    add_custom_target(libzzip_latest ALL
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
++        )
++    install(FILES
++        ${outdir}/${lib}${libname}${dll}
++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
++    if(ZZIPFSEEKO)
++    get_target_property(libname libzzipfseeko OUTPUT_NAME)
++    get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
++    add_custom_target(libzzipfseeko_latest ALL
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
++        )
++    install(FILES
++        ${outdir}/${lib}${libname}${dll}
++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
++    endif(ZZIPFSEEKO)
++    if(ZZIPMMAPPED)
++    get_target_property(libname libzzipmmapped OUTPUT_NAME)
++    get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
++    add_custom_target(libzzipmmaped_latest ALL
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
++        )
++    install(FILES
++        ${outdir}/${lib}${libname}${dll}
++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
++    endif(ZZIPMMAPPED)
++endif(ZZIP_LIBLATEST)
++
++
+ ## messages ##############################################
+ 
+ message(STATUS "lib zzipfseeko  to be compiled: ${ZZIPFSEEKO}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
