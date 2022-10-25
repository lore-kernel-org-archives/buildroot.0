Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28736ECDFA1
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 22:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67EFB80FF8;
	Tue, 25 Oct 2022 22:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67EFB80FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRdxrvWYM4sn; Tue, 25 Oct 2022 22:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8D280F5C;
	Tue, 25 Oct 2022 22:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F8D280F5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C8B71BF5DD
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67D2860A9C
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67D2860A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXwEbaLuXvXf for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 22:13:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D39607F4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40D39607F4
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 22:13:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k8so14757694wrh.1
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 15:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1Jos5da88Mi+pFniaODAGLwiqin+QVeWwMYjkzzc6k=;
 b=cjWRiiS/dGO7/l9gBPYZzQaMNaFQNFjFIiXc2LOv8eBjGrVPKxa5KUeqQx7ye6sFJf
 H6O1XHuyU3F0rZFsRbQJKZ8vKH4DjjrE4WzGmeo0Ts3yP38qstsO4OUNcpGRkvBc6dv1
 9aMI+fhXuiUlFKN/XYtl0aY47qmL7oUXSxPweEJQrfsTELtO+fb27woPKMBJplVP6kT6
 rll/YFlYiaINYBuzrqzvvZN94lxVF3hMdpY9dH6wJWirfhkh1mFz9SkxY6Y2p6rJt+lb
 voK5z/N7XxgNX+MniGb6HQg/jALztotHINdaJouhFrEwtmZYm50M7KNzorXi+vB2fVpB
 wbQg==
X-Gm-Message-State: ACrzQf02sZ3Ry6H5xlO0CeK90L1E+SmrVrdqWPTwcAAk6De6JwAmQ/Gk
 IIxkWzgtWIjVOjXw5QH4knLbsyed1fw=
X-Google-Smtp-Source: AMsMyM5n0FqW9s7VG6xlCOIEyZTcltUDSsjxRr3M4qre4tk4mZPTIqmXNfuoCF++VYPHahS9JxY2yQ==
X-Received: by 2002:a05:6000:170d:b0:236:6aa1:8a56 with SMTP id
 n13-20020a056000170d00b002366aa18a56mr10316770wrc.302.1666735990962; 
 Tue, 25 Oct 2022 15:13:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d17-20020adff2d1000000b002362f6fcaf5sm3730731wrp.48.2022.10.25.15.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 15:13:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 00:13:08 +0200
Message-Id: <20221025221308.352026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1Jos5da88Mi+pFniaODAGLwiqin+QVeWwMYjkzzc6k=;
 b=Uh0IcHUrknG+dxL+orOQ0yzDP4iFvkc4k0qCsqgff1x/08bQe9wzEPZdpeT1wtIHMN
 RK7LPIzm/1wRVcdDei2bM4siUl2zecP48qkQfuto2fUciilCO5wsZLMf0SAtd2dtKNig
 v5kmL4nxyHRWo8jTwo0hIY6KYz19lUk1e9xCfz1rVEQPj0jDTpLi5tu9XE7WvzJqZ13n
 843NvF23N4+8JcktMLv2ba0cmKmeWVIRZmg+YVltoXI/3SD1EJaC3JwXc76pJbZQTHeB
 pIpaikFYuyoDXG4LFg93qJiOcUeZ3NBUchnLOPKB+EMYHiP74063utVvcp+dXGvpluUs
 dvBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Uh0IcHUr
Subject: [Buildroot] [PATCH 1/1] package/libcodec2: fix build without C++
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without C++ raised since bump to version
1.0.5 in commit a380244766342aa7172dc7b572c99db322f74c38:

CMake Error at /home/autobuild/autobuild/instance-7/output-1/host/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.net/results/30b519aa60d5baddb4015cf3608baa04a30be907

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcodec2/0001-update-cmake.patch | 301 ++++++++++++++++++++++
 1 file changed, 301 insertions(+)
 create mode 100644 package/libcodec2/0001-update-cmake.patch

