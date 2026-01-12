Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD72D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E88926158B;
	Mon, 12 Jan 2026 08:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reSsAdib9pL3; Mon, 12 Jan 2026 08:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF27B6155E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207064;
	bh=3UnhGquoIsJL4LKOOiRq6B8scyYiFt0foYhKHJDtfVI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XxgAGbVYBztFOs27bF2851vZqZXUqICerMAXrAfApkteO12xb0GJh2wLFKiUFUTaF
	 OqSILu0+9e7U+V3gxHGORlf3bRWg8kJGsd6+dFhM3YP8ODcAHtT4ql66DASG3g04Dq
	 7Zx/wfv4P6VH17KgktE8TgdAknqnjQNvdWzqAuTcmfnUAhEh2SxAmhbIuNKDRPBqum
	 1zI7dks457JcE7C1KYXYgj0b+8+f3BgQmu96iNZ6hrjAX4/vlf8wa1wHIuoeDzsoGg
	 PxqHu/g829RjD8JuhAz32jEAqCU5vcdCFQxzsiKNUL2aj1L8dEBL0CRI+NfpIf0LH9
	 LX3bb+9NAjI6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF27B6155E;
	Mon, 12 Jan 2026 08:37:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCA218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AB1C414C0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3wyD4DwIlkx for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41C3A413D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C3A413D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41C3A413D0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1AA64A4C3C5A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-1mSQ
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:32 +0100
Message-ID: <20260112082950.2528445-84-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206629;
 bh=TWbcS1/9I1IGdX5sxU42GXhnMWd3XWa9Zo9IWn76KI8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Fuu8iWrPeMmGmbEUeh9sE2Vvz5AjPVVo0Mbo18deLEbQ3h8VcLiq+xGF6Xp2tOxeP
 /uDpydq99ccUw/v/PVm1OZQB8hsc0zKprO6BRYGL4AlSrIugiCqQEAyAPsCU6i6Fi7
 WnhMsCx3Kyb8dds3TjtQNfjdJyHbe7blrc9JTYI2OqmuIwwSHQ8UH3hOlAVMilQlHm
 dIAgey1yMcXSo2prqMe9G2MzazUe8+Dd+hq2JVEyxVjdQ2Ju5P7DJvE5aYW7b//N67
 OwAYEYV7N7et2mxJC/Ms2vmZodGlfsjHi9UC0YD/KrurUfLEJTzuGMhonY9YvAGY5N
 ZdlfwffQLvF0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Fuu8iWrP
Subject: [Buildroot] [PATCH 084/102] package/x11r7/xapp_editres: bump
 version to 1.0.9
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

https://lists.x.org/archives/xorg-announce/2024-March/003469.html

Switched _SITE to URL mentioned in latest release notes.

Added optional dependency to xlib_libxkbfile which was introduced by
upstream commit:
https://gitlab.freedesktop.org/xorg/app/editres/-/commit/80959deec664cd80cd5dbf84af86b52ded4eaee0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_editres/xapp_editres.hash |  6 +++---
 package/x11r7/xapp_editres/xapp_editres.mk   | 11 +++++++++--
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_editres/xapp_editres.hash b/package/x11r7/xapp_editres/xapp_editres.hash
index a1a8ab9005..73f97fb32a 100644
--- a/package/x11r7/xapp_editres/xapp_editres.hash
+++ b/package/x11r7/xapp_editres/xapp_editres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003139.html
-sha256  83cf5dffb1883635fd9c6a8dc48ff9e560f6c6d8ce1a0e929d5f409cba18b6f9  editres-1.0.8.tar.xz
-sha512  9a007ed7a02abf61af8b65a163a7289a1e960db390db401bdfad162aa642e0eb887ecf85be14093efd8567c68f5e01450bb8321403a203a00065fa21985c7922  editres-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003469.html
+sha256  cdfc3f7a6f0ecea417af785b1f46469d9c21a3543a765480a3090fd65e3db3c6  editres-1.0.9.tar.xz
+sha512  b1abf32cad8f881b8b98c8b4a3280b09f581fc3a86188e86d5d435801676ec75377d8a636b9479a335c5c2321d358841f1194861913b2c17803758b626517230  editres-1.0.9.tar.xz
 # Locally computed
 sha256  b1049cf96db2c00428b8313541ab333ec4e06f102955f3edd44f88ec43b0acd6  COPYING
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index bd1bce732c..e8d6e008cb 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-XAPP_EDITRES_VERSION = 1.0.8
+XAPP_EDITRES_VERSION = 1.0.9
 XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.xz
-XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_EDITRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_EDITRES_LICENSE = MIT
 XAPP_EDITRES_LICENSE_FILES = COPYING
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 XAPP_EDITRES_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
+XAPP_EDITRES_CONF_OPTS += --with-xkb
+XAPP_EDITRES_DEPENDENCIES += xlib_libxkbfile
+else
+XAPP_EDITRES_CONF_OPTS += --without-xkb
+endif
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
