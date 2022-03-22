Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A649C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0769415D7;
	Tue, 22 Mar 2022 23:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YL5kq_Y7TUlP; Tue, 22 Mar 2022 23:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585F1415D1;
	Tue, 22 Mar 2022 23:23:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFE61BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03C9B40C7D
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxV9SdgjZE3G for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4C0C40194
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:38 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id i1so1235026ila.0
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bE6URk6u2kPpgd7zFMjllAepvCS3KgT86N8GIIWX0oo=;
 b=KvRIaZUThzIxIlYYypuNPvAK3cwpRv/za2B/nv9KgrBNmkkPrsGBozSdqceAfZTHZ5
 U29X8NpvZMmEWT/S1OVr0zBc0Oms9B31bCrh68AxdwaETGWkps4T4CY8axRPSnnIUcjz
 pm8IGqXyx7q+epVBDRmNake61aycRQWiCbzEc+6BWBQwv7hOLEkJ85l9o4IkTDA9wOlX
 ljgZP/0iV8SENiL1CbaWyvC0K7c+DkalXJLn4q4V9WYQh6BsIJpMKIn7NWeRQkRQXe/s
 9K0gR2PePkc15aK/4NSzYrQe0GhW0x3TGkHt4mveFSWAyLetK/p4LriL8CPY+leWd2AU
 CghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bE6URk6u2kPpgd7zFMjllAepvCS3KgT86N8GIIWX0oo=;
 b=LQbhInX7Dhn2m+uLq4u7+p1/4jMQYlvqhVSy9Wt8EHiWzvsRckaOuyaf+TX2E93noC
 0f/aKvGWpzYpDbaKXyRa4wp2Z4qaVOuOgZZ6H5PYI8mt8tDoVgPKDq5vDjBgT/ztgfbb
 kMMIdltR27HP96pRTMRr0r2qbzMhUrYVUtwcVWSkoyTAPx2H3gSrQ+lzK8mKpoAnKuGc
 5+qBX673XKt34Fz3Az2fkiu8BXdrC3E4x/3sB02zquhJ2TcX34i71IkT3DkOuyDtKfX/
 Fdxonp8iHHgEWuosHdGsF+5DqFXgnNt6sg0+7Ijr4fPHTaFmgq1mu07BmaKqQZ3B1389
 hcJg==
X-Gm-Message-State: AOAM530sxpDSEUZQ3fpXu5D7y0Tyqh4U8ZQz5b+QUqS4GkGsjDee3FbW
 qENwCKKgwDrS5SPi6hOpSF5SxNCQQiwv2cIr
X-Google-Smtp-Source: ABdhPJxBkGvZ4q0+CzazjK/ahwm6PW2DWE1ruoESQulpvWaDPQ6BnWTGf4GtCLlTKX6uyIivwea0oA==
X-Received: by 2002:a05:6e02:12ee:b0:2c8:59cb:c44 with SMTP id
 l14-20020a056e0212ee00b002c859cb0c44mr47455iln.74.1647991357231; 
 Tue, 22 Mar 2022 16:22:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:19 -0600
Message-Id: <20220322232224.2842266-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 06/11] package/libclc: bump version to 13.0.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Weber <matthew.weber@rockwellcollins.com>

