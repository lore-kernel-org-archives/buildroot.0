Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319E7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 16:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8867760A70;
	Fri, 24 Dec 2021 16:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MruiJuxUP005; Fri, 24 Dec 2021 16:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 939CE60AB0;
	Fri, 24 Dec 2021 16:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C56911BF31C
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 16:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3A6260AB0
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 16:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8L3EojpwjeJ for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 16:23:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2A8B60A70
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 16:23:02 +0000 (UTC)
Received: from iago.. (unknown [151.47.222.98])
 by serv15.avernis.de (Postfix) with ESMTPSA id 15777C0AAEE0;
 Fri, 24 Dec 2021 17:22:58 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Fri, 24 Dec 2021 17:21:52 +0100
Message-Id: <20211224162152.1035557-1-br015@umbiko.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/zziplib: fix static build failure
 with mpd
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
 Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest released version of zziplib copies static libraries with appended 
major version, but omits creating the necessary links to the base file names. 
This prevents the linker to find the libraries via the search path. 

There is a discussion upstream: https://github.com/gdraheim/zziplib/issues/117

Update zzip/CMakeLists.txt to the current master, version a32538e to enable 
creation of symlinks. 

This resolves the following autobuild issue:

http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 ...01-update-zzip-cmakelists-to-a32538e.patch | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)
 create mode 100644 package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch

