Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956DCCCF2D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5474C81DE3;
	Mon, 19 Jan 2026 10:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGNUvpMs7AUz; Mon, 19 Jan 2026 10:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF17D81CEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817350;
	bh=Dcxrnmv7UH+zqsa1zE44xY3g1wK7rMtsLjSvU85cXO4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C3MUhBIMb6wPx45xAuBC/qbji0fCz+o6jZ+Fwp7/sPsxpT0MMkdJj6TeDOJeF3fdM
	 ZMGhNnR+hnQn9TPtT7agI5/Bhf15X3f9SdpfYzB0/6LofjJDevM4dUVBbqy5oSudQo
	 DRSGwnuaBqwg3XgdwjJm0RQ+7r60/TzKeZg/L+Ianx1ZA2CURj/oFt1yE08bLm57Ga
	 uaPF4ZNBpSNTyy5GbB1yysqVyGTPXy5uklcDPV39ojIq1cI9klBz5DEnA01bXqyJ0+
	 HBGrcLTZjrlHlNs5poRFSR8usMKgprvJUP88LgmUVSWmsKC4GttU42bK76rOfYhUfj
	 oXNPCJHDzPZyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF17D81CEF;
	Mon, 19 Jan 2026 10:09:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9DC62CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA38160D95
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFHE6H4j1nQd for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 742FB60D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 742FB60D91
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 742FB60D91
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E417B97A1FF; Mon, 19 Jan 2026 11:09:05 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:05 +0100
Message-ID: <20260119100905.12453-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207144243.3696572-21-bernd@kuhls.net>
References: <20251207144243.3696572-21-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817346; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=PVs9n7goTgKvZE/Ji/0D/uG+qWYvh+7qW8SPe/6SmMk=;
 b=NJZat+HEgCqiXIUtbChazbdJrCC7xGHs24snKbYjV+XpuHs2UzU8by+ViJit9BpgW64jW+
 L6pZ3q6QXGyTQMQu8oep2BtwfTDmu2H0xfJ+h+Ll0THVpDOA0ife77XNw7RsRJMa6MTs4G
 BisaIpNSaThnoj0XAfP3X+gNIGs/P2/6EDKNisZCRkGPquWhJ9PVnb8QMA2Y4QwIQxMpcp
 XzR5ZVwhMN5OcClDE8UlM+frq5lPjnbNYHeVyngBqpGaoteJ0Gj9lZMRMnW8C/pH3YP0tC
 890PwQf8NGJAe5Z4fE7jo6HkL1+0YVekIba8kZNjKbRdzcQq2mUFl5Y6PTUToA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NJZat+HE
