Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0BEE4982
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 16:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F19480BA6;
	Tue, 30 Dec 2025 16:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXgce0JpLwwS; Tue, 30 Dec 2025 16:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6261D80BCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767111699;
	bh=ObKZgCKY0Mvihuha/AU8GeDu4M5ftgu9STecIeK1IRU=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EtPIjkaZxv6gTL6BgWuUvyclv/KU/8+SeM6mZ2xK59oIxU8/UWwyN/mK9UeMgz2DZ
	 EvVRx1qo/Dx+eGRunb0yVoNe7dcKzXfJQSb5UORj78B07KOXHZaEnmhiyCk3czTWKj
	 dr5ZJ88TnxXYBT5I0DiGOk3jGSxhwomqe7IdRj5LLA7XfQIrnDTOlmfaClUGc+8pjo
	 ZPp5zzdQinjoLJs5G9ZfBeE1qzPmB4UiSH1kfwGpPH1Nlqp6IcIDzJ10BH+bvdW/nU
	 2uKS79aJvWgZORQOsNYQEtCTpjIUGLWF3LSq08TOGRXxQnO/P+bv2sJh1Ttch7VPWe
	 I3olgOk8rGvXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6261D80BCD;
	Tue, 30 Dec 2025 16:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF7A0277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDAC780BCD
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6t0V07IsQvse for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 16:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A969080BA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A969080BA6
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A969080BA6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:21:36 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id acTXvTcS4P2aDacTYvOFJW; Tue, 30 Dec 2025 17:21:36 +0100
Message-ID: <890b860d-465f-44fd-8182-734a1339fb12@benettiengineering.com>
Date: Tue, 30 Dec 2025 17:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251220170623.155785-1-bernd@kuhls.net>
 <20251220170623.155785-3-bernd@kuhls.net>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251220170623.155785-3-bernd@kuhls.net>
X-CMAE-Envelope: MS4xfHXJ4k2OsrhtfdlsrD2KP403ZdLzQ9UjYYkuVuwy/BophoqJhK4SUooY10OAQ0BJ2cSv+kpJbookSJDxbushI+NyBEFnQuUKy5oUe+ff+AWOJyN1rdxr
 JzCU+Iu00CnO1y/jv12C0ANCTld0squFvrr+eu8wqwsoPeGRXwy7K39Y5G/IdgMkJwYHWX1616S+Mm+L/XdTye47GFbtdar8aPuV/eMEf+yF1jcIPCenTkDt
 4f7iHLUB18xLhduvbvPWTA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767111696; bh=gPUhhC3dikdfg3xjSxmAlsbkAWc1KA3JaLhMh+rDHe0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fn0arus3ESrxmUGJIgKAStFkrwTYSqgOmIJ7d9BOhoN9Z/ILNpeZk2p0b+5mXNOD4
 AmYSpefI6Ezj/iLWDcgVAAjx8Kx1L6yBCLPUjLN0+3VOMi8f1eg6kx6qTcCXaHiBXB
 CMiJFIMhysn7DIkORE0CDaHoWKG9eCqvJlvElIcI0D3GKhb752gQOqiOVvrKi2KNKX
 tYUVefz/c6mLyu+ZHjCDao056aFMqsAgMW6rPcFFDz961GvneDcJgobTlGYTSQjWi0
 Z+eBz+5nNgfnUoqbICTgxWS2yvApPbDqmq8BWemum2suSMhrb8tQN/OQahJO2UxYEa
 LFyR7lRp/Ns1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fn0arus3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 20/12/2025 18:06, Bernd Kuhls wrote:
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
>      in 2019.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

you've preceded me with this, thank you

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
Giulio

