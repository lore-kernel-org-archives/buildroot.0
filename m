Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A5CC46CA2
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 17:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B04A382C99;
	Tue, 19 Dec 2023 17:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B04A382C99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VphLL8GZQzdX; Tue, 19 Dec 2023 17:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0D6831A9;
	Tue, 19 Dec 2023 17:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0D6831A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB4101BF420
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23B841E56
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 17:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A23B841E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OJfb63ASrk4 for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 17:04:57 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8117341E55
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 17:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8117341E55
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-591553d3835so3194192eaf.3
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 09:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005496; x=1703610296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwwcfJ3bUFUJRRb2BRhcG5MYiJAMA8x9an93tVGkTiM=;
 b=DSSIrRp081CuKPHqD3EW7TJnx70jfWv8Xeyyz57H1RjgpGfKnLBi7R4bhKYfXntsXJ
 1vwRoYHhFrqiI9ch43nnpDk6WJ4Z2OTnC4GWya04EELM5TC4uZro4qlcJtFvEU0gzR6a
 NtksrxCBNaN9UM1DNDjZP7uChh3VRlkc7i3jS/ZrWrfmHJ5UGd9oXOOhB7LcU42jAg41
 FApoI2xm3KkYECAs7561adbNzA0HTPugdHxHEU1IYzgiS4mIUO1FW0dqBZED7vb9tUk9
 fZDcGzopF77itVe3POZLlxozVveMre5ZjBYbaETrWa4POaUwiqYER9rUxSFBTkT8Q0Ct
 Bcqg==
X-Gm-Message-State: AOJu0YyUptyqlVSFLjkpb8NSNc8XVYj6mDB2ogs3Dj2r/d+rNp7xAdHO
 ZdAui0QTIax5nZo+7OxFr4NOyBQRMC09ebe5FA0=
X-Google-Smtp-Source: AGHT+IGNMs5tyiNH/yEJG7J5DqLA121hrhNGNcwKHiFIRqt1R2jVJuXapbRzQSQS1UJGpWX4sJs07A==
X-Received: by 2002:a05:6358:920e:b0:172:fd01:4b7e with SMTP id
 d14-20020a056358920e00b00172fd014b7emr830867rwb.1.1703005495830; 
 Tue, 19 Dec 2023 09:04:55 -0800 (PST)
Received: from fedora.. ([75.174.143.7]) by smtp.gmail.com with ESMTPSA id
 x25-20020aa793b9000000b006d45fc85962sm5697911pff.55.2023.12.19.09.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:04:54 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 10:04:50 -0700
Message-ID: <20231219170451.60414-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170451.60414-1-adam.duskett@amarulasolutions.com>
References: <20231219170451.60414-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703005496; x=1703610296;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwwcfJ3bUFUJRRb2BRhcG5MYiJAMA8x9an93tVGkTiM=;
 b=XS80z/ukzJWg6tUJGi3bNZ+Cri06NPncBWyVxhddaAuW0FZHM8eQrGxCt3NmWFTjUI
 tOrEhENs2elw2O/M1kBkexh/61y+sWipB1kA8oQK2MaPDMTS3CLHf0S1eTZZ1FSpsamg
 lAsCmqwdDJ9g0S0EfES5Iff7pb44nPzC6/WAU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XS80z/uk
Subject: [Buildroot] [PATCH v4 2/3] package/zenity: new package
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
v3 -> v4: Select BR2_PACKAGE_HOST_ITSTOOL [Yann]

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/zenity/Config.in   | 32 ++++++++++++++++++++++++++++++++
 package/zenity/zenity.hash |  3 +++
 package/zenity/zenity.mk   | 21 +++++++++++++++++++++
 5 files changed, 58 insertions(+)
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
index 0000000000..ce61658032
--- /dev/null
+++ b/package/zenity/Config.in
@@ -0,0 +1,32 @@
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
+	select BR2_PACKAGE_HOST_ITSTOOL
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
