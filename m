Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E22DC6FD1C
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 23:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9640541C85;
	Wed, 22 Mar 2023 23:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9640541C85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkieyYuFsMqF; Wed, 22 Mar 2023 23:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE22541C82;
	Wed, 22 Mar 2023 23:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE22541C82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAE411BF488
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 23:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 929D441C3F
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 23:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 929D441C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s09ipLf7xw3R for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 23:15:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9173C41C4E
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9173C41C4E
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 23:15:17 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 e12-20020a4ada0c000000b0052cdbbdc803so3275634oou.2
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 16:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679526916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PdPPsHlsdn5O00OrfvY2jLgX9ZGwXND1jXRjMWYIp6w=;
 b=dqRQZmpRT1Pk/MNjfwHH+JRc7zEeicIC2t6UC7hem8xIz+bJAtx35PXsLwzz2pKiaM
 6Ie9kvci4OFBkVyV/l3Wx1XS3TngvZrBVvEpZ6VK/Dd8n+OpnTs1BzBQZ8iLbJu8dFXG
 t52jSI0IfuEn6EQMGowvlGdGIO9K1UePjp5064e94eZrfYAz2w+w3anCf5yDfQlnNMrp
 gfC9EAPEJBqktbrc2vM9D3whd31LlIaGjR17Qn20GfHRGBPAUoZfccX3QeGHYK4i5ROk
 /SUMLprLyH+ewRsCblOn1Wglr78KqWFXbU0ETII7RSCARqdMNFpsbr4oBuDiNUTwvwBP
 sMaA==
X-Gm-Message-State: AO0yUKWiWfJ/BHptpRPGUy/w0MybQ0C9P3aL9PnX3DqzF+6XbMi3QuRe
 bdMotrSQud3TleAY8/YexY3x17tUgBQ=
X-Google-Smtp-Source: AK7set/3nbQk3mMhaJMevX86bDuPHXB9DyF8gtOTALYS0MZu2MMbRpGff7k7ccvq1T1t7qcbmh1Hcg==
X-Received: by 2002:a4a:37cc:0:b0:537:b1ad:1c7c with SMTP id
 r195-20020a4a37cc000000b00537b1ad1c7cmr2192643oor.0.1679526916496; 
 Wed, 22 Mar 2023 16:15:16 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a4a98c1000000b00524f47b4682sm6573311ooj.10.2023.03.22.16.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 16:15:16 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 20:15:11 -0300
Message-Id: <20230322231511.551442-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679526916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PdPPsHlsdn5O00OrfvY2jLgX9ZGwXND1jXRjMWYIp6w=;
 b=AChxhUAJRwv27awFroVMJ/eVZImmaSSpEEhid9as6xLqCJYY4y5npri0ikLg5EHTjU
 TNW+N+eV1caeMSyb58wg6VFwVt3OpHN0PsBBnsI1WnMCZqYOqBCcZu48+nOmNvZBJCRN
 spjrQDIwNtW849M+ZRMhA5mElZLdA0aA/QZzBtHt24o9DQA460vApKxVrXO62ip5UypK
 KzEDinw3RJFQFyHHrnh/0BpbUra1cMnBoVmzmEWUiKoTM1hKwBj9Z24pq34tvqmKavkr
 /ePOxp6JM7NV/bVPbG1QBkHHCkfOeSPwm4+7dT6XpeY7slr1wCTS5WX6vQU1kA9TTbZX
 icgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AChxhUAJ
Subject: [Buildroot] [PATCH] package/qemu: allow building only the guest
 agent
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

Most of the tools are useful only on virtualization hosts. After the
upgrade to QEMU 7.2.0, it is possible to build only quemu-ga, which
makes more sense when we build guest VM images.

Also do not build the other tools by default if none of the emulators is
selected, since the user does not necessarily wants them. Ideally, it
should not be possible to select qemu without selecting at least one of
the subcomponents but it is hard to guess what the user wants.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
NOTE

This was also possible on older QEMU versions, but required a trick to
force compiling the code required to link qemu-ga without building the
other tools:

   ./configure --enable-system --target-list="" --disable-tools --enable-guest-agent
---
 package/qemu/Config.in | 8 +++++++-
 package/qemu/qemu.mk   | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index a446c0cf68..6a9b08648d 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -26,7 +26,6 @@ menuconfig BR2_PACKAGE_QEMU
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_QEMU_TOOLS if !BR2_PACKAGE_QEMU_SYSTEM && !BR2_PACKAGE_QEMU_LINUX_USER
 	help
 	  QEMU is a generic and open source machine emulator and
 	  virtualizer.
@@ -358,4 +357,11 @@ config BR2_PACKAGE_QEMU_TOOLS
 	  Say 'y' here to include tools packaged with QEMU
 	  (e.g. qemu-img).
 
+config BR2_PACKAGE_QEMU_GUEST_AGENT
+	bool "Enable guest agent"
+	help
+	  Say 'y' here to include an agent to run on guests, which
+	  communicates with the host over a virtio-serial channel
+	  named "org.qemu.guest_agent.0".
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3cbeffe213..4194670bb0 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -165,6 +165,12 @@ else
 QEMU_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_GUEST_AGENT),y)
+QEMU_OPTS += --enable-guest-agent
+else
+QEMU_OPTS += --disable-guest-agent
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
 QEMU_OPTS += --enable-fuse --enable-fuse-lseek
 QEMU_DEPENDENCIES += libfuse3
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
