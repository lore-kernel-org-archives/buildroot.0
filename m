Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE810CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C74F2608AC;
	Thu,  4 Sep 2025 16:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSFdOzf82O-5; Thu,  4 Sep 2025 16:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B447860836
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B447860836;
	Thu,  4 Sep 2025 16:35:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB266106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1AAC40082
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2rUvEel8hTY for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4D74008A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F4D74008A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C49587EEF; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:15:11 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 11fd877d5d55334440f708f6e66dffcebdb7a885
X-Git-Newrev: 5cf3e448d1d352f5339a1f7e2c086fb4372f34ac
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.2C49587EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libsoxr: drop
 ffmpeg support
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7829626503082548449=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7829626503082548449==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5cf3e448d1d352f5339a1f7e2c086fb4372f34ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Having support for ffmpeg in libsoxr causes several circular
dependencies:

- pulseaudio -> libsoxr -> ffmpeg -> pulseaudio

  (This one was worked around in
  fecc337d21f337a30ef7f9f448683d99c01fc245 by dropping the ffmpeg ->
  pulseaudio dependency, but it's annoying as being able to output
  audio from ffmpeg into pulseaudio seems useful)

- libopenmpt -> pulseaudio -> libsoxr -> ffmpeg -> libopenmpt

  (This is one exists, and is fixed by this commit)

To fix both circular dependencies, we propose to drop the dependency
of libsoxr on ffmpeg, which is used to get some optimized FFT
implementation. While not being useless, this is the point where
breaking the dependency seems the most logical.

Neither Debian nor Fedora build libsoxr with ffmpeg support.

In order to achieve that, we add a new patch making the option
WITH_AVFFT actually effective. Since we no longer build against
ffmpeg, the previously added patch that was fixing the pkg-config file
is no longer needed.

Fixes:

  https://autobuild.buildroot.net/results/bbfce69f35cafd56245ebeae79086a8b64592a16/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4bf2a854f93c6d5d6b230a3bf2a661b1e9a9b245)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                |  1 -
 .../0001-Add-Libs.private-for-static-linking.patch | 43 ----------------------
 ...txt-allow-building-without-ffmpeg-support.patch | 33 +++++++++++++++++
 package/libsoxr/libsoxr.mk                         |  6 +--
 4 files changed, 34 insertions(+), 49 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bb1a305b30..2347c57ce5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -658,7 +658,6 @@ package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch lib_p
 package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch lib_patch.Upstream
 package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch lib_patch.Upstream
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch lib_patch.Upstream
-package/libsoxr/0001-Add-Libs.private-for-static-linking.patch lib_patch.Upstream
 package/libspatialindex/0001-allow-building-static-libs.patch lib_patch.Upstream
 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch lib_patch.Upstream
 package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch lib_patch.Upstream
diff --git a/package/libsoxr/0001-Add-Libs.private-for-static-linking.patch b/package/libsoxr/0001-Add-Libs.private-for-static-linking.patch
deleted file mode 100644
index be96c6e649..0000000000
--- a/package/libsoxr/0001-Add-Libs.private-for-static-linking.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7d2d1039f303b6322ecb72eebae39b699fd28d19 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 22 Feb 2019 01:31:11 +0100
-Subject: [PATCH] Add Libs.private in soxr.pc.in for static linking
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If libsoxr is build statically against libavutil other applications
-needs to know that they must link with `-lavutil` when building in a
-static context.
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- CMakeLists.txt | 1 +
- src/soxr.pc.in | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ee48f6c..714bd4d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -139,6 +139,7 @@ if (WITH_AVFFT OR (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm" AND SIMD32_FOUND AND WI
-   if (AVUTIL_FOUND)
-     include_directories (${AVUTIL_INCLUDE_DIRS})
-     set (LIBS ${LIBS} ${AVUTIL_LIBRARIES})
-+    set (PKGCONF_LIBS_PRIV ${PKGCONF_LIBS_PRIV} -lavutil)
-   endif ()
- endif ()
- 
-diff --git a/src/soxr.pc.in b/src/soxr.pc.in
-index 69d225b..6c530a6 100644
---- a/src/soxr.pc.in
-+++ b/src/soxr.pc.in
-@@ -2,4 +2,5 @@ Name: ${PROJECT_NAME}
- Description: ${DESCRIPTION_SUMMARY}
- Version: ${PROJECT_VERSION}
- Libs: -L${LIB_INSTALL_DIR} -l${PROJECT_NAME}
-+Libs.private: ${PKGCONF_LIBS_PRIV}
- Cflags: -I${INCLUDE_INSTALL_DIR}
--- 
-2.20.1
-
diff --git a/package/libsoxr/0001-CMakeLists.txt-allow-building-without-ffmpeg-support.patch b/package/libsoxr/0001-CMakeLists.txt-allow-building-without-ffmpeg-support.patch
new file mode 100644
index 0000000000..37c931f4f5
--- /dev/null
+++ b/package/libsoxr/0001-CMakeLists.txt-allow-building-without-ffmpeg-support.patch
@@ -0,0 +1,33 @@
+From 2592f0d38826e8db3603ce1535d82ab427ac73bc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 28 Aug 2025 18:11:13 +0200
+Subject: [PATCH] CMakeLists.txt: allow building without ffmpeg support
+
+The ffmpeg support is optional, but is automatically pulled in (if
+available) on ARM with SIMD, even when WITH_AVFFT is disabled.
+
+Instead, ensure WITH_AVFFT does its job, which is to allow disabling
+ffmpeg usage if not desired.
+
+Upstream: https://github.com/chirlu/soxr/pull/16
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ee48f6c..48f91f1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -134,7 +134,7 @@ if (WITH_AVFFT)
+   endif ()
+ endif ()
+ 
+-if (WITH_AVFFT OR (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm" AND SIMD32_FOUND AND WITH_CR32))
++if (WITH_AVFFT AND (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm" AND SIMD32_FOUND AND WITH_CR32))
+   find_package (LibAVUtil)
+   if (AVUTIL_FOUND)
+     include_directories (${AVUTIL_INCLUDE_DIRS})
+-- 
+2.50.1
+
diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index b34962c4ad..ace13c630b 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -10,7 +10,7 @@ LIBSOXR_SITE = http://downloads.sourceforge.net/project/soxr
 LIBSOXR_LICENSE = LGPL-2.1+
 LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
 LIBSOXR_INSTALL_STAGING = YES
-LIBSOXR_CONF_OPTS = -DWITH_OPENMP=OFF
+LIBSOXR_CONF_OPTS = -DWITH_OPENMP=OFF -DWITH_AVFFT=OFF
 
 ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
 LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=1
@@ -18,8 +18,4 @@ else
 LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=0
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG),y)
-LIBSOXR_DEPENDENCIES += ffmpeg
-endif
-
 $(eval $(cmake-package))

--===============7829626503082548449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7829626503082548449==--
