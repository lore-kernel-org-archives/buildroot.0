Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D1FC87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E07382334;
	Mon,  4 Aug 2025 18:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMJ246H_ufDw; Mon,  4 Aug 2025 18:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72CDE82325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CDE82325;
	Mon,  4 Aug 2025 18:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C9A9118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 030CC4089D
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTPb6Xz9QfgM for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:52:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7B0540D2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7B0540D2E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7B0540D2E
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:52:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9FAC6A4C2EF8
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:51:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60142)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uj0Hu-0000000010d-3Zzd
 for buildroot@buildroot.org; Mon, 04 Aug 2025 18:51:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Aug 2025 20:51:59 +0200
Message-Id: <20250804185159.3344978-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754333519;
 bh=BEEsnk7H/zzItzBkaZd0cYDN3ZrPem0z0TVVt+rkyLQ=;
 h=From:To:Subject:Date:From;
 b=mJwGOUZa2M7GT1RoK7ZIiE+2a3bzOoo2hIBkqCGRA+3lLT5j5F9A7GeR/T0SxK1Hb
 ky1KCbeeVPIcQVed9NLdfrDe1rogj8/2F9DCFDoomgl3Yee0KmgIK1Y/UGGl4kcfjN
 wZItIezO7Gowpark6KGWP7iPkNLdSP2ukANobF+UBKQa8HUEcmcqlS5LsGqFCckBQ+
 B0qTxbDFHpYfCh7NJTIFBtW6fM0oTGrKM2oALtU5MHTOad8WBKlFV0iHxvAIczzWN+
 8cZ9hpOd3l82awvWzijV8iGlCwonP/AmCi2Qdd44SnMzI5LKM/nFnBxgk0ViPdGtqg
 ez/f06QuD9tCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=mJwGOUZa
Subject: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.29.0
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

Release notes:
https://lists.freedesktop.org/archives/wayland-devel/2025-March/044026.html
https://lists.freedesktop.org/archives/wayland-devel/2025-April/044102.html
https://lore.freedesktop.org/wayland-devel/20250731092534.GA4100432@quokka/T/

Upstream changed mtdev into an optional dependency:
https://gitlab.freedesktop.org/libinput/libinput/-/commit/27f4b0ae744a2b2655755188f2224dd5f8c4bdeb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/Config.in     |  1 -
 package/libinput/libinput.hash |  2 +-
 package/libinput/libinput.mk   | 11 +++++++++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 1a8fcc7ed4..f5253dfec2 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBEVDEV
-	select BR2_PACKAGE_MTDEV
 	help
 	  libinput is a library to handle input devices in Wayland
 	  compositors and to provide a generic X.Org input driver.
diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f6ec570588..cd60e70c40 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8e823cc9f44c51b63ae90af0b73676ed82c0402cc1cbd4a59ac91b7bb6cad716  libinput-1.27.0.tar.bz2
+sha256  7160c16c409c9ea4f7da9d91923ae0a92df7f3453a292bf684bed071acd7b4ff  libinput-1.29.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ee15b781e6..93d8a51aca 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.27.0
+LIBINPUT_VERSION = 1.29.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
-LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
+LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
@@ -31,6 +31,13 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+ifeq ($(BR2_PACKAGE_MTDEV),y)
+LIBINPUT_CONF_OPTS += -Dmtdev=true
+LIBINPUT_DEPENDENCIES += mtdev
+else
+LIBINPUT_CONF_OPTS += -Dmtdev=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS),)
 LIBINPUT_PYTHON_TOOLS = libinput-analyze-per-slot-delta \
 	libinput-analyze-recording \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
