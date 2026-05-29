Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A521DCD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791A441FD4;
	Fri, 29 May 2026 08:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qopt-gEfd1W7; Fri, 29 May 2026 08:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A406942278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043375;
	bh=jVdjdpKJLnKQVEkB2CBmVncEIpxk018VGwVq/bS/OZs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YlsUQXZCd7U29hWgFHCwsGAqfg9V27DNL/8Mdodpws/H54NrxFjAE8K3slt6dKaj9
	 UfptETHR73kqDgrQnPp6amVpPXqlY8asq9NmLunqWxcOVjysFraY8F5PUl2vqqDrDO
	 CrdzII71K3giJ/IP8RotHA3lsp2skn/7wj2UpmUMTwwVUAUTvp4keD7lv1Oi7R6LJy
	 hJkof/BJVU6U6Rg45u3vGog7eVa3LGz6+axeCtDi1Li5VAzj5FWxJrC1ug60IMW4jq
	 MBayIqSwKg2CQVCQy8R3Lzv/ixjb8EobbIYVe1ybLGc5G7Srtop42j3mC3rIHo6+Tz
	 YIMSEFuCLinpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A406942278;
	Fri, 29 May 2026 08:29:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E6A5288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E7B16153B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6vpLMfMK4Xp for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BF996152E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF996152E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BF996152E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45ef4223be7so117117f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043366; x=1780648166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wlh2Vd6QQG6KH/M0UMjiId0VvugXSo7JlTPREqxgUd0=;
 b=mBG37WD4mWfr9RLdkVeNhvrgs5bRpXLlEQy+CcuxH160A3Yk5tWIylsM/qQXm8VD98
 78zi/9EcDRxXguxbLpKHkMZVIZBr7QiuRmlY/II2xTiyFgki/7qgGS731WepqcIWr8J8
 RT1VKKYpWqJSznhe5XSZOgnERhNg4yyTBFoPP0We8kZbUoYtTSLqi8K+g9wV7uPwk7Pu
 62QHnyNQggh2s9UoJ0ngHHQdkAH9YkVyD0BDj5rgbW7ceERuPa4cW88H3jungnwJF/6W
 AviVES56sgjcPtUXMPfIolzd7Eo1md+W4TNzrXA4cmZVeOqQFjIv76cocv3aE4teTBOz
 cgTA==
X-Gm-Message-State: AOJu0YwU3HpWes2C/wQvUjW5DV+8fg2alu/eXVJw2tV0V2zGeqHGZqRV
 a9UWGRI+6Rpp5qvhFWcfpqDGYP7gJlboGGV26ye4OlY0OlVUEaHO4N1Y1eCXe8ZPUUb9UjYQ/Sb
 dyA65
X-Gm-Gg: Acq92OFJ6LDOZHZhnut5WM2ZLjKbttttJW4ClDIW400k5Qj54WzNzfgQXb7M3RMXIek
 AzjS55rsxhTOqdcK+m083oNROskP7Km/Vg0p0P7OadeIXpV9LHQ7VUFvpKlIUxDu5rIK815rjEl
 RRPtcrZLmWcGy6nQJnmOUqBYE+elf17TvKUznAOqnIdsafRYym3vGF81o5HdZycZ5N4Kl5uUmbD
 bnbxvB0VEETx39j6d2AelcJKiYXfS7BHtxPoWp9EZNZry7GVLcDdxGfi9kHLKjTIFIXXLtdk7wm
 xUIoWAAkGHwwwtPZaharKstSnTW//UTvQK+2jzIp50gePSz2g9X/cVuWjCxB/7x8CMELae6RETX
 0LynpI3OACGL+4QniqQprhxIPjnjQpZhQg6yAv0Q6CmII1EtBRiA6oLUpbpPiLf+LAQf2bgpOsh
 TG3TigtCcm8slgok5BDR3M3s6TX6BLpDFPnWnprldtn/qkgdOTSV0ibtRl3A==
X-Received: by 2002:a05:600c:1507:b0:490:48b7:c1ff with SMTP id
 5b1f17b1804b1-4909c0ac8ccmr21321775e9.17.1780043365823; 
 Fri, 29 May 2026 01:29:25 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909caa7faasm29540715e9.11.2026.05.29.01.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:25 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:25 +0200
