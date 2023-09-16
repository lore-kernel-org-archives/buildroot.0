Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6E0CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 15:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1356040194;
	Sat, 16 Sep 2023 15:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1356040194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dc7unrg2oXS4; Sat, 16 Sep 2023 15:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A49409EF;
	Sat, 16 Sep 2023 15:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9A49409EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8ADB31BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6437A607F5
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 15:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6437A607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYvGJYKIqrxL for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 15:49:46 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DEC16059D
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 15:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DEC16059D
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-403012f27e3so35611865e9.3
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 08:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694879384; x=1695484184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QQiFngD6TXAZvDjzRwrun+90DkwPQpzVjw7OOkEWxIA=;
 b=BweEPwkKW6GgHczzH0xG6PmPpmfSBJ8L1RClJnqtF9eGNOItmF78rz/anAjpbV2do4
 uQZn81lFoUyJY6q65NYeTJRaM1QjwWlOjaL3bVmt7gBRTD6KWIV8I/w3rerDwbPcP4Zc
 W3C8Clx0+BT+t+bzsQzX4j9yQpqv9q1/GRmiP2dwRYfbmkPK/AUMEFjg6+XOV15a5yUK
 6fsz9H5vbbid6gouAe3tpXubK4RSu68TujaDWpH8haXTnIAA60P0JaJnEmbYK+IZuC1V
 Cac+NbVKDhsEe3PxK7YtAeLI/10q3E/1PnzyG6nIRSRgkGLTktTrWuRNApBk9fNdztAr
 +5gg==
X-Gm-Message-State: AOJu0YyzU5tERVbP+b+dfoONzHOv2AN+dXpgRXpZFD85Hent5RdfoYjW
 o+x3pdIFrzPOOZMX2lCakjHg5i5nrZE=
X-Google-Smtp-Source: AGHT+IGEbPNHHJVpG9zoiXdg7Z8CDHbsp1g2Wv6GjUEXHheKunSbve1cejrJ8qcuToVflGsK1EFCHA==
X-Received: by 2002:adf:8bd2:0:b0:320:5f:c249 with SMTP id
 w18-20020adf8bd2000000b00320005fc249mr1500683wra.30.1694879383533; 
 Sat, 16 Sep 2023 08:49:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b0031f82743e25sm7507008wro.67.2023.09.16.08.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 08:49:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 17:49:40 +0200
Message-Id: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694879384; x=1695484184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QQiFngD6TXAZvDjzRwrun+90DkwPQpzVjw7OOkEWxIA=;
 b=PDzM+M8UORA4pvWp0kP7bQY/uJiGa3KjOpWa7cxnim3fmuYE1Hy503GDRpzc8k+M7l
 1O0wOUc2GwZY2J9EVDHWLByLsVj6ztIG8Zxy5aqlr3THopWUfvY5l1Q9jyEJnJkWuWBK
 377FJTSxoOgBT6vDID/Fb+JL+zCX/KldyFv15+nRn6uIajT9zksEaw0m2iKFkjZHntYW
 CTuaB8VWBgoEDxyyRC8uE0LwwqKXIrjCL1tKgOo1OuqoccR1gb6VtTdGbJ9QqFnynaMI
 K3OJ26vUa/2zOqO+NhMYMJyKgaV8Ytw3HfSa22swGccF4/mrQydotMNNC958d4DJEBHL
 nqfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PDzM+M8U
Subject: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Daniel Lang <dalang@gmx.at>,
 Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of at-spi2-core to
version 2.48.0 in commit d1757fdfb0010d29f20cd68cb6e16f019e236424:

