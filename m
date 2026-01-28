Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8598BD3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFC140114;
	Wed, 28 Jan 2026 17:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tv5Va0VXDtsE; Wed, 28 Jan 2026 17:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C3AB40143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621061;
	bh=J8yQzlWrIW1XW3MTOP+MaEnDLaOLHq6o9veud5T07+4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IWewUyfxM1117UhbI1FE5tpxBSRRpNpYtbIAG/PXTxsGCDaXhgxCbF5rR7f9+DG60
	 mSIlGqL0FQzJopzlb7LxEE1D/N9UG7GlvKYFVfi7PfUxK9nIV+4ENCABRqu0hykz/b
	 qObHJt11bCdna2NiipOazu3lVWsQro3TV6BMGySRMZtfX5n614uHXepBS5TfQ45Xrz
	 rYRPxQv/a0JiNz6FKrfB5nYmF/hEAxJMxHsGdtfcxeZDJfTBfZIxL8BPng23WbprLc
	 lT21qOvCJRq/COAVvx16nKHm7gkoQeqhzIp8ce6w7pRgYmOGUG/qCDei+pIzy0g3ma
	 QPF179qrOo+bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3AB40143;
	Wed, 28 Jan 2026 17:24:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9964D118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A29A60781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gixkZWrNqrBd for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47BF660614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47BF660614
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47BF660614
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF361B97AB36; Wed, 28 Jan 2026 18:24:15 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:14 +0100
Message-ID: <20260128172414.342704-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220170623.155785-3-bernd@kuhls.net>
References: <20251220170623.155785-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621056; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=DtOJpZjgDUTa/TnF4B/6MojLnD4a/v99S1bdqPHteBs=;
 b=hDNDdrkTI1lRFdakwt5yznDBdQcBmtkbjE9pdE7ALP4f1k7HhWDeDIUNkizpbmUCZmsjXP
 H1VqRi3tw3OOLDCSLeZF/YIl6K2mBZRNqPG3TyYMepPe2bUmN3Sc9ae7vvX1hEDY6YwICU
 6rEh1UCF6ZHpswRW2Qu7/4t0zDsmDlJ3+up51Yjku39G0hP0VZSfnqP6/U2DyxulyYWCpi
 OBChaRBced37XemJm2Yea29qcQPzjQJ+Dnown1LJlxzggyN/+3ql7tLSJXIoOrbJxqBodF
 fS720uHXkCr/vW25eo2Mg6WX/h6NY9V4ZlsmHPsK7yGhWXpDU1fEcPhA6MuJ/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=hDNDdrkT
