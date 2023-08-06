Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3975C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920F84098C;
	Sun,  6 Aug 2023 14:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 920F84098C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XIMMZBast3K; Sun,  6 Aug 2023 14:04:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5698640213;
	Sun,  6 Aug 2023 14:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5698640213
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 359201BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8676605B7
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8676605B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_6uq3ZZc1-b for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:03:12 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E631360D6B
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E631360D6B
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A82E8A4C10CE;
 Sun,  6 Aug 2023 16:02:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-1K;
 Sun, 06 Aug 2023 16:02:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:31 +0200
Message-Id: <20230806140241.4155773-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330563;
 bh=QH9xkiM0rg254JT9HYU+Bz2mBAJ1mTE+YOIQs/TW6yc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vQaRjuR1xLZE1loWEC8MAusyBLniQGuG7Qdz/WDtsecYdY2SP0sd/mbeG3L3nMxus
 DHDXoTthtv2QdIeWPjvOnv39mAoaKZQTWfFFbMFOniL4Y8KbvCCjVfqTmzFNQqa6ID
 lo++qkY99ovpMGWTmUlS77NUSMm3a0or06u30pO5/8js147lZkRro/kT+dfbpxP7LA
 aeA92HecgOcoTCSjs520aBswtg0KC3jV3sgt7cXecu1gDXx8fUlwu5hBYS8VQFcdXd
 0YwgcEh/TKm925YuIqoMjsCBE9NbTv72ebozNDeP5GBmkLVbhi3HWHbeMJkl2qKbIy
 fsk/SRVOBoOjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vQaRjuR1
Subject: [Buildroot] [PATCH/next v9 02/12] package/eudev: allow building
 only the library
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/eudev/Config.in | 12 +++++++----
 package/eudev/eudev.mk  | 46 ++++++++++++++++++++++++++++-------------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index a561a96edf..e31f8ae8c8 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # kmod
+	depends on !BR2_INIT_SYSTEMD
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining
 	  better compatibility with existing software such as OpenRC and
@@ -45,12 +45,16 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	help
 	  Enables hardware database installation to /etc/udev/hwdb.bin
 
-endif # BR2_PACKAGE_EUDEV
-
-comment "eudev needs eudev /dev management"
+comment "udev daemon needs eudev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 
+endif # BR2_PACKAGE_EUDEV
+
 comment "eudev needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_INIT_SYSTEMD
+
+comment "eudev is incompatible with systemd init"
+	depends on BR2_INIT_SYSTEMD
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 235a71967e..120307b6e6 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -10,34 +10,41 @@ EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf
+
 EUDEV_CONF_OPTS = \
 	--disable-manpages \
-	--sbindir=/sbin \
-	--libexecdir=/lib \
 	--disable-introspection \
-	--enable-kmod \
-	--enable-blkid
-
-# eudev requires only the util-linux libraries at build time
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs kmod
-EUDEV_PROVIDES = udev
+	--libexecdir=/lib
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
 EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
 endif
 
-ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
-EUDEV_CONF_OPTS += --enable-rule-generator
-else
-EUDEV_CONF_OPTS += --disable-rule-generator
-endif
-
 ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
 EUDEV_CONF_OPTS += --enable-hwdb
 else
 EUDEV_CONF_OPTS += --disable-hwdb
 endif
 
+ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
+
+# eudev requires only the util-linux libraries at build time
+EUDEV_DEPENDENCIES += util-linux-libs kmod
+EUDEV_PROVIDES = udev
+
+EUDEV_CONF_OPTS += \
+	--enable-programs \
+	--sbindir=/sbin \
+	--enable-kmod \
+	--enable-blkid
+
+ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
+EUDEV_CONF_OPTS += --enable-rule-generator
+else
+EUDEV_CONF_OPTS += --disable-rule-generator
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 EUDEV_CONF_OPTS += --enable-selinux
 EUDEV_DEPENDENCIES += libselinux
@@ -55,6 +62,17 @@ define EUDEV_INSTALL_INIT_OPENRC
 	@:
 endef
 
+else # !BR2_PACKAGE_EUDEV_DAEMON
+
+EUDEV_CONF_OPTS += \
+	--disable-programs \
+	--disable-blkid \
+	--disable-selinux \
+	--disable-kmod \
+	--disable-rule-generator
+
+endif
+
 HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
 
 HOST_EUDEV_CONF_OPTS = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
