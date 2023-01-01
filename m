Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D4EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 14:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFEF9403BE;
	Sun,  1 Jan 2023 14:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFEF9403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0liDOc1yXRwg; Sun,  1 Jan 2023 14:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 073C24017B;
	Sun,  1 Jan 2023 14:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 073C24017B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFA781BF33C
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE3D4017B
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAE3D4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSSOd-hww9Mi for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 14:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF17A400E7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF17A400E7
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 14:32:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id ay40so18543393wmb.2
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 06:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByAljAPNTzjaAQRKimQedEWq6ZY0+4uoxhQw9LLeYNk=;
 b=7yq08bKNenGz/k5y0zJF5qyocJSLjL44P+gp1mhyY2ytRKj/i3x2//8UmE2A/L+DWO
 jawCzdtY4xS2pMkMsc3SPBgZbDflrn85Iog9At13Xh8Op9mdKpASfRv09vZNut9aQFiG
 pLDRVQMniielplF92CdpmY370ytVRmZn2Z7IJaYAnKLEcbIv9EGap8IFU5Y80crvmmbC
 8UgBU8tdl+VDtosCZ6rUp4csOt4AThGmiV7SFo0LpWWbwt773n/VFtfiYq+enAV9j6Dm
 Fa5VNwgmRaibOibeUtxE/vNQuvm+G1kzcFcCxJLwaEdxjvHHwC2XesKrWH2qxEL38IdV
 xnjA==
X-Gm-Message-State: AFqh2kr5MTeIqkxBJ+3I9JB1ZrgSOu4jQDvGH01pmd/9IiLyGLiBFM33
 1LQv1R06U6JVr1nEvaMDrxuAeJjQRf4=
X-Google-Smtp-Source: AMrXdXsCxMip+2ABYqufiitR/Qxr2ZHY/Lyl5JOwayU/d+8KsOsAtUzwzx7b58yqOb6CCPqpWWhxaw==
X-Received: by 2002:a05:600c:4998:b0:3cf:68d3:3047 with SMTP id
 h24-20020a05600c499800b003cf68d33047mr26684234wmp.41.1672583563067; 
 Sun, 01 Jan 2023 06:32:43 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:80ae:a953:659b:4560])
 by smtp.gmail.com with ESMTPSA id
 bh12-20020a05600c3d0c00b003cfa81e2eb4sm35545285wmb.38.2023.01.01.06.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 06:32:42 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 15:32:42 +0100
Message-Id: <20230101143242.187845-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ByAljAPNTzjaAQRKimQedEWq6ZY0+4uoxhQw9LLeYNk=;
 b=F10FnO+wtaCCc3eJ8uTxSxgiw4JAPLqqAI6qroWObK6Dktic0/PbCQZC+W8Sn31WVs
 VUjfwwjUASlwJ2V5Adz/K2SwKxfdAEnqxTJDxhzeVfWF9jgrV2EJw5yLOGmiWrI6mj4e
 +oIWxK9MaYnWb1KyDx4ugdUGEA2aLuCiLTyrT506Ld5ed8iVjR8Kc5vWKbfIIYBEtWZG
 RqFik3viEvw1LE7bKHK4gOk1DQf4RU7afmDhtZ6FhNSx7dvUJhk+iq0z01r4Tqd2C58R
 iju19A/Qm0+vOHOhz6hdPa38K8ZRDlxcolUoHwOpNpYSYqoRp1IrOAx2sFrzBDQBXa8V
 O+og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F10FnO+w
Subject: [Buildroot] [PATCH] package/qemu: pixman only used for system
 emulation
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we initially introduced the target qemu in 98e1a6b9619c
(package/qemu: build for the target (i386 or x86_64 only)), we
unconditionally enabled all the system and user emulation without
distinction, so pixman was made a mandatory dependency.

However, soon afterwards, in 68ec49acc7be (package/qemu: add basic
target selection), we added an option to enable/disable the system
emulation, but the dependency on pixman was not moved to that new
option.

Fix that now, and only depend on pixman when system emulation is
enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index f1631059c7..a446c0cf68 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -25,7 +25,6 @@ menuconfig BR2_PACKAGE_QEMU
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_QEMU_TOOLS if !BR2_PACKAGE_QEMU_SYSTEM && !BR2_PACKAGE_QEMU_LINUX_USER
 	help
@@ -53,6 +52,7 @@ comment "Emulators selection"
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable systems emulation"
 	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_PIXMAN
 	help
 	  Say 'y' to build system emulators/virtualisers.
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b38dde4308..d514a2285c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -27,7 +27,6 @@ QEMU_DEPENDENCIES = \
 	host-pkgconf \
 	host-python3 \
 	libglib2 \
-	pixman \
 	zlib
 
 # Need the LIBS variable because librt and libm are
@@ -45,6 +44,7 @@ QEMU_VARS = LIBTOOL=$(HOST_DIR)/bin/libtool
 # checks if the specified sub-set is valid.
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
+QEMU_DEPENDENCIES += pixman
 QEMU_OPTS += --enable-system
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
