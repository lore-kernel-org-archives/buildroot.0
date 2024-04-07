Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E47CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA7682062;
	Sun,  7 Apr 2024 11:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lu2340Ov01V0; Sun,  7 Apr 2024 11:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EA9E8207F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EA9E8207F;
	Sun,  7 Apr 2024 11:46:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCC281BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A920260705
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2ahucmxLShl for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:46:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2AED60733
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2AED60733
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2AED60733
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:46:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE409A4C2DD2;
 Sun,  7 Apr 2024 13:44:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx5-000000005Wv-20cb;
 Sun, 07 Apr 2024 11:44:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:32 +0200
Message-Id: <20240407114445.683504-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490287;
 bh=dAQcqqAjEmAefc4n6OA8/Xt2RNNgxArmpy+UQKh4Zw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UeAl86KzWcWjIwhdZGErOwhjfifdn3mipkeayNkG5qtb20FxWqqzJD2M1WyMSfTtE
 bCGt7p9o1tjbrcu+WoIYcteknuxkb0iFNAvrn/SXBiq4c2EjtTG3XwTS3BVLIpHVhk
 NHlLBbuRGz9vr/8sHPlH9sTihz5Lv9J8PSAd6ohPq343iWTHVABgPZ/wbelJIdTRbN
 qITuxx2o4FvyA6CpCj37Hmk7ZYn6S7c3gKdMrWOhOyCaXF5oy/jIYYqSGNFVxCmre3
 QXNCwbRun7IUyw4nUFSNAFwY0btYh37VFGfLXBeRE0CUhVdvTvdTu7bmJ93VhlO2r1
 Ffel6s6KDkQqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=UeAl86Kz
Subject: [Buildroot] [PATCH v2 07/20] package/kodi: bump version to
 21.0-Omega
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added new dependency to libdisplay-info for gbm support:
https://github.com/xbmc/xbmc/commit/ce9626479c1792210c7b7cc02c7dc4f819ace509

Added new required dependency to tinyxml2:
https://github.com/xbmc/xbmc/commit/9e983ed0449aaf3007d8bfa3261056b120d84188
Please note that parts of kodi still use tinyxml so both dependencies
are needed.

Added new required dependency to libudfread: Since upstream commit
https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e
kodi does not build anymore without libudfread.

Upstream removed the bundled groovy/apache commons binaries:
https://github.com/xbmc/xbmc/commit/d6bc920e056baad7782f47b86cba85d1336bb134

- JsonSchemaBuilder fixes:

Upstream moved CMakeLists.txt to src/ subfolder:
https://github.com/xbmc/xbmc/commit/7e87d98ca55c72fcbc9b8dadf2cb979a85732606

- TexturePacker fixes:

texturepacker now depends on c++17:
https://github.com/xbmc/xbmc/commit/54bd6d7ab552a4ddc04d2595826457d8bfa864d5

Since the host version of texturepacker is a build dependency of kodi:
https://github.com/xbmc/xbmc/blob/Omega/CMakeLists.txt#L187
https://github.com/xbmc/xbmc/blob/Omega/CMakeLists.txt#L472
we add a new dependency to BR2_HOST_GCC_AT_LEAST_9.

Upstream moved CMakeLists.txt to src/ subfolder
https://github.com/xbmc/xbmc/commit/e336a75f42d9c4efd3433f3fa6edd05309689deb

Due to this update we can remove all of our patches for texturepacker.

- Kodi fixes:

Set KODI_SOURCE_DIR variable to root directory of the source tarball.
When building natively, outside of a meta buildsystem like Buildroot,
kodi builds its own tools as part of its build process. TexturePacker
needs cmake modules available from the top of the Kodi source tree, a
source file in a sub-directory at the top-level source tree, which
itself needs includes from the same sub-dir. The Kodi build process sets
KODI_SOURCE_DIR so that TexturePacker can find those files.

In Buildroot, as we cross-build, we build the tools explicitly, without
using the Kodi build process, and thus we must set KODI_SOURCE_DIR to the
root directory of the source tarball. LibreELEC added something similar:
https://github.com/LibreELEC/LibreELEC.tv/commit/70abdd27a22b22547060fcb00a2c70ea61721465

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-jsonschemabuilder.mk                 |  6 ++---
 .../0001-texturepacker.patch                  | 16 -----------
 ...-fix-texture-packer-cmake-source-dir.patch | 27 -------------------
 .../kodi-texturepacker/kodi-texturepacker.mk  |  9 ++++---
 package/kodi/Config.in                        |  4 +++
 package/kodi/kodi.hash                        |  6 ++++-
 package/kodi/kodi.mk                          | 25 ++++++++++-------
 7 files changed, 33 insertions(+), 60 deletions(-)
 delete mode 100644 package/kodi-texturepacker/0001-texturepacker.patch
 delete mode 100644 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index a43ee57e00..ee94a52502 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,20 +6,20 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 20.5-Nexus
