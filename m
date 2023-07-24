Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784CDC001B0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 08:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D66B94060C;
	Mon, 24 Jul 2023 08:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D66B94060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BD_7eMfOnvN4; Mon, 24 Jul 2023 08:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E27E740575;
	Mon, 24 Jul 2023 08:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27E740575
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48A741BF3A9
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 08:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F08440575
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 08:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F08440575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MExhtg6r45RF for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 08:04:27 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4183D403E0
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 08:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4183D403E0
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so5980493e87.2
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 01:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690185865; x=1690790665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PbWKtBIQKakGDHRPn5lZ8PsFlDPpElTbh/Auuhu3KUg=;
 b=InbEuPZupxt0MK6uyWVgaIRYL6aqp1hb5Se58pQMPKL3tx979wrDa7ILdv2BFcqddm
 M4SgtJVmC4XlHay+5p1qTJI+p68W6r+fCo4F65v/pQYJXSSeazCIHflN+PxK6wS/EcGv
 UzleeiVFJeoiF1uaHpjAhgPUM1SvJMzzQy2KG5vIOd7tyWa+7u0s9iGgrSaq8NFLiurj
 H+dNVJ1NcsONg9FwXhlVjpoyXGq+KRimko66Y43nY8QvsKEC64NRu+DSywBu88WfLJni
 OFMwmw5IQB9k8iZRCcAJEhdOYVqdpq09GdzdVTGNomfwLtRqcGNf/kH82ThyyufGY9ar
 ITng==
X-Gm-Message-State: ABy/qLaQ7FyFEJoerauRcm1DUlFpuhiBRrLYjYYQgpBCZ18NSjwoUO7Y
 SKU0GS1jYZf/VQBB0vs3R62+LZSsvHk=
X-Google-Smtp-Source: APBJJlE4vBi/Kt4R6pajd7FP9Xh6FnKLrCYtOZD0JH3DncaYZIubgnIaI2kReiqo8XyiXpyV0nwVjw==
X-Received: by 2002:a19:8c1c:0:b0:4f3:80a3:b40a with SMTP id
 o28-20020a198c1c000000b004f380a3b40amr4646521lfd.69.1690185864402; 
 Mon, 24 Jul 2023 01:04:24 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a056512484800b004fa53431073sm2082480lfb.131.2023.07.24.01.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 01:04:23 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 11:04:09 +0300
Message-Id: <20230724080409.29778-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690185865; x=1690790665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PbWKtBIQKakGDHRPn5lZ8PsFlDPpElTbh/Auuhu3KUg=;
 b=dUCwx7AokAc394/ZN1IOS07IcsOk3XuWLXNE+XpuCHW0sC9o8nso8BhTu+9Su9Oaki
 aKqFcXxA0tPTXBJUzRHULQwbEKBUlk+GsjDUm1bC5hFPGvZUuAgyswl8U1M4tW5jffuU
 DJgoqDdu7aBcYjo2GMy1GoPukOEw+ZrAxQoWyIWfoUM9BMUtUuFhDB043ovjw/KMOhyg
 CHysAIqkxyXw/QXVGekMpiP1KCiefLrSdHcJebp7N5EdQVwLTIdhVSxDxouCAZYo8zH9
 rjyFTW6wWuXRjLNnvrJB5QCOzEJ6qMomUCc7DkKqyX4Y4K87V78nKtfuVQ/e0mzL4s9c
 Bemw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dUCwx7Ao
Subject: [Buildroot] [PATCH v2] boot/barebox: Fix building of internal
 scripts
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
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some barebox targets need to use internal scripts, for example rockchip64
uses scripts/rkimage which requires the pkg-config package to look up the
openssl options. Because buildroot hides the host pkg-config tool, the
scripts cannot be built correctly.
To solve this problem, let's use the pkg-config host environment and add
BR2_TARGET_BAREBOX_NEEDS_OPENSSL and BR2_TARGET_BAREBOX_NEEDS_LIBUSB options
if barebox scripts should use the openssl or libusb host libraries.

  HOSTCC  scripts/rkimage
Package openssl was not found in the pkg-config search path.
Perhaps you should add the directory containing `openssl.pc'
to the PKG_CONFIG_PATH environment variable
Package 'openssl', required by 'virtual:world', not found
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: /tmp/ccN8Xyaj.o: in function `main':
rkimage.c:(.text.startup+0x218): undefined reference to `SHA256_Init'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x22b): undefined reference to `SHA256_Update'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x23e): undefined reference to `SHA256_Final'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x253): undefined reference to `SHA256_Init'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x265): undefined reference to `SHA256_Update'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x275): undefined reference to `SHA256_Final'
collect2: error: ld returned 1 exit status
make[2]: *** [scripts/Makefile.host:107: scripts/rkimage] Error 1
make[1]: *** [Makefile:976: scripts] Error 2

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 boot/barebox/Config.in  | 12 ++++++++++++
 boot/barebox/barebox.mk | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 3961c69c56..dba4a1a8d6 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -54,6 +54,18 @@ config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
+config BR2_TARGET_BAREBOX_NEEDS_OPENSSL
+	bool "Barebox needs OpenSSL"
+	help
+	  Select this option if your Barebox board configuration
+	  requires OpenSSL to be available on the host.
+
+config BR2_TARGET_BAREBOX_NEEDS_LIBUSB
+	bool "Barebox needs LibUSB"
+	help
+	  Select this option if your Barebox board configuration
+	  requires libUSB to be available on the host.
+
 if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
 config BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index d7bcafe436..ead159a0f9 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -43,6 +43,14 @@ ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
 $(1)_LICENSE_FILES = COPYING
 endif
 
+ifeq ($(BR2_TARGET_BAREBOX_NEEDS_OPENSSL),y)
+BAREBOX_DEPENDENCIES += host-openssl
+endif
+
+ifeq ($(BR2_TARGET_BAREBOX_NEEDS_LIBUSB),y)
+BAREBOX_DEPENDENCIES += host-libusb
+endif
+
 $(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))
 
 ifneq ($$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
@@ -73,6 +81,12 @@ endif
 
 $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
 $(1)_MAKE_ENV = $$(TARGET_MAKE_ENV)
+$(1)_MAKE_ENV += \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 
 ifeq ($$(BR2_REPRODUCIBLE),y)
 $(1)_MAKE_ENV += \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
