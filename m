Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1C5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5479A611CE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5479A611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F94E607D9;
	Thu,  4 Nov 2021 00:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZK7o0YFQxYM; Thu,  4 Nov 2021 00:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66BF2607DA;
	Thu,  4 Nov 2021 00:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 517881BF9CB
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40ED281065
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzElHcKA79Ys for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 00:36:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 417F781006
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 00:36:16 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id h14so2697553qtb.3
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUi0Ux49YEnSha12AlA0V4JrFWAq9ViP2ffbTTmcYIA=;
 b=q2AoVP7PxdeNLMhrEjcQurVarFfjaW54U5fd2sWsll/IW3621H9M4ELbrhkazgu4FI
 06hszeDTtmyzuRDZ3keET5AGYi/WAqkMVwGYf5TiSYl4DDW1EhGP0lxGXscWw0ranXuJ
 RqbBrf9gD7+zeqVE4DpHjoM3yTIuGI7DfSy0CLvWD4+zum+hfNvYCoO4p2YpxYwZaGVR
 YpooN0dsCclBtid64GeegWa0W6bCAguNAkpDe6Z8qIKUyX21QszGFfVrNIbZFL/8sc8u
 TaVo2vm/IIqiFyrdeEOlxjBdEfkWZvKmV9rf2/laTKeaQyrai239MCc1+HKSMN4gcf+O
 tL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sUi0Ux49YEnSha12AlA0V4JrFWAq9ViP2ffbTTmcYIA=;
 b=k+uknCKmA+GENHcC8qbzqKu1QkZfYXlZvRheq4TppXxJ5zSGuBGZm3Dld/e1HJZ27S
 n6N8ikawxUzseRLNT1StcfCragsEc0jDt80xQoghRX6kSxEaQ8nZI2CY0iVXD9wjgWqZ
 fL3Pb3aCno/RzldZxEjQBcN7k+DodJ/RrqLLRv9CH1QOr+2l29x1H/bdBQE2HUGpyGL1
 dREthetlvvSue5F3wKAv9leFfNRUJPYeoRj1XQo25/doI0KCnvlmDM/YUD9yx5KTT+XS
 szT6awoOjUcevi2rIhTh1wRHmn/33s/E/xpQn7II1v6Iw73tL6HmbTxKnoShht2CHOd5
 iSwA==
X-Gm-Message-State: AOAM531Yd+UbYU9D3PKtUFicfuBealjArAMWzRN+/wobuD2fmrZWAPLH
 LsdgaHHyBKIfYlXPPfs8Pm2P+ufvre0=
X-Google-Smtp-Source: ABdhPJzaNDYLcBL9AIa6cfe30FP8mrDciZkiSOkpeXl1Mj55Fm0Vxsk6p4keF7sUgfGLBtttSj1gxA==
X-Received: by 2002:ac8:6b98:: with SMTP id z24mr3315523qts.70.1635986174995; 
 Wed, 03 Nov 2021 17:36:14 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o6sm2847034qta.2.2021.11.03.17.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 17:36:14 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 17:36:06 -0700
Message-Id: <20211104003607.2022984-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104003607.2022984-1-aduskett@gmail.com>
References: <20211104003607.2022984-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH vRFC 3/4] package/libpeas: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

midori 9.0 requires libpeas.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/Config.in            |  1 +
 package/libpeas/Config.in    | 45 ++++++++++++++++++++++++++++++++++++
 package/libpeas/libpeas.hash |  4 ++++
 package/libpeas/libpeas.mk   | 38 ++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/libpeas/Config.in
 create mode 100644 package/libpeas/libpeas.hash
 create mode 100644 package/libpeas/libpeas.mk

diff --git a/package/Config.in b/package/Config.in
index c23755a421..0e2cc78d85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1957,6 +1957,7 @@ menu "Other"
 	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libosmium/Config.in"
+	source "package/libpeas/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libpeas/Config.in b/package/libpeas/Config.in
new file mode 100644
index 0000000000..430e668ee7
--- /dev/null
+++ b/package/libpeas/Config.in
@@ -0,0 +1,45 @@
+config BR2_PACKAGE_LIBPEAS
+	bool "libpeas"
+	depends on BR2_USE_MMU # gobject-introspection
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libpeas is a gobject-based plugins engine, and is targetted at
+	  giving every application the chance to assume its own
+	  extensibility. It also has a set of features including, but
+	  not limited to:
+	    - multiple extension points
+	    - On demand (lazy) programming language support for C,
+	      Python and Lua
+	    - Simplicity of the API
+
+	  https://wiki.gnome.org/Projects/Libpeas
+
+if BR2_PACKAGE_LIBPEAS
+
+config BR2_PACKAGE_LIBPEAS_WIDGETS
+	bool "widgets"
+	depends on BR2_PACKAGE_LIBGTK3
+	help
+	  Build GTK+ widgetry
+
+comment "widget support needs libgtk3"
+	depends on !BR2_PACKAGE_LIBGTK3
+
+endif
+
+comment "libpeas needs python3"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_PYTHON3
+
+comment "libpeas needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/libpeas/libpeas.hash b/package/libpeas/libpeas.hash
new file mode 100644
index 0000000000..2b030c01c5
--- /dev/null
+++ b/package/libpeas/libpeas.hash
@@ -0,0 +1,4 @@
+# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.30/libpeas-1.30.0.sha256sum
+sha256  0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3  libpeas-1.30.0.tar.xz
+# Locally calculated
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libpeas/libpeas.mk b/package/libpeas/libpeas.mk
new file mode 100644
index 0000000000..4f1ab1216a
--- /dev/null
+++ b/package/libpeas/libpeas.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# libpeas
+#
+################################################################################
+
+LIBPEAS_VERSION_MAJOR = 1.30
+LIBPEAS_VERSION = $(LIBPEAS_VERSION_MAJOR).0
+LIBPEAS_SOURCE = libpeas-$(LIBPEAS_VERSION).tar.xz
+LIBPEAS_SITE = http://ftp.gnome.org/pub/gnome/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
+LIBPEAS_LICENSE = LGPL-2.1+
+LIBPEAS_LICENSE_FILES = COPYING
+LIBPEAS_CPE_ID_VENDOR = gnome
+LIBPEAS_INSTALL_STAGING = YES
+LIBPEAS_DEPENDENCIES = \
+	host-libglib2 \
+	host-pkgconf \
+	gobject-introspection \
+	libglib2 \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBPEAS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
+LIBPEAS_CONF_OPTS = \
+	-Ddemos=false \
+	-Dglade_catalog=false \
+	-Dintrospection=true \
+	-Dlua51=false \
+	-Dvapi=false
+
+ifeq ($(BR2_PACKAGE_LIBPEAS_WIDGETS),y)
+LIBPEAS_DEPENDENCIES += libgtk3
+LIBPEAS_CONF_OPTS += -Dwidgetry=true
+else
+LIBPEAS_CONF_OPTS += -Dwidgetry=false
+endif
+
+$(eval $(meson-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