> ---
>   package/linux-tools/Config.in |  2 +-
>   package/util-linux/Config.in  | 24 ++++++++++++++++++++++++
>   2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 5a38f6dafe..20131b0d9f 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -150,7 +150,7 @@ comment "rtla needs a toolchain w/ threads, dynamic library"
>   config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>   	bool"selftests"
>   	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> -	depends on BR2_USE_MMU  # bash
> +	depends on BR2_USE_MMU  # bash, util-linux-schedutils
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # util-linux schedutils
>   	select BR2_PACKAGE_LINUX_TOOLS
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index a168abe720..dfebaa0947 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -75,11 +75,13 @@ config BR2_PACKAGE_UTIL_LINUX_AGETTY
>   
>   config BR2_PACKAGE_UTIL_LINUX_BFS
>   	bool "bfs"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  SCO bfs filesystem support
>   
>   config BR2_PACKAGE_UTIL_LINUX_CAL
>   	bool "cal"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Display a calendar, or some part of it
>   
> @@ -100,11 +102,13 @@ comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4
>   
>   config BR2_PACKAGE_UTIL_LINUX_CHMEM
>   	bool "chmem"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Sets a particular size or range of memory online or offline
>   
>   config BR2_PACKAGE_UTIL_LINUX_CRAMFS
>   	bool "cramfs utilities"
> +	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_ZLIB
>   	help
>   	  Utilities for compressed ROM file system (fsck.cramfs,
> @@ -121,11 +125,13 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
>   
>   config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
>   	bool "fallocate"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Preallocate space to a file
>   
>   config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
>   	bool "fdformat"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Low-level format a floppy disk
>   
> @@ -140,26 +146,31 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
>   
>   config BR2_PACKAGE_UTIL_LINUX_HARDLINK
>   	bool "hardlink"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Consolidate duplicate files via hardlinks
>   
>   config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
>   	bool "hwclock"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Query or set the hardware clock (RTC)
>   
>   config BR2_PACKAGE_UTIL_LINUX_IPCMK
>   	bool "ipcmk"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Make various IPC resources
>   
>   config BR2_PACKAGE_UTIL_LINUX_IPCRM
>   	bool "ipcrm"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Remove certain IPC resources
>   
>   config BR2_PACKAGE_UTIL_LINUX_IPCS
>   	bool "ipcs"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Show information on IPC facilities
>   
> @@ -173,11 +184,13 @@ config BR2_PACKAGE_UTIL_LINUX_IRQTOP
>   
>   config BR2_PACKAGE_UTIL_LINUX_KILL
>   	bool "kill"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Send a signal to a process
>   
>   config BR2_PACKAGE_UTIL_LINUX_LAST
>   	bool "last"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Show a listing of last logged in users
>   
> @@ -188,6 +201,7 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
>   
>   config BR2_PACKAGE_UTIL_LINUX_LOGGER
>   	bool "logger"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Enter messages into the system log
>   
> @@ -246,6 +260,7 @@ config BR2_PACKAGE_UTIL_LINUX_LSMEM
>   
>   config BR2_PACKAGE_UTIL_LINUX_MESG
>   	bool "mesg"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Control write access to your terminal
>   
> @@ -288,6 +303,7 @@ config BR2_PACKAGE_UTIL_LINUX_NEWGRP
>   
>   config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
>   	bool "nologin"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Politely refuse a login
>   
> @@ -333,6 +349,7 @@ comment "raw needs a toolchain w/ headers < 5.14"
>   
>   config BR2_PACKAGE_UTIL_LINUX_RENAME
>   	bool "rename"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Rename files
>   
> @@ -366,21 +383,25 @@ comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic lib
>   
>   config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
>   	bool "scheduling utilities"
> +	depends on BR2_USE_MMU # fork()
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>   	help
>   	  Scheduling utilities (chrt, ionice, taskset, uclampset)
>   
>   comment "scheduling utilities need a toolchain w/ headers >= 3.14"
> +	depends on BR2_USE_MMU # fork()
>   	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>   
>   config BR2_PACKAGE_UTIL_LINUX_SETPRIV
>   	bool "setpriv"
> +	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_LIBCAP_NG
>   	help
>   	  Run a program with different Linux privilege settings
>   
>   config BR2_PACKAGE_UTIL_LINUX_SETTERM
>   	bool "setterm"
> +	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_NCURSES
>   	help
>   	  Set terminal attributes
> @@ -417,6 +438,7 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
>   
>   config BR2_PACKAGE_UTIL_LINUX_TUNELP
>   	bool "tunelp"
> +	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_NCURSES
>   	help
>   	  Set various parameters for the lp device
> @@ -435,6 +457,7 @@ config BR2_PACKAGE_UTIL_LINUX_UNSHARE
>   
>   config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
>   	bool "utmpdump"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Dump UTMP and WTMP files in raw format
>   
> @@ -489,6 +512,7 @@ config BR2_PACKAGE_UTIL_LINUX_WDCTL
>   
>   config BR2_PACKAGE_UTIL_LINUX_WRITE
>   	bool "write"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Send a message to another user
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
