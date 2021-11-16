Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4920C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 00:10:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BF661B3F
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 00:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10BF661B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC49940012;
	Tue, 16 Nov 2021 00:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWeJ8M1xkkiL; Tue, 16 Nov 2021 00:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83BDA4017E;
	Tue, 16 Nov 2021 00:10:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 143921BF977
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 00:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03168606C0
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 00:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ze1fKrj-M_jx for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 00:10:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAA99605DC
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 00:10:18 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id j1so2781060vkr.1
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 16:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bv1VabbiQm7i0Say9H/aQRMgaKIjcNzjb29RIwvhcew=;
 b=mxeUnE1LrtQGy6Um+D7J1UlMhnjs6vGMR3cF4coLEOFOofjutJGcTuWBEKNiHv3L1R
 v7JIw031bmObmYPCuGPpwX/xJ1dphCCmuEND9auf6d6Qawm1ZTvkqGz9xZonmnskMCzR
 fD+DW8a0EtNscsSz4CbaFpFkv6eCFBh5EqA6qTcIdoi1w1zYXve1d78VU858AqTAdgEH
 /p60aDoNEQPJ7TtYeJGyrfW/4bBjz5SNMRuYFHvtGHHgLlAYiJbiPBT8EV9NcuOQKhDU
 eCM9asiZB6Zee6z2RKmdJsovzQhjarqzdxADdMjGfyXtpHlyt1o8x9/QXU1Epts3SdPM
 JzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bv1VabbiQm7i0Say9H/aQRMgaKIjcNzjb29RIwvhcew=;
 b=SL5KfrPhtTJGFvEzaFMM/YRUP+FB8V1yttUd05jcCddF9ElkTiA6BI8jK0mMXISbc6
 MEmsLIuOo//vq6CHxT733cXPIwytftkQ9zCZ2TfwUVBimcHHaVWRPhbmFONq9flcYFBq
 EliCWheUnbv92/KFS2A9I6XBEKxPnLZ/2zJ0/audAP/GnHS+3qH5gIxyBqlW0Qub0BkE
 LH912gxCBIl0g/EwsXL+gya2+iBpnSOR4+mhlIXhux1USC4wn5z5akPN5bpml+hB1UZn
 fxHBFz20yvTIgD6HD98VUyMQZBX1pQwW1zrnq6oTBg/0g9WEADmrbCuEbf7CUYJtGX8/
 bukw==
X-Gm-Message-State: AOAM531fY0wofSY4Gsh8nf1B0iQNKquz16fX+awA/hLiqQUqDqAmn2+V
 JX99HjLv19nfaGXpwAuiIT+FPFx0EdA=
X-Google-Smtp-Source: ABdhPJw6SnAJ+J/MLchnclpK1mxXRQziGmhUi95fQzdSyZxFmcpYnkXa9qABji9A9UiuP/ezrY03tg==
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr65829849vkd.4.1637021417522; 
 Mon, 15 Nov 2021 16:10:17 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id v81sm9468484vsv.14.2021.11.15.16.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:10:17 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 21:09:57 -0300
Message-Id: <20211116000957.3853205-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next] package/thermald: bump to 2.4.6
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version).

Add new dependencies:
- host-autoconf-archive
- libevdev
- upower
- xz (liblzma)

Create a pre-configure hook to avoid this error when reconfiguring:
automake: error: cannot open < gtk-doc.make: No such file or directory
Based on the solution used in 178eb1d7ea165d87460224d297ce615bb63090f0.
During the build gtk-doc is already disabled by pkg-autotools.

Create a post-patch hook to avoid this error when reconfiguring:
aclocal: error: couldn't open directory 'm4': No such file or directory
Based on the solution used in 6bf74ce3dbfec8979e379bc1b919f29d09f0d87b.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test-pkg config 1:
BR2_PACKAGE_THERMALD=y
BR2_INIT_SYSTEMD=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/409415667
45 builds, 44 skipped, 0 build failed, 0 legal-info failed

test-pkg config 2:
BR2_PACKAGE_THERMALD=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/409437630
45 builds, 40 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 ...ix-32-bit-build-error-with-musl-v1.2.patch | 53 -------------------
 package/thermald/Config.in                    | 17 ++++--
 package/thermald/thermald.hash                |  2 +-
 package/thermald/thermald.mk                  | 28 +++++++++-
 4 files changed, 41 insertions(+), 59 deletions(-)
 delete mode 100644 package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch

diff --git a/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch b/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch
deleted file mode 100644
index db5bc99a91..0000000000
--- a/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 074575bf3640485ab6d43ae1efed3eff9cebae13 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Thu, 5 Mar 2020 13:45:57 +0800
-Subject: [PATCH] thd_trip_point: fix 32-bit build error with musl v1.2.0
-
-Error log:
- ../git/src/thd_trip_point.cpp: In member function 'bool cthd_trip_point::thd_trip_point_check(int, unsigned int, int, bool*)':
-| ../git/src/thd_trip_point.cpp:250:19: error: format '%ld' expects argument of type 'long int', but argument 6 has type 'time_t' {aka 'long long int'} [-Werror=format=]
-|   250 |      thd_log_info("Too early to act zone:%d index %d tm %ld\n",
-
-musl 1.2.0 have new feature:
-time_t is now 64-bit on all archs (not just 64-bit archs)
-
-Commit id:
-https://git.musl-libc.org/cgit/musl/commit/?id=38143339646a4ccce8afe298c34467767c899f51
-
-Release note link for musl 1.2.0:
-https://git.musl-libc.org/cgit/musl/diff/
-
-use %jd and typecast with intmax_t which is maximum width integer type
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-[Upstream: https://github.com/intel/thermal_daemon/commit/a7136682b9e6ebdb53c3c8b472bcd5039d62dc78.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/thd_trip_point.cpp | 10 ++--------
- 1 file changed, 2 insertions(+), 8 deletions(-)
-
-diff --git a/src/thd_trip_point.cpp b/src/thd_trip_point.cpp
-index 46f692d..6358c27 100644
---- a/src/thd_trip_point.cpp
-+++ b/src/thd_trip_point.cpp
-@@ -242,15 +242,9 @@ bool cthd_trip_point::thd_trip_point_check(int id, unsigned int read_temp,
- 				time_t tm;
- 				time(&tm);
- 				if ((tm - cdevs[i].last_op_time) < cdevs[i].sampling_priod) {
--#if defined __x86_64__ && defined __ILP32__
--					thd_log_info("Too early to act zone:%d index %d tm %lld\n",
-+					thd_log_info("Too early to act zone:%d index %d tm %jd\n",
- 							zone_id, cdev->thd_cdev_get_index(),
--							tm - cdevs[i].last_op_time);
--#else
--					thd_log_info("Too early to act zone:%d index %d tm %ld\n",
--							zone_id, cdev->thd_cdev_get_index(),
--							tm - cdevs[i].last_op_time);
--#endif
-+							(intmax_t)tm - cdevs[i].last_op_time);
- 					break;
- 				}
- 				cdevs[i].last_op_time = tm;
--- 
-2.29.2
-
diff --git a/package/thermald/Config.in b/package/thermald/Config.in
index f32a4b274e..6d74a164b6 100644
--- a/package/thermald/Config.in
+++ b/package/thermald/Config.in
@@ -2,12 +2,18 @@ config BR2_PACKAGE_THERMALD
 	bool "thermald"
 	depends on BR2_i386 || BR2_x86_64 # needs <cpuid.h>
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_USE_WCHAR # upower -> libgudev
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2, dbus
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # upower -> libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2, dbus, upower
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
+	depends on BR2_PACKAGE_HAS_UDEV # upower
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_UPOWER
+	select BR2_PACKAGE_XZ
 	help
 	  Thermal Daemon is a Linux daemon for monitoring and
 	  controlling platform temperatures. Once the system temperature
@@ -16,8 +22,13 @@ config BR2_PACKAGE_THERMALD
 
 	  https://01.org/linux-thermal-daemon
 
-comment "thermald needs a toolchain w/ C++, wchar, threads"
+comment "thermald needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+comment "thermald needs udev /dev management"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index 34094ac8c0..0a37f0e413 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aaf5ffdc12344eef2417b41b433094bb30e4ebf321f0140b090f97bfcf24ea1f  thermald-1.9.1.tar.gz
+sha256  80c92902a89b72a9df85c51a8b5fc472cc01b4410600ef1f56d62c4ac23890c1  thermald-2.4.6.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 5619258c44..9b303104e3 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,17 +4,41 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 1.9.1
+THERMALD_VERSION = 2.4.6
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-THERMALD_DEPENDENCIES = dbus dbus-glib libxml2 $(TARGET_NLS_DEPENDENCIES)
+THERMALD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+THERMALD_DEPENDENCIES = \
+	$(TARGET_NLS_DEPENDENCIES) \
+	host-autoconf-archive \
+	dbus \
+	dbus-glib \
+	libevdev \
+	libxml2 \
+	upower \
+	xz
 # tools are GPL-3.0+ but are not added to the target
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
 THERMALD_CPE_ID_VENDOR = intel
 THERMALD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+# avoid this error when reconfiguring:
+# automake: error: cannot open < gtk-doc.make: No such file or directory
+define THERMALD_GTK_DOC_HOOK
+	echo "CLEANFILES=" > $(@D)/gtk-doc.make
+endef
+THERMALD_PRE_CONFIGURE_HOOKS += THERMALD_GTK_DOC_HOOK
+
+# Autoreconf is missing the m4/ directory, which might actually be missing
+# iff it was the first argument, but unfortunately we are overriding the
+# first include directory above. Thus we need that hook here.
+define THERMALD_CREATE_M4
+	mkdir -p $(@D)/m4
+endef
+THERMALD_POST_PATCH_HOOKS += THERMALD_CREATE_M4
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 THERMALD_DEPENDENCIES += systemd
 THERMALD_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
