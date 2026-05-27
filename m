Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2337ACD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 17:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3AE7421A1;
	Wed, 27 May 2026 17:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOZ872IJMc53; Wed, 27 May 2026 17:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CAA440EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779902823;
	bh=KfC7iS0VBa+9fPV9/QtXcBk6XK8SCfeG1P1av8XXCKw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q9WdypPBJuAdwlN4fDO3BboAtLt3hkuOhgoiA8ngZAgAcpZ6WX8Upj6IzVtPSzZ6J
	 mLF+c5YhbEdMkrBdKVoTSPM4n+wQFcds21zThztCTevFj4Ff4Lsaap9+gjJonZte1t
	 dHKOsnn6KB5wzn74yieTb/u14VD1VBegdRWRIxG1vZkDLUFWRRe4Bii9g6n/S0CpOx
	 EFPTfTfHIpkmqPQLrTrPDpKGqcTkmMWeV9QHqfKA4xvEJwOhY+h239ReNEM1e7+z+9
	 /QeoCzhMhBKhwrXYOcNk6hQGBWjr+NX+WX/YDG4sUVX+t4PxqSfdNvahZG9DUkrP1T
	 2PUrcj5t7p1FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CAA440EF9;
	Wed, 27 May 2026 17:27:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EABDF28A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 17:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC2F58422D
 for <buildroot@buildroot.org>; Wed, 27 May 2026 17:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 412Wqw--uxZ7 for <buildroot@buildroot.org>;
 Wed, 27 May 2026 17:27:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E159784224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E159784224
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E159784224
 for <buildroot@buildroot.org>; Wed, 27 May 2026 17:27:00 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7e636d1bedbso2781496a34.0
 for <buildroot@buildroot.org>; Wed, 27 May 2026 10:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779902820; x=1780507620;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2tIZRNAv+9heWYBHcq35VlMisFETx3fBrXWJJX2n90=;
 b=KvYGeCLCYJj5yCtUerSbZQP16AV4QGLmpkj0SP/+FyBP0q1MKGfoBEMdqK4RTNYV4G
 eOkfNmwEpdGfcJutswL+kDYgW+PlhkEJ+rIHsFuiCB7UH8R0DoptpMmemanPebHz6Yyy
 XHDKsl/LTWGCu4npNiQLvmqKIKySi+xvAq17SXkNOxDFjAQJvQPf7GYsNerNkjW9SVGz
 LAPtinFxb7CA3O6a5z/9i0o0zU+UXxnsMY2yuOFguaIPWq45Ae7U81gVU9OuW3xQVMTd
 63xPSQ0zaK+7DbK8JVoPOYDvAZVbEd9MRuDZKBY5tS+qw6xA4w77T21I5YLjXDEZqKiT
 8Xzg==
X-Gm-Message-State: AOJu0YwFRlc3hEji2xSqUwH0ha9Yll1IP9j83whledz6ug9mDPfD920o
 oi38ovGPH4NlOzZbbHOgSBu9VEBKXJq4F9ltZOrQPlp7hhKOyxR82soesmquiA==
X-Gm-Gg: Acq92OEA21i3QFEV6zWM0zo/B6X5FR1l946MoLWbozPu+vpV3nyqzsHy0i284gOruw4
 FJS51juRHkMr1+4egf6xMZKw6yZuWHvyXtNZSRvqSL5KRqj0A+3IbYBJCGuFQl9eTe3gXtVN7V3
 SQE2Kh0oZG9L0JZrs1tpNzdGT9kVGnvomcdoN6Z3shgpuEfSxm5bZH3RVEwXUI9NqLrlUIk9usq
 yIxVtkjsjT6QJ7EgLZlU1DnelZIigERLLKGIaXzGk6nJezFG1GS9QAep8sH16SzX8yvMTu4jOWq
 vdvHFkSHA9rKNEGHUU7hFQl6g+Bp1SmvkzkhhN9h9mqV6RI/F7z0V0XQQsNUJbVB3BdCg7MJkKG
 ypcu3hinUe/jSmv6MIvsGeU9jMdjiM3Y8X2owx2BF07g0AZldj6OxqgGv27z3bHoqNDcUQAjLZI
 12Q2hj2+B3WJYwIsB/wQKs0hfCB/1/fa2XQ3hcTvNuZzrzXSxAxE0CJUWdsXTzW6MiJw70JB5gM
 ZuSwcJCzQiSqemOJrjwTSGUYG7E0zSZF4s8V7VBLhn1FV0Sh1xB8YbSRxlgLjDwt24TtCWp9QT9
 llAL
