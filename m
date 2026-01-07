Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829C6CFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FC9820B1;
	Wed,  7 Jan 2026 14:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eAhq7mG7bWV; Wed,  7 Jan 2026 14:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11CE8227B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794957;
	bh=F91a08vvQw7f41RsFwfsjxKIiY4Q6IDdUdaRvtKEl5o=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=k6pU7mBL8b4onIUw/xqSoQkfrud6jJwao4hlGjAad5li2ASOLIX0szkukTK8Ps9Bk
	 8fnsmj9HJUJ5OXNTl+OFuwKYxhODW6V9pf8uCoirh5mdzxXQcuu0tvrsh9Gj+uXBBw
	 ZUPP5UDrcKxo7rtAViaBjrg8boobmuLv05R7FTMVYG9dGJFNC4GHCUIutH64mkENpx
	 WNAE4Thui6eWCz2lCHR4Iic7TOaNnPRZret92Rhe/l+1dsXjuigr1shDER6Bq3CRGc
	 uQupFpUh6yF4fQLTCw2ODPt57d7aj2I8kYhKtv19iMBf+WBaPFRsD9SNQgHxlI5ooZ
	 cpJtMFfNYhSFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11CE8227B;
	Wed,  7 Jan 2026 14:09:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19645436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AA4C82051
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnFDzO9smmaN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7355E8223B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7355E8223B
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7355E8223B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04B631814BC; Wed,  7 Jan 2026 15:09:09 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Jan 2026 15:08:47 +0100
Message-ID: <20260107140858.129302-3-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107140858.129302-1-buildroot@heine.tech>
References: <20260107140858.129302-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1767794950; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LQ2GP8sYKS6MDPtoRF5F8O7/TILPj0hHqAImwHYzyAA=;
 b=lHmlovWaxZtlpvmiME6/8jQOkMdqIxOOkNeLQoNIYIlYzqu2H78QNmWLiY4nYEzAfnWOaf
 Unhb8CziWFQn4StDcedAEwt6mYdMELOq2SVYQZ/YMNhqo+ZSuXnmJOVE+Dc/lvnG28l8Hy
 nTTjiNn8lxsXa+XhFTyzrtvEQoQLR48=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=lHmlovWa
Subject: [Buildroot] [PATCH v2 3/3] package/grpc: bump to version 1.76.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- use new flag gRPC_DOWNLOAD_ARCHIVES=OFF which removed the need for patch 003
- re-allign patches
- update 0002 to properly apply and re-enable utf8_range_lib as its linked
  against grpc_plugin_support

Release Notes since 1.66:
https://github.com/grpc/grpc/releases/tag/v1.67.0
https://github.com/grpc/grpc/releases/tag/v1.68.0
https://github.com/grpc/grpc/releases/tag/v1.69.0
https://github.com/grpc/grpc/releases/tag/v1.70.0
https://github.com/grpc/grpc/releases/tag/v1.71.0
https://github.com/grpc/grpc/releases/tag/v1.72.0
https://github.com/grpc/grpc/releases/tag/v1.73.0
https://github.com/grpc/grpc/releases/tag/v1.74.0
https://github.com/grpc/grpc/releases/tag/v1.75.0
https://github.com/grpc/grpc/releases/tag/v1.76.0

Fixes: 2d19a0b332dc17c18533b "package/{python-}protobuf: bump to version 33.2"

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

--

V2: added "Fixes" part

The protobuf bump to 33.2 was initially contained in this series. Another
standalone patch was then applied in commit 2d19a0b332dc17c18533b instead.
Which broke the build of grpc 1.66.1 which relies on an older protobuf
version.
This can be observed with this defconfig:

BR2_arm=y
BR2_cortex_a53=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_COLLECTD=y
BR2_PACKAGE_COLLECTD_GRPC=y
---
 ...the-availability-of-pthread_setname_.patch | 14 ++--
 ...strict-building-of-host-grpc-to-grpc.patch | 77 +++++++++++--------
 ...nconditionally-downloading-api-repos.patch | 38 ---------
 package/grpc/grpc.hash                        |  2 +-
 package/grpc/grpc.mk                          |  8 +-
 5 files changed, 60 insertions(+), 79 deletions(-)
 delete mode 100644 package/grpc/0003-disable-unconditionally-downloading-api-repos.patch

