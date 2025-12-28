Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7799EE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C64600CA;
	Sun, 28 Dec 2025 07:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdB3eoSpeoRs; Sun, 28 Dec 2025 07:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E76F606E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908258;
	bh=tWonqGH5swwNaKEr2Baa31CISRiSczW1QnsCV0NKD8w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dwzU1KRehtNYktJeamVDTWGgCLYRPa3rDQFo5x3wWXE+X8BreX/NjUSavPfmGAV/8
	 zl1PZ2e7hxi0Ona3pu/N31Sw9QceOSiQcngHkWx19A041CH4ZMK52J9waZ8/D+I0eR
	 pcMf5+HlWLmrnQn0M4Yl0h89ByLfaKjt7FrvCYH9S9JvC69d6XUuM9zi5XveaTIVI3
	 ZlbQZ3cuoYd9dVxnRjazE4GmEbUskSOBZ0ClTqIvjmieeuc2cWPRQkpbEbeDb/6ofe
	 YzJ12JMqwTzJbTyBzv/89IBxMOqoISbQ61tsublImj6l+27RE73L9TFQLvNzVpwLCk
	 iiNY6WpyM/sCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E76F606E9;
	Sun, 28 Dec 2025 07:50:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B7D3D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DF68400B1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6Vp4MMYceWm for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A6AE40087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A6AE40087
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A6AE40087
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:50:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA05FA4C2278;
 Sun, 28 Dec 2025 08:48:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVp-000000004ex-21Va;
 Sun, 28 Dec 2025 07:48:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 28 Dec 2025 08:48:06 +0100
Message-ID: <20251228074822.3370464-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908116;
 bh=ouGwPsyaSXMhWUPL1zjex1x/dPONv+TyjoMYDEOoCwk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ev22SofCofj9YZKNxOE3T4F17qKNhsfN/HcElLPHbGY4NQCw5gwe820LQAL9f4CGl
 QMHhIKzgg591/Y5lNnAPAz8SDWVFyVeAMrpf33FcAqyqpn6GgFHC9WUEwLD3y2OkSN
 ySwC4QQGdnHxsPFUTgqNZcYZFBn1dySwxriDSp8IjW3tw/DGUd+fJoPpwtPKbzdMyV
 mcpORbSY4Fz+jidUinGGtaLBvCcrjrJtGqp4fsX3gyVzoC3CfxK6EJXl7S2kB5oiAR
 yAhTc56JnEIVmNWm8jjMwIbtgYZw7myRnX9mQDnjZIOIQoFsqKpn+iU8mxVQcRChGo
 PwGbXNZF4QQ/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ev22SofC
Subject: [Buildroot] [PATCH v6 11/26] package/openpowerlink: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Analysis of
https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2, linked
as "Git (2.x)" from https://sourceforge.net/projects/openpowerlink/

last commit: Jun 2021
last bug report: Jun 2022
last pull request: Sep 2022

The package is broken with cmake 4 and no other package depends on it.

The issue "Status of openPOWERLINK" from Jul 2025 is unanswered:
https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/issues/390

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Romain Naour <romain.naour@gmail.com>
---
 .checkpackageignore                           |   3 -
 Config.in.legacy                              |   6 +
 DEVELOPERS                                    |   1 -
 package/Config.in                             |   1 -
 ...-stack-libraries-to-lib-subdirectory.patch | 167 ---------------
 ...002-cmake-install-oplk-headers-files.patch |  32 ---
 .../0003-Add-top-level-CMakeLists.txt.patch   | 201 ------------------
 package/openpowerlink/Config.in               | 129 -----------
 package/openpowerlink/openpowerlink.hash      |   6 -
 package/openpowerlink/openpowerlink.mk        | 153 -------------
 10 files changed, 6 insertions(+), 693 deletions(-)
 delete mode 100644 package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
 delete mode 100644 package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
 delete mode 100644 package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
 delete mode 100644 package/openpowerlink/Config.in
 delete mode 100644 package/openpowerlink/openpowerlink.hash
 delete mode 100644 package/openpowerlink/openpowerlink.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 311333cb09..044e726089 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -766,9 +766,6 @@ package/openocd/0001-configure-enable-build-on-uclinux.patch lib_patch.Upstream
 package/openpgm/0001-Rename-openpgm-5.2.pc.in.patch lib_patch.Upstream
 package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch lib_patch.Upstream
 package/openpgm/0003-fix-build-on-macOS-ARM.patch lib_patch.Upstream
