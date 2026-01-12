Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA1AD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2186961546;
	Mon, 12 Jan 2026 08:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rL8vvTTQ509Q; Mon, 12 Jan 2026 08:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1045C6154A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207232;
	bh=ZRN46JOEf51g1/ljbC6Am8zSttITi7FI3cFnD+Ll6X8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBujK/Zr1e9XKKE3GCZVDJ2lYjG128H4sd3JGKoo7oZx0w+9qJXdvqpwG4wyls28L
	 ZJB8rLsSukU+j2RfgMT9dDuYXWr/YukBwU1+XfzztUUFAcX/hyW2yzQ5d9y8meHZxR
	 enwZUsST8nQpM0/I2ADgXrjYg4YCD2I/KClJNDAaTVhEQv4xB5GNHRNJ2DlrlVNGkD
	 U/qxBOCSCJo6Q8t91D6kcBra8XTXrQUMLaIo0wMQDtWRRHxMPcdCsQSpw34QtpWax8
	 JMJQA0zhNVe13ofgAVEyO1KAa9sITMQKHkoTVXO19LfafvNabm17iBdSjehwKhrkXw
	 Bnq5z0Xq1c+1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1045C6154A;
	Mon, 12 Jan 2026 08:40:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 795B618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4200E41584
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwTrHM9ns1s1 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09F714157E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F714157E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09F714157E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20407A4C3E2B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-2mmn
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:50 +0100
Message-ID: <20260112082950.2528445-102-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206640;
 bh=b9h2Mp9cw5NtFVUWUYCz56OkXJM3ocQtDcwxS/dmJi4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=XW+TI+KnDuNLm9RDqhhZkRTJyOfhflbWpBCpOBryWoWHYh2xq1bLOPp8EI2VFLeui
 798RXt1TgPDjf/7pgu4QKfRPxWfgsgU+9AEBU1sdnNbKBWAQOoXqGrqKZ8S0HDK7Hp
 UDN61ztEEJk65d6A/+LdJjpnR3Z7KxaZPArwR0sEbD8Wn9ZhGkuhcoohM5DPYhB+TB
 nBs3hMBAsX7xnfNpPfb6aK6TV0wzJqbvBcKPj6A5Uqa+NN/MM6EMOEazLjHSI3jJp2
 EmLHw5NcpH7VYoN4nM7g7liwNgpPZPyvrGI7uxYXOQTcdFjAWTam7pOZ72ZywKG6Fz
 3J4gLhihU/6Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XW+TI+Kn
Subject: [Buildroot] [PATCH 102/102] package/x11r7/xdriver_xf86-input-mouse:
 remove package
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

In version 2.0.0 Linux support was removed:
https://lists.x.org/archives/xorg-announce/2025-August/003624.html

"This mouse driver is primarily used with BSD, GNU Hurd, illumos, &
 Solaris systems. Linux systems should instead use either xf86-input-
 libinput or xf86-input-evdev.

 While versions 1.9.5 and earlier had rudimentary support for Linux as
 well, that has been removed in this release."

Alternative packages can not be selected due to udev dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 ++
 package/x11r7/Config.in                       |  1 -
 .../0001-build-get-rid-of-sdkdir.patch        | 81 -------------------
 .../x11r7/xdriver_xf86-input-mouse/Config.in  |  5 --
 .../xdriver_xf86-input-mouse.hash             |  5 --
 .../xdriver_xf86-input-mouse.mk               | 15 ----
 7 files changed, 6 insertions(+), 108 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
 delete mode 100644 package/x11r7/xdriver_xf86-input-mouse/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
 delete mode 100644 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 2a09961f74..2ef37e063a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1041,7 +1041,6 @@ package/x11r7/xcursor-transparent-theme/0001-fix-symlink.patch lib_patch.Upstrea
 package/x11r7/xdriver_xf86-input-evdev/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-input-libinput/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-fbturbo/0001-sunxi_x_g2d-drop-unused-dri2-include.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-fbturbo/0002-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ce7a475838..c3d30d1f5f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
+	bool "xf86-input-mouse removed"
+	select BR2_LEGACY
+	help
+	  Linux support was removed upstream.
+
 config BR2_PACKAGE_HOST_JSMIN
 	bool "host-jsmin has been removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 0002dfe598..efa25988c9 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -152,7 +152,6 @@ if BR2_PACKAGE_XORG7
 		source "package/x11r7/xdriver_xf86-input-evdev/Config.in"
 		source "package/x11r7/xdriver_xf86-input-joystick/Config.in"
 		source "package/x11r7/xdriver_xf86-input-libinput/Config.in"
