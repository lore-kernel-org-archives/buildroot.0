Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC6C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 14:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F31B540338;
	Sun,  7 Jan 2024 14:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F31B540338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKJ1C66D9sj0; Sun,  7 Jan 2024 14:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09E7640347;
	Sun,  7 Jan 2024 14:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09E7640347
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE3F1BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 14:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BBD940347
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 14:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BBD940347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVEZnvUe2Red for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 14:19:08 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FE8F40338
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 14:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FE8F40338
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e43e48a16so5086975e9.2
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 06:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704637145; x=1705241945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JUN1Tke4XvXKwfxFRn3g8S4dSKRWN7YlB8kbPdfaKzg=;
 b=YZXe5PDtWE5oMrW7y+yVBJU5HdNzu+k7/QoYosBTw9d/n3w9nurYqDNvghoZmaH8Gn
 mdF/XYmY68rkQgRUqJpkdhX9XSMEi/FTXO1Rii7XRSNvmm+XknfH86Z/5i/s+QdLIEwR
 yVcHrkPLZYP4EC34w9tTaKY4C14SGuBmVLhEuZhwaguz7KIT6E5AjEUi8PfVI8AXHp2w
 5ixNxJNIHxKsr8vSwxc8QUDqJuOuK2031EEVt+Qb1iyGqtxXZrBZJMZ1HRPI6eeL7xrV
 xGdqmE9FR0z45LiSIRK93x5yxEx0RJ9bT3FcbsmlVo9RnCaglOESoaOwBMP+arCSTPHs
 LVpQ==
X-Gm-Message-State: AOJu0YzMzOpbtUTuW3AN2/hcZTp8aKP74xMZfQY72JeHleq1NUKLaWSP
 HRpQB3NivJW8Qg2Lwq2jHi7jok0ySqY=
X-Google-Smtp-Source: AGHT+IH+OA3RBMU+9njGhkYthhq2/l8sDM7ssw3JT9QuPSFMG2QJ9+LFbaKHsdHWg6ovi5WWw3MjCQ==
X-Received: by 2002:a05:600c:1990:b0:40e:3655:590d with SMTP id
 t16-20020a05600c199000b0040e3655590dmr1278223wmq.123.1704637145343; 
 Sun, 07 Jan 2024 06:19:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d50cb000000b00336ebf27d59sm5419676wrt.78.2024.01.07.06.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 06:19:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 15:19:01 +0100
Message-ID: <20240107141901.3834463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704637145; x=1705241945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JUN1Tke4XvXKwfxFRn3g8S4dSKRWN7YlB8kbPdfaKzg=;
 b=CBoUAiFr2AD9sqYs9FCX3TCfc41gtei208DO94eIWfiNsh3ifvZWPrPQxnbf1IMn6h
 kWRk8Dgkyi3K6iELMITCxM6E2uTC3BtK/aFfKVekZBU4fQl7sgLWqHiWPfKbDn53ol+b
 sKYC9RZaEkgloEwPeWQ9kRxQqx1Q3rZDfa59hqQG7m0FHhephA1H8glDY9GV1maxo4Z6
 zwnE+FNEjws0lm9KWOYAP3ToTvrrryl0ri9Gi5bfrwYszsQKR8Rq/0OuHfMHfzMKJKOc
 RZSAd4RCXr8mII3N3qavMoLi4Y6EfGkKU6RUx26DNlvPofhdbgtQuyfGBJIXJ9QG2Rbd
 N/Ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CBoUAiFr
Subject: [Buildroot] [PATCH 1/1] package/lvm2: fix libaio handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libaio is only needed for standard install

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/Config.in | 2 +-
 package/lvm2/lvm2.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 577a90656a..e1df71ee2f 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LVM2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_STATIC_LIBS # It fails to build statically
-	select BR2_PACKAGE_LIBAIO
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and
@@ -26,6 +25,7 @@ if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
+	select BR2_PACKAGE_LIBAIO
 	default y
 	help
 	  Install the standard suite of lvm2 programs. When this option
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9caf99eb9b..474ea30bdc 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
 	--disable-nls \
 	--with-symvers=no
 
-LVM2_DEPENDENCIES += host-pkgconf libaio
+LVM2_DEPENDENCIES += host-pkgconf
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
@@ -49,6 +49,7 @@ LVM2_CONF_OPTS += --disable-selinux
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
+LVM2_DEPENDENCIES += libaio
 LVM2_INSTALL_STAGING_OPTS += install
 LVM2_INSTALL_TARGET_OPTS += install
 ifeq ($(BR2_INIT_SYSTEMD),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
