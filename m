Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6FBC4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94A7981252;
	Mon, 28 Nov 2022 18:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94A7981252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ic0O5Kp3j07l; Mon, 28 Nov 2022 18:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 868B68137A;
	Mon, 28 Nov 2022 18:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 868B68137A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 282FF1BF20B
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F0DF60B88
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F0DF60B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70TFNaDEIZSj for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:59:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61A4D60B2C
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61A4D60B2C
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:59:03 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id g26so7535038iob.11
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pd/nWmbFzmR/RTWH/zi8EoARrb+Io+2YDlgBwj1MjgY=;
 b=P7uSyUWmHzGRLTeU6gnage5gTzah2OpQ8fmW1U52e7cPHA4XtYuC1VGORFq8MXvltJ
 MlrqlIZH9l/pvH6WjdtLxYlSjuDh1Sidf3ufXJi5+RR7W0gREcd3wR5HOTM/pvRq4Jf9
 UghXAALJ57M+NAbX2+jSVBb3i6GPVlveM6KVo+5HwubEOiCUgS6uLPPxXSkQkux5erFk
 eNt6sKjK6iPp5GWDhMrqhfv/QSANSsfax+DpwrpvruJwisBkqJhT/KbxU+jRVSk8RgWg
 J6IsyMANeO06NOAALbtyCqe7UzvgQt4JN0+Iy0eIkXSY4rNkXK+mWaWRMHtOwzh5xB1d
 nChg==
X-Gm-Message-State: ANoB5pmsxkK1BKuBUQkJss0jAeu3FDUWyvgpPVsZ0OVs7PvbosZBG2Ia
 6cv8PyQiQFjfhrotrEke7jbiJ2SG6o+FYAMV
X-Google-Smtp-Source: AA0mqf5EpQ6FSX3ETrDtixobjF7uAxO0yhRYck0JcWFRcCI/zKmAHz5QexWuxJvjLfA4YLbze9gDqg==
X-Received: by 2002:a02:c737:0:b0:375:1c5f:3127 with SMTP id
 h23-20020a02c737000000b003751c5f3127mr15740659jao.251.1669658341604; 
 Mon, 28 Nov 2022 09:59:01 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:59:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:51 -0700
Message-Id: <20221128175851.1913859-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pd/nWmbFzmR/RTWH/zi8EoARrb+Io+2YDlgBwj1MjgY=;
 b=Ky7C8PdmaHg7z8fZkea8/1Z92khb42IERo9wLh8bnKsdrpaoxrLLmb63Xb8GUi2HsW
 FwKyh63FOlVMvrBet5ZNO3QEG3SE61QD43VaenR8AtGKi9bpPcm7N804IBuybQLxX43y
 i3OMhmYEijDTkt9zl92BXg53aewWwQBlHz3OsEFscZIf00iLpeJ9DJKGSc1guvPr8TbF
 mNvMT0xktmpQjP3bzSPCbb8hlItLz5KYhF5Kr6BPO5BYQKf8SgZHxxC05lCckF+ZXgad
 ilTUL3gzCbzD7s0LnUaPDoSbw955sFi5ZOl7/59IrFrUNk7ntQj4bchfmysQ146tv1OF
 8NyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ky7C8Pdm
Subject: [Buildroot] [PATCH v2 8/8] package/tensorflow-lite: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package adds the tensorflow lite runtime to buildroot.

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix label_image build
  - more explicit cmake config
---
 package/Config.in                             |  1 +
 .../0001-lite-Update-CMakeLists.txt.patch     | 49 +++++++++++++++++++
 .../0002-Fix-FindFlatBuffers-cmake-file.patch | 37 ++++++++++++++
 ...ink-tensorflow-lite-against-gemmlowp.patch | 32 ++++++++++++
 package/tensorflow-lite/Config.in             | 32 ++++++++++++
 package/tensorflow-lite/tensorflow-lite.hash  |  4 ++
 package/tensorflow-lite/tensorflow-lite.mk    | 49 +++++++++++++++++++
 7 files changed, 204 insertions(+)
 create mode 100644 package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
 create mode 100644 package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch
 create mode 100644 package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch
 create mode 100644 package/tensorflow-lite/Config.in
 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash
 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk

