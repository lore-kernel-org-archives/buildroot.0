Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE62BC4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 16:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C92B41743;
	Mon, 11 Dec 2023 16:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C92B41743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Na0jWo5xjR8; Mon, 11 Dec 2023 16:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D0D541605;
	Mon, 11 Dec 2023 16:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0D541605
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63DFF1BF30C
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BC12613B2
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC12613B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9hj6QA1PhXn for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 16:45:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7B3E61396
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 16:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B3E61396
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ADAA240006;
 Mon, 11 Dec 2023 16:45:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rCjPT-00820k-22;
 Mon, 11 Dec 2023 17:45:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 17:45:29 +0100
Message-Id: <20231211164530.1914335-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/xwayland: libdrm is required,
 not optional
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
index 8550b61389..ac24fb94ec 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