-package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch lib_patch.Upstream
-package/openpowerlink/0002-cmake-install-oplk-headers-files.patch lib_patch.Upstream
-package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch lib_patch.Upstream
 package/openrc/0001-init.d-sysctl.in-add-support-for-busybox-sysctl.patch lib_patch.Upstream
 package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch lib_patch.Upstream
 package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index c1445b9612..97ecc2f601 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENPOWERLINK
+	bool "openpowerlink has been removed"
+	select BR2_LEGACY
+	help
+	  openpowerlink is unmaintained and has been removed
+
 config BR2_PACKAGE_ALURE
 	bool "alure has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index cb57b42846..61860a638c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2930,7 +2930,6 @@ F:	package/mesa3d/
 F:	package/minetest/
 F:	package/minetest-game/
 F:	package/ogre/
-F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/piglit/
 F:	package/python-libevdev/
diff --git a/package/Config.in b/package/Config.in
index e1b4e7cac8..5b565d6d6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -569,7 +569,6 @@ endmenu
 	source "package/openfpgaloader/Config.in"
 	source "package/openipmi/Config.in"
 	source "package/openocd/Config.in"
-	source "package/openpowerlink/Config.in"
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
diff --git a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
deleted file mode 100644
index 0e1c21ec0d..0000000000
--- a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From 16230b7f51bff2bdf061fa80e9a49c807596bb92 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 25 May 2016 15:57:10 +0200
-Subject: [PATCH] install the stack libraries to "lib" subdirectory
-
-Using '.' to install the stack libraries is not correct since
-it will install them to /usr/.
-
-ls /usr/liboplkmnapp-kernelintf.so
-
-Fix this by using 'lib' instead of '.'
-
-The problem with the openpowerlink build system is that it expect
-the stack directory to be a "local staging" directory which
-contains headers and libraries. So the libraries build by the
-stack project are installed in stack/lib by default.
-
-This is wrong to do that because it becomes difficult to package
-openpowerlink for normal Linux systems.
-
-Buildroot like others build system expect from a packaged software
-to install libraries and headers build/provided in a staging
-directory.
-
-It seems that CMAKE_INSTALL_PREFIX is misused by the default value
-"${CMAKE_CURRENT_SOURCE_DIR}/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR}"
-since it already contains the lib directory and therefore the
-entire build system is messed up.
-
-It seems that the openpowerlink's build system doesn't allow/support
-CMAKE_INSTALL_PREFIX to be set externally
-(which is the standard approach).
-
-The issue has been reported [1] upstream and a build system
-refactoring is needed to fix this properly.
-
-[1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/#8f80/a50a/4649/f07c
-
-[rebase on v2.5.0]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- stack/proj/linux/liboplkcn-sim/CMakeLists.txt           | 2 +-
- stack/proj/linux/liboplkcn/CMakeLists.txt               | 2 +-
- stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt | 2 +-
- stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt   | 2 +-
- stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt       | 2 +-
- stack/proj/linux/liboplkmn-sim/CMakeLists.txt           | 2 +-
- stack/proj/linux/liboplkmn/CMakeLists.txt               | 2 +-
- stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt | 2 +-
- stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt  | 2 +-
- stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt   | 2 +-
- stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt       | 2 +-
- 11 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/stack/proj/linux/liboplkcn-sim/CMakeLists.txt b/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
-index 2b3da16..ddb3e92 100644
---- a/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
-@@ -96,4 +96,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkcn/CMakeLists.txt b/stack/proj/linux/liboplkcn/CMakeLists.txt
-index 3be6c52..cf1b1dd 100644
---- a/stack/proj/linux/liboplkcn/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
-@@ -90,4 +90,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-index 904de6c..d8713a8 100644
---- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-index e2514cf..a4e2b75 100644
---- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
-index 98f068c..bb20006 100644
---- a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
-@@ -76,4 +76,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkmn-sim/CMakeLists.txt b/stack/proj/linux/liboplkmn-sim/CMakeLists.txt
-index eb6396a..5beaa07 100644
---- a/stack/proj/linux/liboplkmn-sim/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkmn-sim/CMakeLists.txt
-@@ -91,4 +91,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkmn/CMakeLists.txt b/stack/proj/linux/liboplkmn/CMakeLists.txt
-index cf7927f..6b19557 100644
---- a/stack/proj/linux/liboplkmn/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkmn/CMakeLists.txt
-@@ -89,4 +89,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
-index 9daa2df..bfccb25 100644
---- a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
-@@ -82,4 +82,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt
-index 0135f46..83128eb 100644
---- a/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt
-@@ -91,4 +91,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
-index cd97882..aaaa526 100644
---- a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
-@@ -82,4 +82,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
-index 0c29087..1783134 100644
---- a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
-@@ -79,4 +79,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
- TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
- SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
--INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
-+INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
--- 
-2.9.4
-
diff --git a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch b/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
deleted file mode 100644
index 8e815c0496..0000000000
--- a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f7679a4083de3a9dba80cd719ad4904fbade349b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 25 May 2016 15:57:29 +0200
-Subject: [PATCH] cmake: install oplk headers files
-
-In order to be able to link a third party application
-with openpowerlink libraries, we need to install the
-oplk headers files related to openpowerlink stack.
-
-Install all headers file from STACK_INCLUDE_DIR/oplk.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- stack/CMakeLists.txt | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/stack/CMakeLists.txt b/stack/CMakeLists.txt
-index 69454f2..45f131d 100644
---- a/stack/CMakeLists.txt
-+++ b/stack/CMakeLists.txt
-@@ -110,3 +110,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
- ELSE()
-     MESSAGE(FATAL_ERROR "Unknown Platform and processor combination ${CMAKE_SYSTEM_NAME} and ${CMAKE_SYSTEM_PROCESSOR}!!")
- ENDIF()
-+
-+################################################################################
-+# Install oplk headers files
-+################################################################################
-+INSTALL(DIRECTORY ${STACK_INCLUDE_DIR}/oplk DESTINATION "include")
--- 
-2.9.4
-
diff --git a/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch b/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
deleted file mode 100644
index cd8f9274d6..0000000000
--- a/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
+++ /dev/null
@@ -1,201 +0,0 @@
-From cd0945a323cecb638ce56f2e3d7fb4e8c004b98b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 25 May 2016 15:59:20 +0200
-Subject: [PATCH] Add top level CMakeLists.txt
-
-This CMakeLists.txt can be used to build openpowerlink
-using a automated build system.
-
-Don't use FIND_LIBRARY when the stack is built from a top
-level build (ie CFG_OPLK_LIB is ON).
-For a top level build, CMake will automatically add a build
-dependency on oplk libraries for building demos applications.
-
-Also replace OPLKLIB_DEBUG by OPLKLIB in OPLK_LINK_LIBRARIES macro
-if CMAKE_BUILD_TYPE is "Debug", otherwise TARGET_LINK_LIBRARIES can't
-find the openpowerlink library.
-This issue may be related to:
-https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/issues/109
-
-Fixes:
-http://autobuild.buildroot.net/results/da4/da445b65cb136d71577f04e3a17fdb2ef6302a9b
-
-This patch has not been accepted by upstream:
-https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
-
-Add PCIe support (v2.3.2)
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- CMakeLists.txt                               | 42 +++++++++++++++++
- apps/common/cmake/findoplklib.cmake          | 68 +++++++++++++++-------------
- apps/common/cmake/linkoplklib.cmake          |  2 +-
- drivers/linux/drv_daemon_pcap/CMakeLists.txt | 12 +++--
- 4 files changed, 89 insertions(+), 35 deletions(-)
- create mode 100644 CMakeLists.txt
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-new file mode 100644
-index 0000000..28d4e7a
---- /dev/null
-+++ b/CMakeLists.txt
-@@ -0,0 +1,42 @@
-+
-+CMAKE_MINIMUM_REQUIRED (VERSION 2.8.7)
-+
-+#### LIB ####
-+
-+IF (CFG_OPLK_LIB)
-+    ADD_SUBDIRECTORY("stack")
-+ENDIF (CFG_OPLK_LIB)
-+
-+#### Linux kernel Ethernet module  ####
-+
-+IF (CFG_KERNEL_DRIVERS)
-+    ADD_SUBDIRECTORY("drivers/linux/drv_kernelmod_edrv")
-+ENDIF (CFG_KERNEL_DRIVERS)
-+
-+#### Linux kernel PCIe module  ####
-+
-+IF (CFG_KERNEL_PCIE_DRIVERS)
-+    ADD_SUBDIRECTORY("drivers/linux/drv_kernelmod_pcie")
-+ENDIF (CFG_KERNEL_PCIE_DRIVERS)
-+
-+#### Pcap userspace driver  ####
-+
-+IF (CFG_PCAP_DAEMON)
-+    ADD_SUBDIRECTORY("drivers/linux/drv_daemon_pcap")
-+ENDIF (CFG_PCAP_DAEMON)
-+
-+#### OpenPowerLink Demos  ####
-+
-+# Add subdirectory of CN console demo application
-+IF (CFG_DEMO_CN_CONSOLE)
-+    ADD_SUBDIRECTORY("apps/demo_cn_console")
-+ENDIF (CFG_DEMO_CN_CONSOLE)
-+
-+# Add subdirectory of MN console demo application
-+IF (CFG_DEMO_MN_CONSOLE)
-+    ADD_SUBDIRECTORY("apps/demo_mn_console")
-+ENDIF (CFG_DEMO_MN_CONSOLE)
-+
-+IF (CFG_DEMO_MN_QT)
-+    ADD_SUBDIRECTORY("apps/demo_mn_qt")
-+ENDIF (CFG_DEMO_MN_QT)
-diff --git a/apps/common/cmake/findoplklib.cmake b/apps/common/cmake/findoplklib.cmake
-index f7e710f..b8b04c5 100644
---- a/apps/common/cmake/findoplklib.cmake
-+++ b/apps/common/cmake/findoplklib.cmake
-@@ -85,36 +85,42 @@ MACRO(FIND_OPLK_LIBRARY OPLK_NODE_TYPE)
-     # Set oplk library directory
-     SET(OPLKLIB_DIR ${OPLK_BASE_DIR}/stack/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR})
- 
--    IF((CMAKE_GENERATOR MATCHES "Visual Studio") OR (CMAKE_BUILD_TYPE STREQUAL "Release"))
--        # Search for release library
--        UNSET(OPLKLIB CACHE)
--        MESSAGE(STATUS "Searching for LIBRARY ${OPLKLIB_NAME} in ${OPLKLIB_DIR}")
--        FIND_LIBRARY(OPLKLIB NAME ${OPLKLIB_NAME}
--                             HINTS ${OPLKLIB_DIR} ${OPLKLIB_DIR}/${CFG_DEMO_BOARD_NAME}/${CFG_DEMO_NAME})
--
--        IF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
--
--            UNSET(OPLKDLL CACHE)
--            FIND_PROGRAM(OPLKDLL NAME ${OPLKLIB_NAME}.dll
--                                 HINTS ${OPLKLIB_DIR})
--
--        ENDIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
--    ENDIF()
--
--    IF((CMAKE_GENERATOR MATCHES "Visual Studio") OR (CMAKE_BUILD_TYPE STREQUAL "Debug"))
--        # Search for debug library
--        UNSET(OPLKLIB_DEBUG CACHE)
--        MESSAGE(STATUS "Searching for LIBRARY ${OPLKLIB_DEBUG_NAME} in ${OPLKLIB_DIR}")
--        FIND_LIBRARY(OPLKLIB_DEBUG NAME ${OPLKLIB_DEBUG_NAME}
--                                   HINTS ${OPLKLIB_DIR} ${OPLKLIB_DIR}/${CFG_DEMO_BOARD_NAME}/${CFG_DEMO_NAME})
--
--        IF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
--
--            UNSET(OPLKDLL_DEBUG CACHE)
--            FIND_PROGRAM(OPLKDLL_DEBUG NAME ${OPLKLIB_DEBUG_NAME}.dll
--                                       HINTS ${OPLKLIB_DIR})
--
--        ENDIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
--    ENDIF()
-+    # Don't look for oplk libraries for a top level build
-+    IF(CFG_OPLK_LIB)
-+        SET(OPLKLIB ${OPLKLIB_NAME})
-+        SET(OPLKLIB_DEBUG ${OPLKLIB_DEBUG_NAME})
-+    ELSE(CFG_OPLK_LIB)
-+        IF((CMAKE_GENERATOR MATCHES "Visual Studio") OR (CMAKE_BUILD_TYPE STREQUAL "Release"))
-+            # Search for release library
-+            UNSET(OPLKLIB CACHE)
-+            MESSAGE(STATUS "Searching for LIBRARY ${OPLKLIB_NAME} in ${OPLKLIB_DIR}")
-+            FIND_LIBRARY(OPLKLIB NAME ${OPLKLIB_NAME}
-+                                HINTS ${OPLKLIB_DIR} ${OPLKLIB_DIR}/${CFG_DEMO_BOARD_NAME}/${CFG_DEMO_NAME})
-+
-+            IF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
-+
-+                UNSET(OPLKDLL CACHE)
-+                FIND_PROGRAM(OPLKDLL NAME ${OPLKLIB_NAME}.dll
-+                                    HINTS ${OPLKLIB_DIR})
-+
-+            ENDIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
-+        ENDIF()
-+
-+        IF((CMAKE_GENERATOR MATCHES "Visual Studio") OR (CMAKE_BUILD_TYPE STREQUAL "Debug"))
-+            # Search for debug library
-+            UNSET(OPLKLIB_DEBUG CACHE)
-+            MESSAGE(STATUS "Searching for LIBRARY ${OPLKLIB_DEBUG_NAME} in ${OPLKLIB_DIR}")
-+            FIND_LIBRARY(OPLKLIB_DEBUG NAME ${OPLKLIB_DEBUG_NAME}
-+                                    HINTS ${OPLKLIB_DIR} ${OPLKLIB_DIR}/${CFG_DEMO_BOARD_NAME}/${CFG_DEMO_NAME})
-+
-+            IF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
-+
-+                UNSET(OPLKDLL_DEBUG CACHE)
-+                FIND_PROGRAM(OPLKDLL_DEBUG NAME ${OPLKLIB_DEBUG_NAME}.dll
-+                                        HINTS ${OPLKLIB_DIR})
-+
-+            ENDIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
-+        ENDIF()
-+    ENDIF(CFG_OPLK_LIB)
- 
- ENDMACRO(FIND_OPLK_LIBRARY)
-diff --git a/apps/common/cmake/linkoplklib.cmake b/apps/common/cmake/linkoplklib.cmake
-index 49aab66..d9fd418 100644
---- a/apps/common/cmake/linkoplklib.cmake
-+++ b/apps/common/cmake/linkoplklib.cmake
-@@ -33,7 +33,7 @@ MACRO(OPLK_LINK_LIBRARIES EXECUTABLE_NAME)
-         TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
-     ELSE()
-         IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
--            TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} debug ${OPLKLIB_DEBUG})
-+            TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} debug ${OPLKLIB})
-         ELSE ()
-             TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB})
-         ENDIF()
-diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-index 2b4a2c1..ecceb4c 100644
---- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-+++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-@@ -109,9 +109,15 @@ ENDIF()
- SET(OPLKLIB_DIR ${OPLK_BASE_DIR}/stack/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR})
- SET(OPLKLIB_INCDIR ${OPLK_BASE_DIR}/stack/proj/${SYSTEM_NAME_DIR}/lib${LIB_NAME})
- 
--UNSET(OPLKLIB CACHE)
--FIND_LIBRARY(OPLKLIB NAME ${LIB_NAME}${BUILD_TYPE_EXT}
--                     HINTS ${OPLKLIB_DIR})
-+# Don't look for oplk libraries for a top level build
-+IF(CFG_OPLK_LIB)
-+    SET(OPLKLIB ${LIB_NAME}${BUILD_TYPE_EXT})
-+ELSE(CFG_OPLK_LIB)
-+    UNSET(OPLKLIB CACHE)
-+    FIND_LIBRARY(OPLKLIB NAME ${LIB_NAME}${BUILD_TYPE_EXT}
-+                        HINTS ${OPLKLIB_DIR})
-+ENDIF(CFG_OPLK_LIB)
-+
- INCLUDE_DIRECTORIES(${OPLKLIB_INCDIR})
- 
- SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -pedantic -std=c99 -pthread -fno-strict-aliasing")
--- 
-2.9.4
-
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
deleted file mode 100644
index ef59a04baf..0000000000
--- a/package/openpowerlink/Config.in
+++ /dev/null
@@ -1,129 +0,0 @@
-comment "openpowerlink needs a toolchain w/ C++, threads"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_OPENPOWERLINK
-	bool "openpowerlink"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_i386 || BR2_x86_64
-	help
-	  openPOWERLINK is an Open Source Industrial Ethernet stack
-	  implementing the POWERLINK protocol for Managing Node (MN,
-	  POWERLINK Master) and Controlled Node (CN, POWERLINK Slave).
-
-	  It is provided by
-	  SYSTEC electronic (http://www.systec-electronic.com),
-	  B&R (http://www.br-automation.com) and
-	  Kalycito (http://www.kalycito.com).
-
-	  http://openpowerlink.sourceforge.net/web/
-
-if BR2_PACKAGE_OPENPOWERLINK
-
-choice
-	prompt "MN/CN mode"
-
-config BR2_PACKAGE_OPENPOWERLINK_MN
-	bool "Managing Node"
-	help
-	  Enable Managing Node (master) mode
-
-config BR2_PACKAGE_OPENPOWERLINK_CN
-	bool "Controlled Node"
-	help
-	  Enable Controlled Node (slave) mode
-
-endchoice
-
-choice
-	prompt "stack type"
-	default BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE # legacy
-	default BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB if BR2_PACKAGE_OPENPOWERLINK_LIBPCAP # legacy
-
-config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
-	bool "linked into application"
-	select BR2_PACKAGE_LIBPCAP
-	help
-	  Compile a monolithic openPOWERLINK library. The library
-	  contains an Ethernet driver which is using the PCAP library
-	  for accessing the network. No kernel-side driver is needed.
-
-config BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
-	bool "user-space pcap daemon"
-	select BR2_PACKAGE_LIBPCAP
-	help
-	  Compile openPOWERLINK application library which contains the
-	  interface to a Linux user space driver, and the Linux user
-	  space driver. It is used for implementing a multi-process
-	  solution where the openPOWERLINK layer is running as a
-	  separate Linux user space daemon (i.e. a PCAP based user
-	  space daemon).  No kernel-side stack is needed.
-
-config BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
-	bool "kernel-space driver"
-	depends on BR2_LINUX_KERNEL
-	help
-	  Compile openPOWERLINK application library which contains the
-	  interface to a Linux kernel space driver. This will also
-	  build and install a Linux kernel module openPOWERLINK
-	  driver.
-
-config BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
-	bool "kernel-space PCIe driver"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_PACKAGE_OPENPOWERLINK_MN # MN support only
-	help
-	  Compile openPOWERLINK application library which contains the
-	  interface to a Linux kernel PCIe interface driver. The kernel
-	  part of the openPOWERLINK stack is located on an external PCIe
-	  device. The status/control and data exchange between the
-	  application and kernel stack is handled by the PCIe interface
-	  driver.
-
-comment "openpowerlink kernel stack needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
-endchoice
-
-if BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
-
-menu "Ethernet drivers"
-
-config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_82573
-	bool "Intel 82573"
-	default y
-
-config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_8255x
-	bool "Intel 8255x"
-
-config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_I210
-	bool "Intel I210"
-
-config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8111
-	bool "Realtek RTL-8111/8168"
-
-config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8139
-	bool "Realtek RTL-8139"
-
-endmenu
-
-endif # BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
-
-config BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER
-	bool "PCIe Powerlink Driver"
-	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
-
-menu "demos"
-
-config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE
-	bool "console MN demo"
-	depends on BR2_PACKAGE_OPENPOWERLINK_MN
-
-config BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE
-	bool "console CN demo"
-	depends on BR2_PACKAGE_OPENPOWERLINK_CN
-
-endmenu
-
-endif # BR2_PACKAGE_OPENPOWERLINK
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
deleted file mode 100644
index b6ae8edcd8..0000000000
--- a/package/openpowerlink/openpowerlink.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From https://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.2/
-md5  80a64b0a2c2dec1e7aff22a06000b3d6  openPOWERLINK_V2.7.2.tar.gz
-sha1  09dcb5bd7cb9d59cb9e60230ae09c558996be25b  openPOWERLINK_V2.7.2.tar.gz
-# sha256 locally computed
-sha256  2cc660e0f8a939bd65c9f46176d18882dbe1017cbb2567b414a8a7c9af41a356  openPOWERLINK_V2.7.2.tar.gz
-sha256  348e31e9e5094104463d58d33abd31049fdf209afbc12ea7abb7fd4b4a147429  license.md
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
deleted file mode 100644
index c8dbb66d05..0000000000
--- a/package/openpowerlink/openpowerlink.mk
+++ /dev/null
@@ -1,153 +0,0 @@
-################################################################################
-#
-# openpowerlink
-#
-################################################################################
-
-OPENPOWERLINK_VERSION = 2.7.2
-OPENPOWERLINK_SITE = https://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V$(OPENPOWERLINK_VERSION)
-OPENPOWERLINK_SOURCE = openPOWERLINK_V$(OPENPOWERLINK_VERSION).tar.gz
-OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
-OPENPOWERLINK_LICENSE_FILES = license.md
-
-OPENPOWERLINK_INSTALL_STAGING = YES
-
-# The archive has no leading component.
-OPENPOWERLINK_STRIP_COMPONENTS = 0
-
-OPENPOWERLINK_MN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_MN),ON,OFF)
-OPENPOWERLINK_CN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_CN),ON,OFF)
-
-#### OPLK LIBRARY ####
-
-# Always build a oplk stack
-# Disable library with simulation interface
-# Disable zynq/FPGA (PCIe) interface
-OPENPOWERLINK_CONF_OPTS += -DCFG_OPLK_LIB=ON \
-	-DCFG_COMPILE_LIB_MN_SIM=OFF \
-	-DCFG_COMPILE_LIB_CN_SIM=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_ZYNQINTF=OFF
-
-# All option are ON by default
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
-OPENPOWERLINK_DEPENDENCIES += libpcap
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_COMPILE_LIB_MN=$(OPENPOWERLINK_MN_ONOFF) \
-	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=OFF \
-	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
-	-DCFG_COMPILE_LIB_CN=$(OPENPOWERLINK_CN_ONOFF) \
-	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
-	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF \
-	-DPCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
-OPENPOWERLINK_DEPENDENCIES += libpcap
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_COMPILE_LIB_MN=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(OPENPOWERLINK_MN_ONOFF) \
-	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=OFF \
-	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(OPENPOWERLINK_MN_ONOFF) \
-	-DCFG_COMPILE_LIB_CN=OFF \
-	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(OPENPOWERLINK_CN_ONOFF) \
-	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(OPENPOWERLINK_CN_ONOFF) \
-	-DPCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_COMPILE_LIB_MN=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(OPENPOWERLINK_MN_ONOFF) \
-	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=OFF \
-	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
-	-DCFG_COMPILE_LIB_CN=OFF \
-	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
-	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(OPENPOWERLINK_CN_ONOFF) \
-	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB),y)
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_COMPILE_LIB_MN=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=$(OPENPOWERLINK_MN_ONOFF) \
-	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
-	-DCFG_COMPILE_LIB_CN=OFF \
-	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
-	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
-endif
-
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_COMPILE_SHARED_LIBRARY=$(if $(BR2_STATIC_LIBS),OFF,ON)
-
-#### OPLK KERNEL DRIVERS ####
-
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB)$(BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER),y)
-OPENPOWERLINK_DEPENDENCIES += linux
-
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_KERNEL_DIR="$(LINUX_DIR)" \
-	-DCMAKE_SYSTEM_VERSION="$(LINUX_VERSION)" \
-	-DCFG_OPLK_MN="$(OPENPOWERLINK_MN_ONOFF)" \
-	-DMAKE_KERNEL_ARCH="$(KERNEL_ARCH)" \
-	-DMAKE_KERNEL_CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
-endif
-
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_DRIVERS=ON \
-	-DCFG_POWERLINK_EDRV_82573=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_82573),ON,OFF) \
-	-DCFG_POWERLINK_EDRV_8255X=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_8255x),ON,OFF) \
-	-DCFG_POWERLINK_EDRV_I210=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_I210),ON,OFF) \
-	-DCFG_POWERLINK_EDRV_8111=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8111),ON,OFF) \
-	-DCFG_POWERLINK_EDRV_8139=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8139),ON,OFF)
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_DRIVERS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_PCIE_DRIVERS=ON
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_PCIE_DRIVERS=OFF
-endif
-
-#### OPLK PCAP DAEMON ####
-
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_PCAP_DAEMON=ON \
-	-DCFG_OPLK_MN=$(OPENPOWERLINK_MN_ONOFF)
-endif
-
-#### OPLK DEMO APPS ####
-
-# See apps/common/cmake/configure-linux.cmake for available options list.
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_BUILD_KERNEL_STACK="Link to Application"
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_BUILD_KERNEL_STACK="Linux Userspace Daemon"
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_BUILD_KERNEL_STACK="Linux Kernel Module"
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB),y)
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_BUILD_KERNEL_STACK="Kernel stack on PCIe card"
-endif
-
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_DEMO_MN_CONSOLE=ON \
-	-DCFG_DEMO_MN_CONSOLE_USE_SYNCTHREAD=ON
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_DEMO_MN_CONSOLE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_DEMO_CN_CONSOLE=ON
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_DEMO_CN_CONSOLE=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
