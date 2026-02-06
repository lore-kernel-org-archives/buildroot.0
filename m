Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDD2EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A166114C;
	Fri,  6 Feb 2026 08:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_I8E_UKVA8J; Fri,  6 Feb 2026 08:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD3E46115A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365461;
	bh=cXp42MC5O+waLPG2ZPitZcjX3Rj0DGxaeu+LeNFrPcg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hHVOdq0eQ2e43kvWgjDf6Z3GrcN4rcQS+lVXjbe8TKcPFftqFPvkLA1piv+H8aq4P
	 DKbpyBNsoZ8blIa4GlFXNJBq7+RZ4y7liwhVC58ZCMyDuObAp0vNLIOFPm6/UP1FD1
	 p7wexAoEc/4diWtO4+3xdoyy5Dewc+t3Wev7/FcZdDslr8LI71+jm2hRGImzFFq8M0
	 MYxzKYfcOcmK3YULSJmNa3mRuAWFOvco0Ok3uRu1eYCnNEsyhj7/EfSeEckzQy90gr
	 R9L/IMiefUX+ZQ+LCRhFY9Fd6lEqkNcNdO+xYAoMXy9cBTfIRKDj2muTHOuGWQkeaT
	 pljvlLacCulcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD3E46115A;
	Fri,  6 Feb 2026 08:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98276173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 958D3408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37wOim6j9AH3 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 493794018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 493794018D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 493794018D
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:10:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so3675965e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365457; x=1770970257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X5WSjXggLAfRB3RrxKyHobo0w4v7NGuZbFxGxpbCWdY=;
 b=GY81+/rAWFSaz+bHHnQ5AZcH5nVSY430qdWQ9QU6W6BocQPNc/IY+gwkcGwMZiylNA
 UOwlOKkTv5eGUiNsbTy6UA8qSb6a8egYSqEYy+30zfcu7h7HOgwPJrn7qZukiH1yiuHL
 ApRSj/hfen6YifbsEJM67uLXE2TcOecDnUGyg4ejgz9FXjGRbLTCRY4PlxSKAnU0MoB0
 ndUJRALNmJjnFV2MHnsQQ3DnIftOj68QdBPGHj0KpwboYHSOfjM1lkyYgK8NNTRRVmQn
 yvy+9KUeEmkoParZLEs69Ay2uOU+ROGS0val/6Q+Zv3CDVwMdVR2b0Z/fH7L6mnSkzD4
 r4Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL4KL1Ij5ga9XfCpz3Rl38ZhAjfa5DYxtnK87JnKUk9XeCbi7Wfvy8G29+2WtcOGpGt5S2hpL0490=@buildroot.org
X-Gm-Message-State: AOJu0YwiBfqgBxF3nufXfXUgji8dr+WWApGaFs0buwcQcEQsmNp9xL/s
 iWHFzYILRuBCwpZy0Dp9mAoS6NIvQCXQhlRvjjtKhngB5x7chkh5IO4WgA2jrVRZBvpdLbiEyoY
 knQMx
X-Gm-Gg: AZuq6aJ1Et8z3fZb+c+ZL8HEtSiQkb+SQ30K+Cjig1vQIOTY7KOdtSA7HNOXOIEEYqa
 Vy2hCFjxviRXjmspglsQ+RQhE6EhwjfCywWKCigguOUoBrwuBbsWvdBFghhr0xpZLGTjBYBEcJU
 SXd8wPwWi3s6CZ/2mGPHfw/dlOVUB0AsKwiikT3af6+WJdQhP1rf0i6nqokV/aTj55bEcUZc2uj
 4sbuj5G1yxHNtTwwiGtRz1iApnwO1JhgdMtBiUnmi8Cz0fSsPZxBERXkrPJRZyFQppftCvopMuX
 kEckHs+nwlNsqlgsEluU68Kxt+Ltzf5W8xO+xlzOHxJMV6fg5fr5k0d4imoZ6eu/rI23c6T8MLd
 eNWoAyxHX/SoGUHbU64A8QTKHwyt4aUgkLZH05lJjTLrzC+tShgRBJuZQtgy2oX0CbpHYp2joYk
 N+jHEhnGOmRhT7mQ==
X-Received: by 2002:a05:600c:19c6:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-4832017f99emr26435765e9.0.1770365456946; 
 Fri, 06 Feb 2026 00:10:56 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2bab2sm196353905e9.3.2026.02.06.00.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:10:56 -0800 (PST)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:10:54 +0100
