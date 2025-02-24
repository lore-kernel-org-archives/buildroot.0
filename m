Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60508C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BEC6818D4;
	Mon, 24 Feb 2025 21:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzC3Qgr3M4Cv; Mon, 24 Feb 2025 21:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A9AA81911
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9AA81911;
	Mon, 24 Feb 2025 21:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A441531
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EED5D40BED
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2b1gOVtAPxil for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C027F40BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C027F40BC4
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C027F40BC4
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43948021a45so42764025e9.1
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432145; x=1741036945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=sa1f2FZju97Mpbtd72c04w+VPT/J9uHNfagRP4RectDU1H9KelbsQHBUPNfJ/5QEe1
 QtdSwp+VlioObfp9bCfFsmJSSmD6uiZ3wyHqkx9qKedSOrhAI2x9BwuxTFa37wlXYGm6
 yAb3L5gA73e3cgS2U/ax5XdItaxx9salR8L0Z2tH1NAtuk0Eq8HZRmwzj2RF2vHJrJ+j
 Dh1Lo4todpVlvxtHD2dRjw8m1W+uBUyrKT0zTlbLKodI4iKVhNr6U9MoPK3TmCcSjKvT
 A8Vf53KdqeSQpySQA29jg8UOGhvEivKuJvBpz1tvI7NvEpRqn+PITyVFMtelcK6CTP8N
 4KdA==
X-Gm-Message-State: AOJu0YwLBHTLY6wbYAwInOl/Eoab+afSX8i2f69uMOOE8XPDJAN++jIO
 hx2LWX70mtfulNPgL23Z8atXbOrUcWW00VIPr3OpCFJmiyZ/JH+NzCo7Ow==
X-Gm-Gg: ASbGncv5EpYgt8Yv+BcjmiNrZFM4p/qoCebo9uHBndnmHNLjoLXZ5a9cUV83gV8iSia
 g1OKubJTaNl6jlBCwoYyukHxJpoeqWRK64AxsZ78+8nLlI0i0NfMkYc4GTN0eus5dL0Kubuo23Z
 /Ul7VHUSh69KbbVg/VgIQvtcGXNS0qvOZoknBqfPSBtm2yYF9Fln24yxNM/69VK7n79hGSPsHw5
 ATKU/92a974Qnv6AkGGQ9XvSWZiUAQ6yVgNJLnLC4xfi+ydsEm433X6NJz9mX7cxviqLqEnk9J9
 6QWVwatcQx7J2J42X3k8HBxAP7iCsX3awcMU
X-Google-Smtp-Source: AGHT+IFnmewC2K7seNeR7xi1ylEtWa7knlWd3lPlU7Ic+C/ftyPl+tonHM9Eaqnn+kV/AHC0FOlxEA==
X-Received: by 2002:a05:600c:35d3:b0:439:88bb:d000 with SMTP id
 5b1f17b1804b1-43aafacb836mr20750925e9.25.1740432144729; 
 Mon, 24 Feb 2025 13:22:24 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm119875635e9.0.2025.02.24.13.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:24 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2025 22:22:18 +0100
Message-ID: <7e1d65454c346fe7bbebbc89c602e8b68b204fcf.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740432132.git.yann.morin.1998@free.fr>
References: <cover.1740432132.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432145; x=1741036945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=SJQ4iM1S0xlmXHCuCCWJ4V7VPV1irktJg7HlDnP3SArOQLqYp8yqq8cvyrMMhnPkB4
 pB+qykIbEAkgUi83zF5liXooy7zCuaxix3CKdgJ6/WJNjc51oakbx8FQFL3CP00ZYvKQ
 5WC/juGRZdVDZahlLNZ2ZyCDXQx7j7XZlibGB7cvsJSgQ2biFobfT+OE1btE6Moe9rA1
 aJJiAUgqM114pDBko2uDDLA9vtoq5yl5FbS9LR6NWbyh4Z+33FoQzum5uiMcATrOAl24
 hBvR1E0WPMTvzF4HMs/XCvk06ket2iIjvTANDmticCeVvdEOBo7nPbsDGBdH1X9sJ98z
 5daQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SJQ4iM1S
Subject: [Buildroot] [PATCH 5/8 v2] package/cgroupfs-mount: tweak the kernel
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
