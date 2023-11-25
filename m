Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C187C61D97
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B9B420A1;
	Sat, 25 Nov 2023 01:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B9B420A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eP4Yb4s1p3kf; Sat, 25 Nov 2023 01:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454DD420A9;
	Sat, 25 Nov 2023 01:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 454DD420A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 824881BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55F3542073
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55F3542073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpzMQPcxUcXB for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:01:24 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 596D5420A1
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 596D5420A1
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ce3084c2d1so19468825ad.3
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700874083; x=1701478883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8WMKEoYiIKTm4KYfGxNJmg02TztwxkzwkKR754cH0yE=;
 b=rmCKkPr8HJrDez5PpKpQODXlEzJn7rbp+x4rmvCE7UWkwzXVWaiu0bd4er9kqy8kS+
 mE9pu5WMAiqNxN7/BKQXHrhlECHwGNKmfBvBxor7TnNBYHz10fXKwWMKC0dm2V2KRKYy
 3PaefMcpPrxphcqaxHAZoihcCToIQGJVcszgcU6JlgMdVWNzISoF90cSLScfO2MrCC/m
 Ryn2y4NmK4t+uZtwKXrWsvZbLfm6OC+siHhnHMULgJ1lcApDAj1EFZllQe+Rbu85IGz5
 fwESnlrH/dez7XYYHFgoDaOkKWuAnfFdUZuCKEuDyJmJU0hn3N7wy0q46J/QbistTXpb
 jNIQ==
X-Gm-Message-State: AOJu0YxeuxMHo3zDgQ4/edV7Oq6LsCqShJQ6lpVA+GrHoG2woiTYdOG0
 agbFOCs2FKx191PK13QqPZh3dMP+Nw8yroUHVHU=
X-Google-Smtp-Source: AGHT+IG/GgKHLO4kpNe5p3CCwQwK1/4DgfIM3Uk47eEWKiZwM8cE7WGwON0FERJ8t9P8SpOe3Vbm9Q==
X-Received: by 2002:a17:903:249:b0:1cf:82e0:fd7 with SMTP id
 j9-20020a170903024900b001cf82e00fd7mr5621638plh.34.1700874082868; 
 Fri, 24 Nov 2023 17:01:22 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 jk2-20020a170903330200b001b8b1f6619asm3807749plb.75.2023.11.24.17.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:01:22 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:01:12 -0700
Message-ID: <20231125010113.1758786-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
References: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700874083; x=1701478883;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8WMKEoYiIKTm4KYfGxNJmg02TztwxkzwkKR754cH0yE=;
 b=dSZ1IQGAL/niMnu45UoES/SX6Wi6qpUMqGSv3zIY3a2ejUgUCVB/40kdEOJpKi1gD1
 NCt4ngJ/GhcOgLLsmWg75VoiBzU53KfnyO1ZPZaiZxVKf21R0X76QAo5+1vwxt/cSy8Y
 1nt3+Vq8uafgvlX3/UWrWZmLgE4kdvRo0hxJ0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dSZ1IQGA
Subject: [Buildroot] [PATCH/next v2 4/5] package/zenity: new package
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
index d207f6ae22..d1578e5ad3 100644
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
index f003f3dd91..f59eab5616 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -335,6 +335,7 @@ comment "Graphic applications"
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
index 0000000000..d89e4a3c06
--- /dev/null
+++ b/package/zenity/zenity.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  85bfd8c695c3c2eb6d7ec339b9edfa85d48fa1a9f0b50df111c2da3902fb4c4d  zenity-3.44.2.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  COPYING
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