Message-ID: <20260206081054.31157-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202141504.424544-1-titouan.christophe@mind.be>
References: <20260202141504.424544-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365457; x=1770970257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5WSjXggLAfRB3RrxKyHobo0w4v7NGuZbFxGxpbCWdY=;
 b=MUHo/rKAtNEgvGbRlNceTRziW5LZOPYkPoCj5joPXUtEaUY4J1BYMVTKVgmm3pdiAn
 rhlat1JBjkcLPW0ntcslZwJlriUmATgBsVK+thVl2I+ycL3fGVJ4OtxHtG7fKlSP6ZW5
 i++eRpD4A5OxKI4UByyKPqvqQsOWOYf39tEN/M5dMTHThChkblDgf8BG05uk8MKew7M+
 BsmKdVDSL3B93nxqGD4fRU5hBGhSs98GIXOLzM2QFeYlCQKbPpxR9gCTPF4KfBDv9ffk
 DGaunCK7o5iuSLymfQHPbrQcaKlh6GrhmgxFNXRK7AfoyvrVWKTB1Tir0dfW+i3hNilx
 /dhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MUHo/rKA
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/glibc: security bump
 to v2.41-123
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This contains backports for the following vulnerabilities:
> - CVE-2025-15281:
>     Calling wordexp with WRDE_REUSE in conjunction with WRDE_APPEND in the
>     GNU C Library version 2.0 to version 2.42 may cause the interface to
>     return uninitialized memory in the we_wordv member, which on
>     subsequent calls to wordfree may abort the process.
>     https://www.cve.org/CVERecord?id=CVE-2025-15281
> 
> - CVE-2026-0861:
>     Passing too large an alignment to the memalign suite of functions
>     (memalign, posix_memalign, aligned_alloc) in the GNU C Library version
>     2.30 to 2.42 may result in an integer overflow, which could
>     consequently result in a heap corruption.  Note that the attacker must
>     have control over both, the size as well as the alignment arguments of
>     the memalign function to be able to exploit this.  The size parameter
>     must be close enough to PTRDIFF_MAX so as to overflow size_t along
>     with the large alignment argument.  This limits the malicious inputs
>     for the alignment for memalign to the range [1<<62+ 1, 1<<63] and
>     exactly 1<<63 for posix_memalign and aligned_alloc.  Typically the
>     alignment argument passed to such functions is a known constrained
>     quantity (e.g. page size, block size, struct sizes) and is not
>     attacker controlled, because of which this may not be easily
>     exploitable in practice.  An application bug could potentially result
>     in the input alignment being too large, e.g. due to a different buffer
>     overflow or integer overflow in the application or its dependent
>     libraries, but that is again an uncommon usage pattern given typical
>     sources of alignments.
>     https://www.cve.org/CVERecord?id=CVE-2026-0861
> 
> - CVE-2026-0915:
>     Calling getnetbyaddr or getnetbyaddr_r with a configured nsswitch.conf
>     that specifies the library's DNS backend for networks and queries for
>     a zero-valued network in the GNU C Library version 2.0 to version 2.42
>     can leak stack contents to the configured DNS resolver.
>     https://www.cve.org/CVERecord?id=CVE-2026-0915
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/glibc/glibc.hash       |  2 +-
>  package/glibc/glibc.mk         | 11 ++++++++++-
>  package/localedef/localedef.mk |  2 +-
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 0deba84dc7..a7f1daacf9 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  166b6e7637bb45cb9352e4813005f83dd48f03ef634d3e9e94a30aa5a0300fab  glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830.tar.gz
> +sha256  7ed7900a90fd1b05fd49a25b1877515c6c3f1ab9ea9248af9d5d0e7fdb3fdd82  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 37752416ba..3f519bfdca 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
> +GLIBC_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
>  
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> @@ -39,6 +39,15 @@ GLIBC_IGNORE_CVES += CVE-2025-8058
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
>  GLIBC_IGNORE_CVES += CVE-2010-4756
>  
> +# Fixed by glibc-2.41-121-g1e2c1ea4307197ccece0cda574bcfebf9080894c
> +GLIBC_IGNORE_CVES += CVE-2026-0861
> +
> +# Fixed by glibc-2.41-122-g15c9839a0b853f552b4ed9047841b6223f3c104d
> +GLIBC_IGNORE_CVES += CVE-2026-0915
> +
> +# Fixed by glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
> +GLIBC_IGNORE_CVES += CVE-2025-15281
> +
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index c76a8d82a0..925998a5f4 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
> +LOCALEDEF_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>  LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
>  HOST_LOCALEDEF_DL_SUBDIR = glibc
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
