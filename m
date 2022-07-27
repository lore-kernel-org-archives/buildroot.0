Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66140C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A93160B64;
	Wed, 27 Jul 2022 10:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A93160B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1nNfSyErjAP; Wed, 27 Jul 2022 10:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81A4F60B4C;
	Wed, 27 Jul 2022 10:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A4F60B4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0821BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2679C40105
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2679C40105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivdEUegsaMgN for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC3634017E
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC3634017E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0B08786564; Wed, 27 Jul 2022 09:47:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:00:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba20e0322256b77cf0021a95f5e52dc3416b56a1
X-Git-Newrev: 0fc2438ff6e3d14cc9e7b546e2909e386db33439
X-Patchwork-Hint: ignore
Message-Id: <20220727094718.0B08786564@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: bump to version 1.48.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fc2438ff6e3d14cc9e7b546e2909e386db33439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- rework host-grpc-only-cpp-plugin.patch to match changed CMakeLists.txt
- reintroduce patch to fix cross_compile with host grpc_cpp_plugin [1]
- add patch to disable unconditionally downloading repos of 3rd party APIs not
  used in build [2]

[1] https://github.com/grpc/grpc/pull/30378
[2] https://github.com/grpc/grpc/issues/30385

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....patch => 0003-host-grpc-only-cpp-plugin.patch} | 91 ++++++++++------------
 .../grpc/0004-fix-grpc-plugin-cross-compile.patch  | 43 ++++++++++
 ...ble-unconditionally-downloading-api-repos.patch | 39 ++++++++++
 package/grpc/grpc.hash                             |  2 +-
 package/grpc/grpc.mk                               |  2 +-
 5 files changed, 125 insertions(+), 52 deletions(-)

