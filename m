Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9B9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E87774F5D5;
	Fri, 28 Feb 2025 16:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYiApdmxvFGd; Fri, 28 Feb 2025 16:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8BA04F5DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8BA04F5DF;
	Fri, 28 Feb 2025 16:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A97068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29E0C41883
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiV1HThl_g5P for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48863424C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48863424C0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44CE5844AB; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 17:51:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f4a95e5c6e18413e913236f8e7d44cedecc2b2a
X-Git-Newrev: b98d283f86b2ad280e11f8d4b1f4559beb3698d9
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.44CE5844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libvpx: needs NPTL
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b98d283f86b2ad280e11f8d4b1f4559beb3698d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot commit 03ec8aad1e5f535b39224c3e37b82b7c39e781dd bumped
libvpx to version 1.15.0 which includes a commit adding a call to
pthread_setname_np:
https://chromium.googlesource.com/webm/libvpx/+/8cf26c12842b6de94539dc7389e33733ef3ba50b%5E%21/

Also add reverse dependencies when needed. This patch depends on the
webkit patches which are part of this series.

Fixes:
https://autobuild.buildroot.org/results/078340144f4b18b64a4ef9df1fba21564eba2562/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gstreamer1/gst1-plugins-good/Config.in | 2 +-
 package/libvpx/Config.in                       | 6 +++---
 package/qt5/qt5webengine/Config.in             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 3cf227b78d..6a738faa00 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -419,7 +419,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TWOLAME
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
 	select BR2_PACKAGE_LIBVPX
 	help
 	  VP8 plugin
diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 6b0400c0a2..f0fb69115e 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBVPX
 	bool "libvpx"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	help
 	  A high-quality, open video format that's freely available to
 	  everyone. Supports the VP8 and VP9 formats.
 
 	  http://webmproject.org
 
-comment "libvpx needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libvpx needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 28786bd2c8..6179591399 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -25,7 +25,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
