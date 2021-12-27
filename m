Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD759C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 07:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E80F4019D;
	Mon, 27 Dec 2021 07:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2EvYgsDxcPO; Mon, 27 Dec 2021 07:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3525A40995;
	Mon, 27 Dec 2021 07:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD7961BF573
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 07:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAAB740995
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 07:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxAIuqP80RlQ for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 07:41:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7C284093A
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 07:41:17 +0000 (UTC)
Received: from iago.. (unknown [151.35.88.157])
 by serv15.avernis.de (Postfix) with ESMTPSA id 76102C0ABA36;
 Mon, 27 Dec 2021 08:41:14 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 08:40:56 +0100
Message-Id: <20211227074056.13882-1-br015@umbiko.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211224182228.70f47125@windsurf>
References: <20211224182228.70f47125@windsurf>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 1/1] package/zziplib: fix static build
 failure with mpd
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current released version of zziplib copies static libraries with appended 
major version, but omits creating the necessary links to the base file names. 
This prevents the linker to find the libraries via the search path.

This issue (https://github.com/gdraheim/zziplib/issues/117) has been fixed 
upstream; this patch extracts the necessary part of commit 0e8d35f92efb680c81f6ec1fca9f11d173dce389, to enable creation of symlinks.

This resolves the following autobuild issue:

http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2:
 - extract link creation from commit 0e8d35f

 ...-implant-ZZIP_LIBLATEST-for-zzip_lib.patch | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch

diff --git a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
new file mode 100644
index 0000000000..50380861bc
--- /dev/null
+++ b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
@@ -0,0 +1,78 @@
+Extract link creation for versioned libraries from commit
+0e8d35f92efb680c81f6ec1fca9f11d173dce389.
+
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+
+---
+From 0e8d35f92efb680c81f6ec1fca9f11d173dce389 Mon Sep 17 00:00:00 2001
+From: Guido Draheim <guidod@gmx.de>
+Date: Sat, 22 May 2021 15:13:28 +0200
+Subject: [PATCH] #117 implant ZZIP_LIBLATEST for zzip.lib
+
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
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