diff --git a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
index e8e211758a..909a7fb5b0 100644
--- a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -1,4 +1,4 @@
-From dfec50b899c449bc964514f16e94869de7a68896 Mon Sep 17 00:00:00 2001
+From 3e9f278145fafbfe15a868d0f9032ba590078c3b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Mon, 31 Dec 2018 16:22:07 +0100
 Subject: [PATCH] Properly detect the availability of pthread_setname_np()
@@ -25,10 +25,10 @@ Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
  2 files changed, 8 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 053b9e3784..2565dc5c84 100644
+index f652a4055c..a2c978c7d8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -291,6 +291,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
+@@ -303,6 +303,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
  endif()
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
  
@@ -42,10 +42,10 @@ index 053b9e3784..2565dc5c84 100644
    include(cmake/msvc_static_runtime.cmake)
    add_definitions(-D_WIN32_WINNT=0x600 -D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS -D_WINSOCK_DEPRECATED_NO_WARNINGS)
 diff --git a/include/grpc/support/port_platform.h b/include/grpc/support/port_platform.h
-index 5fb7426af2..24d438d702 100644
+index 04a90fbf8a..6718233782 100644
 --- a/include/grpc/support/port_platform.h
 +++ b/include/grpc/support/port_platform.h
-@@ -228,6 +228,7 @@
+@@ -236,6 +236,7 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
@@ -53,7 +53,7 @@ index 5fb7426af2..24d438d702 100644
  #ifdef __GLIBC_PREREQ
  #if __GLIBC_PREREQ(2, 12)
  #define GPR_LINUX_PTHREAD_NAME 1
-@@ -236,6 +237,7 @@
+@@ -244,6 +245,7 @@
  // musl libc & others
  #define GPR_LINUX_PTHREAD_NAME 1
  #endif
@@ -62,5 +62,5 @@ index 5fb7426af2..24d438d702 100644
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
 -- 
-2.34.1
+2.43.0
 
diff --git a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
index 82705d8a1e..d36eb8fca1 100644
--- a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
+++ b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
@@ -1,4 +1,4 @@
-From 6aab068a6bd92e215b61eaab61062bf1d97bc065 Mon Sep 17 00:00:00 2001
+From fd7f0877e1e4f2305946a5579353d252012ea9e8 Mon Sep 17 00:00:00 2001
 From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Date: Tue, 25 May 2021 14:55:23 +0200
 Subject: [PATCH] Add option to restrict building of (host-)grpc to
