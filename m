Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4585BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 15:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E47FC60F3E;
	Fri, 21 Jan 2022 15:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZKFjLFff6kR; Fri, 21 Jan 2022 15:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C377160EB0;
	Fri, 21 Jan 2022 15:44:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A297F1BF423
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E8DF83E4B
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CjudaNEeu6-S for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 15:43:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99C8B83E3C
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=joE/OcubERa4FS4i8wIVams15M81yfRXln+6V6dVQ0s=; b=NWVrjIa4RdNnkLisAUz7hl1q/+
 +GZ7AI4Bnm7nKsqGZQuIRzHgSlKGBIDVeA3FG4VdQxIhEsLbRgRG1dmjdQwKpEywLMEaISmYpPVnp
 XR2FGcx5W1+Wj0mB0BRikdao7uamJivulmQrp4bN0MxoctMhZv/3KtjPEIsgzk6gven+YrKp+FXP4
 SkQ4kX+zXHP8SEbU5e2NhVvN5r5oksvRdkCTpxka5q40KVX6ylToR4L3TW6mkZPfixJOfohLtWHL+
 SHNDT/RfJdB1s+Mg711Hxk3X+k932wfmst8D0ajXtPzWM9TyhQDYgKnBr45LrMAQ4LWubS1NCJlp4
 eGU8AgJw==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nAw47-000BCn-If; Fri, 21 Jan 2022 16:43:03 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 649c7bf6;
 Fri, 21 Jan 2022 15:42:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 17:42:35 +0200
Message-Id: <20220121154235.798255-8-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154235.798255-1-aperez@igalia.com>
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC v2 7/7] package/racehound: add patch to
 support building with ninja
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, Samuel Martin <s.martin49@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSIA.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Upstream-Status: https://github.com/euspectre/racehound/pull/6
---
Changes v1 -> v2:
  - Patch added to call into Kbuild with plain make.
---
 ...pport-non-Make-generators-e.g.-Ninja.patch | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 package/racehound/0002-CMake-Support-non-Make-generators-e.g.-Ninja.patch

