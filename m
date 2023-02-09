Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45C0C6379F
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 18:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDEEF403F9;
	Thu,  9 Feb 2023 18:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDEEF403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfDQzzELLD0x; Thu,  9 Feb 2023 18:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 036EA41047;
	Thu,  9 Feb 2023 18:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036EA41047
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB64A1BF379
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 18:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D61D8225A
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 18:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D61D8225A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLUFqixoVKS8 for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 18:52:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000C682258
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 000C682258
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 18:52:06 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id f10so1233526ilc.7
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 10:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1kUP9ydv8nzmCFJU+MG1GgF7TfFX3YERBVcp90oZpU=;
 b=hsv7yPy3h5ArRXiJbYzXDlg4FZfTSNbS1HxxYffJeYiykJaGK66QKfnNVpOnQ7vBil
 VRqvVZv2dVb2o/4xLz7KGilI3r3xDUPsEkMh6ZZFkA/lPKKaZ3aHc+R7OKC9DKmmrRpL
 FrGUAu6A4llushCWXmSjYyD9Ma5uRM6hI5aKRwHki/Pk2EYYuM7VHmPPHGYiH6RPQ/la
 zz6EbtYk9ta9ByoZRAUWoZ0YfEwu/eSnApPcEyOJGDTV4UpO1c6LivJMX9nkM1k/Rm41
 pR38esbOzaR+60gk830xsh4e++NT0Mq0HFToqLpAuYiLDgPl6tl2kb8wXxcxR9+5Q+Jc
 0aow==
X-Gm-Message-State: AO0yUKUBqNCowWH0r2PkycWNH0RF1fK7ejTPoeFStgjWz3Bce2viSNJb
 bAnIXXHwirvQDIirv08YgFH1px2DHJM=
X-Google-Smtp-Source: AK7set9POhN53R8sfdNZHkjtzDap3rGHklJ8aewpbq104J6gREw+BwQ/FvWr5xfJQtDlswSX5GOI3Q==
X-Received: by 2002:a92:2611:0:b0:311:e48:d64a with SMTP id
 n17-20020a922611000000b003110e48d64amr8423755ile.17.1675968725792; 
 Thu, 09 Feb 2023 10:52:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v26-20020a02cbba000000b0038a06a14b37sm666696jap.103.2023.02.09.10.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 10:52:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Feb 2023 11:52:03 -0700
Message-Id: <20230209185203.262016-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i1kUP9ydv8nzmCFJU+MG1GgF7TfFX3YERBVcp90oZpU=;
 b=n+f9OtXQXh9nWndew6/7tUzI+PH0vZWXWwxgZvQDNQ+TIqvfR6hT3kZ0OoN241zoj8
 xGoJ9iQWkFgUVWHVJbB4RVgW/15813p2sJcoBkGARBWmxWLoYXh27Uq8VvoLvcyToeIG
 cnhN7Qq2UAJzX7lNne0E1VgnhPc9PpAcFPKpCd00Hod12+RR8UnemWKceYHURpguAaUg
 SlqzPpJwa3YDz6IwOpfVaDUhTlmsf/laxMvd/99LAPIePZ+ZYyaU2hG1huOisHOoU+NC
 DXkPyAbUPWekHuupK24omOL4OtapT36eUB4ww59G1V7zLGVu1+RZDgEm9/3kQxkctS6Q
 67Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n+f9OtXQ
Subject: [Buildroot] [PATCH 1/1] package/pipewire-media-session: bump to
 version 0.4.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Explicitly set installed_tests to disabled.

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...remove-session-managers-option-check.patch | 36 -------------------
 .../pipewire-media-session.hash               |  2 +-
 .../pipewire-media-session.mk                 |  7 ++--
 3 files changed, 6 insertions(+), 39 deletions(-)
 delete mode 100644 package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch

diff --git a/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch b/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
deleted file mode 100644
index fc1d25edb3..0000000000
--- a/package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1923c97fbd0b3d8cacdb72386886f860c818bccf Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 10 Nov 2021 08:54:06 -0700
-Subject: [PATCH] meson: remove session-managers option check.
-
-This option no longer exists and causes a build failure if building
-with the systemd system service enabled.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/pipewire/media-session/-/merge_requests/24]
----
- systemd/system/meson.build | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/systemd/system/meson.build b/systemd/system/meson.build
-index ab0d49064..0e9885b0f 100644
---- a/systemd/system/meson.build
-+++ b/systemd/system/meson.build
-@@ -4,9 +4,7 @@ systemd_system_services_dir = systemd.get_variable(pkgconfig: 'systemdsystemunit
- systemd_config = configuration_data()
- systemd_config.set('PW_MEDIA_SESSION_BINARY', media_session_bindir / 'pipewire-media-session')
- 
--if get_option('session-managers').contains('media-session')
--  configure_file(input : 'pipewire-media-session.service.in',
--               output : 'pipewire-media-session.service',
--               configuration : systemd_config,
--               install_dir : systemd_system_services_dir)
--endif
-+configure_file(input : 'pipewire-media-session.service.in',
-+             output : 'pipewire-media-session.service',
-+             configuration : systemd_config,
-+             install_dir : systemd_system_services_dir)
--- 
-2.25.1
-
diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
index e335fd8913..e6b176eea2 100644
--- a/package/pipewire-media-session/pipewire-media-session.hash
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ebdf9f8e389896fdc4b58da5f909afce18441b4b53d5b4f2104dd53586ea8681  media-session-0.4.1.tar.bz2
+sha256  26e21852e0834a4418b40eae342ac5178dfe40342b9c5afe204d43ef8aafa14e  media-session-0.4.2.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
index d349fd7454..cc7317f925 100644
--- a/package/pipewire-media-session/pipewire-media-session.mk
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.1
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.2
 PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
 PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
 PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
@@ -17,7 +17,10 @@ PIPEWIRE_MEDIA_SESSION_DEPENDENCIES = \
 	pipewire \
 	$(TARGET_NLS_DEPENDENCIES)
 
-PIPEWIRE_MEDIA_SESSION_CONF_OPTS = -Ddocs=disabled -Dtests=disabled
+PIPEWIRE_MEDIA_SESSION_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dtests=disabled \
+	-Dinstalled_tests=disabled
 
 PIPEWIRE_MEDIA_SESSION_MODULE_SETS_LIST = alsa
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
