Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48954CD8CB2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 18:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E2E8596F;
	Tue,  9 Jun 2026 18:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZu2Bu-e2pOb; Tue,  9 Jun 2026 18:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF2EF8596B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781028421;
	bh=/8K+3vkrQLBhxA874lyabk9NOQmc+3XlZMymO4J5RrY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WkEsuDpsww10f3YHuKztIhrPjGeUWGE5P3B6/q6MIxiJ6sn0bDwJlOR2Z3ec6c2A0
	 bgjOgKzkmC0aJ3rezx+qcLjSSDGhZ3IDUk5TKdZB7bEQqAhWq+l9DYZM9n7QS9TXLd
	 AETRk2IuIYCxZvyw67tz2tUUCbeRsPBCKgvCpzRULzc32PmlaeC+7t819KTirSk7V1
	 w4oViyJFhvTQSB0ailBJtYthWRcGQiqwsWuFDt3Re0nSa2zBxep8SBxXE6ZEzmuZvd
	 +NCXXoPkd2JLve7jX8aX3+BXx3PQDzJ8jS6/fzaVmhHf1YvZneotnpu7vhI5lVX/Iu
	 IEpvNnqiTpHyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF2EF8596B;
	Tue,  9 Jun 2026 18:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 005DA190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E54536F876
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 18:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8_-gWwklPUm for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 18:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA7F06F875
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA7F06F875
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA7F06F875
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 18:06:58 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7e6b5c374e5so5598485a34.0
 for <buildroot@buildroot.org>; Tue, 09 Jun 2026 11:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781028417; x=1781633217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UIkIDbop+yYWBNDk1QJF+HUJVLaBTCV4I8rS4Ua4u3s=;
 b=k0ZYJ+InHFie62InWwis9KhwNdIYoAqGetO9mqOtBF9xC0MMBXLGYhuV905RMd8uNB
 sf/TyE51Y2I4UPQNiI7YZcW7NSQDEISm06YPt+b82PIbKDI6DY1Gh5hpo/ClEvAhexkl
 iDpTKNhDY8WHmURDNufiAz/XqA4rT3MWFmr8jxoNPtHpoAdEJSfc3qY+QpESeuaNOSxI
 cL6iJzzNiDSEcEL0qJ42UvSePUKWW0RRARGFNO4qQRIFVrKOSEjWkVALipVVbnWqR44C
 wFuYtzy+lTreM3IB1wpDULrXM3Fmetas/Moh4We3KmxC4RNLj1XHQu2hmbt+t42ZmFDk
 xHDQ==
X-Gm-Message-State: AOJu0Yxdiz4HYsiMnW2wW/cIHJBck8Gh3/BZwgbsOwhO/aAhHQBYVX40
 hjw0Nrr6oRWLri5waALuYRre9xtMZ00DX7xjWb0zPpy2UC+R0+Rpmiba9YHXgwfA
X-Gm-Gg: Acq92OE7Dddeo3XGmxm95V7uDPw3AJ0ZJo+kiCPvaH/hfk8QfNv1+dFOoKJeTjmIzg5
 HCJDEOus73hCNODBJFOsyu0OE9qSmGHeYMpb1YDZsd+x7bXvraOGqB2BL5jiTem4OccFjCDSc1K
 R1FJ4W5Gvl6/usUQSL7/TvVnmbHL9SgZpXAwikiCo7xnhly7YhvkUgj21oxOuBQOvirFRVGVPH8
 Hj6SKx+APZBdu6iiJHmnB9F+GvcVFo9zEIUahLSDLE5DfnH/rhgBhAReYX+wbx+UM+OSX+Bz59F
 6BGv4+EFl3ZKqEoq0r7Adefh7C3hrih+e08ZO/OTBcppxaYH/YZZEo3led+J7HXmLyRKf9jOXi+
 HzflPs2s3ynM5LS+dZExNU1NoJ0ibRhCuR+QqKrhKjJM9bAt+foNJCuMXTEr3n0PkFd+BflLUai
 /MucMaadCV08Xgagm+fR9VaPS1L8YJpsYSjNrStampGzkVg6aX9B2MBZrmsXfe4X+tGfNTDk7ls
 owcrvaxlx4nAKsttux5WieYYwgxHrMTkaD1R4Wdz65ujWTr1dovQP8oO/7XTYul56A1FxFO+71h
 MZn3FJJ3Ck2PL18G0FOeetpyo7UZTpIBiA==
X-Received: by 2002:a05:6830:1295:b0:7e7:4a94:bace with SMTP id
 46e09a7af769-7e74a94ca5cmr2175200a34.13.1781028417265; 
 Tue, 09 Jun 2026 11:06:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (97-118-5-210.hlrn.qwest.net.
 [97.118.5.210]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6e7923af1sm15024069a34.20.2026.06.09.11.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 11:06:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  9 Jun 2026 12:06:54 -0600
Message-ID: <20260609180654.825304-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781028417; x=1781633217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UIkIDbop+yYWBNDk1QJF+HUJVLaBTCV4I8rS4Ua4u3s=;
 b=ODW2CDnoYkYv4mFVEcz/fatRLtNdo/XxIBqWiK75q9T28o09M6x9ceyktPsWkUj8DZ
 2+uuve/yBsXv0shn/HA+URWEbdThjn8ZKUVThBDHo7a1aLDW5Z3aNmbiJhWOPd1iZnHI
 DZveAt4w4XMO/yNR0XqUhbvLzGBdvJZBXRVOGkh8DwRxtEgDU6z/i1I62f9nJXtkYEpR
 YH7c1beLkvUetFtOgp6+F8cardsgjfP5CkyL0KkUPxI7NhVEaydCTbPEtgcrrOVLO9i2
 vbqB1r/Wmhfnw/n1Nr0L1WiX0NmSpT+1xe1RHKQZAPBrQ3nYRTF87e/0H0aGzAHyJT4X
 h8pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ODW2CDno
Subject: [Buildroot] [PATCH v2 1/1] package/dbus: bump to version 1.16.2
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
Expand DBUS_LICENSE for the AFL-2.0 dbus/dbus-arch-deps.h.in header
and the bundled TCL/pycrypto-origin code used by the library.

Drop the stale optional xlib_libSM dependency: the meson build only
checks for x11 for X11 autolaunch support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Enable user-session semantics for systemd init builds so the
    systemd user service/socket units are installed. Keep it disabled
    otherwise.
  - Refer to dbus/dbus-arch-deps.h.in in DBUS_LICENSE instead of the
    nonexistent dbus-arch-deps.h source file.
---
 package/dbus/dbus.hash |  12 +++--
 package/dbus/dbus.mk   | 100 +++++++++++++++++++++++++----------------
 2 files changed, 70 insertions(+), 42 deletions(-)

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
index 7b97c7604d..6913b1e211 100644
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
+	AFL-2.0 or GPL-2.0+ (dbus/dbus-arch-deps.h.in), \
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
 
@@ -27,56 +38,59 @@ DBUS_DEPENDENCIES = host-pkgconf expat
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
+	-Dsystemd_system_unitdir=/usr/lib/systemd/system \
+	-Dsystemd_user_unitdir=/usr/lib/systemd/user \
+	-Duser_session=true
 DBUS_DEPENDENCIES += systemd
 else
-DBUS_CONF_OPTS += --disable-systemd
+DBUS_CONF_OPTS += \
+	-Dsystemd=disabled \
+	-Duser_session=false
 endif
 
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
@@ -122,14 +136,22 @@ endef
 
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
@@ -139,5 +161,5 @@ HOST_DBUS_GEN_INTROSPECT = \
 
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
