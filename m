Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC74F36C49
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 07:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2EDD61070;
	Mon, 20 Apr 2026 07:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyQfvY7z0X3P; Mon, 20 Apr 2026 07:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 706526106B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776671884;
	bh=3Oroe9XLPTqrz/OUZxmKhQeTM9Yj+N12dji674HYm2I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLSJ7n59CVhWyk2G6LBEeL07HUNA/OxnKt1pA4zmGEB21ryMQUokIicv2TErIWPK4
	 I0+kUCWLmqzEqhxco60WDFwaTo+6rKLXEaCAD4h6r8jO9QUlkIrN1MXLl/Xw9FnQ/1
	 PNG3XFXrcjVd3Q5pk7RTprYD8KqPPXjbjHQLveMSz0Nqud5rXqyN0/SUimg/Wy/wFN
	 gjCQwFjZFwQlIpgCZKxqlfxJ6fjA1KjJHSb5d9nHhjuZk1Jq63owAQz05I2ZPccrcs
	 fF8rpllxSyOUlSFLQ57LSLWHG9chJBbFBWfnkR1OGezfCeVwXBxvLXDEoPwBK5jKhi
	 ojdQjadf4EtkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 706526106B;
	Mon, 20 Apr 2026 07:58:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8FA424D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 867F04010D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIKHOP3DL-bT for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 07:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E82C3400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E82C3400DA
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E82C3400DA
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:57:59 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wEjW0-000qws-H2; Mon, 20 Apr 2026 09:57:56 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 05b13466;
 Mon, 20 Apr 2026 07:57:53 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 20 Apr 2026 10:57:50 +0300
Message-ID: <20260420075753.1967051-2-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420075753.1967051-1-aperez@igalia.com>
References: <20260420075753.1967051-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8QGxf6ezuH+LeuJ2WJ7mQaHC5NC+6LiuksZ0yBzf/OE=; b=SxjMY7qrivLmT8drgiwjxL47lw
 CfyAII5OiHK+syq56VXt2QJ1zgM/v4YyB5WAaYGyJCstqlPih3AhPjkZ+ASQc3QVXmdWoAS9V2Dht
 9cQMDlwPiyRRZSwFVlJAFC1tVTr2HXi7YKO2xhbipqYisewpvHj8BXfAFuY++soj3ob/sg9h/Ls3a
 89HjJUGEaZSk2SoJn5Dt7boV1kFU5b/GI+/oHg/UC+CQyBPsAqWXAdPqyrHCptCUUpdTjsEFhmByo
 HlN5t8UT/J/YSjwKwsYIeTJ/6hq1gvONPIoZsmCH/d1AR+AO44NN5k29e3L1eO+eQzTMu6D6rNQYc
 1DvY4Vpw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=SxjMY7qr
Subject: [Buildroot] [PATCH 1/2] package/wlroots: bump version to 0.20.0
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

While at it, drop the two patches, as they are part of this version.
Release notes:

  https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...ibinput-fix-build-with-libinput-1.31.patch | 51 -------------------
 package/wlroots/0002-xcursor.patch            | 33 ------------
 package/wlroots/wlroots.hash                  |  4 +-
 package/wlroots/wlroots.mk                    |  4 +-
 4 files changed, 4 insertions(+), 88 deletions(-)
 delete mode 100644 package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch
 delete mode 100644 package/wlroots/0002-xcursor.patch

