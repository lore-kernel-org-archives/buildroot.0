Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D5CC021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3837280CAB;
	Sun, 23 Feb 2025 21:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rt9BWzVyaXl; Sun, 23 Feb 2025 21:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3758980CB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3758980CB0;
	Sun, 23 Feb 2025 21:14:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA1AD920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA9E480C19
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kywOhFsfEiSi for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48D3780BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D3780BC7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48D3780BC7
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso23872585e9.2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345275; x=1740950075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=qy+TuIKTIw29BbLwHLZmYht+QAb75sjSuVNB8W4H5jP+yTdF/lqiSHCzAfPAnGD1uE
 kC+m1+MdUzAU1asdDNHyGku3nZ/1D02mXilxGISO3P5GmnEDTUKPxyIlNFpF6h56KrSu
 kbSzh7+lueTERl8kg24TLfG7VLAuxeBxGoPr00UCJDd6TQ6wc9CvO6FAkExNH8GfQFkw
 8pdltjsXYjOXt88x7v/uBJNq8fIO/ebBreJaUtSQQQdwTbUrObmTQWqWmFs7RyFOsbOv
 3JagmPvxvXgFFRHom/Wb2PoWacZb38SFqfRk3hz9RRx8gFEpck7jjN0YVfpftsFTEu9H
 Ju1w==
X-Gm-Message-State: AOJu0YyL4/FIvXJ449rbDMZ6T4OHSuVdJ2KPFp9f2xyz2IM/aYXlNlke
 MdbaPVeEBXgp0QvWNdQcjGfwQKNsBlJF3BPoXALaQxeY9A2gG4RZTAxG3Q==
X-Gm-Gg: ASbGncvlqpX+GM2iXr3IzyEFMfDsy5NxgGyuQK41dTof22uikKweZWhhgiTktZi3Oav
 rP7IVIE6JtVOIiBhyYw1JKvu3RnoXwwxbn/jzHymufJtquwJ/DpOVGH+dP/pAjw/iHIAe8SBk0C
 TH0AgfQ+nodwGuUdwAfLS1LNVAzpgCx8cXYgXps8xmnaNh/eyBZsJEdJe6ca0fs8gBt9DGHIQX5
 f0bEq7VXMI7ReK8SpOhX+miU106Eyinnq2bDRbb62CL81etflPfKAxOZE5iRedLuuZmDX6qWZ9Y
 6D3b6frn1U/kYdCHPek8onEGkcREhl0mm7BX
X-Google-Smtp-Source: AGHT+IGf/z1Fqq4BKdjwCKNj91ioTccW34Np/DpAXH9p27jdEwYnqXud1gDOmUrayS4yQXuwR8+rGw==
X-Received: by 2002:a05:600c:350a:b0:439:8e3e:b0d6 with SMTP id
 5b1f17b1804b1-439aeb2ab04mr79541885e9.13.1740345275094; 
 Sun, 23 Feb 2025 13:14:35 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2025 22:14:29 +0100
Message-ID: <f098c7594e5cef3996e18d3dcc5eef97f2140c1e.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345275; x=1740950075; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=gMi9u4t2zVkP5VGvfLl527zZqlBCXT5tyHf3xHi5EMvzgcQUoqWgX9ikNah8d7HoYA
 ji5EG1OSjczU57Iu3dVpB88USIoJKm3vFxqyci9bjKI9TNrNzz1Li1oQLmlGg/gqIEym
 GC5DcnoC/OtanuyQb3ml4tAETHkQUZHUQEEA+bj7688s7b2JJW9b5amYMiWkcMh7pqzX
 NOms6f04H75y3m1AdWGg01gvhSs6oHh94gllP1xhk7HKfvm+rxuTTkzirURHOr5+3VLn
 0QIlXP71IlslgtGlGbhj8ekdfHpyRcqfR3vqb7+ZnZvrjJQfGnSC3AsmgdUCy+HRHBj1
 QxRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gMi9u4t2
Subject: [Buildroot] [PATCH 5/8] package/cgroupfs-mount: tweak the kernel
 config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When it was introduced in 2016 with commit 0e1547a87cfd (cgroupfs-mount:
new package), we did not yet have the infrastrucutre for package to set
kernel config options, which only came 4 years later with commit
0aed4c2dae76 (linux: allow packages to set kernel config options).

So at that time, the requirements for cgroupfs-mount were documented in
the help for the Kconfig symbol.

But now that we do have tha infrastructure in place, actually use it to
set the required options, and drop the list from the Lconfig entry (that
would be duplication, prone to bit-rot with time, and other packages do
not document their requirements in LKconfig, they just use the infra to
set the options).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cgroupfs-mount/Config.in         | 12 +-----------
 package/cgroupfs-mount/cgroupfs-mount.mk | 11 +++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/cgroupfs-mount/Config.in b/package/cgroupfs-mount/Config.in
index 0b2e4ba1e7..29a40c93d1 100644
--- a/package/cgroupfs-mount/Config.in
+++ b/package/cgroupfs-mount/Config.in
@@ -4,16 +4,6 @@ config BR2_PACKAGE_CGROUPFS_MOUNT
 	help
 	  cgroupfs mount and umount scripts.
 
-	  requires a Linux kernel >= 3.0 with the following options
-	  enabled:
-
-	  - CONFIG_BLK_CGROUP
-	  - CONFIG_CGROUPS
-	  - CONFIG_CGROUP_CPUACCT
-	  - CONFIG_CGROUP_DEVICE
-	  - CONFIG_CGROUP_FREEZER
-	  - CONFIG_CGROUP_WRITEBACK
-	  - CONFIG_CGROUP_SCHED
-	  - CONFIG_CGROUP_PIDS
+	  Requires a Linux kernel >= 3.0
 
 	  https://github.com/tianon/cgroupfs-mount
diff --git a/package/cgroupfs-mount/cgroupfs-mount.mk b/package/cgroupfs-mount/cgroupfs-mount.mk
index 5af87629ea..156d584266 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.mk
+++ b/package/cgroupfs-mount/cgroupfs-mount.mk
@@ -10,6 +10,17 @@ CGROUPFS_MOUNT_LICENSE = GPL-3.0+
 CGROUPFS_MOUNT_LICENSE_FILES = debian/copyright
 CGROUPFS_MOUNT_CPE_ID_VALID = YES
 
+define CGROUPFS_MOUNT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_CGROUP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_WRITEBACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)
+endef
+
 define CGROUPFS_MOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
 	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
