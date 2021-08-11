Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8365C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:12:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7376D60F38
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7376D60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4713C4022F;
	Wed, 11 Aug 2021 11:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-l66J5sjGaP; Wed, 11 Aug 2021 11:12:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 871F1404DB;
	Wed, 11 Aug 2021 11:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12E1E1BF30A
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0212B82EFC
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iYyq0SGewuL for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 11:12:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6DC282F4A
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=5icD1lgbDDXc1twzyZ57E3jNlDx4hBZM/8ZymzjL71g=; 
 b=ee4Y0u/XjXJVq4xa25oC4ydgJELahJnGIIEmvOq2Tqo1Z86Uv3IhL19Vh0E5w/GytNgeTH4Vc4dZFycnU+mQPgFBNhNTzce0aYp3e36ss6wy7GKx48jif9pGKqq/ZF5qF8ervkQd0zEOEuVc5LMSexWISk8cJvAsyWC5nZuiwMP3tLuZuSVlkgysyh8xx1zFkcJ4GeFeypNeGz1tH9hNmJYo+9wwXZtBZudSZj1RYx7nLB+l00gPWyRIjLJACi3dl3L8XFVI0PN3AiNmU+e8SeDxgVzxKgH4bOSGA4UK5y8dhe/gcU/mJzkMS6nKRlUmI8Qrfvv+Ez8jtIFKq0kTVQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mDm9h-0007ZZ-2p; Wed, 11 Aug 2021 13:12:17 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 8bc381af;
 Wed, 11 Aug 2021 11:11:58 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 14:11:57 +0300
Message-Id: <20210811111158.2577789-3-aperez@igalia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811111158.2577789-1-aperez@igalia.com>
References: <20210811111158.2577789-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/wlroots: bump to version 0.14.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update to version 0.14.1, and adapt to upstream changes:

- seatd/libseat is now used unconditionally, the logind/elogind build
  options have been removed (which can be used through seatd, no
  functionality is lost).
- Now wlroots includes a software-based renderer (which uses pixman),
  and the OpenGL ES one is optional. For now it is left always enabled
  (as it was before) but this could be changed in the future.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wlroots/Config.in    |  1 +
 package/wlroots/wlroots.hash |  4 ++--
 package/wlroots/wlroots.mk   | 19 +++----------------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 41f8986772..8d485992f5 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_WLROOTS
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_SEATD
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 024ea93cae..fdebe1ef68 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,5 +1,5 @@
-# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.13.0/wlroots-0.13.0.tar.gz.sig
-sha256  f6bea37fd4a6f5e5f552b83d61adae8c73e64b0bcb9ae0ab464ebcd9309d3cf3  wlroots-0.13.0.tar.gz
+# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.14.1/wlroots-0.14.1.tar.gz.sig
+sha256  448a83d579ac280357c8a4e902b9477bacbab81cc4d9c140e443642d458869db  wlroots-0.14.1.tar.gz
 
 # Hashes for license files:
 sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 0696d037df..89d5024176 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.13.0
+WLROOTS_VERSION = 0.14.1
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -18,11 +18,12 @@ WLROOTS_DEPENDENCIES = \
 	libegl \
 	libgles \
 	pixman \
+	seatd \
 	udev \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Drenderers=gles2
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
 WLROOTS_DEPENDENCIES += ffmpeg
@@ -32,13 +33,6 @@ ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WLROOTS_DEPENDENCIES += libpng
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
-WLROOTS_CONF_OPTS += -Dlogind=enabled -Dlogind-provider=systemd
-WLROOTS_DEPENDENCIES += systemd
-else
-WLROOTS_CONF_OPTS += -Dlogind=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 WLROOTS_CONF_OPTS += -Dx11-backend=enabled -Dxwayland=enabled
 WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
@@ -46,11 +40,4 @@ else
 WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SEATD),y)
-WLROOTS_CONF_OPTS += -Dlibseat=enabled
-WLROOTS_DEPENDENCIES += seatd
-else
-WLROOTS_CONF_OPTS += -Dlibseat=disabled
-endif
-
 $(eval $(meson-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
