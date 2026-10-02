Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA87CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1976180F69;
	Fri,  2 Oct 2026 10:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLNRajdi_CUJ; Fri,  2 Oct 2026 10:32:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DC02A80F75
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937177;
	b=tVjYiFeQbv/VwnjjzQFAYR+DwESbL5cTTA4JxZ7HRgSyR+cudIETjQ/tZ/6ePW9a0Az1
	 lFbv6C/31L5ROyj4ZbZdAuBBybdyfJmKQvhdmCVfw30GpiPo9qyxZ5uW2V6tGntP0IeaR
	 Z5P8geKP3TquhJGK8AWycvo2Hl8XcfBcuv7kX3HKoP7pRSkLoAcAodXH3Ivlpmv7qEJDU
	 luIdgWOOtGTYPQrLRHZuQrKAM3SHO3IofKfvxC3XXM5Y0I3XqQWnixY4erGGsljtpDp5y
	 bfc4HJVVoCV9k53z4c8eToRnTY7GJhQ8/ClUu+ALYNetzS1qXmXoXSFvMMAI1uwsgfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937177;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=At8r6Arp6lR3L2vlpI/UbcYQxbp6iIGcuCH8sC18wHY=;
	b=SXAYKtqR1TE58mxsRpJ7G/kjK13FI0ImIbW3c2kXVThWHK9aWnK/kCn3nzSBs3Ayisix
	 hnvIWS5Gj1qufYJkgtuE/FD7ZVJ3CdlCUN0ajo32XienlOPKsGaaQtlQOGgne37y1N/K7
	 lKMynNm8WVbH99MHBPsLV/VoZAn3hxn1PExK/oh1FEmSsKjepr6dJwGvvmy0U+lygYdrQ
	 KGcYUkdlYu6aja+ITyw+0RdtZUJ+gY9O98wLo2rWEMYvXdvqLRVaMGcP4zdWFh8SA0TxJ
	 o36HxGmis7VT+5A2phWqMWIqqqhSmK/9VJc/XisZJ521XlK1BQ7UkDPOXyXAEL8xSsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937176;
	bh=At8r6Arp6lR3L2vlpI/UbcYQxbp6iIGcuCH8sC18wHY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yyvu3NLIHfcgke9WteIGN52U67MCgrdE9bZ0ajZMmC1BOtLOyqc858WYWO4+zTvgY
	 rsM/hNPVUbznrFsL7q5sljx/4S1L/cJ/0rzyejykTZKrXWUoia9r/SoF0gHdoYqY/X
	 irLJ2kzO7JBUvHkiGqE3Kavs12IznoeHXgdzHK7FsoRWnArpHIXT9qiD6+TBAo0g3n
	 CB+Aq83sSWAIv2kQ6JukYPtvLfAYmt3N0u2jEvWAupbxy+cUMAJq62I0o09h1qkWM4
	 AuevzIGbbW7Zjk1Nz+0up97HzHTpF1Q7z1bd8y14dz79NPxupDACGfAOKFmYHAMuJi
	 rMw8CmVsozYCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC02A80F75;
	Fri,  2 Oct 2026 10:32:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 093A73AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A171E40B53
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0lfo95da3mt for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:32:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6DC2D407E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937171;
 b=G2SvMkG62vQw7uOJ97ysY5p+EAR1Oyp+ugHUX/4Fea/6TlHAHUiAd2sudqHeJpXLTucU
 ofgwuNDqdGbm3rVfmxyIbErpdMg0uYwnd6+xRrZTh3tKPRhClhLMQUqC9w1djiZ/5myZ2
 whI2c/RQC6pAszbuqwhu21XygWxcGhzRgBGkRjexB5CqqhNaZKDpmW66tGTD1WWMb4fa1
 79WSEFwjSwQq0GX+h4QZ13h3BbYIXntdY3WqLJOKJ+j7FC0p2v9ynzJX+3ZB85aWe52ZA
 SigckDS1kNdqWXiAKxNqx3ovbJULUB2ZKwty7ME8iyBaue1zOdbdGNK3OriKXXFSiqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937171;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AunkO/E20+AckYggV350WD8xBKY3nsXmC2rwO6MOUk8=;
 b=LFaVrhvBV79EzUKVzoPsx4jJZHBm/UaIbFSrl+oHaarrZOhiqAibqMtGXAbmdoruQL1B
 VS3lvZ9S4G5u+MvWs+tjPykaE7hsIYgipQ0ErcUbzHj2ERdwHL8MVNqovdG7fSDs+1M+U
 /qMJHg2Eq0JMxpLADUh17MbxSxIYg3O27eDvgRu4rGkeZZGqd7jkcCaN/Qkcg99BkcAN5
 cjeueQLdZPgwcftUVYyfNjcBJz6cA7/oKLBAku/0Cxlrf9xdHrAF1M+Bm47s0adlWioMd
 4q2pw9juXELexsQEHdyYGCOjthXS/p9E8P7Akt3TDuLvQCblFwoOzbd+PhjKAkJbqWA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="NHkxMi1/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DC2D407E9
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:48 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f89so4527682f8f.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937167; x=1791541967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AunkO/E20+AckYggV350WD8xBKY3nsXmC2rwO6MOUk8=;
 b=F7qx5tEysbpM0FFpR0HY8Sre49R4rYyqZDodHHPibA6geHyj3m6tEVm6O1RB0faPL6
 JU409ru7lSc+vo1wW25VUXdxwSjHHmG0VoZpq50w/ux2vt3L9wkf3jV0FlzEqfL+uaxJ
 vxa0E5W0XhbMCMOda41F4w7SUFU/o8AE1oI6JhYge8lqLldgPLxoCSkyJlOoQB1tJKF9
 Fd79EuUeMxNsYW5YQHO6gP2e+lYtMOJaiI7HbMOx+wPwdQP1nmfnQjYO/JYAI/jqK5cw
 gSVNvpQ9T2XRShTSAi7UjhVYJkeoXace+KFtPKvwJJAHGvqHY/JH+y0couyeUirSCFkX
 hDTw==