diff --git a/package/libcodec2/0001-update-cmake.patch b/package/libcodec2/0001-update-cmake.patch
new file mode 100644
index 0000000000..e983800e27
--- /dev/null
+++ b/package/libcodec2/0001-update-cmake.patch
@@ -0,0 +1,301 @@
+From 812d69af486e608a10380ed5817b03d08c6e786a Mon Sep 17 00:00:00 2001
+From: "A. Maitland Bottoms" <bottoms@debian.org>
+Date: Sun, 17 Jul 2022 17:04:44 -0400
+Subject: [PATCH] update cmake
+
+Some minor refactoring of Codec2 build to better use CMake
+features to improve readability ans maintainability.
+
+[Retrieved from:
+https://github.com/drowe67/codec2/commit/812d69af486e608a10380ed5817b03d08c6e786a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt     | 48 +++++---------------------
+ src/CMakeLists.txt | 84 ++++++++++++++++++++++++----------------------
+ 2 files changed, 53 insertions(+), 79 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 54ac1f4f4..998af5ddf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -5,19 +5,13 @@
+ # Please report questions, comments, problems, or patches to the freetel
+ # mailing list: https://lists.sourceforge.net/lists/listinfo/freetel-codec2
+ #
+-set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9" CACHE STRING "Minimum OS X deployment version")
+-
+-project(codec2)
+-
+-cmake_minimum_required(VERSION 3.0)
+-
+-# Set policies here, probably should move to cmake dir.
+-if(POLICY CMP0075)
+-    cmake_policy(SET CMP0075 NEW)
+-endif()
+-if(POLICY CMP0079)
+-    cmake_policy(SET CMP0079 NEW)
+-endif()
++cmake_minimum_required(VERSION 3.13)
++project(CODEC2
++  VERSION 1.0.5
++  DESCRIPTION "Next-Generation Digital Voice for Two-Way Radio"
++  HOMEPAGE_URL "https://www.rowetel.com/codec2.html"
++  LANGUAGES C
++  )
+ 
+ include(GNUInstallDirs)
+ mark_as_advanced(CLEAR
+@@ -39,23 +33,6 @@ if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
+    "separate build directory and run cmake from there.")
+ endif("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
+ 
+-#
+-# Set project version information. This should probably be done via external
+-# file at some point.
+-#
+-set(CODEC2_VERSION_MAJOR 1)
+-set(CODEC2_VERSION_MINOR 0)
+-# Set to patch level if needed, otherwise leave FALSE.
+-# Must be positive (non-zero) if set, since 0 == FALSE in CMake.
+-set(CODEC2_VERSION_PATCH 5)
+-set(CODEC2_VERSION "${CODEC2_VERSION_MAJOR}.${CODEC2_VERSION_MINOR}")
+-# Patch level version bumps should not change API/ABI.
+-set(SOVERSION "${CODEC2_VERSION_MAJOR}.${CODEC2_VERSION_MINOR}")
+-if(CODEC2_VERSION_PATCH)
+-    set(CODEC2_VERSION "${CODEC2_VERSION}.${CODEC2_VERSION_PATCH}")
+-endif()
+-message(STATUS "codec2 version: ${CODEC2_VERSION}")
+-
+ # Set default build type
+ if(NOT CMAKE_BUILD_TYPE)
+     set(CMAKE_BUILD_TYPE "Debug")
+@@ -65,6 +42,7 @@ endif()
+ if(BUILD_OSX_UNIVERSAL)
+ set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64")
+ endif(BUILD_OSX_UNIVERSAL)
++set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9" CACHE STRING "Minimum OS X deployment version")
+ 
+ #
+ # Find the git hash if this is a working copy.
+@@ -190,10 +168,6 @@ if (_GNU_SOURCE)
+     add_definitions(-D_GNU_SOURCE=1)
+ endif()
+ 
+-if(UNIX)
+-    set(CMAKE_REQUIRED_LIBRARIES m)
+-endif()
+-
+ check_symbol_exists(floor  math.h   HAVE_FLOOR)
+ check_symbol_exists(ceil   math.h   HAVE_CEIL)
+ check_symbol_exists(pow    math.h   HAVE_POW)
+@@ -288,11 +262,7 @@ else()
+ endif()
+ 
+ # Return the date (yyyy-mm-dd)
+-macro(DATE RESULT)
+-  execute_process(COMMAND "date" "+%Y%m%d" OUTPUT_VARIABLE ${RESULT})
+-endmacro()
+-DATE(DATE_RESULT)
+-string(REGEX REPLACE "\n$" "" DATE_RESULT "${DATE_RESULT}")
++string(TIMESTAMP DATE_RESULT "%Y-%m-%d" UTC)
+ message(STATUS "Compilation date = XX${DATE_RESULT}XX")
+ 
+ set(CPACK_PACKAGE_VERSION_PATCH "${CPACK_PACKAGE_VERSION_PATCH}-${DATE_RESULT}-${FREEDV_HASH}")
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 642404962..cb0990bc2 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -81,7 +81,7 @@ else(CMAKE_CROSSCOMPILING)
+ # Build code generator binaries. These do not get installed.
+     # generate_codebook
+     add_executable(generate_codebook generate_codebook.c)
+-    target_link_libraries(generate_codebook m ${CMAKE_REQUIRED_LIBRARIES})
++    target_link_libraries(generate_codebook m)
+     # Make native builds available for cross-compiling.
+     export(TARGETS generate_codebook
+         FILE ${CMAKE_BINARY_DIR}/ImportExecutables.cmake)
+@@ -238,12 +238,16 @@ set(CODEC2_PUBLIC_HEADERS
+ #
+ # Setup the codec2 library
+ #
++# Patch level version bumps should not change API/ABI.
++set(SOVERSION "${CODEC2_VERSION_MAJOR}.${CODEC2_VERSION_MINOR}")
++message(STATUS "codec2 version: ${CODEC2_VERSION}")
+ add_library(codec2 ${CODEC2_SRCS})
+ if(UNIX)
+-    target_link_libraries(codec2 m)
++    target_link_libraries(codec2 PUBLIC m)
+ endif(UNIX)
+ if(LPCNET AND lpcnetfreedv_FOUND)
+-    target_link_libraries(codec2 lpcnetfreedv)
++    target_link_libraries(codec2 PRIVATE lpcnetfreedv)
++    list(APPEND CODEC2_PUBLIC_HEADERS ${CMAKE_SOURCE_DIR}/lpcnet/src/lpcnet_freedv.h)
+ endif()
+ include_directories(${CMAKE_CURRENT_SOURCE_DIR})
+ set_target_properties(codec2 PROPERTIES
+@@ -269,70 +273,70 @@ export(TARGETS codec2
+ )
+ 
+ add_executable(c2enc c2enc.c)
+-target_link_libraries(c2enc ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(c2enc codec2)
+ 
+ add_executable(c2dec c2dec.c)
+-target_link_libraries(c2dec ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(c2dec codec2)
+ 
+ add_executable(c2sim c2sim.c sd.c)
+-target_link_libraries(c2sim ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(c2sim codec2)
+ 
+ add_executable(fdmdv_get_test_bits fdmdv_get_test_bits.c fdmdv.c kiss_fft.c codec2_fft.c kiss_fftr.c)
+-target_link_libraries(fdmdv_get_test_bits m ${CMAKE_REQUIRED_LIBRARIES})
++target_link_libraries(fdmdv_get_test_bits m)
+ 
+ add_executable(fdmdv_mod fdmdv_mod.c fdmdv.c kiss_fft.c codec2_fft.c kiss_fftr.c)
+-target_link_libraries(fdmdv_mod m ${CMAKE_REQUIRED_LIBRARIES})
++target_link_libraries(fdmdv_mod m)
+ 
+ add_executable(fdmdv_demod fdmdv_demod.c fdmdv.c kiss_fft.c octave.c modem_stats.c codec2_fft.c kiss_fftr.c)
+-target_link_libraries(fdmdv_demod m ${CMAKE_REQUIRED_LIBRARIES})
++target_link_libraries(fdmdv_demod m)
+ 
+ add_executable(fdmdv_put_test_bits fdmdv_put_test_bits.c fdmdv.c kiss_fft.c codec2_fft.c kiss_fftr.c)
+-target_link_libraries(fdmdv_put_test_bits m ${CMAKE_REQUIRED_LIBRARIES})
++target_link_libraries(fdmdv_put_test_bits m)
+ 
+ add_executable(fdmdv_channel fdmdv_channel.c)
+-target_link_libraries(fdmdv_channel ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(fdmdv_channel codec2)
+ 
+ add_executable(insert_errors insert_errors.c)
+-target_link_libraries(insert_errors ${CMAKE_REQUIRED_LIBRARIES})
++target_link_libraries(insert_errors)
+ 
+ add_executable(freedv_tx freedv_tx.c)
+-target_link_libraries(freedv_tx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_tx codec2)
+ 
+ add_executable(freedv_rx freedv_rx.c)
+-target_link_libraries(freedv_rx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_rx codec2)
+ 
+ add_executable(freedv_data_raw_tx freedv_data_raw_tx.c)
+-target_link_libraries(freedv_data_raw_tx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_data_raw_tx codec2)
+ 
+ add_executable(freedv_data_raw_rx freedv_data_raw_rx.c octave.c)
+-target_link_libraries(freedv_data_raw_rx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_data_raw_rx codec2)
+ 
+ add_executable(freedv_data_tx freedv_data_tx.c)
+-target_link_libraries(freedv_data_tx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_data_tx codec2)
+ 
+ add_executable(freedv_data_rx freedv_data_rx.c)
+-target_link_libraries(freedv_data_rx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_data_rx codec2)
+ 
+ add_executable(freedv_mixed_tx freedv_mixed_tx.c)
+-target_link_libraries(freedv_mixed_tx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_mixed_tx codec2)
+ 
+ add_executable(freedv_mixed_rx freedv_mixed_rx.c)
+-target_link_libraries(freedv_mixed_rx ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(freedv_mixed_rx codec2)
+ 
+ add_executable(fsk_mod fsk_mod.c)
+-target_link_libraries(fsk_mod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(fsk_mod codec2)
+ 
+ add_executable(fsk_mod_ext_vco fsk_mod_ext_vco.c)
+-target_link_libraries(fsk_mod_ext_vco m ${CMAKE_REQUIRED_LIBRARIES})
++target_link_libraries(fsk_mod_ext_vco m)
+ 
+ add_executable(fsk_demod fsk_demod.c modem_probe.c octave.c)
+-target_link_libraries(fsk_demod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(fsk_demod codec2)
+ 
+ add_executable(fsk_get_test_bits fsk_get_test_bits.c)
+ target_link_libraries(fsk_get_test_bits)
+ 
+ add_executable(fsk_put_test_bits fsk_put_test_bits.c)
+-target_link_libraries(fsk_put_test_bits ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(fsk_put_test_bits codec2)
+ 
+ add_executable(framer framer.c)
+ target_link_libraries(framer)
+@@ -341,46 +345,46 @@ add_executable(deframer deframer.c)
+ target_link_libraries(deframer)
+ 
+ add_executable(fm_demod fm_demod.c fm.c)
+-target_link_libraries(fm_demod m ${CMAKE_REQUIRED_LIBRARIES})
++target_link_libraries(fm_demod m)
+ 
+ add_executable(cohpsk_mod cohpsk_mod.c)
+-target_link_libraries(cohpsk_mod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(cohpsk_mod codec2)
+ 
+ add_executable(ofdm_get_test_bits ofdm_get_test_bits.c)
+-target_link_libraries(ofdm_get_test_bits ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(ofdm_get_test_bits codec2)
+ 
+ add_executable(ofdm_put_test_bits ofdm_put_test_bits.c)
+-target_link_libraries(ofdm_put_test_bits ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(ofdm_put_test_bits codec2)
+ 
+ add_executable(ofdm_mod ofdm_mod.c)
+-target_link_libraries(ofdm_mod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(ofdm_mod codec2)
+ 
+ add_executable(ofdm_demod ofdm_demod.c octave.c)
+-target_link_libraries(ofdm_demod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(ofdm_demod codec2)
+ 
+ add_executable(fmfsk_mod fmfsk_mod.c)
+-target_link_libraries(fmfsk_mod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(fmfsk_mod codec2)
+ 
+ add_executable(fmfsk_demod fmfsk_demod.c modem_probe.c octave.c)
+-target_link_libraries(fmfsk_demod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(fmfsk_demod codec2)
+ 
+ add_executable(vhf_deframe_c2 vhf_deframe_c2.c)
+-target_link_libraries(vhf_deframe_c2  ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(vhf_deframe_c2  codec2)
+ 
+ add_executable(vhf_frame_c2 vhf_frame_c2.c)
+-target_link_libraries(vhf_frame_c2  ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(vhf_frame_c2  codec2)
+ 
+ add_executable(cohpsk_demod cohpsk_demod.c octave.c)
+-target_link_libraries(cohpsk_demod ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(cohpsk_demod codec2)
+ 
+ add_executable(cohpsk_get_test_bits cohpsk_get_test_bits.c)
+-target_link_libraries(cohpsk_get_test_bits ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(cohpsk_get_test_bits codec2)
+ 
+ add_executable(cohpsk_put_test_bits cohpsk_put_test_bits.c octave.c)
+-target_link_libraries(cohpsk_put_test_bits ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(cohpsk_put_test_bits codec2)
+ 
+ add_executable(ch ch.c)
+-target_link_libraries(ch ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(ch codec2)
+ 
+ add_executable(tollr tollr.c)
+ 
+@@ -388,10 +392,10 @@ add_executable(ldpc_noise ldpc_noise.c)
+ target_link_libraries(ldpc_noise m)
+ 
+ add_executable(ldpc_enc ldpc_enc.c)
+-target_link_libraries(ldpc_enc ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(ldpc_enc codec2)
+ 
+ add_executable(ldpc_dec ldpc_dec.c)
+-target_link_libraries(ldpc_dec ${CMAKE_REQUIRED_LIBRARIES} codec2)
++target_link_libraries(ldpc_dec codec2)
+ 
+ install(TARGETS codec2 EXPORT codec2-config
+     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT lib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
