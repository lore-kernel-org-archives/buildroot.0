Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CD8C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 18:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C65E380EEB;
	Sun,  5 Jul 2026 18:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiHWHp63TcOI; Sun,  5 Jul 2026 18:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04058102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783275621;
	bh=oYTzLhyi7Q32BVOmPveFQY8+nZDk60D9uV0B4+soVps=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p+cDeQJgePUflcxXX+Y200JyiQ1HqEzLLG8sC/VqS/o+axsW8+wxN91LvFv+873oU
	 jgJDTUCdFDmkkDHUOrd8O1tW19LHY1T7/jgt4hJKRIEIRk0HajxpxyIVG3qr5mqkjo
	 g0XJgz4o4NQUF6OZGYziR42lXcHtOk1TSXCdyJ7N721Nonichud3ptwJenM3fb9jZA
	 3kpeFvqecANlHQa8fcAfoZPCIT8bN/Uk7BD03Vc0OwLrh5kCnZP4iEzVdofNZgHN43
	 dLy/lHWLuI/4PcXhJdettcYyqnJYWB9gy3g6XZNMufO01eAFuKJD9OaQ3uojEf/EIv
	 v0IVngyLRNC2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04058102D;
	Sun,  5 Jul 2026 18:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 385E6316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29D8140372
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KYJ7VXyqygq for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 18:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D92F40317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D92F40317
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D92F40317
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:20:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 666A8A4C0569;
 Sun,  5 Jul 2026 20:20:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57400)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgRRx-000000005fC-01Pq;
 Sun, 05 Jul 2026 18:20:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  5 Jul 2026 20:20:16 +0200
Message-ID: <20260705182016.3258983-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783275617;
 bh=xVpip7HXoZhg9gBqu4xoNUx6VyLqIwnUgJKwYDhRM7s=;
 h=From:To:Cc:Subject:Date:From;
 b=dgPEbSs2lL5CCeQyYXdDgdZlmj6LVBSyohf8juBdKX0p4cdK5gdqybhFJn6dRKe6K
 K7gTK8yideZCBHpuSJ8KPKsSEdGlr9C1KpKxIV7L1PNnNvHv56faIrLScEEAjaukvX
 f6gS1gyFTGgiGwu3Y0cPmhPKMkFW9rLzr5gSjJAnupIdevoRL3U/P5RQZNBhg4m7bz
 lbaiy3Q2uG95VdJNq3ac+HY+L3a1tKAN/PvLJ1xfjq5N912sJGILRyHj44+q+sNmJa
 LgWgvKuCZCfUlK2p+riKUmIK1OUzzeAxAG5UtoqIfToTwm29hmQ0A5VudbQpD+eK76
 HQ5yn+XP1NB4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dgPEbSs2
Subject: [Buildroot] [PATCH 1/1] package/libva-intel-driver: bump version to
 2.4.5
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

https://github.com/irql-notlessorequal/intel-vaapi-driver/blob/2.4.5/NEWS

This bump follows
https://github.com/LibreELEC/LibreELEC.tv/commit/39d2ff612fce9bb57c43ac767df15052a896e9ed

"Intel archived intel/intel-vaapi-driver at 2.4.1 and advises forking.
 irql-notlessorequal/intel-vaapi-driver is the active continuation (119
 commits ahead, tagged releases, Chromium fixes), so track it at 2.4.5.
 [...]
 The fork renamed the wayland meson option, so switch with_wayland to
 with_wayland_drm in all DISPLAYSERVER branches. Also drop the dead
 01.org PKG_SITE."

Updated license file and hash due to upstream commit:
https://github.com/irql-notlessorequal/intel-vaapi-driver/commit/7343767d87926d519f528db88ba1edfb153d8289

Also switch build system to meson.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/aa9e83fb51fdc68dcd0b1f474739fcf40197f6e9

 package/libva-intel-driver/Config.in           |  2 +-
 .../libva-intel-driver/libva-intel-driver.hash |  6 ++----
 .../libva-intel-driver/libva-intel-driver.mk   | 18 ++++++++----------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index 53c5b366c3..a71a5a6b9a 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	help
 	  VA-API back-end driver for Intel graphics chips
 
-	  https://01.org/vaapi
+	  https://github.com/irql-notlessorequal/intel-vaapi-driver
 
 comment "libva intel driver needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 4bf827748f..459a8b80e2 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,3 @@
-# From https://github.com/intel/intel-vaapi-driver/releases
-sha1  c998e06f13238c6419bb38ede9a13e453312737b  intel-vaapi-driver-2.4.1.tar.bz2
 # Locally computed
-sha256  0081fce08eb3a83f7d99c3b853c8fdfa0af437b8f5b0fb7c66faeb83bcbe0c19  intel-vaapi-driver-2.4.1.tar.bz2
-sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
+sha256  f89f77bc46ec6f46392c1b90b9bf34d09f908bf33c9d16d385897b1fe282bacc  libva-intel-driver-2.4.5.tar.gz
+sha256  b3a55fe5734da7831d7b359e52f8f7026e05216d58479981407c184afb8b24f9  LICENSE
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index ad801dc957..1c23bf69f9 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,26 +4,24 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.4.1
-LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
-LIBVA_INTEL_DRIVER_SITE = \
-	https://github.com/intel/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
+LIBVA_INTEL_DRIVER_VERSION = 2.4.5
+LIBVA_INTEL_DRIVER_SITE = $(call github,irql-notlessorequal,intel-vaapi-driver,$(LIBVA_INTEL_DRIVER_VERSION))
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
+LIBVA_INTEL_DRIVER_LICENSE_FILES = LICENSE
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_INTEL_DRIVER_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
-LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-x11
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_x11=yes
 else
-LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-x11
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_x11=no
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_INTEL_DRIVER_DEPENDENCIES += wayland
-LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-wayland
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_wayland_drm=yes
 else
-LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-wayland
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_wayland_drm=no
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
