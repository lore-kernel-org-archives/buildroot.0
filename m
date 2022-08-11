Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D9FC19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 06:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1227182CD3;
	Thu, 11 Aug 2022 06:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1227182CD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXRZ62h-4Nrv; Thu, 11 Aug 2022 06:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 240CF82A29;
	Thu, 11 Aug 2022 06:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 240CF82A29
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F46F1BF271
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 06:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE14960E8A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 06:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE14960E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXtopO7z0sNc for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 06:35:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FEEE60B8A
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FEEE60B8A
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 06:35:07 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso4223863otp.7
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 23:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=EnuMyyZYRPCReSiQMYHQXavw8j6B9AI3x5X1UIU0UiU=;
 b=DtXccskwKdq+UmMH0e0Y7n/sSeF4h7cRTqao5D2jbj7FXqgJPYGgOk/zlWSY+UhA57
 VrkFrtvkyVDmFrwPzHFfZPRty0hJzihjpjWAmdakXS9mlSlAx6yLOAk9gzrUBt5h3kKs
 6y6/mvWiUEIImAmyx2YwNAf2VeINR+Vj3yKsESbO9pm0CI2/UISK8LgaDEmIemdt8Gk0
 mg4xAr74EpyfM6GQezIEcfeSkIEEOeQQYWF5yPeHrhm6+SiFRnHEh85A3svQbC6F4g8B
 buXaN2Xgg6/c3qTf+QWVUY6/yU/6xDaHXhu3+alAgF10mBGSbmH+n9nzH/QrCfbei7oQ
 G93A==
X-Gm-Message-State: ACgBeo0/3g2sbGukUkEULYRqlWOLgmyqhgJzY6PDmvEQkpoCJLm4QlKt
 +IDMWe0ttHhqpp8/yxyMOvXFJcnL6w8=
X-Google-Smtp-Source: AA6agR5RxsKuyFBMBfswxedA+3v/FqvxaNzVB6ZEUXQBQarJHKW7WeOe9EC21h1hAciIj1yXQzQIEg==
X-Received: by 2002:a05:6830:618a:b0:618:edb6:b5b5 with SMTP id
 cb10-20020a056830618a00b00618edb6b5b5mr12187755otb.0.1660199705827; 
 Wed, 10 Aug 2022 23:35:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 d13-20020a4aeb8d000000b0041b49c19a00sm983417ooj.18.2022.08.10.23.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 23:35:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 00:35:01 -0600
Message-Id: <20220811063502.1823571-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=EnuMyyZYRPCReSiQMYHQXavw8j6B9AI3x5X1UIU0UiU=;
 b=YJ3nlJ+rOBUTDbR3cJioW9W3D4AnLtmgHRXJUszFh8ykrbfoCG6LiURD2nuHLgQ/CR
 2C+iiVUDS7GDT0dIufhxUlIifiHN/n99YFn8ltyimAqwp0PAGiNC5dD+xagh0DbIK/vg
 bMkDrn5rkQWUAhMj3kNUfzdIr6nB6NTftlG4YJwUn6An+pZel4F63v3fjRQA9PutrW6x
 Iuc9CcNX1HumrZ5bEgDO7J/RBJ1jF/ATuexo33IRSqMm2Jrclqe/dOjwvWhKXQqjE60z
 wP103haB8lPw39dvCE9xBX1ellBA4MdKoL6idS9JVSrzcN6l5WcLADszXJcTxXLrDmmH
 6q6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YJ3nlJ+r
Subject: [Buildroot] [PATCH 1/2] package/libucontext: new package
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a ucontext.h C API on musl libc.

Architecture support table based on:
https://github.com/kaniini/libucontext/tree/libucontext-1.2#supported-features

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libucontext/Config.in        | 33 ++++++++++++++++++++++++++++
 package/libucontext/libucontext.hash |  4 ++++
 package/libucontext/libucontext.mk   | 17 ++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/libucontext/Config.in
 create mode 100644 package/libucontext/libucontext.hash
 create mode 100644 package/libucontext/libucontext.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..b843acca9e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1334,6 +1334,7 @@ F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/libucontext/
 F:	package/lilv/
 F:	package/lv2/
 F:	package/pipewire/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..3fe0dcc3c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2050,6 +2050,7 @@ menu "Other"
 	source "package/libtpl/Config.in"
 	source "package/libubox/Config.in"
 	source "package/libuci/Config.in"
+	source "package/libucontext/Config.in"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
 	source "package/liburing/Config.in"
diff --git a/package/libucontext/Config.in b/package/libucontext/Config.in
new file mode 100644
index 0000000000..84a6e89f23
--- /dev/null
+++ b/package/libucontext/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_m68k
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_riscv && BR2_RISCV_32
+	default y if BR2_riscv && BR2_RISCV_64
+	default y if BR2_s390x
+	default y if BR2_sh4
+	default y if BR2_sh4eb
+	default y if BR2_sh4a
+	default y if BR2_sh4aeb
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
+config BR2_PACKAGE_LIBUCONTEXT
+	bool "libucontext"
+	depends on BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
+	help
+	  Ucontext implementation featuring glibc-compatible ABI.
+
+	  https://github.com/kaniini/libucontext
diff --git a/package/libucontext/libucontext.hash b/package/libucontext/libucontext.hash
new file mode 100644
index 0000000000..a8e1e23e36
--- /dev/null
+++ b/package/libucontext/libucontext.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  937fba9d0beebd7cf957b79979b19fe3a29bb9c4bfd25e869477d7154bbf8fd3  libucontext-1.2.tar.gz
+# License files, locally calculated
+sha256  ecf4be354bbb6ccebdf150d1a8f2b3caeb10cf7c8a580f278a30799372f9e037  LICENSE
diff --git a/package/libucontext/libucontext.mk b/package/libucontext/libucontext.mk
new file mode 100644
index 0000000000..75c4f9b9e4
--- /dev/null
+++ b/package/libucontext/libucontext.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libucontext
+#
+################################################################################
+
+LIBUCONTEXT_VERSION = 1.2
+LIBUCONTEXT_SITE = $(call github,kaniini,libucontext,libucontext-$(LIBUCONTEXT_VERSION))
+LIBUCONTEXT_LICENSE = ISC
+LIBUCONTEXT_LICENSE_FILES = LICENSE
+LIBUCONTEXT_INSTALL_STAGING = YES
+
+LIBUCONTEXT_CONF_OPTS = \
+	-Dfreestanding=false \
+	-Dexport_unprefixed=true
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
