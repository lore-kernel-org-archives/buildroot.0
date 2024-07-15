Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A126BC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3B1405F9;
	Mon, 15 Jul 2024 10:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAJEK-UDsPz2; Mon, 15 Jul 2024 10:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D58C7405FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58C7405FA;
	Mon, 15 Jul 2024 10:15:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D212F1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A06A80D8D
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IWjlzGQeIGM for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5751B80D91
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5751B80D91
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D20686C44; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c998848b4c75601f8e55a886d79b4d51bb6f83f
X-Git-Newrev: 33b5412b7869bba90ffc63fa00da763a64c981a8
X-Patchwork-Hint: ignore
Message-Id: <20240715101424.4D20686C44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: use bundled re2
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

commit: https://git.buildroot.net/buildroot/commit/?id=33b5412b7869bba90ffc63fa00da763a64c981a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we use Buildroot's re2 package to build qt5webengine, there is an
issue at link time as the qt5webengine mistakenly uses the abseil-cpp
headers of its built-in copy rather than the ones of our abseil-cpp
library, built as a dependency of re2. However, we build our
abseil-cpp differently than the one bundled, and that causes some
conflicts.

Since teaching Chromium's build system to not use its own abseil-cpp
headers is an adventure we'd rather not engage into, we fallback to
use the bundled re2.

Therefore, we drop in Config.in all dependencies that were inherited
from Buildroot's re2 package. This warrants a few comments:

- BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS should be dropped because
  the list of architectures supported by our Buildroot abseil-cpp
  package may be different than the set of architectures supported by
  the bundled abseil-cpp in Chromium. In addition, the list of
  architectures in BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS is also a
  very limited subset of BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS, so
  this change will not expose the build of qt5webengine to additional
  architectures.

- We're dropping BR2_TOOLCHAIN_GCC_AT_LEAST_8 because it was inherited
  from re2. The main qt5 package anyway depends on gcc >= 5.x. We will
  figure out thanks to the autobuilders exactly which gcc version is
  needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/Config.in       | 9 ++-------
 package/qt5/qt5webengine/qt5webengine.mk | 2 --
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 57cbe301f0..28786bd2c8 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -9,13 +9,11 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
-	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, dynamic library, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ host gcc >= 4.9, threads, wchar"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -25,10 +23,8 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
 config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS # re2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
@@ -50,7 +46,6 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_MINIZIP
 	select BR2_PACKAGE_OPUS
-	select BR2_PACKAGE_RE2
 	select BR2_PACKAGE_SNAPPY
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index bccd460aa7..529a83df6c 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -78,7 +78,6 @@ QT5WEBENGINE_DEPENDENCIES += \
 	libvpx \
 	libxml2 \
 	libxslt \
-	re2 \
 	snappy \
 	webp
 
@@ -104,7 +103,6 @@ QT5WEBENGINE_CONF_OPTS += \
 	-feature-webengine-system-ninja \
 	-feature-webengine-system-nss \
 	-feature-webengine-system-png \
-	-feature-webengine-system-re2 \
 	-feature-webengine-system-snappy \
 	-feature-webengine-system-zlib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