Message-ID: <20260529082925.57640-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527122510.674604-1-thomas.perale@mind.be>
References: <20260527122510.674604-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043366; x=1780648166; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlh2Vd6QQG6KH/M0UMjiId0VvugXSo7JlTPREqxgUd0=;
 b=fELXjm033zT59/OaShQV9U48fdePoolovLNBhi2OD4DJEYnPrUF0D7n5P90dByYND3
 CAXygNbqDY2SZQKK2FPTbEflGKZwDk1MvhuJJ19vVnn2k924oo7LGOAGTwRCt78+yYOE
 aQLqFZ3CImkeZqNGHF4tkleXfKB5k+4IKV562uP7BL4eq43dhEIfXVIpNSeRvydX7Toe
 w0mV+Zf5bEset6Q101rGQViSk4qG7ARcHaObmjYrLfTerYxSGX4+x/jIZqQcM5dRtJ6x
 /ug5aeuf+aR/7AbBqHDluZY6E5oHP9oxbe5A+Azbc9tER+tUDK+QabYRBWEkAiwosJ4T
 lsjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fELXjm03
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/{glibc,
 localedef}: security bump to version glibc-2.41-137-gb676adadb
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
> Fixes the following vulnerabilities:
> 
> - CVE-2026-4046:
>     The iconv() function in the GNU C Library versions 2.43 and earlier
>     may crash due to an assertion failure when converting inputs from the
>     IBM1390 or IBM1399 character sets, which may be used to remotely crash
>     an application.    This vulnerability can be trivially mitigated by
>     removing the IBM1390 and IBM1399 character sets from systems that do
>     not need them.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-4046
>   - glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3
> 
> - CVE-2026-4437:
>     Calling gethostbyaddr or gethostbyaddr_r with a configured
>     nsswitch.conf that specifies the library's DNS backend in the GNU C
>     Library version 2.34 to version 2.43 could, with a crafted response
>     from the configured DNS server, result in a violation of the DNS
>     specification that causes the application to treat a non-answer
>     section of the DNS response as a valid answer.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-4437
>   - glibc-2.41-131-gdbd8335c8ce8af11226ee1514d7a020b15c63345
> 
> - CVE-2026-4438:
>     Calling gethostbyaddr or gethostbyaddr_r with a configured
>     nsswitch.conf that specifies the library's DNS backend in the GNU C
>     library version 2.34 to version 2.43 could result in an invalid DNS
>     hostname being returned to the caller in violation of the DNS
>     specification.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-4438
>   - glibc-2.41-132-g502861645bb1baf650d58e2ddd6b230bc26676c9
> 
> > git shortlog 2.41-123-gfb4db64a0..glibc-2.41-137-gb676adadb
> 
> Carlos O'Donell (2):
>       resolv: Count records correctly (CVE-2026-4437)
>       resolv: Check hostname for validity (CVE-2026-4438)
> 
> DJ Delorie (1):
>       include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h
> 
> Florian Weimer (8):
>       Switch currency symbol for the bg_BG locale to euro
>       nss: Introduce dedicated struct nss_database_for_fork type
>       Linux: In getlogin_r, use utmp fallback only for specific errors
>       nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
>       iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
>       posix: Run tst-wordexp-reuse-mem test
>       Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)
>       Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)
> 
> Michael Jeanson (1):
>       tests: fix tst-rseq with Linux 7.0
> 
> Xi Ruoyao (1):
>       elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
> 
> Yury Khrustalev (1):
>       posix: Fix invalid flags test for p{write,read}v2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/glibc/glibc.hash       |  2 +-
>  package/glibc/glibc.mk         | 11 ++++++++++-
>  package/localedef/localedef.mk |  2 +-
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index e999129ccc..3f1df7058a 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  3789146d175834dc4873f41bd87932cd6ad7c83d0b7bf340768ee6a927aac784  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2-git4.tar.gz
> +sha256  c5856a16a8576d35adddd92f7e86c58faeedd849633582a7926f9a3e766ffe2d  glibc-2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 7c07dd5923..3ce6265a6d 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
> +GLIBC_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
>  GLIBC_SITE = https://sourceware.org/git/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -51,6 +51,15 @@ GLIBC_IGNORE_CVES += CVE-2026-0915
>  # Fixed by glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
>  GLIBC_IGNORE_CVES += CVE-2025-15281
>  
> +# Fixed by glibc-2.41-131-gdbd8335c8ce8af11226ee1514d7a020b15c63345
> +GLIBC_IGNORE_CVES += CVE-2026-4437
> +
> +# Fixed by glibc-2.41-132-g502861645bb1baf650d58e2ddd6b230bc26676c9
> +GLIBC_IGNORE_CVES += CVE-2026-4438
> +
> +# Fixed by glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3
> +GLIBC_IGNORE_CVES += CVE-2026-4046
> +
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 441145c38f..c3a959c5f5 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
> +LOCALEDEF_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
>  LOCALEDEF_SITE_METHOD = git
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