+KODI_JSONSCHEMABUILDER_VERSION = 21.0-Omega
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
 KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
 KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.md
-HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder
+HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder/src
 
 HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS = \
 	-DCMAKE_MODULE_PATH=$(@D)/project/cmake/modules
 
 define HOST_KODI_JSONSCHEMABUILDER_INSTALL_CMDS
 	$(INSTALL) -m 755 -D \
-		$(@D)/tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
+		$(@D)/tools/depends/native/JsonSchemaBuilder/src/JsonSchemaBuilder \
 		$(HOST_DIR)/bin/kodi-JsonSchemaBuilder
 endef
 
diff --git a/package/kodi-texturepacker/0001-texturepacker.patch b/package/kodi-texturepacker/0001-texturepacker.patch
deleted file mode 100644
index 8830b4c646..0000000000
--- a/package/kodi-texturepacker/0001-texturepacker.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix host compile
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd.org/tools/depends/native/TexturePacker/Makefile xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd/tools/depends/native/TexturePacker/Makefile
---- xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd.org/tools/depends/native/TexturePacker/Makefile	2015-01-25 09:00:48.000000000 +0100
-+++ xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd/tools/depends/native/TexturePacker/Makefile	2015-01-25 13:03:23.606140953 +0100
-@@ -36,7 +36,7 @@
- 	-rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
- 	cd $(PLATFORM); cp -a $(SOURCE)/* .
- 	cd $(PLATFORM); ./autogen.sh
--	cd $(PLATFORM); ./configure --prefix=$(PREFIX) $(EXTRA_CONFIGURE) EXTRA_DEFINES="$(NATIVE_ARCH_DEFINES)"
-+	cd $(PLATFORM); ./configure --prefix=$(PREFIX) EXTRA_DEFINES="$(NATIVE_ARCH_DEFINES)"
- 
- 
- $(APP): $(PLATFORM)
diff --git a/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch b/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
deleted file mode 100644
index ddd82439fe..0000000000
--- a/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Fix stand-alone build
-
-CMake Error at CMakeLists.txt:40 (add_executable):
-  Cannot find source file:
-
-    /home/bernd/buildroot/output/build/host-kodi-texturepacker-18.4-Leia/tools/depends/native/TexturePacker/xbmc/guilib/XBTF.cpp
-
-  Tried extensions .c .C .c++ .cc .cpp .cxx .cu .m .M .mm .h .hh .h++ .hm
-  .hpp .hxx .in .txx
-
-CMake Error at CMakeLists.txt:40 (add_executable):
-  No SOURCES given to target: TexturePacker
-
-Downloaded from
-https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/mediacenter/kodi/patches/kodi-100.25-hack-fix-texture-packer-cmake-source-dir.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -Naur a/tools/depends/native/TexturePacker/CMakeLists.txt b/tools/depends/native/TexturePacker/CMakeLists.txt
---- a/tools/depends/native/TexturePacker/CMakeLists.txt	2016-12-23 17:10:28.593185862 +0000
-+++ b/tools/depends/native/TexturePacker/CMakeLists.txt	2016-12-23 17:10:39.469253011 +0000
-@@ -1,3 +1,5 @@
-+set(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/../../../..)
-+
- list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
- 
- if(APPLE)
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index e640ab3a90..c3c06d0210 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,13 +6,13 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 20.5-Nexus
+KODI_TEXTUREPACKER_VERSION = 21.0-Omega
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
 KODI_TEXTUREPACKER_LICENSE = GPL-2.0
 KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.md
-HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
+HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker/src
 HOST_KODI_TEXTUREPACKER_DEPENDENCIES = \
 	host-giflib \
 	host-libjpeg \
@@ -21,7 +21,7 @@ HOST_KODI_TEXTUREPACKER_DEPENDENCIES = \
 
 HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
 	$(HOST_CXXFLAGS) \
-	-std=c++0x \
+	-std=c++17 \
 	-DTARGET_POSIX \
 	-DTARGET_LINUX \
 	-D_LINUX \
@@ -30,11 +30,12 @@ HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
 HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(HOST_KODI_TEXTUREPACKER_CXXFLAGS)" \
 	-DCMAKE_MODULE_PATH=$(@D)/cmake/modules \
+	-DKODI_SOURCE_DIR=$(@D) \
 	-Wno-dev
 
 define HOST_KODI_TEXTUREPACKER_INSTALL_CMDS
 	$(INSTALL) -m 755 -D \
-		$(@D)/tools/depends/native/TexturePacker/TexturePacker \
+		$(@D)/tools/depends/native/TexturePacker/src/TexturePacker \
 		$(HOST_DIR)/bin/kodi-TexturePacker
 endef
 
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8ad9fdae78..885550a542 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+	select BR2_PACKAGE_LIBDISPLAY_INFO
 
 comment "kodi needs udev support for gbm"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
@@ -56,6 +57,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_9 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_WCHAR
@@ -103,6 +105,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TINYXML
+	select BR2_PACKAGE_TINYXML2
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
 	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
@@ -162,6 +165,7 @@ config BR2_PACKAGE_KODI_EVENTCLIENTS
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
+	select BR2_PACKAGE_LIBUDFREAD
 	help
 	  Enable Blu-ray input support.
 	  Select this if you want to play back Blu-ray content.
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index b497ab7dca..15d1e471cd 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,9 @@
+# From https://github.com/xbmc/xbmc/blob/Omega/xbmc/interfaces/swig/CMakeLists.txt
+sha512  743698979c801f3cfb36545888b5303e1e25dae5692bb45cab7ebbe102a6eda31f09abc6978349ad90ecaf630416fc87eacba7781244855e7e771a3c44041fa0  apache-groovy-binary-4.0.16.zip
+sha512  8e7e62418a49ba810512c13a640a8bf35f878fcd54af32fdaab1111e37817f58b21b475980ba663fba4887e45ef8d88af8ff17796f20d202e929e8e2574546dc  commons-lang3-3.14.0-bin.tar.gz
+sha512  2e94877000dd270b69e2e8cbf49f258a90b4c628b6b6b0814e300a2f0e9c391f0816dceb0707e596ae3b7c9532f93e7a4917df47c77f44b3a810e14042ce5f3f  commons-text-1.11.0-bin.tar.gz
 # Locally computed
-sha256  9bf3257ebf251d20f276b7f90681985a270779150af2fb395d4b593c04002deb  kodi-20.5-Nexus.tar.gz
+sha256  7f54c1fd8456ac46221fbc85e447362bdc209163c6cb19fca98d106560071b7c  kodi-21.0-Omega.tar.gz
 sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
 sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
 sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 085169367d..b9931f9609 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,8 +6,8 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 20.5
-KODI_VERSION_NAME = Nexus
+KODI_VERSION_MAJOR = 21.0
+KODI_VERSION_NAME = Omega
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
@@ -45,6 +45,7 @@ KODI_DEPENDENCIES = \
 	libfribidi \
 	libplist \
 	libpng \
+	libudfread \
 	lzo \
 	openssl \
 	pcre \
@@ -54,6 +55,7 @@ KODI_DEPENDENCIES = \
 	sqlite \
 	taglib \
 	tinyxml \
+	tinyxml2 \
 	zlib
 
 # taken from tools/depends/target/*/*-VERSION
