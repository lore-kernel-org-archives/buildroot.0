Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4974C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 865944129B;
	Sat, 15 Mar 2025 19:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJE_ZGMlWNER; Sat, 15 Mar 2025 19:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 562B841282
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562B841282;
	Sat, 15 Mar 2025 19:57:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93925EA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C2E83B2B
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZisY_1XJGTp for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F2A783AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F2A783AB9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F2A783AB9
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso3545465e9.3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068635; x=1742673435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=XxjC43uJ7DUzNB5qwQ9O5w/6a+Zkt64MsQiEZBZAfeA5KI71Dpa6hhLksLRz+UAFNd
 tavHP7WOGwKKxs11Se2lAoBlmHYPkdelYXMRGIZyQXv0js4TG49nn7y0RVAYM0Dwnia7
 QKCQ4rDL1l6Gc2Dwvok9x+ntayuajheoQxlFDhEEEIXDbCenASrtq7k4AwKuu/1w5pHi
 1ss0t8ShGw5JjgeakShL++X9ZuJIn/MirlGzZszmUU4hhMsltAnP19YarxXk3T0RU45e
 g5wq6RBboEVvVt09+9lrkK9HWCyf55Qc7zzlZRz9TGfbcZudgD9Wh1TzDplQXXBC5dU6
 J1oA==
X-Gm-Message-State: AOJu0YxeIOWLocGV+G4Y++jxi6Pw9RDtQsXDVAy97XY9Etzm3lnsuFX3
 vzzQ1Bv9eqtfoOo3UV8m1Sw/b0v34lOgeNfgS4yCkRSfm8W+hLOqckBRhQ==
X-Gm-Gg: ASbGnctmjOvsjuSF4aCJUM0dnMtTzwyPNDtM0uC0YRFjZSUyivQTrsiJmJbPcxrtzZt
 kpwNoP5TCoYgNWChjQo2MGBe4a4P0ycYiZ3CgYoPpgIwo6xDLA5tB7Pk1W7jq+JW2bl3DCiokbJ
 3L51HTtxLnLxWvymwBg7keA53J1AMaJOutNdq8QkywzMkToBTnuzbERUp9ncf1OPN1wl6rFzq/c
 MM6r7QuvjLBh2ipcjUXDTillkFU1LlLuQNn9PGXVh4/XftVj9aR6a5A8IsMxCLtn1THUVFvAr82
 3SZk6F4Rdxn9j6UwkrInnjG2uWsO5qbzuh1hF7u0ZeFEa1xjU8K1MnLs9HJ04DKchw==
X-Google-Smtp-Source: AGHT+IFc7h6O+Z0gLUMe/BhLezG23/198IWmHcvw7W/Qdu4GGNVxsNepvqpL3akvtko4JzZnk8oDLg==
X-Received: by 2002:a05:600c:46cd:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-43d1ece19c6mr91314765e9.30.1742068635227; 
 Sat, 15 Mar 2025 12:57:15 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:15 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2025 20:57:04 +0100
Message-ID: <8a0c2690ed742abcf9caaa2145b2c96f0f19b801.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068635; x=1742673435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zd2wnRmV9DWpzE2eTq0KCQLnKFPbJTsXUgsJKQg66A=;
 b=Hj4tJl+9pAdHwI3VqeOkb3HqffcFB/kqqZGhDSjl/St2ImV70Lcl8G7t7pLKldl6EO
 lSQ6kQK94of5KTAx8aw0YhMGO8/LmN3tYvk12wqVmElBBYBDdA1HRD4EDmSLyDEZtHaz
 J45UgTKMhvz0xbaGJz9Umodza2cpEVrYkk/nYYTt7ss+UTmLzppBrUa9uTO41l9EArrf
 vYrv4CPymH0V2hY3l9Dzs8WWwCinBLXfDDOR0zzCjJhmdLKLcvSLOMg0CRsXsvc8yD1e
 sR+SvAKFrb/fHoLKo8pJYAfy5i7ryjhlgdA6jeBG4F9bOnIr6FXRjeLyF3f9etV/Wt1V
 UdSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hj4tJl+9
Subject: [Buildroot] [PATCH 06/14 v4] package/cgroupfs-mount: tweak the
 kernel config
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