diff --git a/package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch b/package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch
new file mode 100644
index 0000000000..1ed9243f69
--- /dev/null
+++ b/package/zziplib/0001-update-zzip-cmakelists-to-a32538e.patch
@@ -0,0 +1,220 @@
+--- zziplib-0.13.72/zzip/CMakeLists.txt
++++ zziplib-a32538e/zzip/CMakeLists.txt
+@@ -14,12 +14,11 @@
+ 
+ # options ###########################################################
+ option(BUILD_SHARED_LIBS "Build a shared library" ON)
+-option(BUILD_STATIC_LIBS "Build the static library" OFF)
+ option(MSVC_STATIC_RUNTIME "Build with static runtime libs (/MT)" ON)
+ option(ZZIPMMAPPED "Build libzzipmmapped (not fully portable)" ON)
+ option(ZZIPFSEEKO "Build libzzipfseeko (based on posix.1 api)" ON)
+ 
+-if(UNIX)
++if(UNIX OR MINGW)
+ option(ZZIP_COMPAT "Build compatibility with old libzzip releases" ON)
+ option(ZZIP_LIBTOOL "Ensure binary compatibility with libtool" ON)
+ option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" ON)
+@@ -27,6 +26,12 @@
+ option(ZZIP_COMPAT "Build compatibility with old libzzip releases" OFF)
+ option(ZZIP_LIBTOOL "Ensure binary compatibility with libtool" OFF)
+ option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" OFF)
++endif()
++
++if(ZZIP_LIBTOOL OR ZZIP_PKGCONFIG)
++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" ON)
++else()
++option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" OFF)
+ endif()
+ 
+ # used in zzip/_config.h
+@@ -114,7 +119,7 @@
+     )
+ endif()
+ 
+-set(CMAKE_POSITION_INDEPENDENT_CODE ON)
++set(CMAKE_POSITION_INDEPENDENT_CODE ${BUILD_SHARED_LIBS})
+ add_definitions ( -DHAVE_CONFIG_H )
+ 
+ set(RELNUM "${PROJECT_VERSION_MAJOR}")
+@@ -276,103 +281,103 @@
+     ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ endif()
+ 
+-if(ZZIP_COMPAT)
+-  install(FILES ${outdir}/compat/zzip.h ${outdir}/compat/zziplib.h ${outdir}/compat/zzip-io.h 
+-          DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+-  if(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
++if(ZZIP_COMPAT OR ZZIP_LIBTOOL)
++  if(BUILD_SHARED_LIBS AND CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
+     set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
+     set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
+-    set(libdir ${CMAKE_INSTALL_FULL_LIBDIR})
+     get_target_property(libname libzzip OUTPUT_NAME)
+     get_target_property(librelease libzzip RELEASE_POSTFIX)
+-    get_target_property(libversion libzzip VERSION)
+-    install(CODE "execute_process(COMMAND bash -c \"set -e
+-        cd $DESTDIR/${libdir}
+-        if [ -f ${lib}${libname}${librelease}.${libversion}${dll} ]; then
+-          # Fix for APPLE where dylib goes in the end
+-          ln -s ${lib}${libname}${librelease}.${libversion}${dll} ${lib}${libname}${librelease}${dll}.${libversion}
+-        fi
+-        [ -f ${lib}${libname}${librelease}${dll}.${libversion} ] || exit 0
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.10
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.11
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.12
+-        \")")
++    add_custom_target(libzzip_links ALL
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${librelease}${dll}.10
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${librelease}${dll}.11
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${librelease}${dll}.12
++        )
++    install(FILES
++      ${outdir}/${lib}${libname}${librelease}${dll}.10
++      ${outdir}/${lib}${libname}${librelease}${dll}.11
++      ${outdir}/${lib}${libname}${librelease}${dll}.12
++      DESTINATION ${CMAKE_INSTALL_LIBDIR})
+   endif()
+ endif()
+ 
++if(ZZIP_COMPAT)
++  install(FILES ${outdir}/compat/zzip.h ${outdir}/compat/zziplib.h ${outdir}/compat/zzip-io.h
++          DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++endif()
++
+ if(ZZIP_LIBTOOL)
+-  if(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
++  if(BUILD_SHARED_LIBS AND CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
+     set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
+     set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
+-    set(libdir ${CMAKE_INSTALL_FULL_LIBDIR})
+-    get_target_property(libname libzzip OUTPUT_NAME)
+-    get_target_property(librelease libzzip RELEASE_POSTFIX)
+-    get_target_property(libversion libzzip VERSION)
+-    install(CODE "execute_process(COMMAND bash -c \"set -e
+-        cd $DESTDIR/${libdir}
+-        if [ -f ${lib}${libname}${librelease}.${libversion}${dll} ]; then
+-          # Fix for APPLE where dylib goes in the end
+-          ln -s ${lib}${libname}${librelease}.${libversion}${dll} ${lib}${libname}${librelease}${dll}.${libversion}
+-        fi
+-        [ -f ${lib}${libname}${librelease}${dll}.${libversion} ] || exit 0
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${dll}
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.10
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.11
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.12
+-        \")")
+     if(ZZIPFSEEKO)
+     get_target_property(libname libzzipfseeko OUTPUT_NAME)
+     get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
+-    get_target_property(libversion libzzipfseeko VERSION)
+-    install(CODE "execute_process(COMMAND bash -c \"set -e
+-        cd $DESTDIR/${libdir}
+-        if [ -f ${lib}${libname}${librelease}.${libversion}${dll} ]; then
+-          # Fix for APPLE where dylib goes in the end
+-          ln -s ${lib}${libname}${librelease}.${libversion}${dll} ${lib}${libname}${librelease}${dll}.${libversion}
+-        fi
+-        [ -f ${lib}${libname}${librelease}${dll}.${libversion} ] || exit 0
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${dll}
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.10
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.11
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.12
+-        \")")
++    add_custom_target(libzzipfseeko_links ALL
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${librelease}${dll}.10
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${librelease}${dll}.11
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${librelease}${dll}.12
++        )
++    install(FILES
++        ${outdir}/${lib}${libname}${librelease}${dll}.10
++        ${outdir}/${lib}${libname}${librelease}${dll}.11
++        ${outdir}/${lib}${libname}${librelease}${dll}.12
++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
+     endif(ZZIPFSEEKO)
+     if(ZZIPMMAPPED)
+     get_target_property(libname libzzipmmapped OUTPUT_NAME)
+     get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
+-    get_target_property(libversion libzzipmmapped VERSION)
+-    install(CODE "execute_process(COMMAND bash -c \"set -e
+-        cd $DESTDIR/${libdir}
+-        if [ -f ${lib}${libname}${librelease}.${libversion}${dll} ]; then
+-          # Fix for APPLE where dylib goes in the end
+-          ln -s ${lib}${libname}${librelease}.${libversion}${dll} ${lib}${libname}${librelease}${dll}.${libversion}
+-        fi
+-        [ -f ${lib}${libname}${librelease}${dll}.${libversion} ] || exit 0
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${dll}
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.10
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.11
+-        echo -n .. Installing: `pwd`
+-        ln -svf ${lib}${libname}${librelease}${dll}.${libversion} ${lib}${libname}${librelease}${dll}.12
+-        \")")
++    add_custom_target(libzzipmmaped_links ALL
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${librelease}${dll}.10
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${librelease}${dll}.11
++        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${librelease}${dll}.12
++        )
++    install(FILES
++        ${outdir}/${lib}${libname}${librelease}${dll}.10
++        ${outdir}/${lib}${libname}${librelease}${dll}.11
++        ${outdir}/${lib}${libname}${librelease}${dll}.12
++        DESTINATION ${CMAKE_INSTALL_LIBDIR})
+     endif(ZZIPMMAPPED)
+   endif(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
+ endif(ZZIP_LIBTOOL)
++
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
+ 
+ ## messages ##############################################
+ 
+
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