X-Received: by 2002:a05:6830:43a8:b0:7de:442b:722 with SMTP id
 46e09a7af769-7e5feaabc27mr13221727a34.0.1779902819421; 
 Wed, 27 May 2026 10:26:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-131-78.hlrn.qwest.net.
 [184.96.131.78]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e60667af4csm12096879a34.27.2026.05.27.10.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 10:26:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 May 2026 11:26:53 -0600
Message-ID: <20260527172653.547372-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779902819; x=1780507619; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v2tIZRNAv+9heWYBHcq35VlMisFETx3fBrXWJJX2n90=;
 b=q010FrbZ2iyD+yBrtpUy9t0eauHLRBEf67ZJ2Pu4r1tEqXqgtQxMRh4gsf7jzIFwHO
 5Cd38bhvfobOrBVO65kjZhhhCe1qq7FsI0RqS+gp4tx51UdhUZz21rKUbJi4ZQvQ9/oA
 FgemOYiBysVrdjMuu2Wx9Jh4tW3DukM32EtQ1bOjRYr0cO0Yi+RMho9imRGGrpqIfmz6
 hPpMIuPh6w4jWqjv8vJAYWFYnOl9rAyw8KcxejKTrf1PEx6i/5UhWY4xk1Uxyc/4UWsE
 RaP5u50SdQrjYM2g1flRQb2wpYv3mhsp1vV3aKbpieFQbLOAUl5Y+847Z5N6tHm+u0Z0
 LG8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=q010FrbZ
Subject: [Buildroot] [PATCH 1/1] package/dbus: bump to version 1.16.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from autotools to meson.

The COPYING file now points to separate license texts under LICENSES/
instead of embedding them, so update DBUS_LICENSE_FILES and hashes.
Expand DBUS_LICENSE for the AFL-2.0 dbus-arch-deps.h header and the
bundled TCL/pycrypto-origin code used by the library.

Drop the stale optional xlib_libSM dependency: the meson build only
checks for x11 for X11 autolaunch support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/dbus/dbus.hash | 12 ++++--
 package/dbus/dbus.mk   | 97 +++++++++++++++++++++++++-----------------
 2 files changed, 67 insertions(+), 42 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index a06ba50ccd..fae6b796e3 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,13 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.16.2.tar.xz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f  dbus-1.14.10.tar.xz
+sha256  0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb643384bd6beb7e2  dbus-1.16.2.tar.xz
 
 # Locally calculated
-sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
+sha256  150e5d08e1cb5e62b65967d7931acad2c42d98ec1bbb584bebb01921cbc853c2  COPYING
+sha256  7ecc7db84298adb05d2cf10339c63a5315a1c5c270a68d97d7d40a53b508ccde  LICENSES/AFL-2.0.txt
+sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  2cb8f4f410f0ffc5dcfbadd188e20c859fdbb161e616cf2f3d34dfbf8c740547  LICENSES/LicenseRef-pycrypto-orig.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  36fc2d8a56a2a014ded51e298a7e63635eb4ec62e8bedb99c82b892542ac5e7d  LICENSES/TCL.txt
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7b97c7604d..d34cc3e53e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,11 +6,22 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.14.10
+DBUS_VERSION = 1.16.2
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
-DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
-DBUS_LICENSE_FILES = COPYING
+DBUS_LICENSE = \
+	AFL-2.0 or GPL-2.0+ (dbus-arch-deps.h), \
+	AFL-2.1 or GPL-2.0+ (library, daemon, some tools), \
+	GPL-2.0+ (some tools), MIT (some files), \
+	Public Domain (dbus-sha), TCL (dbus-hash)
+DBUS_LICENSE_FILES = \
+	COPYING \
+	LICENSES/AFL-2.0.txt \
+	LICENSES/AFL-2.1.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LicenseRef-pycrypto-orig.txt \
+	LICENSES/MIT.txt \
+	LICENSES/TCL.txt
 DBUS_CPE_ID_VENDOR = freedesktop
 DBUS_INSTALL_STAGING = YES
 