diff --git a/package/Config.in b/package/Config.in
index a59d074430..c979710f32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2105,6 +2105,7 @@ endif
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
+	source "package/tensorflow-lite/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
diff --git a/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
new file mode 100644
index 0000000000..53b5170681
--- /dev/null
+++ b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch
@@ -0,0 +1,49 @@
+From 081c2e4e3cf021efb2853a485a18b563e88f6117 Mon Sep 17 00:00:00 2001
+From: Terry Heo <terryheo@google.com>
+Date: Tue, 1 Nov 2022 15:55:30 -0700
+Subject: [PATCH] lite: Update CMakeLists.txt
+
+This changes are needed to build kernel tests.
+
+PiperOrigin-RevId: 485439972
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+081c2e4e3cf021efb2853a485a18b563e88f6117]
+---
+ tensorflow/lite/CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index 9dfbb4b72f3..fd8b3faf1e2 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -209,6 +209,9 @@ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tflite_with_xnnpack\\.cc$")
+ # Exclude Flex related files.
+ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*with_selected_ops\\.cc$")
+ 
++# Exclude tensorflow_profiler_logger files.
++list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tensorflow_profiler_logger\\.cc$")
++
+ if(_TFLITE_ENABLE_MMAP)
+   list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation_disabled\\.cc$")
+ else()
+@@ -222,6 +225,7 @@ if(NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")
+ endif()
+ populate_tflite_source_vars("core" TFLITE_CORE_SRCS)
+ populate_tflite_source_vars("core/api" TFLITE_CORE_API_SRCS)
++populate_tflite_source_vars("core/c" TFLITE_CORE_C_SRCS)
+ populate_tflite_source_vars("c" TFLITE_C_SRCS)
+ populate_tflite_source_vars("delegates" TFLITE_DELEGATES_SRCS)
+ if(TFLITE_ENABLE_GPU)
+@@ -483,6 +487,7 @@ endif()
+ # TFLite library
+ set(_ALL_TFLITE_SRCS
+   ${TFLITE_CORE_API_SRCS}
++  ${TFLITE_CORE_C_SRCS}
+   ${TFLITE_CORE_SRCS}
+   ${TFLITE_C_SRCS}
+   ${TFLITE_DELEGATES_FLEX_SRCS}
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch
new file mode 100644
index 0000000000..e97bb3e52f
--- /dev/null
+++ b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.patch
@@ -0,0 +1,37 @@
+From a4ff4b5e952a22906ac0ed01e73f84f42926c325 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 24 Nov 2022 14:29:06 -0700
+Subject: [PATCH] Fix FindFlatBuffers cmake file
+
+Capitalization needs to match for system cmake override to work:
+https://github.com/google/flatbuffers/blob/v22.11.23/CMake/FindFlatBuffers.cmake
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/tensorflow/tensorflow/pull/58677]
+---
+ tensorflow/lite/CMakeLists.txt                                  | 2 +-
+ .../modules/{FindFlatbuffers.cmake => FindFlatBuffers.cmake}    | 0
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+ rename tensorflow/lite/tools/cmake/modules/{FindFlatbuffers.cmake => FindFlatBuffers.cmake} (100%)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index f9c30d6a046..c2ee9edfb61 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -143,7 +143,7 @@ find_package(absl REQUIRED)
+ find_package(Eigen3 REQUIRED)
+ find_package(farmhash REQUIRED)
+ find_package(fft2d REQUIRED)
+-find_package(Flatbuffers REQUIRED)
++find_package(FlatBuffers REQUIRED)
+ find_package(gemmlowp REQUIRED)
+ find_package(NEON_2_SSE REQUIRED)
+ find_package(cpuinfo REQUIRED)  #CPUINFO is used by XNNPACK and RUY library
+diff --git a/tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake b/tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+similarity index 100%
+rename from tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmake
+rename to tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch b/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch
new file mode 100644
index 0000000000..dbee9942b3
--- /dev/null
+++ b/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against-gemmlowp.patch
@@ -0,0 +1,32 @@
+From fb584589f707853d85a081c99b1b82598c2631c1 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 24 Nov 2022 15:10:27 -0700
+Subject: [PATCH] Don't link tensorflow-lite against gemmlowp
+
+We can't link against gemmlowp as it is a header only library.
+
+Fixes:
+/bin/ld: cannot find -lgemmlowp: No such file or directory
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/tensorflow/tensorflow/pull/58678]
+---
+ tensorflow/lite/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
+index f9c30d6a046..3fe5ed15605 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -560,7 +560,6 @@ target_link_libraries(tensorflow-lite
+     farmhash
+     fft2d_fftsg2d
+     flatbuffers::flatbuffers
+-    gemmlowp
+     ruy::ruy
+     pthreadpool
+     ${CMAKE_DL_LIBS}
+-- 
+2.34.1
+
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
new file mode 100644
index 0000000000..9231d674bd
--- /dev/null
+++ b/package/tensorflow-lite/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_TENSORFLOW_LITE
+	bool "tensorflow-lite"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_SHARED_LIBS
+	depends on ( BR2_arm && BR2_ARM_CPU_ARMV7A ) || ( BR2_aarch64 && BR2_ARM_CPU_ARMV8A )
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_FARMHASH
+	select BR2_PACKAGE_FFT2D
+	select BR2_PACKAGE_FLATBUFFERS
+	select BR2_PACKAGE_GEMMLOWP
+	select BR2_PACKAGE_LIBABSEIL_CPP
+	select BR2_PACKAGE_NEON_2_SSE
+	select BR2_PACKAGE_RUY
+	help
+	  Tensorflow Lite dynamic library and headers: Inference engine to run previously trained machine learning models.
+
+comment "tensorflow-lite needs needs a toolchain w/ gcc >= 9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
+comment "tensorflow-lite needs a toolchain w/ glibc, C++, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
+			!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "tensorflow-lite needs a toolchain w/ shared libraries"
+	depends on !BR2_SHARED_LIBS
+
+comment "tensorflow-lite in buildroot currently only supports arm + armv7a cpu or arm64 + armv8a cpu targets"
+	depends on ( BR2_arm && !BR2_ARM_CPU_ARMV7A ) || ( BR2_aarch64 && !BR2_ARM_CPU_ARMV8A) || (!BR2_arm && !BR2_aarch64)
diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/tensorflow-lite/tensorflow-lite.hash
new file mode 100644
index 0000000000..7d9035707b
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc92dac48  tensorflow-lite-2.11.0.tar.gz
+# License files, locally calculated
+sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1aec65  LICENSE
diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/tensorflow-lite/tensorflow-lite.mk
new file mode 100644
index 0000000000..1f75f3813c
--- /dev/null
+++ b/package/tensorflow-lite/tensorflow-lite.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# tensorflow-lite
+#
+################################################################################
+
+TENSORFLOW_LITE_VERSION = 2.11.0
+TENSORFLOW_LITE_SITE =  $(call github,tensorflow,tensorflow,v$(TENSORFLOW_LITE_VERSION))
+TENSORFLOW_LITE_INSTALL_STAGING = YES
+TENSORFLOW_LITE_LICENSE = Apache-2.0
+TENSORFLOW_LITE_LICENSE_FILES = LICENSE
+TENSORFLOW_LITE_SUBDIR = tensorflow/lite
+TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD = NO
+TENSORFLOW_LITE_DEPENDENCIES += \
+	host-pkgconf \
+	host-flatbuffers \
+	cpuinfo \
+	eigen \
+	farmhash \
+	fft2d \
+	flatbuffers \
+	gemmlowp \
+	libabseil-cpp \
+	neon-2-sse \
+	ruy
+
+TENSORFLOW_LITE_CONF_OPTS = \
+	-Dabsl_DIR=$(STAGING_DIR)/usr/lib/cmake/absl \
+	-DBUILD_SHARED_LIBS=ON \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/gemmlowp" \
+	-DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+	-DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake \
+	-DFARMHASH_SOURCE_DIR=$(FARMHASH_DIR) \
+	-Dfarmhash_DIR=$(STAGING_DIR)/usr/lib \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DFETCHCONTENT_QUIET=OFF \
+	-DFFT2D_SOURCE_DIR=$(STAGING_DIR)/usr/include/fft2d \
+	-DFlatBuffers_DIR=$(STAGING_DIR)/usr/lib/cmake/flatbuffers \
+	-DNEON_2_SSE_DIR=$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \
+	-DTFLITE_ENABLE_EXTERNAL_DELEGATE=ON \
+	-DTFLITE_ENABLE_GPU=OFF \
+	-DTFLITE_ENABLE_INSTALL=ON \
+	-DTFLITE_ENABLE_MMAP=ON \
+	-DTFLITE_ENABLE_NNAPI=ON \
+	-DTFLITE_ENABLE_RUY=ON \
+	-DTFLITE_ENABLE_XNNPACK=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
