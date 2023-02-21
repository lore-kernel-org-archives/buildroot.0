Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8C8C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FBF440FC2;
	Tue, 21 Feb 2023 14:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBF440FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGZzcqe95g0L; Tue, 21 Feb 2023 14:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C53D740407;
	Tue, 21 Feb 2023 14:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C53D740407
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 315AD1BF2F0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B79D40407
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B79D40407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_92EaEAKd1y for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:21:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE80740339
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE80740339
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:21:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id j3so1431669wms.2
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 06:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6kDBkwGrX2HgK2XEfBUGS+FLNrXkSHCl40EN9OpGkI=;
 b=m2w/3D70Hz0c+Iz6L9rrFnOcQQsKIESEZYFn6X3tyT2WOKxTzm9icjvsnVmH1rKKFL
 CwZavkMnbAcu6weauOgITqTOkaVDu/lZs32dFkbpWXC59FFjrKRPfG5rne2kQ2hpG1ED
 6EGJrqSd5wK12ngRG1hi57BOcqn0lBQQ/kfMwuIfT+cDTHVTnOZi812ctOFCbTRzlgfB
 xoSw3IT4giqdVHNwkwuH4UzebKsOSCWC3+JtCKuakoFE57f594IDtOHdyUvXLC6HLcQU
 gJ2KotpIjttW3wsugT1Hm/uxKljMZyuQ+7tk9Um8aIfEV0jvsekV4tIZH+gZcdIAqqbn
 I5XQ==
X-Gm-Message-State: AO0yUKWv1W7MYlmYfA7QyqCaxrrC87Qt7+0qBGcpnCe5ZMdYjEU8CRtV
 C6zkMhpS6UhUDERIj5CtMdBXBf7XBbQ=
X-Google-Smtp-Source: AK7set++8YUTTAx9Z6vk6fLnKIdQpZebuwyEUWNIEj1mYD2QlIDMBz3qmgr5DCGYvTD0Ckqa+4D/VA==
X-Received: by 2002:a7b:c3d1:0:b0:3dc:51f6:8f58 with SMTP id
 t17-20020a7bc3d1000000b003dc51f68f58mr3455610wmj.6.1676989307469; 
 Tue, 21 Feb 2023 06:21:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n24-20020a7bcbd8000000b003dc4aae4739sm13188228wmi.27.2023.02.21.06.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 06:21:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 15:21:44 +0100
Message-Id: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n6kDBkwGrX2HgK2XEfBUGS+FLNrXkSHCl40EN9OpGkI=;
 b=IU4twpRaPT2vxaLtaM/VczYa+5SPAWYhUOrj0te0jUIH5ap9tq/77BvYhgiOcOACAl
 jD93O98eah3v1VUlE+A9svty3R5IqjlAs8wQ4Tlwsq+dBgySvGntkMy3JHLVd/0QT7no
 VnDRTOO2z4Jjl7i231fCf/Ujsy8P2yAy8v5B41qyQsIWXeb9w2eDD3hMOzCeCHINwAnu
 pfNFfwSFbuewVoi7syIArmexneE8rSYPiNs6NOsDikHPRvPy7B0u739yQIzzarvlEYGq
 UEnvqWe8U+bM+VWItF9K2GrUDu7rMYaV34/ajzUWLFZVG1UzrbuY4ceCY5oxjsnLbM7G
 kCeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IU4twpRa
Subject: [Buildroot] [PATCH 1/1] package/systemd: disable with -Ofast
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd can't be built with -Ofast since version 252 and
https://github.com/systemd/systemd/commit/60f97fee2d2f948c8e8963ea8ff767008cb93cae
resulting in the following build failure since bump to version 252.4 in
commit a2c823d1f548d5a0120d27d6c000603192360f7b:

../output-1/build/systemd-252.4/meson.build:397:8: ERROR: Problem encountered: -Ofast, -ffast-math, or -ffinite-math-only is specified in c_args.

While at it, revert changes made by commit 9cd084b54e2223e49c37962b0cbefae7bea26ef5

Fixes:
 - http://autobuild.buildroot.org/results/8f41c4984b645851724e554c3162b83bc312bee7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/Config.in  | 1 +
 package/systemd/systemd.mk | 5 -----
 system/Config.in           | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 9f4d933779..5bbdbb405f 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
+	depends on !BR2_OPTIMIZE_FAST
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cce9162f6d..edba8c2677 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -98,11 +98,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dtmpfiles=true \
 	-Dumount-path=/usr/bin/umount
 
-SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
-ifeq ($(BR2_OPTIMIZE_FAST),y)
-SYSTEMD_CFLAGS += -O3
-endif
-
 ifeq ($(BR2_nios2),y)
 # Nios2 ld emits warnings, make warnings not to be treated as errors
 SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
diff --git a/system/Config.in b/system/Config.in
index 1ca7690ea3..8a8b198fcd 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,6 +127,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_OPTIMIZE_FAST
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
@@ -140,6 +141,9 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and targe
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
+comment "systemd can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
+
 comment "systemd highly recommends Linux >= 4.15"
 	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
