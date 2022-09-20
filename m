Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55664C6FA90
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 18:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECC6F82862;
	Tue, 20 Sep 2022 18:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC6F82862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2XpenrsuKTC; Tue, 20 Sep 2022 18:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ABC282848;
	Tue, 20 Sep 2022 18:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ABC282848
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C56C31BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 18:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD2D940C6B
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 18:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD2D940C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yQDjZTxxaBf for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 18:37:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8BDA40A62
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8BDA40A62
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 18:37:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n8so2708549wmr.5
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date;
 bh=UECJuLsxhKO6mqN4lpR2zFvYtVeulgRBSNM0XEnT3sI=;
 b=RtkYuUvYAYXj0sT+oCDlBhC7lc5QAMLAJKBIJu9b6jBHZTfB3Fhy3v564r7uvejOp/
 Spu/oZ+AbFwGKQlXVG9N4Vc9hvK37wr4FQ3TcIjw4+nwUG8iXk7AJPnVFx4KgzN2nQoj
 l8ijE/uBEXWDNr925BaDCdu01aZQs1MwG6EgTYnyDjMHq8CvcF6zxx72u063sdiWi1Ip
 ZSkw9e3dNgbUnNsFPXmcc8ecPp/wq0DHzLovwsX31tugSMCcusDrhh3C2i3U18sc7srV
 4TACzk1/i8rwluBkDoB+Rm14TIn/XKJe8UAYSIK3qs9zojtAuMY5qZqsB8/Vr1dL8MhS
 JEqQ==
X-Gm-Message-State: ACrzQf2l6VQc7v8EjcNrlkhH6qncqszzPnA7od/Oor/VouLZljkwUtlX
 QzmB5YJyOFYoHeO9jfEVRxF8eZ4Vnnc=
X-Google-Smtp-Source: AMsMyM48GD5bO4rooj5ZEZ4x4WXPsLNof8JOBrTY2uKBFMOHwIIsuIn4rJNATsoEt/qSmlgQRIXJ1w==
X-Received: by 2002:a7b:c2a2:0:b0:3a8:4959:a327 with SMTP id
 c2-20020a7bc2a2000000b003a84959a327mr3429046wmk.50.1663699033103; 
 Tue, 20 Sep 2022 11:37:13 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b795:8a2b:1e98:bedc])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6106000000b0021e43b4edf0sm533636wrt.20.2022.09.20.11.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:37:12 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 20:37:11 +0200
Message-Id: <cae74d308371337c0e53569f3c391bd980ba081b.1663699017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663699017.git.yann.morin.1998@free.fr>
References: <cover.1663699017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
 bh=UECJuLsxhKO6mqN4lpR2zFvYtVeulgRBSNM0XEnT3sI=;
 b=ZGR+hhobNPFlX0uBaAysPkpoOUtP/b6GoILUed/rr6d3uUZ8Z5aixasmG1HelCD5Mt
 5v74oPGWiAVG+RyJb9OBqUUVrGDVpYoll9CrRr61lxp6ybynZZZnGEj+fuU3W6OUGR/n
 h0fTxp+da36J+E8lFml4ST1KMVPU8gG8FJj5QVug6yCNNCYve2e2cqV21SEb4JMEaTb1
 1riKUifu/aAoT3EhDa+rBJdFUoZVUFnk9THCE21FJCpRUqMKmUVwUeF58W8jxzxxtTmz
 byxX5HdW9/1+woUJaWt6Nxm8sPgdEerhyX5bN0jhqF33eDwgP2ZNm+fTOR5h9S6hsBug
 +S5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZGR+hhob
Subject: [Buildroot] [PATCH 1/2] fs/cpio: allow users to provide their own
 dracut modules
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dracut modules can only be looked for in HOST_DIR/lib/dracut/modules.d/
as dracut does not offer the possibility to look elsewhere.

Installing files in HOST_DIR/ can do done either from a host-package, or
via a post-built script; there is no overlay like there is for target/.
This is a bit cumbersome.

Additional modules are most probably developped in a relatively tight
loop with the configuration files, so it makes sense to expose both
close together.

Add an option to the fs/cpio filesystem, so users can point to a list
of modules to install.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 fs/cpio/Config.in |  5 +++++
 fs/cpio/cpio.mk   | 12 +++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index bec2d9dca2..4d38276c88 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -29,6 +29,11 @@ endchoice
 
 if BR2_TARGET_ROOTFS_CPIO_DRACUT
 
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES
+	string "extra dracut modules"
+	help
+	  Space-separated list of directories containing dracut modules.
+
 config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
 	string "dracut configuration files"
 	default "fs/cpio/dracut.conf"
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index d671c337df..04c8f49013 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -50,6 +50,13 @@ else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
 
 ROOTFS_CPIO_DEPENDENCIES += host-dracut
 
+ROOTFS_CPIO_DRACUT_MODULES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES))
+ifeq ($(BR_BUILDING),y)
+ifneq ($(words $(ROOTFS_CPIO_DRACUT_MODULES)),$(words $(sort $(notdir $(ROOTFS_CPIO_DRACUT_MODULES)))))
+$(error No two dracut modules can have the same basename, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES setting)
+endif
+endif
+
 ROOTFS_CPIO_DRACUT_CONF_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES))
 ifeq ($(BR_BUILDING),y)
 ifeq ($(ROOTFS_CPIO_DRACUT_CONF_FILES),)
@@ -68,10 +75,13 @@ ROOTFS_CPIO_OPTS += --no-kernel
 endif
 
 define ROOTFS_CPIO_CMD
-	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir $(HOST_DIR)/lib/dracut/modules.d
 	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
 		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
 	)
+	$(foreach m,$(ROOTFS_CPIO_DRACUT_MODULES), \
+		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
+	)
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
 		-c /dev/null \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
