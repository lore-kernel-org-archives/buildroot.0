Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25400D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E481440EF2;
	Wed,  7 Jan 2026 17:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISGdGbi2TS_a; Wed,  7 Jan 2026 17:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02BCF40EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808283;
	bh=RxsLUln0/uNbhhbZ/IAWDzQb5UNXqs7n5KaYRQJyj3Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KH73S+vAatvRVWBiieiKwFvRkY89qQTC5K8JUmlSm5GXiGxuFq8zp53UX5boc6fbs
	 ny7KqrlNASv2MWbBLyqTitHd/J+9ouRtWOI8hzEirQCDq7vNYq4xW168ItAxRd9DDI
	 Ow0LIIKUTpbueYA7isKDEI213iihablENbz4Nnkaf7w9G6MUBXB7TYzKjKgFcUw/wR
	 ssOLF20JjXAItMjPnlifBcJKtGej1fuM4eyrhEOxm7hk/YqsuV/ogkiU9+ksIFwmvg
	 u3Pri9YtJ+YGAjeuEYi6FVoUJGP2WQUWooUpUNeQzjUa2/Rez0oJqbSkF+OtEFf7U3
	 iKnd554gkIGTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02BCF40EEF;
	Wed,  7 Jan 2026 17:51:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A029ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C62DE40EEF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjMaCxKHUZGM for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2481740EE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2481740EE6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2481740EE6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F394CB97A70C; Wed,  7 Jan 2026 18:51:17 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:16 +0100
Message-ID: <20260107175116.227711-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-5-thomas.perale@mind.be>
References: <20251228185637.58072-5-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808278; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=S1wWYhbGdZDjZIERxHWrs1dd+QJGlqC4gOXcaCW50Bo=;
 b=XXUT7jaQTtF9jj3E7naXqFXD4Yp/a1W3VrH0SuFAZgcWf14XSUAWkH+RFTwZ73cL1ntZHY
 ajkXjfOHO3vdhQDikQNc9Gzn+6YA0tjPlrH1HR6+ttNrbH5LyZPV28jnUmP3ubTbzrq42f
 JY8uu/WfPvQUkzdohuiD6Mgls+sWUeK2DOcy7pduM+axrIGTFivFyucu4xkkbtLDlNIvUf
 9/1QfiCew3Bad+ap/UlIbBuhGgC6D3vUDALY1mIod9YyCCYDJmaDk29Eaor1xVOya2s3LO
 83sdvlStRFBMLoL5E5C8ao+97Rafxu3byrSjGfbEsjVN7mZCsJ2WK0DTEIdcAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XXUT7jaQ
Subject: Re: [Buildroot] [PATCH 05/10] boot/grub2: add CVE trailer in patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...4-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch |  4 ++--
>  ...-tar-Integer-overflow-leads-to-heap-OOB-write.patch |  2 +-
>  ...text-Integer-overflow-leads-to-heap-OOB-write.patch |  2 +-
>  boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch    |  4 ++--
>  ...44-fs-Disable-many-filesystems-under-lockdown.patch | 10 +++++-----
>  ...ent-overflows-when-allocating-memory-for-arra.patch |  4 ++--
>  boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch |  1 +
>  7 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
> index 40df727a60..3cffc80530 100644
> --- a/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
> +++ b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
> @@ -5,8 +5,8 @@ Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
>  
>  Replaced with grub_strlcpy().
>  
> -Fixes: CVE-2024-45782
> -Fixes: CVE-2024-56737
> +CVE: CVE-2024-45782
> +CVE: CVE-2024-56737
>  Fixes: https://savannah.gnu.org/bugs/?66599
>  
>  Reported-by: B Horn <b@horn.uk>
> diff --git a/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
> index c3c845a50a..9d89bcd48f 100644
> --- a/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
> +++ b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
> @@ -9,7 +9,7 @@ number parsed by read_number(). Later direct arithmetic calculation like
>  grub_size_t leading to heap OOB write. This patch fixes the issue by
>  using grub_add() and checking for an overflow.
>  
> -Fixes: CVE-2024-45780
> +CVE: CVE-2024-45780
>  
>  Reported-by: Nils Langius <nils@langius.de>
>  Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> diff --git a/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
> index bb3cfb1813..b9638caabb 100644
> --- a/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
> +++ b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
> @@ -9,7 +9,7 @@ to 0 leading to heap OOB write. This patch fixes
>  the issue by using grub_add() and checking for
>  an overflow.
>  
> -Fixes: CVE-2024-45777
> +CVE: CVE-2024-45777
>  
>  Reported-by: Nils Langius <nils@langius.de>
>  Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
> diff --git a/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
> index 58a63985cd..7598254496 100644
> --- a/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
> +++ b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
> @@ -6,8 +6,8 @@ Subject: [PATCH] fs/bfs: Disable under lockdown
>  The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
>  This will also disable the AFS.
>  
> -Fixes: CVE-2024-45778
> -Fixes: CVE-2024-45779
> +CVE: CVE-2024-45778
> +CVE: CVE-2024-45779
>  
>  Reported-by: Nils Langius <nils@langius.de>
>  Signed-off-by: Daniel Axtens <dja@axtens.net>
> diff --git a/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
> index 9120f8c872..778903533d 100644
> --- a/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
> +++ b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
> @@ -9,11 +9,11 @@ hfsplus, iso9660, squash4, tar, xfs and zfs.
>  The JFS, ReiserFS, romfs, UDF and UFS security vulnerabilities were
>  reported by Jonathan Bar Or <jonathanbaror@gmail.com>.
>  
> -Fixes: CVE-2025-0677
> -Fixes: CVE-2025-0684
> -Fixes: CVE-2025-0685
> -Fixes: CVE-2025-0686
> -Fixes: CVE-2025-0689
> +CVE: CVE-2025-0677
> +CVE: CVE-2025-0684
> +CVE: CVE-2025-0685
> +CVE: CVE-2025-0686
> +CVE: CVE-2025-0689
>  
>  Suggested-by: Daniel Axtens <dja@axtens.net>
>  Signed-off-by: Daniel Axtens <dja@axtens.net>
> diff --git a/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
> index e7bf8d543b..ce84e677c3 100644
> --- a/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
> +++ b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
> @@ -9,8 +9,8 @@ overflow checks are in place.
>  The HFS+ and squash4 security vulnerabilities were reported by
>  Jonathan Bar Or <jonathanbaror@gmail.com>.
>  
> -Fixes: CVE-2025-0678
> -Fixes: CVE-2025-1125
> +CVE: CVE-2025-0678
> +CVE: CVE-2025-1125
>  
>  Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
>  Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> diff --git a/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
> index 7449e08191..e7d89e02e7 100644
> --- a/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
> +++ b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
> @@ -9,6 +9,7 @@ The code is extracted from the upstream commit:
>  
>  Fix: bsc#1234959
>  
> +CVE: CVE-2024-56738
>  Signed-off-by: Gary Lin <glin@suse.com>
>  Upstream: not submitted upstream, as upstream has switched to gcrypt
>  Taken-from: https://build.opensuse.org/projects/SUSE:SLE-15-SP5:Update/packages/grub2.39923/files/grub2-constant-time-grub_crypto_memcmp.patch?expand=0
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
