Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07CFC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 13:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 119AC4090D;
	Tue, 19 Jul 2022 13:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 119AC4090D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRwklHEBEjW9; Tue, 19 Jul 2022 13:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70D040936;
	Tue, 19 Jul 2022 13:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C70D040936
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB5191BF870
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 13:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A488240936
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 13:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A488240936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 331GAXlFI5-E for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 13:05:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 083B54090D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 083B54090D
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 13:05:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d8so1597295wrp.6
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 06:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b/fVC9wSIVZfHLAiucGVvGrfeNI2jF5ZHpOb4/B4Qo0=;
 b=NvsdZJ0Ym+ycA0j/oaL0O0HJJH5eUljtTNBmWeUvqWdMWyFEE0TSnMRhHDTnyp3OOE
 V2ZE9RYDvhihMhYCn1hGNkaTwGDPE1nVvGET4dI0C650a1I5Y3nwlMLKoLqE89xL2J6l
 sunC3wmUvcwNC6GhhIrNnUbCDRwDsdUI54lmCT9hi8USwSqon1ybdULx9aVFUggDGC5c
 EKbMYGD3jJOezlr7OZpCXUqXScidncnfcUvUh4xFQuhF03dValtRb6fwwkJEDtLmblLm
 FrBhxeijULXBpTvANcZIwWdLKo+AultTa3CkkKpXKYaM6K4b6ttbSHcIj+9FQcjyNU6S
 jxGw==
X-Gm-Message-State: AJIora9N5dycH69zJWYxsg3NSEAnu33VhOcRaRd9JbgNLLS7XzXOf7yX
 GyDphBYaz4GPtjTswc803aLDLashteU=
X-Google-Smtp-Source: AGRyM1tmIJoLYdqsWTudp6KLdYeDEpmubVGJGxGQu40NPpcvIFv45OudIRCxkTntsspVf8gO8FWdLQ==
X-Received: by 2002:adf:f14d:0:b0:21d:ad67:c2e0 with SMTP id
 y13-20020adff14d000000b0021dad67c2e0mr27031033wro.247.1658235947881; 
 Tue, 19 Jul 2022 06:05:47 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 d13-20020adfe84d000000b0020fcaba73bcsm13334641wrn.104.2022.07.19.06.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:05:47 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 15:04:48 +0200
Message-Id: <20220719130449.334694-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b/fVC9wSIVZfHLAiucGVvGrfeNI2jF5ZHpOb4/B4Qo0=;
 b=HsyQmWXWSHTkH6daLKvyVEH6ZKR29Cu9CcD9sWu2l5HPWthaBIxtsQ1eJVsIuL1VoG
 PV76gjpgz5WCoyAzo0uIpzbRIRd5lBFhwM+kf0rx7QJIm8qOe8KZyLV0YFH7+8RRU25B
 4+oQuHBvZ2HgwKKrM9TWmjZAbM1oAhk7HIOXMuBsYUwiTdTFnhiqffVaDJ0W6hvDwo2K
 U0b3xe56VH6+VQ2BIFuXyFAIx9jgpuCadoiQVVr2s4/SqkmVie3iW6O3W5Fb9y2JcqF/
 Hw2bgY72x+2JI2yzjWIwMzMX7mFgi2LAqQ8++U+k8wco4Dkl/jogK1Shu3AQi/D7y+6U
 X6GQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HsyQmWXW
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 251.3
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add config option for the new sysupdate feature.

Remove upstreamed patch.

Update options, manually setdefault options, remove option
not available anymore.

Set default-user-shell based on wether a couple packages
are enabled.

Set default-locale to C, this seems the only safe default,
users can override this in `/etc/locale.conf`.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
 package/systemd/Config.in                     | 12 +++++++
 package/systemd/systemd.hash                  |  4 +--
 package/systemd/systemd.mk                    | 20 +++++++++--
 4 files changed, 32 insertions(+), 37 deletions(-)
 delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
deleted file mode 100644
index 0934886acb..0000000000
--- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 7 Jan 2022 22:25:23 +0100
-Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
-
-MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
-but it's defined in kernel headers since version 5.2.
-
-[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/basic/missing_syscall.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 8267b1a90c..793d111c55 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -569,6 +569,10 @@ static inline int missing_open_tree(
- #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
- #endif
- 
-+#ifndef MOVE_MOUNT_T_EMPTY_PATH
-+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
-+#endif
-+
- static inline int missing_move_mount(
-                 int from_dfd,
-                 const char *from_pathname,
--- 
-2.31.1
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d5d88404de..9f1a778e59 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -475,6 +475,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUPDATE
+	bool "enable sysupdate support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-sysupdate atomically updates the host OS, container
+	  images, portable service images or other sources, based on
+	  the transfer configuration files described in sysupdate.d.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 3572b25965..838ed13fd5 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
+sha256  11c9c3fcc13d689615dd2ea79161d1b992087cf1e2a23856d7d7ade0efbddc54  systemd-251.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
@@ -11,4 +11,4 @@ sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
+sha256  177ff657698bc940f9888b7f69e5d734b0933c2859ea264fde8de1700cec40dd  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 46a4e8de2c..b6fffc553f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.4
+SYSTEMD_VERSION = 251.3
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -62,6 +62,8 @@ SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Ddefault-hierarchy=unified \
+	-Ddefault-compression=auto \
+	-Ddefault-locale='C' \
 	-Didn=true \
 	-Dima=false \
 	-Dkexec-path=/usr/sbin/kexec \
@@ -472,6 +474,20 @@ else
 SYSTEMD_CONF_OPTS += -Dsysext=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
+SYSTEMD_CONF_OPTS += -Dsysupdate=true
+else
+SYSTEMD_CONF_OPTS += -Dsysupdate=false
+endif
+
+ifeq ($(BR2_PACKAGE_BASH),y)
+SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/bash
+else ifeq ($(BR2_PACKAGE_ZSH),y)
+SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/zsh
+else
+SYSTEMD_CONF_OPTS += -Ddefault-user-shell=/bin/sh
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
@@ -546,7 +562,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
 SYSTEMD_CONF_OPTS += \
 	-Defi=true \
 	-Dgnu-efi=true \
-	-Defi-cc=$(TARGET_CC) \
 	-Defi-ld=bfd \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
@@ -797,6 +812,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmachined=false \
 	-Dportabled=false \
 	-Dsysext=false \
+	-Dsysupdate=false \
 	-Duserdb=false \
 	-Dhomed=false \
 	-Dnetworkd=false \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