diff --git a/package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch b/package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch
deleted file mode 100644
index c5ef11ecf0..0000000000
--- a/package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c1452d88114710f5772662b1d8efb9c71edaa34c Mon Sep 17 00:00:00 2001
-From: Aleksei Bavshin <alebastr89@gmail.com>
-Date: Sat, 7 Feb 2026 17:48:16 -0800
-Subject: [PATCH] backend/libinput: fix build with libinput 1.31
-
-Upstream: https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/c1452d88114710f5772662b1d8efb9c71edaa34c
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- backend/libinput/meson.build | 4 ++++
- backend/libinput/switch.c    | 5 +++++
- 2 files changed, 9 insertions(+)
-
-diff --git a/backend/libinput/meson.build b/backend/libinput/meson.build
-index c244eb77a..091b0e0eb 100644
---- a/backend/libinput/meson.build
-+++ b/backend/libinput/meson.build
-@@ -29,3 +29,7 @@ features += { 'libinput-backend': true }
- wlr_deps += libinput
- 
- internal_config.set10('HAVE_LIBINPUT_BUSTYPE', libinput.version().version_compare('>=1.26.0'))
-+internal_config.set10(
-+	'HAVE_LIBINPUT_SWITCH_KEYPAD_SLIDE',
-+	libinput.version().version_compare('>=1.30.901')
-+)
-diff --git a/backend/libinput/switch.c b/backend/libinput/switch.c
-index abeec86d7..9dde3c9cb 100644
---- a/backend/libinput/switch.c
-+++ b/backend/libinput/switch.c
-@@ -2,6 +2,7 @@
- #include <libinput.h>
- #include <wlr/interfaces/wlr_switch.h>
- #include "backend/libinput.h"
-+#include "config.h"
- 
- const struct wlr_switch_impl libinput_switch_impl = {
- 	.name = "libinput-switch",
-@@ -36,6 +37,10 @@ void handle_switch_toggle(struct libinput_event *event,
- 	case LIBINPUT_SWITCH_TABLET_MODE:
- 		wlr_event.switch_type = WLR_SWITCH_TYPE_TABLET_MODE;
- 		break;
-+#if HAVE_LIBINPUT_SWITCH_KEYPAD_SLIDE
-+	case LIBINPUT_SWITCH_KEYPAD_SLIDE:
-+		return;
-+#endif
- 	}
- 	switch (libinput_event_switch_get_switch_state(sevent)) {
- 	case LIBINPUT_SWITCH_STATE_OFF:
--- 
-GitLab
-
diff --git a/package/wlroots/0002-xcursor.patch b/package/wlroots/0002-xcursor.patch
deleted file mode 100644
index d57980fa39..0000000000
--- a/package/wlroots/0002-xcursor.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 47486545b196987f6f07fffe2929bba8f515b8e9 Mon Sep 17 00:00:00 2001
-From: Dale Turner <rxguyrx@gmail.com>
-Date: Wed, 3 Dec 2025 20:02:29 -0400
-Subject: [PATCH] =?UTF-8?q?Add=20"const"=20to=20eliminate=20"error:=20init?=
- =?UTF-8?q?ialization=20discards=20=E2=80=98const=E2=80=99=20qualifier=20f?=
- =?UTF-8?q?rom=20pointer=20target=20type"?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream: https://gitlab.freedesktop.org/wlroots/wlroots/-/commit/47486545b196987f6f07fffe2929bba8f515b8e9
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xcursor/xcursor.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xcursor/xcursor.c b/xcursor/xcursor.c
-index b5edb9de8..6627fb6cd 100644
---- a/xcursor/xcursor.c
-+++ b/xcursor/xcursor.c
-@@ -602,7 +602,7 @@ xcursor_build_fullname(const char *dir, const char *subdir, const char *file)
- static const char *
- xcursor_next_path(const char *path)
- {
--	char *colon = strchr(path, ':');
-+	const char *colon = strchr(path, ':');
- 
- 	if (!colon)
- 		return NULL;
--- 
-GitLab
-
diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 37ac909693..cd1b83e6e4 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.2/downloads/wlroots-0.19.2.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.0/downloads/wlroots-0.20.0.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  09a0a8d60104c8b0772fee4f60ba76a89aed7e59dff7659d00960fba06bdf267  wlroots-0.19.2.tar.gz
+sha256  33f52414e1b280839aeb70786f0ae2c9f54e27ad4873108d86270a2f89c4934b  wlroots-0.20.0.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index bd2e0eb561..5ce634d402 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.19.2
+WLROOTS_VERSION = 0.20.0
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
@@ -26,7 +26,7 @@ WLROOTS_DEPENDENCIES = \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Dlibliftoff=disabled
 
 WLROOTS_RENDERERS = gles2
 WLROOTS_BACKENDS = libinput drm
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