* Converts to the cmake pkg type
 * Updates download site
 * Adds a crosscompile fixups patch
   * Allow prepare_builtins utility to be directly called
     (it isn't installed into the path when cross compiling)
   * Fix file_find() for root search limitation

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v11 -> v12:
  - update to 13.0.1 instead of 11.1.0
  - pass required host cmake options for C/CXX compilers
---
 .../0001-support-out-of-tree-build.patch      | 71 +++++++++++++++++++
 package/libclc/libclc.hash                    |  2 +-
 package/libclc/libclc.mk                      | 56 +++++++--------
 3 files changed, 98 insertions(+), 31 deletions(-)
 create mode 100644 package/libclc/0001-support-out-of-tree-build.patch

diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/libclc/0001-support-out-of-tree-build.patch
new file mode 100644
index 0000000000..de7207bedb
--- /dev/null
+++ b/package/libclc/0001-support-out-of-tree-build.patch
@@ -0,0 +1,71 @@
+From 495491e9d53bfb184c15753b5187e4bb55b19511 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Tue, 9 Mar 2021 15:55:17 -0600
+Subject: [PATCH] support out of tree build
+
+(1) The package has a prepare_builtins tool which is built
+but not placed in the path for later use in the build. This
+fix allows the later build steps to use the binary in-place.
+
+(2) With cmake, find_file() when used for non-host builds is
+limited by CMAKE_FIND_ROOT_PATH* scope.
+
+In $(HOST_DIR)/share/buildroot/toolchainfile.cmake we set the
+following target settings for CMAKE_FIND_ROOT_PATH* which
+limit the scope.
+set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/aarch64-buildroot-linux-gnu/sysroot")
+set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
+set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
+set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
+set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
+
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ CMakeLists.txt                          | 2 +-
+ cmake/CMakeDetermineCLCCompiler.cmake   | 4 ++++
+ cmake/CMakeDetermineLLAsmCompiler.cmake | 4 ++++
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9472f19..a784519 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -279,7 +279,7 @@ foreach( t ${LIBCLC_TARGETS_TO_BUILD} )
+ 
+			# Add prepare target
+			add_custom_command( OUTPUT "${obj_suffix}"
+-				            COMMAND prepare_builtins -o
++				            COMMAND ./prepare_builtins -o
+					    "${obj_suffix}"
+					    "builtins.opt.${obj_suffix}"
+					    DEPENDS "opt.${obj_suffix}"
+diff --git a/cmake/CMakeDetermineCLCCompiler.cmake b/cmake/CMakeDetermineCLCCompiler.cmake
+index 94d85d9..5de6a48 100644
+--- a/cmake/CMakeDetermineCLCCompiler.cmake
++++ b/cmake/CMakeDetermineCLCCompiler.cmake
+@@ -12,7 +12,7 @@ mark_as_advanced(CMAKE_CLC_ARCHIVE)
+ 
+ set(CMAKE_CLC_COMPILER_ENV_VAR "CLC_COMPILER")
+ set(CMAKE_CLC_ARCHIVE_ENV_VAR "CLC_LINKER")
+-find_file(clc_comp_in CMakeCLCCompiler.cmake.in PATHS ${CMAKE_ROOT}/Modules ${CMAKE_MODULE_PATH})
++set(clc_comp_in "${CMAKE_MODULE_PATH}/CMakeCLCCompiler.cmake.in" )
+ # configure all variables set in this file
+ configure_file(${clc_comp_in} ${CMAKE_PLATFORM_INFO_DIR}/CMakeCLCCompiler.cmake @ONLY)
+ mark_as_advanced(clc_comp_in)
+diff --git a/cmake/CMakeDetermineLLAsmCompiler.cmake b/cmake/CMakeDetermineLLAsmCompiler.cmake
+index 1c424c7..dd3bfb6 100644
+--- a/cmake/CMakeDetermineLLAsmCompiler.cmake
++++ b/cmake/CMakeDetermineLLAsmCompiler.cmake
+@@ -18,7 +18,7 @@ mark_as_advanced(CMAKE_LLAsm_ARCHIVE)
+ set(CMAKE_LLAsm_PREPROCESSOR_ENV_VAR "LL_PREPROCESSOR")
+ set(CMAKE_LLAsm_COMPILER_ENV_VAR "LL_ASSEMBLER")
+ set(CMAKE_LLAsm_ARCHIVE_ENV_VAR "LL_LINKER")
+-find_file(ll_comp_in CMakeLLAsmCompiler.cmake.in PATHS ${CMAKE_ROOT}/Modules ${CMAKE_MODULE_PATH})
++set(ll_comp_in "${CMAKE_MODULE_PATH}/CMakeLLAsmCompiler.cmake.in" )
+ # configure all variables set in this file
+ configure_file(${ll_comp_in} ${CMAKE_PLATFORM_INFO_DIR}/CMakeLLAsmCompiler.cmake @ONLY)
+ mark_as_advanced(ll_comp_in)
+-- 
+2.17.1
+
diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
index 2af64bc8e8..c496291d81 100644
--- a/package/libclc/libclc.hash
+++ b/package/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  54d7ae523aabf68d533011739d6c01546cae0c294442d0f44fd657c046cb707d  libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060-br1.tar.gz
+sha256  8f0213e52e2fcaca3dfcc438f05d0e15e9b3c96fd6b0994a802b267dc1047a1d  libclc-13.0.1.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
index 6fe8e10a77..5d246cf4f8 100644
--- a/package/libclc/libclc.mk
+++ b/package/libclc/libclc.mk
@@ -4,43 +4,39 @@
 #
 ################################################################################
 
-# Use the latest commit from release_90 branch.
-LIBCLC_VERSION = d1cbc92e2ceee59963f5c3a576382e5bba31f060
-LIBCLC_SITE = https://github.com/llvm-mirror/libclc
-LIBCLC_SITE_METHOD = git
+LIBCLC_VERSION = 13.0.1
+LIBCLC_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
+LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
 
-LIBCLC_DEPENDENCIES = host-clang host-llvm
+LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
 LIBCLC_INSTALL_STAGING = YES
 
-# C++ compiler is used to build a small tool (prepare-builtins) for the host.
-# It must be built with the C++ compiler from the host.
+# CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
+# llvm-config provided values
+#
+# CMAKE_*_COMPILER has to be set to the host compiler to build a host
+# 'prepare_builtins' tool used during the build process
 #
 # The headers are installed in /usr/share and not /usr/include,
 # because they are needed at runtime on the target to build the OpenCL
 # kernels.
 LIBCLC_CONF_OPTS = \
-	--with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
-	--prefix=/usr \
-	--includedir=/usr/share \
-	--pkgconfigdir=/usr/lib/pkgconfig \
-	--with-cxx-compiler=$(HOSTCXX_NOCCACHE)
-
-define LIBCLC_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
-endef
-
-define LIBCLC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define LIBCLC_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-endef
-
-define LIBCLC_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
-endef
-
-$(eval $(generic-package))
+	-DCMAKE_SYSROOT="" \
+	-DCMAKE_C_COMPILER_FORCED=ON \
+	-DCMAKE_CXX_COMPILER_FORCED=ON \
+	-DCMAKE_CLC_COMPILER_FORCED=ON \
+	-DCMAKE_LLAsm_COMPILER_FORCED=ON \
+	-DCMAKE_INSTALL_DATADIR="share" \
+	-DCMAKE_FIND_ROOT_PATH="$(HOST_DIR)" \
+	-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
+	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
+	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
+	-DLLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