Subject: Re: [Buildroot] [PATCH/next 21/33] package/vlc: bump to version
 3.0.22
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
> Release notes:
> https://code.videolan.org/videolan/vlc/-/blob/3.0.22/NEWS
> 
> Rebased patch 0005.
> 
> Removed patch 0011 which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...Don-t-assume-strerror_l-is-available.patch |  8 ++--
>  ...5-fix-build-with-versions-2024.11.28.patch | 47 -------------------
>  package/vlc/vlc.hash                          |  8 ++--
>  package/vlc/vlc.mk                            |  2 +-
>  4 files changed, 9 insertions(+), 56 deletions(-)
>  delete mode 100644 package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
> 
> diff --git a/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
> index cd839b7379..e860f56ac4 100644
> --- a/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
> +++ b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
> @@ -11,8 +11,8 @@ Fix compile error
>  Code for #else condition was taken from
>  http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
>  
> -[Bernd: rebased for vlc-3.0.6 & 3.0.9.2]
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Bernd: rebased for 3.0.22]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   configure.ac      | 2 +-
>   src/posix/error.c | 4 ++++
> @@ -22,13 +22,13 @@ diff --git a/configure.ac b/configure.ac
>  index dfb4c1c329..bfe43512a2 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -590,7 +590,7 @@ dnl Check for system libs needed
> +@@ -667,7 +667,7 @@
>   need_libc=false
>   
>   dnl Check for usual libc functions
>  -AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale stricmp strnicmp strptime uselocale])
>  +AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale strerror_l stricmp strnicmp strptime uselocale])
> - AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
> + AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
>   AC_REPLACE_FUNCS([gettimeofday])
>   AC_CHECK_FUNC(fdatasync,,
>  diff --git a/src/posix/error.c b/src/posix/error.c
> diff --git a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch b/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
> deleted file mode 100644
> index 9708f680c9..0000000000
> --- a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 8befcbfa834b809602db24c9ba7456d8cfc25cdb Mon Sep 17 00:00:00 2001
> -From: Florian Albrechtskirchinger <falbrechtskirchinger@gmail.com>
> -Date: Sun, 2 Mar 2025 08:30:43 +0100
> -Subject: [PATCH] live555: fix build with versions >= 2024.11.28
> -
> -In the 2024.11.28 release (version 1732752000), live555 introduced
> -`EventLoopWatchVariable` as a typedef for `std::atomic<char>`, replacing
> -direct use of `char` in earlier versions. Add a conditional typedef to
> -define it as `char` for older versions, and update `event_rtsp` and
> -`event_data` to use `EventLoopWatchVariable`.
> -
> -Upstream: https://code.videolan.org/videolan/vlc/-/commit/8befcbfa834b809602db24c9ba7456d8cfc25cdb
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - modules/access/live555.cpp | 8 ++++++--
> - 1 file changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
> -index 461766661e49..cacea3c46952 100644
> ---- a/modules/access/live555.cpp
> -+++ b/modules/access/live555.cpp
> -@@ -194,6 +194,10 @@ class RTSPClientVlc;
> - #define CAP_SUBSESSION_PAUSE    (1 << 3)
> - #define CAPS_DEFAULT            CAP_RATE_CONTROL
> - 
> -+#if LIVEMEDIA_LIBRARY_VERSION_INT < 1732752000 // 2024.11.28
> -+typedef char EventLoopWatchVariable;
> -+#endif
> -+
> - struct demux_sys_t
> - {
> -     char            *p_sdp;    /* XXX mallocated */
> -@@ -232,8 +236,8 @@ struct demux_sys_t
> -     bool             b_no_data;     /* if we never received any data */
> -     int              i_no_data_ti;  /* consecutive number of TaskInterrupt */
> - 
> --    char             event_rtsp;
> --    char             event_data;
> -+    EventLoopWatchVariable event_rtsp;
> -+    EventLoopWatchVariable event_data;
> - 
> -     bool             b_get_param;   /* Does the server support GET_PARAMETER */
> -     bool             b_paused;      /* Are we paused? */
> --- 
> -GitLab
> -
> diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
> index b3d9a083b9..6733a870b1 100644
> --- a/package/vlc/vlc.hash
> +++ b/package/vlc/vlc.hash
> @@ -1,7 +1,7 @@
> -# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha256
> -sha256  24dbbe1d7dfaeea0994d5def0bbde200177347136dbfe573f5b6a4cee25afbb0  vlc-3.0.21.tar.xz
> -# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha1
> -sha1  be8557fc2f4be58caebe4a8b1d70f03dc6b95792  vlc-3.0.21.tar.xz
> +# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha256
> +sha256  e2cc1cf0ae0902a09da5a37c249a8a4e4b5ec4dc095443b8e1493c6a7cc138ea  vlc-3.0.22.tar.xz
> +# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha1
> +sha1  f9871439cdb281e18a78828c389cf7bf66d47d69  vlc-3.0.22.tar.xz
>  # Locally computed
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index a597616470..81783c99ed 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VLC_VERSION = 3.0.21
> +VLC_VERSION = 3.0.22
>  VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
>  VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
>  VLC_LICENSE = GPL-2.0+, LGPL-2.1+
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