diff --git a/package/racehound/0002-CMake-Support-non-Make-generators-e.g.-Ninja.patch b/package/racehound/0002-CMake-Support-non-Make-generators-e.g.-Ninja.patch
new file mode 100644
index 0000000000..7f90fb8c69
--- /dev/null
+++ b/package/racehound/0002-CMake-Support-non-Make-generators-e.g.-Ninja.patch
@@ -0,0 +1,112 @@
+From f8d266b017fd76e2de9d20e0bb3951a5338075d1 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Fri, 14 Jan 2022 14:33:21 +0200
+Subject: [PATCH] CMake: Support non-Make generators, e.g. Ninja
+
+---
+ cmake/modules/FindKbuild.cmake             | 15 +++++++++++++--
+ cmake/modules/kbuild_system.cmake          |  4 ++--
+ cmake/modules/kmodule_files/CMakeLists.txt | 11 +++++++++--
+ core/tests/common_target/CMakeLists.txt    |  2 +-
+ 4 files changed, 25 insertions(+), 7 deletions(-)
+
+diff --git a/cmake/modules/FindKbuild.cmake b/cmake/modules/FindKbuild.cmake
+index b79d140..2ba0a78 100644
+--- a/cmake/modules/FindKbuild.cmake
++++ b/cmake/modules/FindKbuild.cmake
+@@ -5,6 +5,7 @@
+ #     (often /lib/modules/${KBUILD_VERSION_STRING}/build)
+ # KBUILD_INCLUDE_DIR - not used
+ # KBUILD_FOUND - TRUE if everything is correct, FALSE otherwise
++# KBUILD_MAKE_COMMAND - Command to run for Make invocations.
+ 
+ if (NOT KBUILD_VERSION_STRING)
+ 	set(KBUILD_VERSION_STRING ${CMAKE_SYSTEM_VERSION} CACHE STRING 
+@@ -18,8 +19,18 @@ endif (NOT KBUILD_BUILD_DIR)
+ 
+ set(KBUILD_INCLUDE_DIRS "NOT USED")
+ 
+-# Note: only KBUILD_BUILD_DIR variable is really used in the project.
+-# Other variables defined only for FindModule architecture of CMake.
++# Only makefiles have $(MAKE) defined, in other cases invoke make directly.
++if (CMAKE_GENERATOR STREQUAL "Unix Makefiles")
++    set(KBUILD_MAKE_COMMAND $\(MAKE\))
++else ()
++    find_program(KBUILD_MAKE_COMMAND make REQUIRED)
++    set(KBUILD_MAKE_COMMAND ${KBUILD_MAKE_COMMAND} CC=${CMAKE_C_COMPILER} CFLAGS=${CMAKE_C_FLAGS})
++endif ()
++
++
++# Note: only KBUILD_BUILD_DIR and KBUILD_MAKE_COMMAND variables are really
++# used in the project. Other variables defined only for FindModule
++# architecture of CMake.
+ 
+ # Handle the QUIETLY and REQUIRED arguments and set KBUILD_FOUND to TRUE if 
+ # all listed variables are TRUE
+diff --git a/cmake/modules/kbuild_system.cmake b/cmake/modules/kbuild_system.cmake
+index e28ef33..e4e33df 100644
+--- a/cmake/modules/kbuild_system.cmake
++++ b/cmake/modules/kbuild_system.cmake
+@@ -262,13 +262,13 @@ function(kbuild_add_module name)
+ 					> "${_dir}.${_name}.o.cmd")
+ 		endforeach(shipped_source_noext_abs ${shipped_source_noext_abs})
+ 	endif(shipped_sources_noext_abs)
+-	
++
+ 	# The rule to create module
+ 	add_custom_command(
+ 		OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${name}.ko ${symvers_file}
+ 		${cmd_create_command}
+ 		${symvers_command}
+-		COMMAND $(MAKE) -C ${KBUILD_BUILD_DIR}
++		COMMAND ${KBUILD_MAKE_COMMAND} -C ${KBUILD_BUILD_DIR}
+ 			M=${CMAKE_CURRENT_BINARY_DIR} modules
+ 		DEPENDS ${depend_files}
+ 	)
+diff --git a/cmake/modules/kmodule_files/CMakeLists.txt b/cmake/modules/kmodule_files/CMakeLists.txt
+index 1147cc5..6115153 100644
+--- a/cmake/modules/kmodule_files/CMakeLists.txt
++++ b/cmake/modules/kmodule_files/CMakeLists.txt
+@@ -5,7 +5,7 @@ if (NOT KERNELDIR)
+ 	set(KERNELDIR /lib/modules/${KBUILD_VERSION_STRING}/build)
+ endif (NOT KERNELDIR)
+ 
+-set(PWD $\(shell pwd\))
++set(PWD $$\(pwd\))
+ 
+ project(kmodule_try_compile)
+ # Create rule for produce file from another file via copiing
+@@ -27,9 +27,16 @@ if(COPY_FILE)
+ 	copy_file("${COPY_FILE}" "${CMAKE_CURRENT_BINARY_DIR}/try_compile.ko")
+ endif(COPY_FILE)
+ 
++# Only makefiles have $(MAKE) defined, in other cases invoke make directly.
++if (CMAKE_GENERATOR STREQUAL "Unix Makefiles")
++    set(KBUILD_MAKE_COMMAND $\(MAKE\))
++else ()
++    find_program(KBUILD_MAKE_COMMAND make REQUIRED)
++endif ()
++
+ # Rule to produce try_compile.ko from try_compile.c
+ add_custom_command(OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/try_compile.ko"
+-	COMMAND $(MAKE) -C ${KERNELDIR} M=${PWD} modules
++	COMMAND ${KBUILD_MAKE_COMMAND} -C ${KERNELDIR} M=${PWD} modules
+ 					DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/try_compile.c")
+ 
+ # Kbuild system cannot work with out-of-source build,
+diff --git a/core/tests/common_target/CMakeLists.txt b/core/tests/common_target/CMakeLists.txt
+index cf257ad..fe48e68 100644
+--- a/core/tests/common_target/CMakeLists.txt
++++ b/core/tests/common_target/CMakeLists.txt
+@@ -17,7 +17,7 @@ add_custom_target("common_target_module"
+ 
+ add_custom_command(
+ 	OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${KMODULE_NAME}.ko"
+-	COMMAND $(MAKE) -f module.makefile
++	COMMAND ${KBUILD_MAKE_COMMAND} -f module.makefile
+ 	DEPENDS 
+ 		"${CMAKE_CURRENT_BINARY_DIR}/cfake.c"
+ 		"${CMAKE_CURRENT_BINARY_DIR}/cfake.h"
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
