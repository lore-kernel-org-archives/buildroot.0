Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5DEC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C9160FAD;
	Mon, 20 Feb 2023 09:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C9160FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WccVDmxJu9nv; Mon, 20 Feb 2023 09:09:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B41F660FDD;
	Mon, 20 Feb 2023 09:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B41F660FDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE5B1BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 264684148B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264684148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOnxTUlybLGw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:09:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DB54097A
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8DB54097A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:09:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t15so420620wrz.7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SsqGNpCFjAnmzgfsaLAJ9UKVO8PHS09mGvpMVJSl6zY=;
 b=KPXawViE4P4dnw/nDZKkeHCjr+bB2l6Ofr9GULwtTI3+APXdTnMYBvYwVwFh2JoAi2
 IcvbHotCCy3BjYUVQXSwwaPPfBH/xqvKkNVPv7fU7QPI9BSBZb99xBsgN717QqrIzP0I
 b7zw2oc7TlCax/ku5cQBicVu2O35S6hIzvnMMuHrONBbRIiozgaF5Yj9//8QklRPODOJ
 mLOS6S9G1HMqDlABTiGKUffMStD3PCOtyFc7iWq5fKUc2qY7h4QrNIEJLNgQAS0Dulif
 etvAPlGYAUeedoTgXy6RXkcgGeLmKdyLuD+VgnmAbdTQAgY4EgS7NfpgWf4D8O3Wf6+8
 rWbQ==
X-Gm-Message-State: AO0yUKXqTR3YTFtB+0MQi6AQqMiuMilt26cSUk5L17L8EaC6W2PuhAZB
 8BQKyrM3LRYgSeS3K9ybHMG7Od47mMncm2OS
X-Google-Smtp-Source: AK7set+hwzn0xPzFdkN3Kieq9Ov49+VWatCgWNlkiO3DDkLjkXL93obRLrRhbrCyZOzNbtn4lqVuSg==
X-Received: by 2002:a5d:6102:0:b0:2c6:9e75:3bd8 with SMTP id
 v2-20020a5d6102000000b002c69e753bd8mr687815wrt.16.1676884185772; 
 Mon, 20 Feb 2023 01:09:45 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003dc4a47605fsm471897wmi.8.2023.02.20.01.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:09:45 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:09:22 +0100
Message-Id: <20230220090923.2155635-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsqGNpCFjAnmzgfsaLAJ9UKVO8PHS09mGvpMVJSl6zY=;
 b=oJ3+KPLuf9qvdDVYZXiqGCgdHbT9i/0vNTRJZy2QYXBCND6Kk/lpuwP8viH9p4uvp0
 cxovJo2DLlKr0hWB2YWZMBoTK70GXiMOGbGjqWeAsckR0iVYav6/j3MyKy/+hIdcj9ta
 vSqPspefMeRhVT1g9ke5ixthT55/7GdT6pjnCRJUGXL/O5n3WcArw7bZCAceMNu4cZy0
 ehbu1TDuntOwtYD5yOZXD5/InbRwO5PJnRVlzF38xpgW1T7F4/f8+2meXUnmQSzoC2vN
 TQa9p6Zr1k1g8nyPIXxs1EExfvRcXCedZ+4bJGtiaV0ln7fizYvtN+BxlN9rEugSH35B
 6FgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oJ3+KPLu
Subject: [Buildroot] [PATCH v1 2/3] package/libgtk3: re-enable atk-bridge
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The reason why it was not used was that at-spi2-core and at-spi2-atk were not available,
since then, it is, so drop this patch. This will also avoid warnings in webkitgtk.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libgtk3/0001-disable-atk-bridge.patch | 41 -------------------
 package/libgtk3/Config.in                     |  2 +
 package/libgtk3/libgtk3.mk                    |  4 +-
 3 files changed, 4 insertions(+), 43 deletions(-)
 delete mode 100644 package/libgtk3/0001-disable-atk-bridge.patch

diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
deleted file mode 100644
index f3e9bff2ba..0000000000
--- a/package/libgtk3/0001-disable-atk-bridge.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Remove atk-bridge support.
-
-atk-bridge doesn't seem useful for now in Buildroot and requires to
-add two new packages just for it: at-spi2-core and at-spi2-atk.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/gtk/a11y/gtkaccessibility.c
-+++ b/gtk/a11y/gtkaccessibility.c
-@@ -37,10 +37,6 @@
- #include <gtk/gtktogglebutton.h>
- #include <gtk/gtkaccessible.h>
-
--#ifdef GDK_WINDOWING_X11
--#include <atk-bridge.h>
--#endif
--
- static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
-                                          guint                  n_param_values,
-                                          const GValue          *param_values,
-@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
-   _gtk_accessibility_override_atk_util ();
-   do_window_event_initialization ();
-
--#ifdef GDK_WINDOWING_X11
--  atk_bridge_adaptor_init (NULL, NULL);
--#endif
--
-   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
- }
---- a/meson.build
-+++ b/meson.build
-@@ -564,7 +564,7 @@ if x11_enabled
-   xfixes_dep     = dependency('xfixes', required: false)
-   xcomposite_dep = dependency('xcomposite', required: false)
-   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
--  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
-+  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
- 
-   backend_immodules += ['xim']
- 
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 82ca68d2da..d921f79226 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -24,6 +24,8 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 283c129cef..fc2b501cb8 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -14,8 +14,8 @@ LIBGTK3_CPE_ID_VENDOR = gnome
 LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
-	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk at-spi2-atk at-spi2-core libglib2 \
+	cairo pango gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrandr xlib_libXrender xlib_libXi
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