@@ -12,14 +12,15 @@ Upstream: not accepted (see https://github.com/grpc/grpc/issues/25322)
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
-Updated for 1.48.0:
+Updated for 1.76.0:
+[build utf8_range_lib as it is now explicitly required]
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
- CMakeLists.txt | 36 +++++++++++++++++++++++++++++++-----
- 1 file changed, 31 insertions(+), 5 deletions(-)
+ CMakeLists.txt | 39 +++++++++++++++++++++++++++++++++------
+ 1 file changed, 33 insertions(+), 6 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2565dc5c84..94f8fd3e93 100644
+index bc86c00463..08441ddbd2 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -50,12 +50,16 @@ set(gRPC_BUILD_MSVC_MP_COUNT 0 CACHE STRING "The maximum number of processes for
@@ -39,7 +40,7 @@ index 2565dc5c84..94f8fd3e93 100644
  set(gRPC_INSTALL ${gRPC_INSTALL_default} CACHE BOOL
      "Generate installation target")
  
-@@ -662,6 +666,8 @@ add_custom_target(plugins
+@@ -689,6 +693,8 @@ add_custom_target(plugins
    DEPENDS ${_gRPC_PLUGIN_LIST}
  )
  
@@ -48,16 +49,16 @@ index 2565dc5c84..94f8fd3e93 100644
  add_custom_target(tools_c
    DEPENDS
  )
-@@ -673,6 +679,8 @@ add_custom_target(tools_cxx
+@@ -700,6 +706,8 @@ add_custom_target(tools_cxx
  add_custom_target(tools
    DEPENDS tools_c tools_cxx)
  
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
 +
  protobuf_generate_grpc_cpp_with_import_path_correction(
-   src/proto/grpc/channelz/channelz.proto src/proto/grpc/channelz/channelz.proto
+   src/core/ext/transport/chaotic_good/chaotic_good_frame.proto src/core/ext/transport/chaotic_good/chaotic_good_frame.proto
  )
-@@ -1660,7 +1668,7 @@ if(gRPC_BUILD_TESTS)
+@@ -1986,7 +1994,7 @@ if(gRPC_BUILD_TESTS)
      DEPENDS buildtests_c buildtests_cxx)
  endif()
  
@@ -66,7 +67,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  add_library(address_sorting
    third_party/address_sorting/address_sorting.c
-@@ -2855,6 +2863,8 @@ if(gRPC_INSTALL)
+@@ -3221,6 +3229,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -75,16 +76,16 @@ index 2565dc5c84..94f8fd3e93 100644
  if(gRPC_BUILD_TESTS)
  
  add_library(grpc_test_util
-@@ -2987,6 +2997,8 @@ endif()
+@@ -3371,6 +3381,8 @@ endif()
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(grpc_unsecure
-   src/core/channelz/channel_trace.cc
-   src/core/channelz/channelz.cc
-@@ -3547,6 +3559,8 @@ if(gRPC_INSTALL)
+   src/core/call/call_arena_allocator.cc
+   src/core/call/call_filters.cc
+@@ -3951,6 +3963,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -93,7 +94,7 @@ index 2565dc5c84..94f8fd3e93 100644
  if(gRPC_BUILD_TESTS)
  
  add_library(gtest
-@@ -3621,6 +3635,8 @@ target_link_libraries(gtest
+@@ -4025,6 +4039,8 @@ target_link_libraries(gtest
  
  endif()
  
@@ -102,7 +103,24 @@ index 2565dc5c84..94f8fd3e93 100644
  add_library(upb_base_lib
    third_party/upb/upb/base/status.c
  )
-@@ -4108,6 +4124,8 @@ if(gRPC_INSTALL)
+@@ -4641,6 +4657,7 @@ if(gRPC_INSTALL)
+   )
+ endif()
+ 
++endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
+ 
+ add_library(utf8_range_lib
+   third_party/utf8_range/utf8_range.c
+@@ -4681,7 +4698,7 @@ target_link_libraries(utf8_range_lib
+   ${_gRPC_ALLTARGETS_LIBRARIES}
+ )
+ 
+-
++if (NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
+ 
+ if(gRPC_INSTALL)
+   install(TARGETS utf8_range_lib EXPORT gRPCTargets
+@@ -4692,6 +4709,8 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -111,16 +129,16 @@ index 2565dc5c84..94f8fd3e93 100644
  if(gRPC_BUILD_TESTS)
  
  if(gRPC_BUILD_CODEGEN)
-@@ -4193,6 +4211,8 @@ endif()
+@@ -4784,6 +4803,8 @@ endif()
  
  endif()
  
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(grpc++
-   src/core/ext/transport/binder/client/binder_connector.cc
-   src/core/ext/transport/binder/client/channel_create.cc
-@@ -4684,6 +4704,7 @@ if(gRPC_INSTALL)
+   src/cpp/client/call_credentials.cc
+   src/cpp/client/channel_cc.cc
+@@ -5263,6 +5284,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -128,7 +146,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  if(gRPC_BUILD_CODEGEN)
  add_library(grpc++_reflection ${_gRPC_STATIC_WIN32}
-@@ -4967,6 +4988,8 @@ target_link_libraries(grpc++_test_util
+@@ -5537,6 +5559,8 @@ target_link_libraries(grpc++_test_util
  
  endif()
  
@@ -137,7 +155,7 @@ index 2565dc5c84..94f8fd3e93 100644
  add_library(grpc++_unsecure
    src/cpp/client/call_credentials.cc
    src/cpp/client/channel_cc.cc
-@@ -5707,6 +5730,7 @@ if(gRPC_INSTALL)
+@@ -6285,6 +6309,7 @@ if(gRPC_INSTALL)
    )
  endif()
  
@@ -145,7 +163,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  add_library(grpc_plugin_support
    src/compiler/cpp_generator.cc
-@@ -5769,7 +5793,7 @@ foreach(_hdr
+@@ -6385,7 +6410,7 @@ foreach(_hdr
  endforeach()
  
  
@@ -154,7 +172,7 @@ index 2565dc5c84..94f8fd3e93 100644
    install(TARGETS grpc_plugin_support EXPORT gRPCTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
      BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-@@ -16520,7 +16544,7 @@ target_link_libraries(grpc_completion_queue_test
+@@ -18827,7 +18852,7 @@ target_link_libraries(grpc_completion_queue_test
  
  
  endif()
@@ -163,7 +181,7 @@ index 2565dc5c84..94f8fd3e93 100644
  
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
-@@ -16548,7 +16572,7 @@ target_link_libraries(grpc_cpp_plugin
+@@ -18855,7 +18880,7 @@ target_link_libraries(grpc_cpp_plugin
  
  
  
@@ -172,7 +190,7 @@ index 2565dc5c84..94f8fd3e93 100644
    install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
      RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
      BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-@@ -37968,7 +37992,7 @@ endif()
+@@ -51904,7 +51929,7 @@ endif()
  
  
  
@@ -181,13 +199,12 @@ index 2565dc5c84..94f8fd3e93 100644
  
  if(gRPC_INSTALL)
    install(EXPORT gRPCTargets
-@@ -38089,3 +38113,5 @@ generate_pkgconfig(
+@@ -52025,3 +52050,5 @@ generate_pkgconfig(
    "-lgrpcpp_otel_plugin"
-   "-laddress_sorting -lupb_textformat_lib -lupb_json_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mem_lib -lupb_base_lib"
+   "-laddress_sorting -lupb_textformat_lib -lupb_json_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
    "grpcpp_otel_plugin.pc")
 +
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
-\ No newline at end of file
 -- 
-2.34.1
+2.43.0
 
diff --git a/package/grpc/0003-disable-unconditionally-downloading-api-repos.patch b/package/grpc/0003-disable-unconditionally-downloading-api-repos.patch
deleted file mode 100644
index 0cd5012b26..0000000000
--- a/package/grpc/0003-disable-unconditionally-downloading-api-repos.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2a73f6439b6d745b2cbfff120dc7adc555400247 Mon Sep 17 00:00:00 2001
-From: Michael Nosthoff <buildroot@heine.tech>
-Date: Fri, 22 Jul 2022 08:49:48 +0200
-Subject: [PATCH] disable unconditionally downloading api repos
-
-The Buildroot build doesn't need those submodules, so disable them hard
-for now.
-
-See https://github.com/grpc/grpc/issues/30385
-
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94f8fd3e93..df43d2e193 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -402,6 +402,7 @@ if(gRPC_BUILD_GRPCPP_OTEL_PLUGIN)
-   include(cmake/opentelemetry-cpp.cmake)
- endif()
- 
-+if(FALSE)
- # Setup external proto library at third_party/envoy-api with 2 download URLs
- if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/envoy-api AND gRPC_DOWNLOAD_ARCHIVES)
-   # Download the archive via HTTP, validate the checksum, and extract to third_party/envoy-api.
-@@ -478,6 +479,7 @@ if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/xds AND gRPC_DOWNLOAD_ARC
-     xds-3a472e524827f72d1ad621c4983dd5af54c46776
-   )
- endif()
-+endif()
- 
- if(WIN32)
-   set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} ws2_32 crypt32)
--- 
-2.34.1
-
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 08aada1454..130e098c9e 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79ed4ab72fa9589b20f8b0b76c16e353e4cfec1d773d33afad605d97b5682c61  grpc-1.66.1.tar.gz
+sha256  0af37b800953130b47c075b56683ee60bdc3eda3c37fc6004193f5b569758204  grpc-1.76.0.tar.gz
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index d8681f33ce..77cbc366f0 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.66.1
+GRPC_VERSION = 1.76.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
@@ -36,7 +36,8 @@ GRPC_CONF_OPTS = \
 	-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
-	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
+	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF \
+	-DgRPC_DOWNLOAD_ARCHIVES=OFF
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 GRPC_DEPENDENCIES += libexecinfo
@@ -81,7 +82,8 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
-	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
+	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF \
+	-DgRPC_DOWNLOAD_ARCHIVES=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
