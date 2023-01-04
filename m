Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F365C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD1106107D;
	Wed,  4 Jan 2023 16:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD1106107D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEb6nX3KCdbY; Wed,  4 Jan 2023 16:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C3761081;
	Wed,  4 Jan 2023 16:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C3761081
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 303FD1BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A4FF40B7B
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A4FF40B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7d89DIaUo9m for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:25:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB6140B7F
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AB6140B7F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2896D8751A; Wed,  4 Jan 2023 16:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:21:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 917f05975f9c60eca92988ea9974de55a9e91e44
X-Git-Newrev: 43c833e6cb44d4ffe59629cd83344caa9f63a0c6
X-Patchwork-Hint: ignore
Message-Id: <20230104162551.2896D8751A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.16.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43c833e6cb44d4ffe59629cd83344caa9f63a0c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version includes support for setting proxy options and gamepad
support. Release notes:

  https://wpewebkit.org/release/cog-0.16.0.html

This imports a small patch to properly pick libdrm compiler flags,
fetched from the upstream repository.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...libdrm-dependency-when-protocols-are-used.patch | 36 +++++++++++++++++++++
 package/cog/cog.hash                               |  8 ++---
 package/cog/cog.mk                                 | 37 ++++++++++++----------
 3 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
new file mode 100644
index 0000000000..44e555c121
--- /dev/null
+++ b/package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
@@ -0,0 +1,36 @@
+From 9a1982c563e218b7695e6a174c8230d3b063eb27 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Thu, 6 Oct 2022 09:04:22 +0200
+Subject: [PATCH] wl: Fix libdrm dependency when protocols are used
+
+As the comment says, cog-platform-wl.c needs drm_fourcc.h to build
+properly when wayland_weston_direct_display is enabled.
+
+However, libdrm.pc doesn't specify "include/libdrm" as part of its
+includedir but whether in its cflags. So use the compile_args dep
+instead of includes to fix the build failure.
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+(cherry picked from commit 32c1d9533bcdc22cbc01d02bf2e6ac0d4bda2dc2)
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://github.com/Igalia/cog/pull/501]
+---
+ platform/wayland/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
+index f1e18ec..31e4460 100644
+--- a/platform/wayland/meson.build
++++ b/platform/wayland/meson.build
+@@ -67,7 +67,7 @@ if wayland_platform_weston_protocols.length() > 0
+ 
+     # The code uses definitions from the drm_fourcc.h header, but does not
+     # need to link the library; libdrm here is only a build-time dependency.
+-    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(includes: true)]
++    wayland_platform_dependencies += [dependency('libdrm').partial_dependency(compile_args: true)]
+ endif
+ 
+ 
+-- 
+2.38.0
+
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index aa128d73d8..a2c55c4b94 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.14.1.tar.xz.sums
-md5  69d72ac046a0fc485ea7b61b96e7e7fc  cog-0.14.1.tar.xz
-sha1  6236972b0ae0bce38a0a017610f161b349723862  cog-0.14.1.tar.xz
-sha256  fb91104e25e1dde27189c91c70acc356e387f47acebaa8997e01ce5879c3a600  cog-0.14.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.16.0.tar.xz.sums
+md5  2705472ea4f333290973722c0862b21d  cog-0.16.0.tar.xz
+sha1  ef16e5e3d91d0da056fe5e4f596c211af7453b4e  cog-0.16.0.tar.xz
+sha256  2956f719d36c9a6368f63901a0d1ceaf4d27f529f7df441b3748c36d72906fc6  cog-0.16.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 1f24bebee4..241c4e309c 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.14.1
+COG_VERSION = 0.16.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -12,37 +12,40 @@ COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
-	-DCOG_BUILD_PROGRAMS=ON \
-	-DCOG_PLATFORM_HEADLESS=ON \
-	-DINSTALL_MAN_PAGES=OFF \
-	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
-	-DUSE_SOUP2=ON
+	-Ddocumentation=false \
+	-Dmanpages=false \
+	-Dprograms=true \
+	-Dsoup2=enabled \
+	-Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
+	-Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
+
+COG_PLATFORMS_LIST = headless
 
 ifeq ($(BR2_PACKAGE_WESTON),y)
-COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=ON
+COG_CONF_OPTS += -Dwayland_weston_direct_display=true
 COG_DEPENDENCIES += weston
 else
-COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=OFF
+COG_CONF_OPTS += -Dwayland_weston_direct_display=false
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
+COG_PLATFORMS_LIST += wayland
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
-else
-COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
+COG_PLATFORMS_LIST += drm
 COG_DEPENDENCIES += libdrm libinput libgbm libegl udev
-else
-COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_USE_SYSTEM_DBUS),y)
-COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
+COG_CONF_OPTS += -Dcog_dbus_control=system
 else
-COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
+COG_CONF_OPTS += -Dcog_dbus_control=user
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+COG_DEPENDENCIES += libmanette
 endif
 
-$(eval $(cmake-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