X-Gm-Message-State: AFuF++liAUKdKUMjodkxszJSU315p/i5FTWUYd34PWF9VE8nDPN8GbfL
 8DRekRAk6oBpUXpnm8lAogr9NDkWORDL62YW/dnYkyoskEDwevYy6DMXGmUzKVKnNq92EgCSUhS
 koym+a5o=
X-Gm-Gg: AYBFou00Cy+vETUuW79SkbxlRI0lG3QfEiBJT6Y37sxbd40KB2F3cq/v7dWWIO2KNgm
 dSWj7SESXSpXzo6I3dCmEbxr7cXOvzjNaNNZ4R+dRkctxhDx45ORdMrQHeXHCjx/bQjop9KNnSo
 Tn+h97zbik6JOBGdaIgfN7BFHn9QmCB3TAHMIbswLcQ2nzhGwnJZCcc34TyptEhMDfVl+PtbK8T
 OdwdwJF9ipzZ1+0mSkzamjuAXs6uAL3+pI5GxtKXtssLNkPP0bhd5sHWDJaTIt5J5MYmJzDamzS
 0d2v2bsLxHHF4DsFzNJLJaOD0ZAcLBa2VctaMhXGP2hTeQL8GdK7TutZockK6cF3riI5/xZ26Vs
 V5Y86IanyUBLj8DYPA739oyFzhlvjpfkD+sAZ1VsZrVGETGNG39IMf2SxctB+0NL2dUTW2qYtpk
 uzJz1EZvnPB4MKViA7EsnbhFMRMRKV3H2YpnX7f12KYwKsTc1qJSMbqj/WBnI/flkfzGHadC82G
 luVFrH9VohWwl6k1rNKvFnlr8jbpPJeXutR3/H+UQ==
X-Received: by 2002:a05:600c:6217:b0:4a0:1ea1:477a with SMTP id
 5b1f17b1804b1-4a0276a31b1mr40917245e9.27.1790937166772; 
 Fri, 02 Oct 2026 03:32:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280bfafasm72384825e9.8.2026.10.02.03.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:46 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:32:37 +0200
