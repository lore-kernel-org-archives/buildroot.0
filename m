Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAC2D5B87A
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 23:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8E960842;
	Mon, 15 Dec 2025 23:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVxImAeEwz05; Mon, 15 Dec 2025 23:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107DF60F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765840308;
	bh=0RwtNiVpJW5DXAWd1AiqUMX3DGsAFfiqtHghKKIF9mo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M8yd4nkGG7FmNFSEpKqd6qrkGYzYhGAL7Apf17F8ZcEpNKjjMCYOhlwwKZ9K5fXvY
	 isA9VC7X5mUXvXqa85JzrPxrbwRDRxSDq+yboKoXtAh1B06JNT441HVtPXo3VjQ0G0
	 gjVWA+6/SKEXzKsmyrFF7gxzEcBMMpKp2s+nmgwR6VnzrjqhoXYx2wRSd+fOj2J1EZ
	 rvmSSgsZkPDOBOe0VIVJRhWcKxbdAfiSWFOPD65uOzs8Bxt5TvoLCKHYCfJ5optV28
	 9k0FT1ltGtwUarihkPIwdKGASeik7JoUEFclmwWp913fQQmS3G8C/G/yqN5oox7cUs
	 H362mt9iG+Fzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 107DF60F2C;
	Mon, 15 Dec 2025 23:11:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F148151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54FBE408D6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qzmsev7KFw7 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 23:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 224994053F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 224994053F
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 224994053F
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 23:11:44 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-37b9728a353so38547071fa.0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 15:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765840302; x=1766445102;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hkymImt5Z6BLDPNbTLxDLbna3VdNvBBaxWeijZfOwRM=;
 b=SoIH0fA/NwGTmfv75meTf2NZtYJzNFx5exSPU3owXriPPz+RnQEAxh6Ovrypad0WDH
 h+zii82UaehS4zJQ0QH7+HzdV/GRtw8zpqDUQC4MOTktG0q4VQ2OjdBXwYIK91azB8Bu
 +Vrtubng+Cr485IiQzXUV2KaXFHQwgfctMPZ57YBmu5OJG38TYPMYr9wkNB2Ds6gxu/z
 /YEHlXAdbXJF+8NYHc58Ygc9t5pzc8+3n4/rGeL6zl6zn3TQTRPUo3TLm+f35+wtQ3gB
 kcmCj98GtJEwP0eASkFq5WhhehjWvdMWr1EPE3upJCH4b4gaEPU/2HXSuQ9BOL5ChQvK
 ridg==
X-Gm-Message-State: AOJu0YzkrZvmTnglrQYvGX5avOxlA8eFI4fALFEjkIg58BCI163cCZGz
 WUSmL3gAVe5GwgAMs10tfOo8r3gryKpUb4kT23cMIboo9vuOoz0/wX4uHh4M/Q==
X-Gm-Gg: AY/fxX5qxfTbkdWFSNmViGiGhiG67J1k3roJMReWrF/1YrXv1FRUm9+c2iJTXVJ/mJV
 vJJk/kXBf3w2G1+jgQyXj2LhpgkWqd6RieTutakkA9VDIrJMmhaBJhR8ltJstiPSvzoRDmryOhD
 ZLR4ljdyyvwcngC9/zcMT9KcnEWrC8eEKGBL9C+CkCHQF8Ddz9COZqHmixg7zUI6HxpNzmOQvhC
 p9V+elAYZhcUzoZ5TbeOyL20AlIWtGYc5VUG1fJHKGgoFffc18WCnGH3jmgd+JELKdjB1WMT8Kv
 QqSdeY3dbjpQdnVseaHaC+hWr/kMs+75eyvl4T3IYhcAVY8rhNR+sxE+JZyTI6c4JMX3cRMWBlu
 4DerPJ+hjXzdLbsnY1STX1FszweZh7DzyCZwY5iSRNlLBnZ5NYq90GwK/50tND+G/LTyIAO3mq/
 a7RMP2ysIVtJJ4mWxIOjBT9xRVGQfM1tbpt0xlW+9Y8lo=
X-Google-Smtp-Source: AGHT+IG+MFo5tZ63K6Fth7QamIeFv+IieqF5O5y/+x58sgdAx+JtKnDI+h5L8qNVtztJ5+UhgVG4Rw==
X-Received: by 2002:a2e:a550:0:b0:37b:9615:e423 with SMTP id
 38308e7fff4ca-37fd0792c07mr42856151fa.15.1765840301926; 
 Mon, 15 Dec 2025 15:11:41 -0800 (PST)
