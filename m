Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1474AC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 10:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DAD160628;
	Sun, 16 Aug 2026 10:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3ckHzPfPZjG; Sun, 16 Aug 2026 10:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EAF86061E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786876245;
	bh=UEKj18MiKLpPLtf5cE67Vpuk9ztqTjcwNSV8GQwES2w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rLq3vXThT81ASoktFi0pPqiKq2zV5hJXi6nzVAvHz/ubbL7S8ONhtxocdgPpGfswR
	 rpnrZP5zBPra8L4nryGw3oOXCiluRxugzHgBo8LvxSAiGfXvBW1KBcrPy+3PZsfhRK
	 XD9tylTZnKoWc87NFYMJ5ffaxnQg2Cgq+ibuP/6fSNHTwNrITdddGUyBwuSmAZpHP8
	 Y+aiJIvCmlsKKIc0u+0sMp+iIHfLEGLfzSR9AgM2fWyjaXyMrUzo1esTBBSO6PGJeu
	 p2iZQ33+drJTmyTpo2thCV4NItHDxJpAEazQ2+KNNJUDLBf1AnVxOsL9CeyxkTZbmT
	 C8NOJ2Hu/7C/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EAF86061E;
	Sun, 16 Aug 2026 10:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4EEE333
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2AE1400AB
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOIwiPQkpbXa for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 10:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE26F4005C
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE26F4005C
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Hfopw3M+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE26F4005C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786876238;
 bh=omqluEog9fmDTVrtVQr4vWAcHrAqBFAMyF62ws2s3w0=;
 h=From:To:Cc:Subject:Date:From;
 b=Hfopw3M+MLIpcOsoCV1HXeRhU7RYWGkpURm8JQ9VEtOFvbZv1sFRzgzSbWDDFR8wK
 VG3itgdeX22HcaNX5F3lOLHErYUym3js4Yz8gVqO4gHZHjKEgMcxsnKuobRayIg+tg
 cHA3decFZxiOPoEIA7CXya0oDAVJad047wJlP9g00Rxma/B5mqNQ8eS+ggiwisbvhx
 Zhz2LfsIQw5qfV58X3hJUYOPpfrHztc24BcB7yGjUgNUkZud+cfZb1utzOqbZnt9f+
 Y1Jjn7KFh8EKLYFOSB92av6Ov6giEDen6FvHjk0TRr1kvA/EWVvGsx8gUTjXcVccx5
 L8fTWDAND0jJQ==
Received: from fli4l.lan.fli4l (p5b3a090d.dip0.t-ipconnect.de [91.58.9.13])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A38CA4C1176;
 Sun, 16 Aug 2026 12:30:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56640)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvY8T-000000007MY-1f84;
 Sun, 16 Aug 2026 10:30:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 16 Aug 2026 12:30:36 +0200
Message-ID: <20260816103037.1714478-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/2] package/mesa-libclc: new package
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab check-* pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b4ca952392ac2a057a101fe44058b9d53b437ff7

Building defconfig

BR2_PACKAGE_LLVM=y
BR2_PACKAGE_MESA_LIBCLC=y

stopped after reaching the 3h timeout on the Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2762788072

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/mesa-libclc/Config.in        | 13 +++++++++
 package/mesa-libclc/mesa-libclc.hash |  3 ++
 package/mesa-libclc/mesa-libclc.mk   | 42 ++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/mesa-libclc/Config.in
 create mode 100644 package/mesa-libclc/mesa-libclc.hash
 create mode 100644 package/mesa-libclc/mesa-libclc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d3..bcb1d54e04 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -469,6 +469,7 @@ F:	package/libzippp/
 F:	package/linux-firmware/
 F:	package/mc/
 F:	package/mesa3d/
+F:	package/mesa-libclc/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
 F:	package/mpg123/
diff --git a/package/Config.in b/package/Config.in
index 6058800682..5fdb3fdf25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2270,6 +2270,7 @@ endif
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
+	source "package/mesa-libclc/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
diff --git a/package/mesa-libclc/Config.in b/package/mesa-libclc/Config.in
new file mode 100644
index 0000000000..620bfb13e8
--- /dev/null
+++ b/package/mesa-libclc/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MESA_LIBCLC
+	bool "mesa-libclc"
+	depends on BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_LLVM_AMDGPU
+	select BR2_PACKAGE_LLVM_RTTI
+	help
+	  This is a fork of LLVM's libclc applying some fixes of a
+	  known good state to be used by Mesa3D.
+
+	  https://gitlab.freedesktop.org/karolherbst/mesa-libclc
+
+comment "mesa-libclc needs llvm"
+	depends on !BR2_PACKAGE_LLVM
diff --git a/package/mesa-libclc/mesa-libclc.hash b/package/mesa-libclc/mesa-libclc.hash
new file mode 100644
index 0000000000..a03274867e
--- /dev/null
+++ b/package/mesa-libclc/mesa-libclc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c77fc1104fbc2d254a48d2176a33cbec915dde9a48beda7a274f2e837b796386  mesa-libclc-22.1.8.3-git4.tar.gz
+sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/mesa-libclc/mesa-libclc.mk b/package/mesa-libclc/mesa-libclc.mk
new file mode 100644
index 0000000000..62d7fef69e
--- /dev/null
+++ b/package/mesa-libclc/mesa-libclc.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# mesa-libclc
+#
+################################################################################
+
+MESA_LIBCLC_VERSION = 22.1.8.3
+MESA_LIBCLC_SITE = https://gitlab.freedesktop.org/karolherbst/mesa-libclc.git
+MESA_LIBCLC_SITE_METHOD = git
+MESA_LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
+MESA_LIBCLC_LICENSE_FILES = LICENSE.TXT
+MESA_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
+HOST_MESA_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
+MESA_LIBCLC_INSTALL_STAGING = YES
+
+# CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
+# llvm-config provided values
+#
+# CMAKE_*_COMPILER has to be set to the host compiler to build a host
+# 'prepare_builtins' tool used during the build process
+#
+# The headers are installed in /usr/share and not /usr/include,
+# because they are needed at runtime on the target to build the OpenCL
+# kernels.
+MESA_LIBCLC_CONF_OPTS = \
+	-DCMAKE_SYSROOT="" \
+	-DCMAKE_C_COMPILER_FORCED=ON \
+	-DCMAKE_INSTALL_DATADIR="share" \
+	-DCMAKE_FIND_ROOT_PATH="$(HOST_DIR)" \
+	-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
+	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
+	-DLLVM_CMAKE_DIR="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR="$(HOST_DIR)/bin"
+
+HOST_MESA_LIBCLC_CONF_OPTS = \
+	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
