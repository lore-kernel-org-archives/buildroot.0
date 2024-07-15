Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A02C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B5140648;
	Mon, 15 Jul 2024 10:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ija4Nai2TH05; Mon, 15 Jul 2024 10:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9783A4062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9783A4062F;
	Mon, 15 Jul 2024 10:14:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C25E11BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FE4680D45
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyrpqH0gfZdY for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3023780DC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3023780DC3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29A0986C43; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 430edbdc8820087a31be9e1c0e8c922753d24021
X-Git-Newrev: 31d676229dff5134f3dda66d08a6ce409ab81e99
X-Patchwork-Hint: ignore
Message-Id: <20240715101424.29A0986C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: use bundled
 ffmpeg
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

commit: https://git.buildroot.net/buildroot/commit/?id=31d676229dff5134f3dda66d08a6ce409ab81e99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot has moved to a modern ffmpeg, and the version of Chromium
part of qtwebengine is not ready to work with this modern version of
ffmpeg. While Chromium has been updated upstream to support a more
recent ffmpeg, it requires the backport of too many patches, so let's
use the bundled ffmpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/Config.in       | 3 +--
 package/qt5/qt5webengine/qt5webengine.mk | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 67c843e5f6..57cbe301f0 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ffmpeg, libglib2, libvpx, qt5base-dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
@@ -40,7 +40,6 @@ config BR2_PACKAGE_QT5WEBENGINE
 	# flag (for 64-bits, it adds the -m64 flag).
 	# https://github.com/v8/v8/blob/5.6.326.55/gypfiles/toolchain.gypi#L1036-L1037
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64 # v8/chromium
-	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 56f951fdbe..bccd460aa7 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -70,7 +70,6 @@ QT5WEBENGINE_DEPENDENCIES += \
 	host-python3 \
 	host-webp \
 	host-zlib \
-	ffmpeg \
 	freetype \
 	jpeg \
 	lcms2 \
@@ -85,7 +84,6 @@ QT5WEBENGINE_DEPENDENCIES += \
 
 QT5WEBENGINE_CONF_OPTS += \
 	-webengine-embedded-build \
-	-webengine-ffmpeg \
 	-webengine-opus \
 	-webengine-webchannel \
 	-webengine-webp \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