Received: from gimli.. (h-158-174-186-51.NA.cust.bahnhof.se. [158.174.186.51])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fded760d8sm30856151fa.23.2025.12.15.15.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 15:11:40 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Tue, 16 Dec 2025 00:11:37 +0100
Message-ID: <20251215231137.2465811-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765840302; x=1766445102; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hkymImt5Z6BLDPNbTLxDLbna3VdNvBBaxWeijZfOwRM=;
 b=butcmc6Bkl2XKx7fcHr7XReFRcLjpAQrKlk5YlJHxnlgjR47BNV8I4Yf79txcudfkw
 7ZCmgaQzAwLuIJyKpI8VbU1upeD1Q6xKe1VYPIEgc+sDnkWhOVDNaX4btbk/zSPxFMIr
 ZnyIeSDX7DMaCJWLfA+o6zAKsdJ7T0hebvML7n9pWtDg3l8DJ4gdILSBiueE13WjFgL7
 xmaW1FASCRu3DOdgnul7fkz9qRNlZNs8wuwa+paapGARZsgMxfe4yDmnU4hBgE4o24nh
 jlfUglin8Q2Nsj6cJGrNIhKgVP6IEDtbazvwMbjJdgQz4wzifHQN+7jcVrP2NYbv1jGt
 yZMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=butcmc6B
Subject: [Buildroot] [PATCH 1/1] package/watchdogd: bump to version 4.1
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

Changes:
 - Add watchdogctl list-clients command to display currently subscribed
   clients to the process supervisor. Outputs to stdout in either table
   format (default) with colored headers, or JSON format with -j/--json
 - New global -j, --json option for machine-readable output, currently
   supported by list-clients and status commands
 - New API: wdog_clients() returns array of wdog_client_t structs for
   programmatic access to subscribed clients. See API documentation at
   https://codedocs.xyz/troglobit/watchdogd/wdog_8h.html
 - Enhance watchdogctl status command to display formatted output by
   default, with device information, capabilities, and reset history in
   a human-readable table format. Use -j/--json for JSON output

Fixes:
 - Generic scripts running more than 1 second would fail with false
   "critical error" reports and cause unwanted system reboots due
   to uninitialized exit status variable
 - watchdogctl reload with tempmon crashes watchdogd
 - Issue causing unwanted reboot when watchdogctl reload was called
   while a generic monitor script was running
 - Fix memory leak in generic monitor with optional script path, would
   be triggered on watchdogctl reload

The first of the fixes means we can now drop the backported patch.
Also, the test mode has been dropped from public use, hence it being
removed as well in this commit.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 Config.in.legacy                              |  6 ++
 ...Fix-use-of-uninitialized-exit-status.patch | 85 -------------------
 package/watchdogd/Config.in                   |  7 --
 package/watchdogd/watchdogd.hash              |  2 +-
 package/watchdogd/watchdogd.mk                | 11 +--
 5 files changed, 9 insertions(+), 102 deletions(-)
 delete mode 100644 package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index da91b68087..69565196cb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,12 @@ config BR2_PACKAGE_MESA3D_VDPAU
 	help
 	  Mesa3d removed the Gallium VDPAU state tracker.
 
+config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
+	bool "The watchdogd test mode option has been removed."
+	select BR2_LEGACY
+	help
+	  watchdogd v4.1 removes the test mode and test suite.
+
 config BR2_BINUTILS_VERSION_2_42_X
 	bool "binutils 2.42 has been removed"
 	select BR2_LEGACY