diff --git a/package/grpc/0004-host-grpc-only-cpp-plugin.patch b/package/grpc/0003-host-grpc-only-cpp-plugin.patch
similarity index 61%
rename from package/grpc/0004-host-grpc-only-cpp-plugin.patch
rename to package/grpc/0003-host-grpc-only-cpp-plugin.patch
index c97d9a9385..c68b096df6 100644
--- a/package/grpc/0004-host-grpc-only-cpp-plugin.patch
+++ b/package/grpc/0003-host-grpc-only-cpp-plugin.patch
@@ -11,15 +11,18 @@ Upstream-status: not accepted (see https://github.com/grpc/grpc/issues/25322)
 
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Updated for 1.48.0:
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
  CMakeLists.txt | 43 +++++++++++++++++++++++++++++++++++--------
  1 file changed, 35 insertions(+), 8 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e8934a3e03..c2df332cc6 100644
+index d3963b074b..51cef83141 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -48,12 +48,16 @@ option(gRPC_BUILD_TESTS "Build tests" OFF)
+@@ -49,12 +49,16 @@ option(gRPC_BUILD_TESTS "Build tests" OFF)
  option(gRPC_BUILD_CODEGEN "Build codegen" ON)
  option(gRPC_BUILD_CSHARP_EXT "Build C# extensions" ON)
  option(gRPC_BACKWARDS_COMPATIBILITY_MODE "Build libraries that are binary compatible across a larger number of OS and libc versions" OFF)
@@ -36,7 +39,7 @@ index e8934a3e03..c2df332cc6 100644
  set(gRPC_INSTALL ${gRPC_INSTALL_default} CACHE BOOL
      "Generate installation target")
  
-@@ -367,6 +371,8 @@ add_custom_target(plugins
+@@ -555,6 +559,8 @@ add_custom_target(plugins
    DEPENDS ${_gRPC_PLUGIN_LIST}
  )
  
@@ -44,17 +47,17 @@ index e8934a3e03..c2df332cc6 100644
 +
  add_custom_target(tools_c
    DEPENDS
-   check_epollexclusive
-@@ -382,6 +388,8 @@ add_custom_target(tools_cxx
+ )
+@@ -567,6 +573,8 @@ add_custom_target(tools_cxx
  add_custom_target(tools
    DEPENDS tools_c tools_cxx)
  
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
 +
- protobuf_generate_grpc_cpp(
-   src/proto/grpc/channelz/channelz.proto
+ protobuf_generate_grpc_cpp_with_import_path_correction(
+   src/proto/grpc/channelz/channelz.proto src/proto/grpc/channelz/channelz.proto
  )
-@@ -1000,6 +1008,7 @@ if(gRPC_BUILD_TESTS)
+@@ -1228,6 +1236,7 @@ if(gRPC_BUILD_TESTS)
      DEPENDS buildtests_c buildtests_cxx)
  endif()
  
@@ -62,7 +65,7 @@ index e8934a3e03..c2df332cc6 100644
  
  add_library(address_sorting
    third_party/address_sorting/address_sorting.c
-@@ -1051,6 +1060,8 @@ if(gRPC_INSTALL)
+@@ -1280,6 +1289,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -70,26 +73,26 @@ index e8934a3e03..c2df332cc6 100644
 +
  if(gRPC_BUILD_TESTS)
  
- add_library(end2end_nosec_tests
-@@ -1313,6 +1324,8 @@ target_link_libraries(end2end_tests
+ add_library(end2end_tests
+@@ -1451,6 +1462,8 @@ endforeach()
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(gpr
-   src/core/lib/gpr/alloc.cc
-   src/core/lib/gpr/atm.cc
-@@ -2106,6 +2119,8 @@ if(gRPC_INSTALL)
+   src/core/ext/upb-generated/google/protobuf/any.upb.c
+   src/core/ext/upb-generated/google/rpc/status.upb.c
+@@ -2373,6 +2386,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
 +
- if(gRPC_BUILD_CSHARP_EXT)
+ if(gRPC_BUILD_TESTS)
  
- add_library(grpc_csharp_ext SHARED
-@@ -2288,6 +2303,8 @@ endif()
+ add_library(grpc_test_util
+@@ -2511,6 +2526,8 @@ endif()
  
  endif()
  
@@ -97,8 +100,8 @@ index e8934a3e03..c2df332cc6 100644
 +
  add_library(grpc_unsecure
    src/core/ext/filters/census/grpc_context.cc
-   src/core/ext/filters/client_channel/backend_metric.cc
-@@ -2650,6 +2667,8 @@ if(gRPC_INSTALL)
+   src/core/ext/filters/channel_idle/channel_idle_filter.cc
+@@ -2916,6 +2933,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -107,16 +110,16 @@ index e8934a3e03..c2df332cc6 100644
  if(gRPC_BUILD_TESTS)
  
  if(gRPC_BUILD_CODEGEN)
-@@ -2717,6 +2736,8 @@ endif()
+@@ -2987,6 +3006,8 @@ endif()
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(grpc++
-   src/cpp/client/channel_cc.cc
-   src/cpp/client/client_callback.cc
-@@ -3134,6 +3155,7 @@ if(gRPC_INSTALL)
+   src/core/ext/transport/binder/client/binder_connector.cc
+   src/core/ext/transport/binder/client/channel_create.cc
+@@ -3463,6 +3484,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -124,7 +127,7 @@ index e8934a3e03..c2df332cc6 100644
  
  if(gRPC_BUILD_CODEGEN)
  add_library(grpc++_reflection
-@@ -3374,6 +3396,8 @@ target_link_libraries(grpc++_test_util
+@@ -3705,6 +3727,8 @@ target_link_libraries(grpc++_test_util
  
  endif()
  
@@ -133,7 +136,7 @@ index e8934a3e03..c2df332cc6 100644
  add_library(grpc++_unsecure
    src/cpp/client/channel_cc.cc
    src/cpp/client/client_callback.cc
-@@ -3656,6 +3680,7 @@ if(gRPC_INSTALL)
+@@ -4023,6 +4047,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -141,7 +144,7 @@ index e8934a3e03..c2df332cc6 100644
  
  add_library(grpc_plugin_support
    src/compiler/cpp_generator.cc
-@@ -3715,7 +3740,7 @@ foreach(_hdr
+@@ -4082,7 +4107,7 @@ foreach(_hdr
  endforeach()
  
  
@@ -149,27 +152,18 @@ index e8934a3e03..c2df332cc6 100644
 +if(gRPC_INSTALL OR gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
    install(TARGETS grpc_plugin_support EXPORT gRPCTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -3795,6 +3820,8 @@ endif()
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+@@ -4166,6 +4191,8 @@ endif()
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(upb
-   third_party/upb/upb/decode_fast.c
-   third_party/upb/upb/decode.c
-@@ -3852,8 +3879,6 @@ if(gRPC_INSTALL)
-   )
- endif()
- 
--
--
- add_executable(check_epollexclusive
-   test/build/check_epollexclusive.c
- )
-@@ -3958,6 +3981,8 @@ target_link_libraries(gen_percent_encoding_tables
-   ${_gRPC_ALLTARGETS_LIBRARIES}
+   third_party/upb/third_party/utf8_range/naive.c
+   third_party/upb/third_party/utf8_range/range2-neon.c
+@@ -4256,6 +4283,8 @@ target_link_libraries(gen_hpack_tables
+   gpr
  )
  
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
@@ -177,7 +171,7 @@ index e8934a3e03..c2df332cc6 100644
  
  if(gRPC_BUILD_TESTS)
  
-@@ -10722,7 +10747,7 @@ target_link_libraries(grpc_cli
+@@ -11228,7 +11257,7 @@ target_link_libraries(grpc_cli
  
  
  endif()
@@ -186,7 +180,7 @@ index e8934a3e03..c2df332cc6 100644
  
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
-@@ -10752,7 +10777,7 @@ target_link_libraries(grpc_cpp_plugin
+@@ -11258,7 +11287,7 @@ target_link_libraries(grpc_cpp_plugin
  
  
  
@@ -194,8 +188,8 @@ index e8934a3e03..c2df332cc6 100644
 +if(gRPC_INSTALL OR gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
    install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -15420,7 +15445,7 @@ endif()
+     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
+@@ -19803,7 +19832,7 @@ endif()
  
  
  
@@ -204,12 +198,9 @@ index e8934a3e03..c2df332cc6 100644
  
  if(gRPC_INSTALL)
    install(EXPORT gRPCTargets
-@@ -15517,3 +15542,5 @@ generate_pkgconfig(
-   "-lgrpc++_unsecure -labsl_statusor -labsl_status -labsl_raw_hash_set -labsl_hashtablez_sampler -labsl_synchronization -labsl_time -labsl_time_zone -labsl_civil_time -labsl_graphcycles_internal -labsl_symbolize -labsl_demangle_internal -labsl_malloc_internal -labsl_stacktrace -labsl_debugging_internal -labsl_exponential_biased -labsl_cord -labsl_str_format_internal -labsl_hash -labsl_bad_variant_access -labsl_bad_optional_access -labsl_strings -labsl_strings_internal -labsl_base -labsl_spinlock_wait -labsl_int128 -labsl_city -labsl_throw_delegate -labsl_raw_logging_internal -labsl_log_severity"
+@@ -19900,3 +19929,5 @@ generate_pkgconfig(
+   "-lgrpc++_unsecure"
    ""
    "grpc++_unsecure.pc")
 +
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
--- 
-2.26.3
-
diff --git a/package/grpc/0004-fix-grpc-plugin-cross-compile.patch b/package/grpc/0004-fix-grpc-plugin-cross-compile.patch
new file mode 100644
index 0000000000..d4e18a7853
--- /dev/null
+++ b/package/grpc/0004-fix-grpc-plugin-cross-compile.patch
@@ -0,0 +1,43 @@
+From 6798193f062676fddf7fee6d0c928f8ce6d92894 Mon Sep 17 00:00:00 2001
+From: Michael Nosthoff <buildroot@heine.tech>
+Date: Thu, 21 Jul 2022 22:14:32 +0200
+Subject: [PATCH] cmake: fix cross-compilation with
+ gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
+
+commit 99752b173cfa reintroduced the cross-compilation issue which was fixed by da10b795e177
+
+upstream PR: https://github.com/grpc/grpc/pull/30378
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+
+---
+ CMakeLists.txt                    | 2 +-
+ templates/CMakeLists.txt.template | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9cad96a12f95..11e7ae2b67df 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -514,7 +514,7 @@ function(protobuf_generate_grpc_cpp_with_import_path_correction FILE_LOCATION IM
+          --plugin=protoc-gen-grpc=${_gRPC_CPP_PLUGIN}
+          ${_protobuf_include_path}
+          ${REL_FIL}
+-    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION} ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
++    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION} ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_CPP_PLUGIN}
+     WORKING_DIRECTORY ${_gRPC_PROTO_SRCS_DIR}
+     COMMENT "Running gRPC C++ protocol buffer compiler for ${IMPORT_PATH}"
+     VERBATIM)
+diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
+index 161cf46798f1..82fe4217913a 100644
+--- a/templates/CMakeLists.txt.template
++++ b/templates/CMakeLists.txt.template
+@@ -498,7 +498,7 @@
+            --plugin=protoc-gen-grpc=<%text>${_gRPC_CPP_PLUGIN}</%text>
+            <%text>${_protobuf_include_path}</%text>
+            <%text>${REL_FIL}</%text>
+-      DEPENDS <%text>${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION}</%text> <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
++      DEPENDS <%text>${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION}</%text> <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> <%text>${_gRPC_CPP_PLUGIN}</%text>
+       WORKING_DIRECTORY <%text>${_gRPC_PROTO_SRCS_DIR}</%text>
+       COMMENT "Running gRPC C++ protocol buffer compiler for <%text>${IMPORT_PATH}</%text>"
+       VERBATIM)
diff --git a/package/grpc/0005-disable-unconditionally-downloading-api-repos.patch b/package/grpc/0005-disable-unconditionally-downloading-api-repos.patch
new file mode 100644
index 0000000000..967bbf6247
--- /dev/null
+++ b/package/grpc/0005-disable-unconditionally-downloading-api-repos.patch
@@ -0,0 +1,39 @@
+From b0599c3d1b52818c79ea8fa5dfdc40a4ce01e454 Mon Sep 17 00:00:00 2001
+From: Michael Nosthoff <buildroot@heine.tech>
+Date: Fri, 22 Jul 2022 08:49:48 +0200
+Subject: [PATCH] disable unconditionally downloading api repos
+
+The Buildroot build doesn't need those submodules, so disable them hard
+for now.
+
+See https://github.com/grpc/grpc/issues/30385
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11e7ae2b67..a9062fa6ef 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -327,6 +327,7 @@ include(cmake/xxhash.cmake)
+ include(cmake/zlib.cmake)
+ include(cmake/download_archive.cmake)
+ 
++if(FALSE)
+ # Setup external proto library at third_party/envoy-api with 2 download URLs
+ if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/envoy-api)
+   # Download the archive via HTTP, validate the checksum, and extract to third_party/envoy-api.
+@@ -403,6 +404,7 @@ if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/xds)
+     xds-cb28da3451f158a947dfc45090fe92b07b243bc1
+   )
+ endif()
++endif()
+ 
+ if(WIN32)
+   set(_gRPC_BASELIB_LIBRARIES ws2_32 crypt32)
+-- 
+2.25.1
+
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 9e3a225a51..84af11f5a1 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e18b16f7976aab9a36c14c38180f042bb0fd196b75c9fd6a20a2b5f934876ad6  grpc-1.45.2.tar.gz
+sha256  9b1f348b15a7637f5191e4e673194549384f2eccf01fcef7cc1515864d71b424  grpc-1.48.0.tar.gz
 sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 2f037b5d59..5d90397efc 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.45.2
+GRPC_VERSION = 1.48.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
