Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593E6C46CD2
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1716F40995;
	Fri,  5 Jan 2024 10:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1716F40995
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ezRqpK1pWqN; Fri,  5 Jan 2024 10:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393FC4098F;
	Fri,  5 Jan 2024 10:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393FC4098F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13A321BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7299042176
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7299042176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTWNqh02Syf5 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B4E7421BE
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4E7421BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B205843FD; Fri,  5 Jan 2024 10:56:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:51:58 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4a1dfdc494259e93b26af941a430e87f19369609
X-Git-Newrev: 6cf8ed02cd0e672074b7ec4cfe8e91d9679393c1
X-Patchwork-Hint: ignore
Message-Id: <20240105105642.7B205843FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/xwayland: libdrm
 is required, not optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cf8ed02cd0e672074b7ec4cfe8e91d9679393c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/476/47665d417dbae76bf27e805a5bcb1d8d6ab1f445/

xwayland unconditionally includes xf86drm.h, so libdrm is required and not
optional:

grep -rs xf86drm.h
glamor/glamor_egl.c:#include <xf86drm.h>
hw/xwayland/xwayland-glamor.h:#include <xf86drm.h>
hw/xwayland/xwayland-glamor-eglstream.c:#include <xf86drm.h>
hw/xwayland/xwayland-window.h:#include <xf86drm.h>
hw/xwayland/xwayland-drm-lease.c:#include <xf86drm.h>
hw/xwayland/xwayland-glamor-gbm.c:#include <xf86drm.h>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 797de283c7ae9b99e4d2366cf142b2bc8b2f2a84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xwayland/Config.in   |  1 +
 package/x11r7/xwayland/xwayland.mk | 13 ++++---------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 241ab73ad3..9ac1928f51 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_XWAYLAND
 	# them, otherwise, use the small libsha1 library.
 	depends on !BR2_RISCV_32 # xlib_libxshmfence
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
+	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 8eac602042..b0bff19be5 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -12,6 +12,7 @@ XWAYLAND_LICENSE_FILES = COPYING
 XWAYLAND_CPE_ID_VENDOR = x.org
 XWAYLAND_INSTALL_STAGING = YES
 XWAYLAND_DEPENDENCIES = \
+	libdrm \
 	pixman \
 	wayland \
 	wayland-protocols \
@@ -23,15 +24,16 @@ XWAYLAND_DEPENDENCIES = \
 	xlib_xtrans \
 	xorgproto
 XWAYLAND_CONF_OPTS = \
+	-Ddri3=true \
 	-Dxwayland_eglstream=false \
 	-Dxvfb=false \
 	-Ddefault_font_path=/usr/share/fonts/X11/ \
 	-Ddtrace=false \
 	-Ddocs=false
 
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY),yy)
+ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
 XWAYLAND_CONF_OPTS += -Dglamor=true
-XWAYLAND_DEPENDENCIES += libdrm libepoxy
+XWAYLAND_DEPENDENCIES += libepoxy
 else
 XWAYLAND_CONF_OPTS += -Dglamor=false
 endif
@@ -79,13 +81,6 @@ XWAYLAND_CONF_OPTS += -Dsha1=libsha1
 XWAYLAND_DEPENDENCIES += libsha1
 endif
 
-ifeq ($(BR2_PACKAGE_LIBDRM),y)
-XWAYLAND_CONF_OPTS += -Ddri3=true
-XWAYLAND_DEPENDENCIES +=  libdrm
-else
-XWAYLAND_CONF_OPTS += -Ddri3=false
-endif
-
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 XWAYLAND_CONF_OPTS += -Dlibunwind=true
 XWAYLAND_DEPENDENCIES += libunwind
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