Message-ID: <20261002103239.77070-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260921235239.3826789-1-fiona.klute@gmx.de>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kbd: fix static build with
 uClibc
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since upstream commit 7fdd8debe37ae52812b77d82e08713bd62c607f4 [1]
> (included from release 2.9.0) libkbdfile unconditionally includes
> dlfcn.h. uClibc provides this header only if shared library support is
> enabled [2], so building kbd fails if BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> and BR2_STATIC_LIBS=y (BR2_SHARED_STATIC_LIBS=y works).
> 
> The issue has been fixed upstream [3], backport the patch.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=7fdd8debe37ae52812b77d82e08713bd62c607f4
> [2] https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/Makefile.in#L260
> [3] https://github.com/legionus/kbd/issues/159
> 
> Fixes: 930660890bf8b40d9bd55cd9e202e574b53d5d49
> Fixes: https://autobuild.buildroot.org/results/872d12bf869717ae8aec9a2ed6295cf8f7e8b098/
> Fixes: https://autobuild.buildroot.org/results/056b5fe4ca230989041a1ed166c1b509f8bb0908/
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
> Upstream fix was quick, so this replaces my previous patch to disable
> static kbd builds with uclibc. test-pkg fails with
> bootlin-aarch64-glibc-old, but that also happens on current master, so
> isn't a regression.
> 
>  ...re-dlopen-and-memfd_create-for-libra.patch | 146 ++++++++++++++++++
>  package/kbd/kbd.mk                            |   4 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> 
> diff --git a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch b/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> new file mode 100644
> index 0000000000..3c83146d75
> --- /dev/null
> +++ b/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> @@ -0,0 +1,146 @@
> +From 8e552683fa36fe9d09ee3e0909e600350d0bc3cb Mon Sep 17 00:00:00 2001
> +From: Alexey Gladkov <legion@kernel.org>
> +Date: Mon, 21 Sep 2026 12:15:00 +0200
> +Subject: [PATCH] libkbdfile: Require dlopen and memfd_create for library
> + decompressors
> +
> +The library decompressors need dlopen() to load compression libraries
> +and memfd_create() to hold decompressed data. Building them without
> +these facilities can fail even though external decompression commands
> +remain available.
> +
> +Enable the library backends and ELF note support only when both
> +requirements are met, and apply the same condition to the ELF note
> +test. Otherwise, retain the external-command fallback.
> +
> +Also restrict the libbz2 fallback probe to failed pkg-config lookups
> +so that --without-bzip2 does not inadvertently enable bzip2 support.
> +
> +Link: https://github.com/legionus/kbd/issues/159
> +Signed-off-by: Alexey Gladkov <legion@kernel.org>
> +Upstream: https://github.com/legionus/kbd/commit/6ff3161c1e5d448920d412a269716cf42be155b5
> +[Fiona: backport to 2.9.0]
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +---
> + configure.ac               | 19 ++++++++++++-------
> + src/libkbdfile/Makefile.am |  9 +++++++--
> + src/libkbdfile/elf-note.c  |  3 +++
> + 3 files changed, 22 insertions(+), 9 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 05cecab..0691167 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -81,7 +81,7 @@ AC_FUNC_STAT
> + AC_FUNC_MALLOC
> + AC_FUNC_REALLOC
> + AC_FUNC_STRERROR_R
> +-AC_CHECK_FUNCS([alarm dup2 endpwent memset setlocale strcasecmp strerror \
> ++AC_CHECK_FUNCS([alarm dup2 endpwent memset setlocale strcasecmp strerror memfd_create \
> + 		strdup strndup strchr strrchr strspn strstr strtol])
> + 
> + AC_SEARCH_LIBS([timer_create], [rt])
> +@@ -263,13 +263,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
> + ])
> + AM_CONDITIONAL(VLOCK, test "$VLOCK_PROG" = "yes")
> + 
> ++AS_IF([test "$enable_dlopen" = "yes" -a "$ac_cv_func_memfd_create" = "yes"],
> ++      [enable_kbdfile_elfnote=yes],
> ++      [enable_kbdfile_elfnote=no])
> ++AM_CONDITIONAL(USE_ELFNOTE, test "$enable_kbdfile_elfnote" = "yes")
> ++
> + AC_ARG_WITH([zlib],
> + 	[AS_HELP_STRING([--with-zlib],
> + 			[support zlib compression @<:@default=auto@:>@])],
> + 	[],
> + 	[: m4_divert_text([DEFAULTS], [with_zlib=yes])]
> + )
> +-AS_IF([test "$with_zlib" != "no"],
> ++AS_IF([test "$with_zlib" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
> + 	[PKG_CHECK_MODULES(ZLIB, zlib, [HAVE_ZLIB=yes], [HAVE_ZLIB=no])],
> + 	[HAVE_ZLIB=no]
> + )
> +@@ -284,11 +289,11 @@ AC_ARG_WITH([bzip2],
> + 	[],
> + 	[: m4_divert_text([DEFAULTS], [with_bzip2=yes])]
> + )
> +-AS_IF([test "$with_bzip2" != "no"],
> +-	[PKG_CHECK_MODULES(BZIP2, bzip2, [HAVE_BZIP2=yes], [HAVE_BZIP2=no])],
> ++AS_IF([test "$with_bzip2" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
> ++	[PKG_CHECK_MODULES(BZIP2, bzip2, [HAVE_BZIP2=yes], [HAVE_BZIP2=auto])],
> + 	[HAVE_BZIP2=no]
> + )
> +-AS_IF([test "$HAVE_BZIP2" = "no"], [
> ++AS_IF([test "$HAVE_BZIP2" = "auto"], [
> + 	AC_CHECK_LIB(bz2, BZ2_bzDecompressInit, [
> + 		HAVE_BZIP2=yes
> + 		BZIP2_LIBS=-lbz2
> +@@ -306,7 +311,7 @@ AC_ARG_WITH([lzma],
> + 	[],
> + 	[: m4_divert_text([DEFAULTS], [with_lzma=yes])]
> + )
> +-AS_IF([test "$with_lzma" != "no"],
> ++AS_IF([test "$with_lzma" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
> + 	[PKG_CHECK_MODULES(LZMA, liblzma, [HAVE_LZMA=yes], [HAVE_LZMA=no])],
> + 	[HAVE_LZMA=no]
> + )
> +@@ -321,7 +326,7 @@ AC_ARG_WITH([zstd],
> + 	[],
> + 	[: m4_divert_text([DEFAULTS], [with_zstd=yes])]
> + )
> +-AS_IF([test "$with_zstd" != "no"],
> ++AS_IF([test "$with_zstd" != "no" -a "$enable_kbdfile_elfnote" = "yes"],
> + 	[PKG_CHECK_MODULES(ZSTD, libzstd, [HAVE_ZSTD=yes], [HAVE_ZSTD=no])],
> + 	[HAVE_ZSTD=no]
> + )
> +diff --git a/src/libkbdfile/Makefile.am b/src/libkbdfile/Makefile.am
> +index 2511064..ebdb28d 100644
> +--- a/src/libkbdfile/Makefile.am
> ++++ b/src/libkbdfile/Makefile.am
> +@@ -10,14 +10,17 @@ headers = \
> + libkbdfile_la_SOURCES = \
> + 	$(headers) \
> + 	contextP.h \
> +-	elf-note.h \
> +-	elf-note.c \
> + 	init.c \
> + 	kbdfile.c
> + 
> + libkbdfile_la_LIBADD =
> + libkbdfile_la_CFLAGS =
> + 
> ++if USE_ELFNOTE
> ++libkbdfile_la_SOURCES += \
> ++	elf-note.h \
> ++	elf-note.c
> ++
> + if USE_ZLIB
> + libkbdfile_la_SOURCES += kbdfile-zlib.c
> + libkbdfile_la_CFLAGS += $(ZLIB_CFLAGS)
> +@@ -38,6 +41,8 @@ libkbdfile_la_SOURCES += kbdfile-zstd.c
> + libkbdfile_la_CFLAGS += $(ZSTD_CFLAGS)
> + endif
> + 
> ++endif # USE_ELFNOTE
> ++
> + KBDFILE_CURRENT  = 1
> + KBDFILE_REVISION = 0
> + KBDFILE_AGE      = 0
> +diff --git a/src/libkbdfile/elf-note.c b/src/libkbdfile/elf-note.c
> +index 842be9d..bc4a684 100644
> +--- a/src/libkbdfile/elf-note.c
> ++++ b/src/libkbdfile/elf-note.c
> +@@ -6,7 +6,10 @@
> + #include <stdint.h>
> + #include <stdarg.h>
> + #include <errno.h>
> ++
> ++#ifdef HAVE_DLFCN_H
> + #include <dlfcn.h>
> ++#endif
> + 
> + #include "elf-note.h"
> + 
> +-- 
> +2.55.0
> +
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 34401075ce..6e34a45bae 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -14,6 +14,10 @@ KBD_DEPENDENCIES = \
>  	$(TARGET_NLS_DEPENDENCIES) \
>  	host-pkgconf
>  
> +# 0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> +# modifies configure.ac and src/libkbdfile/Makefile.am
> +KBD_AUTORECONF = YES
> +
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
>  KBD_CONF_OPTS += --with-bzip2
>  KBD_DEPENDENCIES += bzip2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
