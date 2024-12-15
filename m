Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266FEC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A369A42A3A;
	Fri, 28 Feb 2025 16:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FPrmCkoiQO3; Fri, 28 Feb 2025 16:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B793427F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B793427F9;
	Fri, 28 Feb 2025 16:32:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17D42711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 030286F672
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRl3x4ynFZJN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1416160736
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1416160736
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1048885E77; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 17:51:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6744f0e9368d940f22a58b5981d9659e1a63f206
X-Git-Newrev: 865457e76201f663cf81b09486485fbee961423d
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.1048885E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: disable
 libdrm usage when not available
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

commit: https://git.buildroot.net/buildroot/commit/?id=865457e76201f663cf81b09486485fbee961423d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes build error

-- Could NOT find LibDRM (missing: LibDRM_INCLUDE_DIR LibDRM_LIBRARY)
CMake Error at Source/cmake/OptionsGTK.cmake:320 (message):
  libdrm is required for USE_LIBDRM
Call Stack (most recent call first):
  Source/cmake/WebKitCommon.cmake:237 (include)
  CMakeLists.txt:21 (include)

with this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WEBKITGTK=y

due to libdrm being enabled by default:
https://github.com/WebKit/WebKit/blob/f736325e66bfa8e85f85387299448476f3e1fb3c/Source/cmake/OptionsGTK.cmake#L59

This is a port of buildroot commit 65f8174648a3df922892cfac1ad15279d1bffde3
for the wpewebkit package, quoting its commit message:

    Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
    libdrm package has not been selected.

    WPE WebKit can be built without libdrm support, and it will still work
    with backends that use other platform-specific methods to handle
    graphics buffers and/or presenting content onto an output. For example
    this is the case with wpebackend-rdk configured to use rpi-userland,
    which uses dispmanx to produce the output instead of DRM/KMS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 19740b3b4e..9328327ac2 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -92,6 +92,13 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_LIBBACKTRACE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_LIBDRM=ON
+WEBKITGTK_DEPENDENCIES += libdrm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_LIBDRM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBJXL),y)
 WEBKITGTK_CONF_OPTS += -DUSE_JPEGXL=ON
 WEBKITGTK_DEPENDENCIES += libjxl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