@@ -27,56 +38,56 @@ DBUS_DEPENDENCIES = host-pkgconf expat
 DBUS_SELINUX_MODULES = dbus
 
 DBUS_CONF_OPTS = \
-	--with-dbus-user=dbus \
-	--disable-tests \
-	--disable-asserts \
-	--disable-xml-docs \
-	--disable-doxygen-docs \
-	--with-system-socket=/run/dbus/system_bus_socket \
-	--with-system-pid-file=/run/dbus-daemon.pid \
-	--with-session-socket-dir=/tmp \
-	--runstatedir=/run
-
-ifeq ($(BR2_STATIC_LIBS),y)
-DBUS_CONF_OPTS += LIBS='-pthread'
-endif
+	-Dapparmor=disabled \
+	-Dasserts=false \
+	-Ddbus_user=dbus \
+	-Ddoxygen_docs=disabled \
+	-Dducktype_docs=disabled \
+	-Dinstalled_tests=false \
+	-Dintrusive_tests=false \
+	-Dlaunchd=disabled \
+	-Dmodular_tests=disabled \
+	-Dqt_help=disabled \
+	-Druntime_dir=/run \
+	-Dsession_socket_dir=/tmp \
+	-Dsystem_pid_file=/run/dbus-daemon.pid \
+	-Dsystem_socket=/run/dbus/system_bus_socket \
+	-Duser_session=false \
+	-Dxml_docs=disabled
 
 ifeq ($(BR2_microblaze),y)
 # microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
-DBUS_CONF_OPTS += --disable-inotify
+DBUS_CONF_OPTS += -Dinotify=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-DBUS_CONF_OPTS += --enable-selinux
+DBUS_CONF_OPTS += -Dselinux=enabled
 DBUS_DEPENDENCIES += libselinux
 else
-DBUS_CONF_OPTS += --disable-selinux
+DBUS_CONF_OPTS += -Dselinux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT)$(BR2_PACKAGE_LIBCAP_NG),yy)
-DBUS_CONF_OPTS += --enable-libaudit
+DBUS_CONF_OPTS += -Dlibaudit=enabled
 DBUS_DEPENDENCIES += audit libcap-ng
 else
-DBUS_CONF_OPTS += --disable-libaudit
+DBUS_CONF_OPTS += -Dlibaudit=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-DBUS_CONF_OPTS += --with-x
+DBUS_CONF_OPTS += -Dx11_autolaunch=enabled
 DBUS_DEPENDENCIES += xlib_libX11
-ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
-DBUS_DEPENDENCIES += xlib_libSM
-endif
 else
-DBUS_CONF_OPTS += --without-x
+DBUS_CONF_OPTS += -Dx11_autolaunch=disabled
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 DBUS_CONF_OPTS += \
-	--enable-systemd \
-	--with-systemdsystemunitdir=/usr/lib/systemd/system
+	-Dsystemd=enabled \
+	-Dsystemd_system_unitdir=/usr/lib/systemd/system
 DBUS_DEPENDENCIES += systemd
 else
-DBUS_CONF_OPTS += --disable-systemd
+DBUS_CONF_OPTS += -Dsystemd=disabled
 endif
 
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
@@ -122,14 +133,22 @@ endef
 
 HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
 HOST_DBUS_CONF_OPTS = \
-	--with-dbus-user=dbus \
-	--disable-tests \
-	--disable-asserts \
-	--disable-selinux \
-	--disable-xml-docs \
-	--disable-doxygen-docs \
-	--disable-systemd \
-	--without-x
+	-Dapparmor=disabled \
+	-Dasserts=false \
+	-Ddbus_user=dbus \
+	-Ddoxygen_docs=disabled \
+	-Dducktype_docs=disabled \
+	-Dinstalled_tests=false \
+	-Dintrusive_tests=false \
+	-Dlaunchd=disabled \
+	-Dlibaudit=disabled \
+	-Dmodular_tests=disabled \
+	-Dqt_help=disabled \
+	-Dselinux=disabled \
+	-Dsystemd=disabled \
+	-Duser_session=false \
+	-Dx11_autolaunch=disabled \
+	-Dxml_docs=disabled
 
 # dbus for the host
 DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
@@ -139,5 +158,5 @@ HOST_DBUS_GEN_INTROSPECT = \
 
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