Makefile:576: *** dbus is in the dependency chain of at-spi2-core that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/511a682abd233ba90543044fd9102dc08c762f78

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atkmm/Config.in        | 6 ++++--
 package/atkmm2_28/Config.in    | 6 ++++--
 package/gkrellm/Config.in      | 6 ++++--
 package/gtkmm3/Config.in       | 5 +++--
 package/libfm/Config.in        | 5 +++--
 package/libglade/Config.in     | 6 ++++--
 package/libgtk2/Config.in      | 5 +++--
 package/libgtk3/Config.in      | 5 +++--
 package/pcmanfm/Config.in      | 5 +++--
 package/pinentry/Config.in     | 5 +++--
 package/vte/Config.in          | 5 +++--
 package/xscreensaver/Config.in | 5 +++--
 12 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 571d7e69ad..9c3db0cdb5 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
@@ -14,7 +15,8 @@ config BR2_PACKAGE_ATKMM
 
 	  http://www.gtkmm.org/
 
-comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "atkmm needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
index e88073b87a..75e44b66b9 100644
--- a/package/atkmm2_28/Config.in
+++ b/package/atkmm2_28/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM2_28
 	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_LIBSIGC2
@@ -17,7 +18,8 @@ config BR2_PACKAGE_ATKMM2_28
 
 	  http://www.gtkmm.org/
 
-comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
diff --git a/package/gkrellm/Config.in b/package/gkrellm/Config.in
index e957c058de..b65598593b 100644
--- a/package/gkrellm/Config.in
+++ b/package/gkrellm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GKRELLM
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS # libgtk2 -> at-spi2-core
 	select BR2_PACKAGE_GKRELLM_SERVER if !BR2_PACKAGE_GKRELLM_CLIENT
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -38,6 +39,7 @@ comment "client needs a toolchain w/ C++, gcc >= 4.8"
 
 endif # BR2_PACKAGE_GKRELLM
 
-comment "gkrellm needs a toolchain w/ wchar, threads"
+comment "gkrellm needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 6b924c856b..a8a4bac1e1 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,9 +1,9 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
@@ -18,6 +18,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
+	depends on !BR2_STATIC_LIBS # atkmm2_28 -> at-spi2-core
 	depends on BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_ATKMM2_28
 	select BR2_PACKAGE_CAIROMM1_14
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index e78bc99b76..2d3bada2ca 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBFM
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on !BR2_STATIC_LIBS # libgtk2 -> at-spi2-core
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
@@ -22,9 +23,9 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, dynamic libary, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index 8d0d26f159..b74acba86e 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBXML2
@@ -14,7 +15,8 @@ config BR2_PACKAGE_LIBGLADE
 
 	  https://download.gnome.org/sources/libglade/
 
-comment "libglade needs a toolchain w/ wchar, threads"
+comment "libglade needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index f2888b2f51..0a3c25e220 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -34,10 +35,10 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 endif
 
-comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk2 needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 34b8d49eb3..82e4de8ae1 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,9 +1,9 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
@@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 73b8c7c04c..353ec818da 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on !BR2_STATIC_LIBS # libgtk2 -> at-spi2-core
 	select BR2_PACKAGE_LIBFM
 	select BR2_PACKAGE_MENU_CACHE
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,10 +19,10 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pcmanfm needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index bd5e3af5a1..e7e06f8867 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -55,16 +55,17 @@ config BR2_PACKAGE_PINENTRY_GTK2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on !BR2_STATIC_LIBS # libgtk2 -> at-spi2-core
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The pinentry-gtk2 tool
 
-comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PINENTRY_QT5
diff --git a/package/vte/Config.in b/package/vte/Config.in
index 45d627885f..60849903ae 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_STATIC_LIBS # libgtk3 -> at-spi2-core
 	select BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_PCRE2
 	help
@@ -22,12 +23,12 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10"
+comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		BR2_TOOLCHAIN_USES_MUSL
 
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index ba259274d1..c58812019e 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on !BR2_STATIC_LIBS # libgtk2 -> at-spi2-core
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_GDK_PIXBUF_XLIB
 	select BR2_PACKAGE_LIBGLU
@@ -29,10 +30,10 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
+comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, dynamic library, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
