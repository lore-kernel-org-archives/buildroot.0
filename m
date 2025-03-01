Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E254C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D878542D43;
	Sat,  1 Mar 2025 15:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vnm5xSyRgT6K; Sat,  1 Mar 2025 15:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A09F42D20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A09F42D20;
	Sat,  1 Mar 2025 15:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68A27181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C2784C47
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laiOlw6S-5W6 for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1441C84C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1441C84C44
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1441C84C44
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so19690825e9.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841547; x=1741446347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=jjYbxuRkBHqc0TBdMDuGhV48vRVm7d1q2wDSH6+rDJtZBfwT8M05aHkl7QjskdpnxI
 dpWLyJpvEubSBDGu6/ferC8cTR0+Tt3QVVMHv8fVgOmsdsERRajb8TNIFZcahZLsDgUk
 xIjNcPJoNsj+w0d2gOzJC+yJOPrVwlMwfHBdtsdXZ8Ul+HSuzBA05nmKc2LjFlMFp99/
 TM8+zAwT+0j1IbZQ5Zlau34nvOQnJWWQuQQz4XefuwGPMVikRH8Y/NWx5SyuUkDHFkDW
 A1KKk/75CSSY3BzSaJTkBMWz4sDW2j1WH/UpWkHbSHtTunB8BY2rt1Rg7t1z58TAxs8a
 eg1w==
X-Gm-Message-State: AOJu0Yz2iGpaeOMIHLU6A+qwTHvwNkZQLnqif6lvjRC+iJPOyHBwTXwU
 w+Tuswl4Nc5sT3JWoVTUDIx6gQzstd3fNeiWZnu8HSXh27IWZxhh8c3/+w==
X-Gm-Gg: ASbGncvk0PPn52UM3y7HOUM5uiDskNT0rjiBpJTNsS9V6dufHJIlQFs8c02XKPYs5QO
 11CAoXPb3dxLTYd/bBgOjrKeSJL6gN8yhU7qvkvM4QtDzb32guDfnKBpEk+vn10GGu2j4upFbnK
 udboSKsDPeE0j5gzvs/sBQjitgQwyIKLvEDOk4gS13dKxb+I6mOSP+4yf4maoG8z6c3X8MBBKnR
 4kFfBb7v671hMACssZ+7Uuhx9LQKy89zGZDfZy5m/lR4SVZkBbm5+m1oGKBSbq4E2Hcbg3b/y8I
 CFGrq7qfPLLKzYrK+TEfPTQE3VRh0zWmKAbukxQQRGmwD05SLea2kCA=
X-Google-Smtp-Source: AGHT+IGYgYc7QH7Acz5HdPyR8fVg9cynRXGvW7Cyile9yqAlby/5+fzuji8vuBKiNnmV8K1prGPrDQ==
X-Received: by 2002:a05:600c:3513:b0:439:9f42:c137 with SMTP id
 5b1f17b1804b1-43ba66e218emr69492485e9.11.1740841546988; 
 Sat, 01 Mar 2025 07:05:46 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2025 16:05:41 +0100
Message-ID: <1c1b6bc9fed9219fa289a40ad76aec2239e390d7.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841547; x=1741446347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=P0/aiWXQPtkFpVTA9tnLj5RcSmOpEPGe7zPid+mogKzJq6n+20kA6/ZXV01tsXZGo+
 gENF5ipSZoyrnIyD8iPUPtD94UiBfRbfpB6VJMceZlyuaVZ6BxwBQ2pXo6zzYJLuMm1P
 P89E0e+Fq3vI/w9/GC4gRfp+JChCIfog38v5PRYUpT2sfCXR0RJAa2WbGyIeaMw52zl9
 TvY8a3Z+AR8x0c6wuwIErV/g37jJaixNva+Xz7o/Bs4DGq8agO/xDobwYfGI6HeYljGM
 Nn3+sFeRA6x7nWpmaUrlKhfZqCM1SrCfE6gKCmGSEHxB5c0YHP2LvLkCpGcI9Mafv0l5
 FcxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P0/aiWXQ
Subject: [Buildroot] [PATCH 6/9 v3] package/cgroupfs-mount: tweak the kernel
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