Subject: Re: [Buildroot] [PATCH 3/4] package/util-linux: add dependency to
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Upstream added fork() to lib/canonicalize.c in version 2.34[1]
> https://github.com/util-linux/util-linux/commit/e101a9eb0fab6725e0a239a92f9b50822c494a3e
> 
> but the resulting build errors on non-mmu archs were most likely masked
> by previous build errors which are already fixed.
> 
> lib/canonicalize.c as part of libcommon is widely used so we need to add
> the dependency to many Config.in options.
> 
> For an overview about its usage see
> output/build/util-linux-2.41.2$ grep -r "LDADD = \$(LDADD) libcommon.la" * | grep Makemodule | cut -d ":" -f 2 | sort
> 
> Fixes:
> https://autobuild.buildroot.net/results/34b/34b1f733fdfb5c5e30e631576f875398435ad115/
> 
> [1] Added to buildroot with commit bb216ed060b16e09b2027ef242347b2f2e3c97dc
>     in 2019.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/linux-tools/Config.in |  2 +-
>  package/util-linux/Config.in  | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 5a38f6dafe..20131b0d9f 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -150,7 +150,7 @@ comment "rtla needs a toolchain w/ threads, dynamic library"
>  config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>  	bool"selftests"
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> -	depends on BR2_USE_MMU  # bash
> +	depends on BR2_USE_MMU  # bash, util-linux-schedutils
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # util-linux schedutils
>  	select BR2_PACKAGE_LINUX_TOOLS
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index a168abe720..dfebaa0947 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -75,11 +75,13 @@ config BR2_PACKAGE_UTIL_LINUX_AGETTY
>  
>  config BR2_PACKAGE_UTIL_LINUX_BFS
>  	bool "bfs"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  SCO bfs filesystem support
>  
>  config BR2_PACKAGE_UTIL_LINUX_CAL
>  	bool "cal"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Display a calendar, or some part of it
>  
> @@ -100,11 +102,13 @@ comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4
>  
>  config BR2_PACKAGE_UTIL_LINUX_CHMEM
>  	bool "chmem"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Sets a particular size or range of memory online or offline
>  
>  config BR2_PACKAGE_UTIL_LINUX_CRAMFS
>  	bool "cramfs utilities"
> +	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  Utilities for compressed ROM file system (fsck.cramfs,
> @@ -121,11 +125,13 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
>  
>  config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
>  	bool "fallocate"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Preallocate space to a file
>  
>  config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
>  	bool "fdformat"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Low-level format a floppy disk
>  
> @@ -140,26 +146,31 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
>  
>  config BR2_PACKAGE_UTIL_LINUX_HARDLINK
>  	bool "hardlink"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Consolidate duplicate files via hardlinks
>  
>  config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
>  	bool "hwclock"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Query or set the hardware clock (RTC)
>  
>  config BR2_PACKAGE_UTIL_LINUX_IPCMK
>  	bool "ipcmk"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Make various IPC resources
>  
>  config BR2_PACKAGE_UTIL_LINUX_IPCRM
>  	bool "ipcrm"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Remove certain IPC resources
>  
>  config BR2_PACKAGE_UTIL_LINUX_IPCS
>  	bool "ipcs"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Show information on IPC facilities
>  
> @@ -173,11 +184,13 @@ config BR2_PACKAGE_UTIL_LINUX_IRQTOP
>  
>  config BR2_PACKAGE_UTIL_LINUX_KILL
>  	bool "kill"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Send a signal to a process
>  
>  config BR2_PACKAGE_UTIL_LINUX_LAST
>  	bool "last"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Show a listing of last logged in users
>  
> @@ -188,6 +201,7 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
>  
>  config BR2_PACKAGE_UTIL_LINUX_LOGGER
>  	bool "logger"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Enter messages into the system log
>  
> @@ -246,6 +260,7 @@ config BR2_PACKAGE_UTIL_LINUX_LSMEM
>  
>  config BR2_PACKAGE_UTIL_LINUX_MESG
>  	bool "mesg"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Control write access to your terminal
>  
> @@ -288,6 +303,7 @@ config BR2_PACKAGE_UTIL_LINUX_NEWGRP
>  
>  config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
>  	bool "nologin"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Politely refuse a login
>  
> @@ -333,6 +349,7 @@ comment "raw needs a toolchain w/ headers < 5.14"
>  
>  config BR2_PACKAGE_UTIL_LINUX_RENAME
>  	bool "rename"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Rename files
>  
> @@ -366,21 +383,25 @@ comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic lib
>  
>  config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
>  	bool "scheduling utilities"
> +	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>  	help
>  	  Scheduling utilities (chrt, ionice, taskset, uclampset)
>  
>  comment "scheduling utilities need a toolchain w/ headers >= 3.14"
> +	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>  
>  config BR2_PACKAGE_UTIL_LINUX_SETPRIV
>  	bool "setpriv"
> +	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBCAP_NG
>  	help
>  	  Run a program with different Linux privilege settings
>  
>  config BR2_PACKAGE_UTIL_LINUX_SETTERM
>  	bool "setterm"
> +	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	  Set terminal attributes
> @@ -417,6 +438,7 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
>  
>  config BR2_PACKAGE_UTIL_LINUX_TUNELP
>  	bool "tunelp"
> +	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	  Set various parameters for the lp device
> @@ -435,6 +457,7 @@ config BR2_PACKAGE_UTIL_LINUX_UNSHARE
>  
>  config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
>  	bool "utmpdump"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Dump UTMP and WTMP files in raw format
>  
> @@ -489,6 +512,7 @@ config BR2_PACKAGE_UTIL_LINUX_WDCTL
>  
>  config BR2_PACKAGE_UTIL_LINUX_WRITE
>  	bool "write"
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Send a message to another user
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