diff --git a/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
deleted file mode 100644
index 69e7b36ef4..0000000000
--- a/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From f6d56c374723923e276ccfd442fdd0cabf23d095 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Fri, 14 Feb 2025 19:26:24 +0100
-Subject: [PATCH] Fix use of uninitialized exit status
-
-Depending on the timing between the SIGCHLD callback run and the first
-generic_cb() timer callback run, script_exit_status() sometimes
-returned uninitialized memory as the exit status of a script. This
-could lead to incorrect "critical error" reports if that uninitialized
-memory happened to contain a value that interpreted as an int was
-above the critical threshold.
-
-Additionally, script_exit_status() unconditionally removed the process
-information from the queue, meaning that if a process had not
-completed by the time its status was first probed, its status could
-never be updated or successfully probed again, leading to timeout. Fix
-this by removing the process only if the status indicates it has
-terminated (successful or not).
-
-The problems affected primarily scripts running approximately one
-second or longer, because very short running scripts will very likely
-have their exit status collected by the SIGCHLD callback before the
-first timer callback run.
-
-Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
-Upstream: https://github.com/troglobit/watchdogd/pull/52
----
- src/script.c | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/src/script.c b/src/script.c
-index 1220fb9..f6e0763 100644
---- a/src/script.c
-+++ b/src/script.c
-@@ -16,6 +16,7 @@
-  */
- 
- #include <errno.h>
-+#include <stdbool.h>		/* bool type (before C23) */
- #include <stdlib.h>		/* setenv() */
- #include <sys/wait.h>		/* waitpid() */
- #include <unistd.h>		/* execv(), _exit() */
-@@ -28,6 +29,7 @@
- struct exec_info {
- 	pid_t   pid;
- 	int     exit_status;
-+	bool    exited;
- 	void  (*cb)(void *arg);
- 	void   *arg;
- 	LIST_ENTRY(exec_info) entry;
-@@ -64,6 +66,8 @@ static void add(pid_t pid, void (*cb)(void *), void *arg)
- 	}
- 
- 	info->pid = pid;
-+	info->exit_status = 0;
-+	info->exited = false;
- 	info->cb  = cb;
- 	info->arg = arg;
- 	LIST_INSERT_HEAD(&exec_info_head, info, entry);
-@@ -78,6 +82,7 @@ static int exec(pid_t pid, int status)
- 			continue;
- 
- 		info->exit_status = status;
-+		info->exited = true;
- 		if (info->cb)
- 			info->cb(info->arg);
- 
-@@ -96,9 +101,11 @@ int script_exit_status(pid_t pid)
- 		if (info->pid != pid)
- 			continue;
- 
--		status = info->exit_status;
--		LIST_REMOVE(info, entry);
--		free(info);
-+		if (info->exited) {
-+			status = info->exit_status;
-+			LIST_REMOVE(info, entry);
-+			free(info);
-+		}
- 		break;
- 	}
- 
--- 
-2.47.2
-
diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
index 0aeaad165f..eeff3ad744 100644
--- a/package/watchdogd/Config.in
+++ b/package/watchdogd/Config.in
@@ -20,13 +20,6 @@ config BR2_PACKAGE_WATCHDOGD
 
 if BR2_PACKAGE_WATCHDOGD
 
-config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
-	bool "Enable watchdogctl test cases"
-	help
-	  The watchdogctl program comes with a suite of tests built-in.
-	  They can be used to verify correct operation of watchdogd and
-	  the kernel watchdog driver.
-
 config BR2_PACKAGE_WATCHDOGD_GENERIC
 	bool "Generic script monitor"
 	default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL_WRAP # legacy 2024.02
diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
index 0c228666bd..1ecc2cb40f 100644
--- a/package/watchdogd/watchdogd.hash
+++ b/package/watchdogd/watchdogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  7f38bc691353a51fc6feb2ccab60417c0284dd3f4d55c50d8b1781fda70d8101  watchdogd-4.0.tar.gz
+sha256  7ae90acfd8879145be6fb9afe0f388e461230ce76ff9b8f4daeb93250351c314  watchdogd-4.1.tar.gz
 
 # Locally calculated
 sha256  e233c56d807c74c67f2eff47ad03c216144cdd374d8d7578b996c28c260eadda  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 189efc81d4..e6c756af53 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WATCHDOGD_VERSION = 4.0
+WATCHDOGD_VERSION = 4.1
 WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
@@ -15,14 +15,7 @@ WATCHDOGD_SELINUX_MODULES = watchdog
 
 WATCHDOGD_CONF_OPTS = \
 	--disable-compat \
-	--disable-examples \
-	--disable-test-mode
-
-ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
-WATCHDOGD_CONF_OPTS += --disable-builtin-tests
-else
-WATCHDOGD_CONF_OPTS += --enable-builtin-tests
-endif
+	--disable-examples
 
 ifneq ($(BR2_PACKAGE_WATCHDOGD_GENERIC),y)
 WATCHDOGD_CONF_OPTS += --without-generic
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