@@ -61,10 +63,21 @@ KODI_LIBDVDCSS_VERSION = 1.4.3-Next-Nexus-Alpha2-2
 KODI_LIBDVDNAV_VERSION = 6.1.1-Next-Nexus-Alpha2-2
 KODI_LIBDVDREAD_VERSION = 6.1.3-Next-Nexus-Alpha2-2
 KODI_EXTRA_DOWNLOADS += \
+	https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-4.0.16.zip \
+	https://dlcdn.apache.org/commons/lang/binaries/commons-lang3-3.14.0-bin.tar.gz \
+	https://dlcdn.apache.org/commons/text/binaries/commons-text-1.11.0-bin.tar.gz \
 	$(call github,xbmc,libdvdcss,$(KODI_LIBDVDCSS_VERSION))/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	$(call github,xbmc,libdvdnav,$(KODI_LIBDVDNAV_VERSION))/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	$(call github,xbmc,libdvdread,$(KODI_LIBDVDREAD_VERSION))/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
 
+define KODI_PROVIDE_JAVA_TARBALLS
+	mkdir -p $(@D)/buildroot-build/build/download
+	cp $(KODI_DL_DIR)/apache-groovy-binary-4.0.16.zip $(@D)/buildroot-build/build/download
+	cp $(KODI_DL_DIR)/commons-lang3-3.14.0-bin.tar.gz $(@D)/buildroot-build/build/download
+	cp $(KODI_DL_DIR)/commons-text-1.11.0-bin.tar.gz $(@D)/buildroot-build/build/download
+endef
+KODI_POST_EXTRACT_HOOKS = KODI_PROVIDE_JAVA_TARBALLS
+
 KODI_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
 	-DENABLE_APP_AUTONAME=OFF \
@@ -104,7 +117,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM),y)
 KODI_CORE_PLATFORM_NAME += gbm
-KODI_DEPENDENCIES += libgbm libinput libxkbcommon
+KODI_DEPENDENCIES += libdisplay-info libgbm libinput libxkbcommon
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
@@ -368,12 +381,6 @@ else
 KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
-KODI_DEPENDENCIES += libudfread
-else
-KODI_CONF_OPTS += -DENABLE_INTERNAL_UDFREAD=OFF
-endif
-
 # Remove versioncheck addon, updating Kodi is done by building a new
 # buildroot image.
 KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
