Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E79D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 18:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0460A40799;
	Sun, 14 Dec 2025 18:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNpRk-7hLGl4; Sun, 14 Dec 2025 18:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2EE40569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765738689;
	bh=psm6jA9h1kPCAHMbkrG46yg0q2fr1I8RZnBojXmvI14=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cuDJAZ2fuXRlZGMumz9ni1hY+80bDQw65SJ98K00XRz9sUhhNdsuXQ9nEM4c+KrCE
	 FRwbaEqwAfBdfKkwv5tgVrdVTZUCQsuEwXkZX/1QVSGzXVCz4p5zfGgoPzIzeCOk4Q
	 03lNqG94EWf3IH8IABmpAn5YIQ076eaEdSdQEkJlXGQyiPV97qCOBJz+DqqWnS6ml1
	 Dxmsxq1XIVTe0fYE9L8JunV7wnpecPOdsz8uhRSrrMxNtaEP2msx50+qUsXloSdKlV
	 URbSULbIgLR79wzfn2e4ZtLT3XhHJnbKPvSvhg0T4XDzuANuITVF/SqbFw4t8wDzSx
	 GZGwEKpFLTcRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E2EE40569;
	Sun, 14 Dec 2025 18:58:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BFD42D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 18:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DCD54033B
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 18:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dJqwqLLSAib for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 18:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3849B40169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3849B40169
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3849B40169
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 18:58:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 400CCA4C4103
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 19:57:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33444)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUrHy-000000004IT-2a2u
 for buildroot@buildroot.org; Sun, 14 Dec 2025 18:57:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 19:57:50 +0100
Message-ID: <20251214185750.2379322-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214185750.2379322-1-bernd@kuhls.net>
References: <20251214185750.2379322-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765738671;
 bh=IRd8K5l35SOgv5Bpk3V1R0ZsIdsGdc8h9pOvq36jCnI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WvEy8pcfzBi2eMRqykJVfkneafXrEQXlvb/oGOwvdrFTRW4c7Cl1zXUn7a06Abn64
 0OxJs+YaPQE0Cy5KQyBc8hB3fB10h26bo/VEV/ysIGnvo/l1N16i+VJoovBqcYzgnU
 V5uyf3jRoT4p50q9O4aNpknq6gmo5EOYALu0BebHV7tm+IaznxQfUWahM3g9zCD/ql
 AR52/lFtvHYeykLfuGFq7O3BJY2XBQlctT6QBNc5xcgSP9yYoRVnaTW8cX5JpKKtX7
 8WcDWajr+PUhWEcaH9pNJ5znDJ8YaxSxs6jnwfuOTQ25RSRYfcFX9hhbBw3lQoLp+r
 kTviGDQltOI9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WvEy8pcf
Subject: [Buildroot] [PATCH 2/2] package/util-linux: add dependency to
 BR2_USE_MMU when needed
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

Upstream added fork() to lib/canonicalize.c in version 2.34[1]
https://github.com/util-linux/util-linux/commit/e101a9eb0fab6725e0a239a92f9b50822c494a3e

but the resulting build errors on non-mmu archs were most likely masked
by previous build errors which are already fixed.

lib/canonicalize.c as part of libcommon is widely used so we need to add
the dependency to many Config.in options.

For an overview about its usage see
output/build/util-linux-2.41.2$ grep -r "LDADD = \$(LDADD) libcommon.la" * | grep Makemodule | cut -d ":" -f 2 | sort

Fixes:
https://autobuild.buildroot.net/results/34b/34b1f733fdfb5c5e30e631576f875398435ad115/

[1] Added to buildroot with commit bb216ed060b16e09b2027ef242347b2f2e3c97dc
    in 2019.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-tools/Config.in |  2 +-
 package/util-linux/Config.in  | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 5a38f6dafe..20131b0d9f 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -150,7 +150,7 @@ comment "rtla needs a toolchain w/ threads, dynamic library"
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-	depends on BR2_USE_MMU  # bash
+	depends on BR2_USE_MMU  # bash, util-linux-schedutils
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # util-linux schedutils
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index a168abe720..dfebaa0947 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -75,11 +75,13 @@ config BR2_PACKAGE_UTIL_LINUX_AGETTY
 
 config BR2_PACKAGE_UTIL_LINUX_BFS
 	bool "bfs"
+	depends on BR2_USE_MMU # fork()
 	help
 	  SCO bfs filesystem support
 
 config BR2_PACKAGE_UTIL_LINUX_CAL
 	bool "cal"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Display a calendar, or some part of it
 
@@ -100,11 +102,13 @@ comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4
 
 config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	bool "chmem"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Sets a particular size or range of memory online or offline
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Utilities for compressed ROM file system (fsck.cramfs,
@@ -121,11 +125,13 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
 
 config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
 	bool "fallocate"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Preallocate space to a file
 
 config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 	bool "fdformat"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Low-level format a floppy disk
 
@@ -140,26 +146,31 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
 
 config BR2_PACKAGE_UTIL_LINUX_HARDLINK
 	bool "hardlink"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Consolidate duplicate files via hardlinks
 
 config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
 	bool "hwclock"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Query or set the hardware clock (RTC)
 
 config BR2_PACKAGE_UTIL_LINUX_IPCMK
 	bool "ipcmk"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Make various IPC resources
 
 config BR2_PACKAGE_UTIL_LINUX_IPCRM
 	bool "ipcrm"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Remove certain IPC resources
 
 config BR2_PACKAGE_UTIL_LINUX_IPCS
 	bool "ipcs"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Show information on IPC facilities
 
@@ -173,11 +184,13 @@ config BR2_PACKAGE_UTIL_LINUX_IRQTOP
 
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Send a signal to a process
 
 config BR2_PACKAGE_UTIL_LINUX_LAST
 	bool "last"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Show a listing of last logged in users
 
@@ -188,6 +201,7 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
 
 config BR2_PACKAGE_UTIL_LINUX_LOGGER
 	bool "logger"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Enter messages into the system log
 
@@ -246,6 +260,7 @@ config BR2_PACKAGE_UTIL_LINUX_LSMEM
 
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Control write access to your terminal
 
@@ -288,6 +303,7 @@ config BR2_PACKAGE_UTIL_LINUX_NEWGRP
 
 config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	bool "nologin"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Politely refuse a login
 
@@ -333,6 +349,7 @@ comment "raw needs a toolchain w/ headers < 5.14"
 
 config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "rename"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Rename files
 
@@ -366,21 +383,25 @@ comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic lib
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	help
 	  Scheduling utilities (chrt, ionice, taskset, uclampset)
 
 comment "scheduling utilities need a toolchain w/ headers >= 3.14"
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
 
 config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	bool "setterm"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Set terminal attributes
@@ -417,6 +438,7 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 
 config BR2_PACKAGE_UTIL_LINUX_TUNELP
 	bool "tunelp"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Set various parameters for the lp device
@@ -435,6 +457,7 @@ config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 
 config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 	bool "utmpdump"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Dump UTMP and WTMP files in raw format
 
@@ -489,6 +512,7 @@ config BR2_PACKAGE_UTIL_LINUX_WDCTL
 
 config BR2_PACKAGE_UTIL_LINUX_WRITE
 	bool "write"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Send a message to another user
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
