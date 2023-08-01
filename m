Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449F9EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 05:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2DA8402F2;
	Tue,  1 Aug 2023 05:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DA8402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9W2SQzA9xte; Tue,  1 Aug 2023 05:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0003840141;
	Tue,  1 Aug 2023 05:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0003840141
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56D171BF33F
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 05:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E87004064F
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 05:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E87004064F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1onA4mTIvC7F for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 05:08:43 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3A9640199
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 05:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A9640199
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe21e7f3d1so5694787e87.3
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690866520; x=1691471320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PbWKtBIQKakGDHRPn5lZ8PsFlDPpElTbh/Auuhu3KUg=;
 b=Lee25ONx28o7QmxM49GPDwBSZutqZCDRK+oOAaKXGd9YCVqSadHLVcK3NsClZhnmai
 jVnyasC4RbsMWRRjdz9cmkFbpSk7vKORspNPV10J1/sMV2paTuydYweMIXmPSuNJmPi8
 5NwS2qy4nnm28a8GskDvL3HwlLSZ/WE1GkxLr/16vNPHoRUMYD6oP48yoH+OS579TkEh
 IIsDaN59MDEW95fMatXRuPHhwJwH59N30d5nOyAMw5eqdL60CvzmOtwI1GZQlJKEKTVg
 id5jmV959Biooi8AilFfaJVvBoNQJLFCzbfHp/jtL0jTujgN8QdrEROvh1X5cLqqTLji
 bHkg==
X-Gm-Message-State: ABy/qLa37aRYfRQzXr7BfuOe8fzWuL0oJ+4tLq7ZGFfgY6Fo8nq5gGEc
 qbun7vlfT1goql4l08AlVm2zjeUaQw46kQ==
X-Google-Smtp-Source: APBJJlHmXElY56RDq4IEJ4k21YJK6c2CW+KLz1YcXEs/z1FHFCdEGR6juHC1xyYLs3UzPmDlF38gnw==
X-Received: by 2002:ac2:5e73:0:b0:4f8:7781:9870 with SMTP id
 a19-20020ac25e73000000b004f877819870mr1082128lfr.60.1690866520087; 
 Mon, 31 Jul 2023 22:08:40 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a05651238ac00b004f84a92ba75sm2405061lft.65.2023.07.31.22.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 22:08:39 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 08:08:25 +0300
Message-Id: <20230801050825.1819-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690866520; x=1691471320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PbWKtBIQKakGDHRPn5lZ8PsFlDPpElTbh/Auuhu3KUg=;
 b=WUrfIpQmf7Hphg+uxtr1a7evrttTbwf62377Q7R+DMv1qe5dNEqNIo+gTBEBQaUNjR
 1mhsq1CncM9AZN5TeD8M8baMfXFry3KPzdK4F036zNZLJocUw2f5OAx+mMG6YIacEwKJ
 QfYdiTqW1/QDbI+aNgzyTKOtw8oFSV/aEJvMFUAoe81ZJhzQfAiPCHQt/StMNkSiRbrV
 8an0Tn3r8aHnQ0O3uUWKJGj49B/5J7GhYQeD06fv8PmfaWtJwO2Vhl0flN4UzmXF/wC/
 /7p94DjmzncJr4DRjk0g8EbVmZFXwAirqdH6YRIwyaMHtfOv5WkCUVLkAbhkGBZjwb3s
 SuNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WUrfIpQm
Subject: [Buildroot] [PATCH RESEND v2] boot/barebox: Fix building of
 internal scripts
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
