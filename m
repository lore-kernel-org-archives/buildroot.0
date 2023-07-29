Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AADC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 06:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBBC1402E0;
	Sat, 29 Jul 2023 06:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBBC1402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYWQ9tD1z2Z5; Sat, 29 Jul 2023 06:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D7A2401ED;
	Sat, 29 Jul 2023 06:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D7A2401ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE2341BF4DA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 06:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 786194159C
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 06:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786194159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fvrl32hYd-UE for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 06:56:20 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E2544156E
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 06:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E2544156E
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-348d6bc349eso13100415ab.0
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 23:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690613779; x=1691218579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VKCd1MhyRIUS9paSwDtwM4ak9cysB4rWClnCxyAfgD4=;
 b=lP62lOHmBsEpk7EnokvIu5RgWLz+KDjiJxuvdO9HpgTtZFxh38aWg477T/xqVoEYBW
 escOHtm/No/+qZOppk2iRaKhSs8y5OZqRcn4mEtVKrvWB68gSG9k4lT10XkQxEifUyID
 jXLFpP9l26AIJXgAIB2JuIDYz8k/AZ3WhJagmfb9gLrktsA1n3oRaIMq7cnrL1Q+KmA3
 6nLb0umKgzcXYIb0c7G1GkPJJAr4jSMfMA4t979VgFzbV3ZMPYY7167J50fbflVzKqFZ
 n5zRjtpCUdF8RsBzAIMu9HsDmBxK0A1LzChdKZJfhICEztAmRys65fENo2rt9OZBLE7r
 vNZw==
X-Gm-Message-State: ABy/qLahCBYZqDJoAjU902cpY3FlF9oA46SGgw8O/k42ZxtjGr7s440V
 yQwK9MO2kzf7Ny/9GulIpUUBXiYNJJw=
X-Google-Smtp-Source: APBJJlHRfyPKPN2wFVV8pwUW8PNYBAaVX4aVRXjD6ERyv0pkBdY5QlC3GGEhHQVb+OooJvyCvg4UHg==
X-Received: by 2002:a05:6e02:f92:b0:348:9c80:f427 with SMTP id
 v18-20020a056e020f9200b003489c80f427mr1696501ilo.30.1690613778890; 
 Fri, 28 Jul 2023 23:56:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 u22-20020a02aa96000000b0042b3a328ee0sm1597269jai.166.2023.07.28.23.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 23:56:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 00:56:16 -0600
Message-Id: <20230729065616.961984-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690613779; x=1691218579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VKCd1MhyRIUS9paSwDtwM4ak9cysB4rWClnCxyAfgD4=;
 b=nnRQ2WhnBLmZffmiizskyd1BfAGj1f4x+3Q9SLZKcg7pIEHoX/R032NVQZSphcFm6u
 Jh2/hAB0lasDd4HStR7GHMhtbVzyVHh8fiTizvb8tTNtat3wZlj2zm5b2KCD7AR7L0VN
 +Y/fpQqZtO+X+qthkJqrfnjnJJW6DgxWQHnnehe5teHsrxuM1BunkE/zMSZOUzSoAhMW
 FQN1mRBJKgjKtSXceofxg1pLt/xwZQrU2W+vWSyfycr5HHcipwD4+0mROOjzrDyEYLez
 hFyczlMDW0509CqUdwEHt8Sb0y34aDODlbeY+ormEpwzFb3himPwqTX72ifvwdOoho1p
 iVyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nnRQ2Whn
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 254
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

README.md hash changed due to syntax fix:
https://github.com/systemd/systemd-stable/commit/49ddb4757b197b303309b0dcdfc5f858f4b8e168

Remove no longer supported/required valgrind config option.

Disable new unsupported passwdqc config option.

Disable new unsupported ukify config option.

Disable new unsupported xenctrl config option.

Update systemd-boot config options to new format.

Add new host-python-pyelftools systemd-boot dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 29 ++++++++++++-----------------
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 00c08edcd9..10f4bc04fa 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  cf2d27e67663d599a045101c7178cf0ec63d9df2962a54adf7de0d0357724f00  systemd-252.4.tar.gz
+sha256  18db69c8fc33afebf95a40cfa3769df5f0e4a07bccdebd33b2fd81c8b75e7a02  systemd-254.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
@@ -12,4 +12,4 @@ sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  da9b2c7b8cd10516fd2c4279b82496ea61787148f13e899c62fc8988c5fac34f  LICENSES/README.md
+sha256  8ccb649d1fc1103e5726612cf303f05d4eb86b7ab46d9f630009dd32e87612e2  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 63467171ed..0aa1da3fb8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 252.4
+SYSTEMD_VERSION = 254
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -82,6 +82,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dmode=release \
 	-Dnspawn-locale='C.UTF-8' \
 	-Dnss-systemd=true \
+	-Dpasswdqc=false \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Drootlibdir='/usr/lib' \
@@ -96,7 +97,9 @@ SYSTEMD_CONF_OPTS += \
 	-Dtelinit-path= \
 	-Dtests=false \
 	-Dtmpfiles=true \
-	-Dumount-path=/usr/bin/umount
+	-Dukify=false \
+	-Dumount-path=/usr/bin/umount \
+	-Dxenctrl=false
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
@@ -215,13 +218,6 @@ else
 SYSTEMD_CONF_OPTS += -Dfdisk=false
 endif
 
-ifeq ($(BR2_PACKAGE_VALGRIND),y)
-SYSTEMD_DEPENDENCIES += valgrind
-SYSTEMD_CONF_OPTS += -Dvalgrind=true
-else
-SYSTEMD_CONF_OPTS += -Dvalgrind=false
-endif
-
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
 SYSTEMD_CONF_OPTS += -Dxz=true
@@ -575,13 +571,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
 SYSTEMD_INSTALL_IMAGES = YES
-SYSTEMD_DEPENDENCIES += gnu-efi
-SYSTEMD_CONF_OPTS += \
-	-Defi=true \
-	-Dgnu-efi=true \
-	-Defi-ld=bfd \
-	-Defi-libdir=$(STAGING_DIR)/usr/lib \
-	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
+SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
+SYSTEMD_CONF_OPTS += -Defi=true -Dbootloader=true
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
@@ -594,7 +585,7 @@ define SYSTEMD_INSTALL_BOOT_FILES
 endef
 
 else
-SYSTEMD_CONF_OPTS += -Defi=false -Dgnu-efi=false
+SYSTEMD_CONF_OPTS += -Defi=false -Dbootloader=false
 endif # BR2_PACKAGE_SYSTEMD_BOOT == y
 
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
@@ -812,6 +803,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhibernate=false \
 	-Dldconfig=false \
 	-Dresolve=false \
+	-Dbootloader=false \
 	-Defi=false \
 	-Dtpm=false \
 	-Denvironment-d=false \
@@ -826,6 +818,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhostnamed=false \
 	-Dlocaled=false \
 	-Dmachined=false \
+	-Dpasswdqc=false \
 	-Dportabled=false \
 	-Dsysext=false \
 	-Dsysupdate=false \
@@ -868,9 +861,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dinitrd=false \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
+	-Dukify=false \
 	-Danalyze=false \
 	-Dlibcryptsetup=false \
 	-Daudit=false \
+	-Dxenctrl=false \
 	-Dzstd=false
 
 HOST_SYSTEMD_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
