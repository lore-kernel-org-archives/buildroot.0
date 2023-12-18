Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14958C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEF43409FC;
	Mon, 18 Dec 2023 19:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEF43409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MEXb2AQ3Bbh5; Mon, 18 Dec 2023 19:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB00A4096D;
	Mon, 18 Dec 2023 19:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB00A4096D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA3821BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A045782215
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A045782215
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvHENPdnBGr1 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:54:11 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ED5382201
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED5382201
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d075392ff6so25426595ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702929250; x=1703534050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5hhOgWjjrXqhkTXjP692jmy7ZMr4TwtkVCzQdOuogkA=;
 b=ckRXEXxsgHs58kp2sCumLvnVVmYJWkKkv1R0Ro1HB/u1dX2KLhfsg+mlw85+pGCACG
 2+bUsglSZzyWoGyCY6FVXArzTIQlNcgqVyoMLPlssSg7FiVXrQtuuSo0BPBfN5BdW05k
 mm2IMzFiDZflNldqHY8JRGce+apT7m8Tydj1HTF0ZSa9XdJtDzQjHJHyznCKOqotPtN3
 TKNG8mBuAktefpMtRry6Xof1+6vlEXz3YOQ+vKaey4R4gBA4KtplKdhUJMUE1olLb3/P
 mn9D4AkcFefy+mEngPgKPyGgSstGbqp7WWnftX/9Ys2fL51ogVeG8EfXXAGmlVz/0Rkr
 +/Mg==
X-Gm-Message-State: AOJu0YyDltlwm5kKDmQFQ9t4/iuQbKHfsHAqI8kei20qShC+bG5kkGYA
 39KVg82keZ5trcrSAQxFWXwznWHGSgn1E7YGLwA=
X-Google-Smtp-Source: AGHT+IG6kPGmiiHMy2K6NFWrAza4bpOsUXE4UA8L97ryJGkPRPEWrL6Ew8R5HQ4tKyX0UkwynDN8hw==
X-Received: by 2002:a17:902:a511:b0:1d0:6ffd:6112 with SMTP id
 s17-20020a170902a51100b001d06ffd6112mr15379690plq.52.1702929250120; 
 Mon, 18 Dec 2023 11:54:10 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e80200b001acae9734c0sm2037283plg.266.2023.12.18.11.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:54:09 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:54:05 -0700
Message-ID: <20231218195406.553072-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218195406.553072-1-adam.duskett@amarulasolutions.com>
References: <20231218195406.553072-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702929250; x=1703534050;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hhOgWjjrXqhkTXjP692jmy7ZMr4TwtkVCzQdOuogkA=;
 b=IcuEW94w5GgSYMJibUzWxN29JY6f9BvHZ0HiAUHv9TAB/4s+cha9iVpDEpiapiryec
 sOwmdcVya8YsybpnQRG59uvxVyeZRYXt9CIjqCCD2brFS6gqZVhfr1yPC3OnQqGsq9DJ
 JkfHkhKtXHjz2Y6mwhw9kMolvAJgmIlgjeCZM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IcuEW94w
Subject: [Buildroot] [PATCH v3 2/3] package/zenity: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the ivi-homescreen File selector plugin

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Fix hash of COPYING

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/zenity/Config.in   | 31 +++++++++++++++++++++++++++++++
 package/zenity/zenity.hash |  3 +++
 package/zenity/zenity.mk   | 21 +++++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 package/zenity/Config.in
 create mode 100644 package/zenity/zenity.hash
 create mode 100644 package/zenity/zenity.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 519ad2984e..688142f398 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-sdk-bin/
 F:	package/itstool/
 F:	package/python-kmod/
 F:	package/python-versioneer/
+F:	package/zenity/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..6f6e2bb56d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -333,6 +333,7 @@ comment "Graphic applications"
 	source "package/swaybg/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
+	source "package/zenity/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
diff --git a/package/zenity/Config.in b/package/zenity/Config.in
new file mode 100644
index 0000000000..de018b4900
--- /dev/null
+++ b/package/zenity/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_ZENITY
+	bool "zenity"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
+	depends on BR2_USE_WCHAR # libgtk3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3
+	depends on BR2_USE_MMU # libgtk3
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || BR2_PACKAGE_HAS_LIBGL # libgtk3
+	select BR2_PACKAGE_LIBGTK3
+	help
+	  The GNOME port of the venerable 'dialog'
+	  program, which allows you to display dialog boxes from
+	  the command-line and shell scripts.
+
+	  https://github.com/GNOME/zenity
+
+comment "zenity needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "zenity needs an OpenGL or an OpenGL-EGL/wayland backend"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
+		!BR2_PACKAGE_HAS_LIBGL
diff --git a/package/zenity/zenity.hash b/package/zenity/zenity.hash
new file mode 100644
index 0000000000..0d1d7b0cb5
--- /dev/null
+++ b/package/zenity/zenity.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  85bfd8c695c3c2eb6d7ec339b9edfa85d48fa1a9f0b50df111c2da3902fb4c4d  zenity-3.44.2.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/zenity/zenity.mk b/package/zenity/zenity.mk
new file mode 100644
index 0000000000..8abe010874
--- /dev/null
+++ b/package/zenity/zenity.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# zenity
+#
+################################################################################
+
+ZENITY_VERSION = 3.44.2
+ZENITY_SITE = $(call github,GNOME,zenity,$(ZENITY_VERSION))
+ZENITY_LICENSE = LGPL-2.1
+ZENITY_LICENSE_FILES = COPYING
+ZENITY_DEPENDENCIES = \
+	host-itstool \
+	libgtk3
+
+ZENITY_CONF_OPTS = -Dlibnotify=false
+
+ifeq ($(BR2_PACKAGE_WEBKITGTK),y)
+ZENITY_DEPENDENCIES += webkitgtk
+endif
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
