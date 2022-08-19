Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E94C28B2B
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 17:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46A8741D3C;
	Fri, 19 Aug 2022 17:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46A8741D3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eF5K1LnhFFpL; Fri, 19 Aug 2022 17:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA71A41D33;
	Fri, 19 Aug 2022 17:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA71A41D33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61DC01BF366
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3598C41D4D
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3598C41D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Vog1G3HNLP6 for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 17:51:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F14EA41D22
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F14EA41D22
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 17:51:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m10-20020a05600c3b0a00b003a603fc3f81so2843851wms.0
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 10:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=V55YnTUZMeABWys6wJ2NgAIRqvUS7+vIgyKGBlR5alM=;
 b=SSuBsysDfyRTuu7RlLyhkm/3Iy+Dq+DnqFR7vyQJ+JOJEk2P04I7RNwY2nQyqGOchW
 BgXTlRekZ6dvXealDelOuXJprASAEJZuulI3cL9Pk+f6XXVFBySim0CGd/D3qAFjP9Wc
 p8splBrtriS3lU/fKkfYGUCRd96kukxhDpL+hyftEFqp2d2PlXVT/IAB/tiGs/I+p+lm
 cUcoY8sTi9b76fuTU55iZ9rPLMEaYHy96UIByKYbOb+Ry2Psb/UW6+keNTurjYJUO1Ul
 fHvTgJgvfW5XqC5nw/7z5aFWiYEpavz1E8i6nQA3LSMKLrLXuMmodqJpsAaRRYEn05al
 P8pg==
X-Gm-Message-State: ACgBeo0BbMWy0J6llCSCeB3C0foq5IIg9XnpIP1FE7riBV1OqsisOP7j
 Df5dOmgz6+P+qwvEdhtX0xb+wIp7IUs=
X-Google-Smtp-Source: AA6agR7bW2dLtUPHCX27+1NDwq/NkzJCYtI4enfqwj/dVuhlnorT+Bc7gfKUcfCcrytXM9271I9T1A==
X-Received: by 2002:a05:600c:582:b0:3a5:4f7b:3146 with SMTP id
 o2-20020a05600c058200b003a54f7b3146mr5456610wmd.152.1660931464122; 
 Fri, 19 Aug 2022 10:51:04 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:54a5:9a99:1f8c:15e1])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm8937295wme.8.2022.08.19.10.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 10:51:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 19:51:00 +0200
Message-Id: <417c53083693347f5c22298c49c8ff9df1f35d0f.1660931225.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660931225.git.yann.morin.1998@free.fr>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=V55YnTUZMeABWys6wJ2NgAIRqvUS7+vIgyKGBlR5alM=;
 b=JEl7ZwwT/THPW+c6paF0QRTEq6zW8RixBA8RPX95fe7nFCei9nLvFExk5EXjVmxcE+
 GKQ3uHVoK+Kg4T6EBxLtrIkVAe2lNvkWDtEegm5eGXr62mphma+swxclOGZDyVj+i2Wo
 tSAkAQajV21rL4P3wQqNXyc2lOxiSO28YkUaXGFzWOl5SAsXRLEqMuR9cGyBwjEj0YSe
 klBMLT3F5BT6qGw0ySkYmGotyIsmIU3xnDdWy5bZTnC411yHSj/h4vwtBsLhNDtjpNQ7
 cQtApt+ajJHC9/pb0RdoPUwHZFkCyUu2dd4f4581yp3hoVT0XrRj/l7tNb4oqCa/tdQY
 vUTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JEl7ZwwT
Subject: [Buildroot] [PATCH 3/4] fs/cpio: accept a list of dracut.conf files
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

It is not unusual that projects can target multiple boards, and in
such cases, a lot is shared between boards and only the low-level
stuff differ.

Allow users to specify more than one dracut config file to cover
tose cases.

dracut does not accept more than one config file with the -c option,
but it can load more than one from a directory with --confdir. So,
we copy all the config files to a temporary directory and se that as
--confdir. However, we can't drop passing -c, or dracut would read
the system-wide /etc/dracut.conf (not sure if ${prefix} is even used),
which we do not want. So, we use an empty file as -c; /dev/null comes
in handy as an empty file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 fs/cpio/Config.in | 12 +++++++-----
 fs/cpio/cpio.mk   | 19 ++++++++++++++-----
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 861e9a929e..94a826f9e4 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -29,13 +29,15 @@ endchoice
 
 if BR2_TARGET_ROOTFS_CPIO_DRACUT
 
-config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
-	string "dracut configuration file"
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
+	string "dracut configuration files"
 	default "fs/cpio/dracut.conf"
 	help
-	  Dracut configuration file. It determines which parts of the
-	  rootfs get included in the cpio image. See dracut.conf(5) or
-	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
+	  Space-separated list of Dracut configuration files. They
+	  determine which parts of the rootfs get included in the
+	  cpio image. See:
+	    dracut.conf(5)
+	    https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
 
 	  The default configuration file is suitable for busybox init.
 	  It doesn't, however, pivot_root into a full rootfs.
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index fa66b1c710..d671c337df 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -50,9 +50,14 @@ else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
 
 ROOTFS_CPIO_DEPENDENCIES += host-dracut
 
-ROOTFS_CPIO_DRACUT_CONF_FILE = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE))
-ifeq ($(BR_BUILDING):$(ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
-$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
+ROOTFS_CPIO_DRACUT_CONF_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES))
+ifeq ($(BR_BUILDING),y)
+ifeq ($(ROOTFS_CPIO_DRACUT_CONF_FILES),)
+$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
+endif
+ifneq ($(words $(ROOTFS_CPIO_DRACUT_CONF_FILES)),$(words $(sort $(notdir $(ROOTFS_CPIO_DRACUT_CONF_FILES)))))
+$(error No two dracut config files can have the same basename, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
+endif
 endif
 
 ifeq ($(BR2_LINUX_KERNEL),y)
@@ -63,10 +68,14 @@ ROOTFS_CPIO_OPTS += --no-kernel
 endif
 
 define ROOTFS_CPIO_CMD
-	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
+	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
+		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
+	)
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
-		-c $(ROOTFS_CPIO_DRACUT_CONF_FILE) \
+		-c /dev/null \
+		--confdir $(ROOTFS_CPIO_DIR)/confdir \
 		--sysroot $(TARGET_DIR) \
 		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
 		-M \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