-		source "package/x11r7/xdriver_xf86-input-mouse/Config.in"
 		source "package/x11r7/xdriver_xf86-input-synaptics/Config.in"
 		source "package/x11r7/xdriver_xf86-input-tslib/Config.in"
 		source "package/x11r7/xdriver_xf86-input-vmmouse/Config.in"
diff --git a/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
deleted file mode 100644
index d5f97f98c1..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From aef3d9bca4d77db833f71d50b1c84b16c69d7deb Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 23 Oct 2016 22:53:21 +0200
-Subject: [PATCH] build: get rid of sdkdir
-
-Use of sdkdir causes problems during cross-compilation, where the full
-path is then appended to the DESTDIR, leading to host paths being
-appended in the target:
-    https://bugs.busybox.net/show_bug.cgi?id=8696
-
-Other drivers (e.g. keyboard) got rid of sdkdir. Do the same.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- Makefile.am         |  3 ---
- configure.ac        | 10 ----------
- include/Makefile.am |  4 +++-
- xorg-mouse.pc.in    |  3 +--
- 4 files changed, 4 insertions(+), 16 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7142485..efe66cb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -34,9 +34,6 @@ ChangeLog:
- 
- dist-hook: ChangeLog INSTALL
- 
--# Provide an sdk location that is writable by this module
--DISTCHECK_CONFIGURE_FLAGS = --with-sdkdir='$${includedir}/xorg'
--
- if LINT
- # Check source code with tools like lint & sparse
- lint:
-diff --git a/configure.ac b/configure.ac
-index 15d9047..515681d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -60,16 +60,6 @@ AC_ARG_WITH(xorg-module-dir,
- inputdir=${moduledir}/input
- AC_SUBST(inputdir)
- 
--# X Server SDK location is required to install xf86-mouse-properties.h
--# This location is also relayed in the xorg-mouse.pc file
--sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
--
--# Workaround overriding sdkdir to be able to create a tarball when user has no
--# write permission in sdkdir. See DISTCHECK_CONFIGURE_FLAGS in Makefile.am
--AC_ARG_WITH([sdkdir], [], [sdkdir="$withval"])
--AC_SUBST([sdkdir])
--
--
- # Work out which OS mouse driver we need to build
- case $host_os in
-   linux*)
-diff --git a/include/Makefile.am b/include/Makefile.am
-index 27ce0fb..2b85e4e 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -1 +1,3 @@
--sdk_HEADERS = xf86-mouse-properties.h
-+# Location formerly known as 'sdkdir'
-+xorgincludedir = $(includedir)/xorg
-+xorginclude_HEADERS = xf86-mouse-properties.h
-diff --git a/xorg-mouse.pc.in b/xorg-mouse.pc.in
-index 57df596..8355e61 100644
---- a/xorg-mouse.pc.in
-+++ b/xorg-mouse.pc.in
-@@ -1,6 +1,7 @@ prefix=@prefix@
--sdkdir=@sdkdir@
-+prefix=@prefix@
-+includedir=@includedir@
- 
- Name: xorg-mouse
- Description: X.Org mouse input driver for non-evdev OS'es
- Version: @PACKAGE_VERSION@
--Cflags: -I${sdkdir}
-+Cflags: -I${includedir}/xorg
--- 
-2.7.4
-
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
deleted file mode 100644
index efa181e556..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
-	bool "xf86-input-mouse"
-	select BR2_PACKAGE_XORGPROTO
-	help
-	  X.Org driver for mouse input devices
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
deleted file mode 100644
index d654c362a9..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://lists.x.org/archives/xorg-announce/2023-May/003392.html
-sha256  4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968  xf86-input-mouse-1.9.5.tar.xz
-sha512  ed9bd9cb9a05dac0ff1bfb4e4704cb2e94117afb400aa9e0b7ccdbb102bc6db1b0d3af7cb6f99d0892f8fc306f1643286291c0fa7114af8e65864412bd6c1afa  xf86-input-mouse-1.9.5.tar.xz
-# Locally computed
-sha256  5b066654bdb61a1ef41f38cceda752897bbddb6e60e20f5889cab436a9b7b813  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
deleted file mode 100644
index 25e25ab93d..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-mouse
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.5
-XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.xz
-XDRIVER_XF86_INPUT_MOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
-XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
-XDRIVER_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
-XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = YES
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
