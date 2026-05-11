Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E931CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 15:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691B283DBF;
	Mon, 11 May 2026 15:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fep1jT4L3zo2; Mon, 11 May 2026 15:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805ED83DD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778513789;
	bh=JguAuRnwp1Zax9tmXSid+v7oUsIUgwZ6CJVpJCvj+L8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q4IxUsfT45u21BFQtA9d+U1VC/MNxMctrpezqXm3W4sbZAXX1h2tlKQ8qKXBCfm6L
	 DZo6Hp4wYFwJV6LDFyjzHHiwsa4xcUIrhLq43pTNqLohKiyiNIj+QrkktC3dvIPY8u
	 Th0d/Xvcs2Fn4QfDkc/vb0Sb5qz13fOGp03UFmdopPxT2l6aEgaIKTKO0KNKO+MOAz
	 ThnvzxMJGDnhI+b2uIfSf3EUBwEhb8sSn30lk1QBNiETtmkladpLeXGAaqOaCDJ2KW
	 Ev1pGAqQEK14iOBabroGpGAojA+HCp7nCJpHKCaP7B8k6C2KwIarOZ6/W0v8cCZ6C/
	 RzxXgXoMxe9NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805ED83DD3;
	Mon, 11 May 2026 15:36:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DCC6223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F48C403C9
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqgSnGq2IjeQ for <buildroot@buildroot.org>;
 Mon, 11 May 2026 15:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80DB2403C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80DB2403C8
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80DB2403C8
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:36:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso2319827f8f.3
 for <buildroot@buildroot.org>; Mon, 11 May 2026 08:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778513783; x=1779118583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xkzGIRMRuzHcxnnq/2Mxvt2SCpG0OGBt4hUm8PCoA4E=;
 b=lJFqjRmfJ32hwymfWLe1w7pGh1p5oSunvcgCD2C5qOnjizquSH+6aniM5LZ6T7uG96
 gx2B/oY0gu47EgSE5kSXOZFSbw60hGKtP1q8JKfsdlmV0fT8+0yM+qk/ntDFxa4i5PFq
 Xur/Sel1JLLlNbrm8B1DI77MluCLGTLexGsJll4/rDDG96+33R7xHoNUGvA8OlsjyLte
 9Eh/TTEMmBL0YWURjN+a3R3XOUrzhd+cFW7X2NusOXOf87Oq8dduKZPeGGZcZ5ZWkDQJ
 0/YFWyMIq5DIehuv4zeOdwxmMetvvPIFx23WucpWpnmTAL5/p1p8XU5DYx1VDjgqyxHb
 SAKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1EzBw0/nwY8qZTUEn0W6QnC2B2tqa/9f/xIKuvNpZFF8b+4TD4nj7odThDtGHsw2oPxQyQIO+ll0=@buildroot.org
X-Gm-Message-State: AOJu0YyZElGYLZArGgrh3iodVrfYZCkn6gTtUcRmlKT+ul3bceK31XlF
 MGA6GHP96R/pXhN4G+A2MUYsHrRNSh7lVpOAMxlh7Bfc+lX+iDlgiZwEX1rFkw6xTQw=
X-Gm-Gg: Acq92OHnN3wAP7uzfWO3cZwbh/AgNDgMP7pNzfT5ngK7O+JzZcBCoGo9LdtKROgW3ky
 MYkEsbGDSyXSt8zxSUXCoy3FzIpCmYTJYFvuSns6T84IqASpLK8nuEf1/fqAd8YZK9N4uroRG+o
 Xx6+25iupww8il+lY29h45rycQrR7PBrEe6snQaWuhUBoSHP/IuAZuUh60YMaQk8eqr12UzaeVh
 e5lc+/kHLq/cb8cuDIy5veyLhTwT36V78jrUEY/Na2W2bqU7F22gg4g9Y1htgFgx9i/pQ7N7ufn
 B+139/UF7Tt50T7iSRixJRaIksko2MJ5uKlrbxVo159FLxNCWCX/qHgPFmD4wT0dqq9DR8hP5Cr
 V8oVLrHwj/bRXksUaFALR1lnezmUpCoyYiZdP/k+FQpOp/H0WVVksmV485Zn4Ac7VXPIzIQ7La1
 zDEkmKGOqC8cF0Qo2CRR6m8uNBCrBNyO2s+PwAuhTekg3T
X-Received: by 2002:a05:6000:2c05:b0:44a:aa3c:5927 with SMTP id
 ffacd0b85a97d-4515d5c69b6mr40267312f8f.29.1778513783324; 
 Mon, 11 May 2026 08:36:23 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454913049ecsm25758572f8f.19.2026.05.11.08.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 08:36:22 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 11 May 2026 17:36:22 +0200
Message-ID: <20260511153622.338710-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507135455.980874-1-buildroot@bubu1.eu>
References: <20260507135455.980874-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778513783; x=1779118583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkzGIRMRuzHcxnnq/2Mxvt2SCpG0OGBt4hUm8PCoA4E=;
 b=eVLihXUpEUKmLk8ta1dMzqmeGlGfMwlJvGb19/GAbKf3Ds0RUEbqBsdMjosWZpVbbU
 yPd8xxeGiWZuTnNaKLRp3mDUcyTJ48JWhNrensGIwODdlcgYNM4jBD0P0Pe/VTwGmKA0
 IKdBlZrjku2cidFhBTOvX9JB8x9EpXlCEnOmHtMEhEAhNIzhpVj/xc6YLqHOQaPkdWbM
 f5JMo/3AZodoZc+CHY4hG9jJv3PdTqy0yhnhLZOuvZKmjv5Jkjbi00TzYBjJVuZaZrTA
 t0hVAEbdYEi+6iOxuB7zg5v4eg43i5sidUssn3XbME6ftOTKZonsepc74fShD9D36Rm0
 fscw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eVLihXUp
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/util-linux: fix loopdev
 nofollow patch
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

Hi Marcus,

Thanks for sending the proper fix, and sorry for the delay I was AFK last week.

This was tested with the improper options on 2025.02.x and the error went
unoticed. I added the minimal defconfig to your commit message:


    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    BR2_PACKAGE_UTIL_LINUX_LOSETUP=y

It's now applied on 2025.02.x.

Best regards,
PERALE Thomas

In reply of:
> eeb65cf0f6753da6bc53197b971aec12ba647026 manually backported upstream
> util-linux security fix (util-linux: 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
> but didn't account for ul_canonicalize_path being named just canonicalize_path
> in 2.40.x. Use the upstream backported patch from the 2.40.x maintenance
> branch instead.
> 
> Fixes: eeb65cf0f6753da6bc53197b971aec12ba647026
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>  .../util-linux/0006-add-loopdev-fl-nofollow.patch | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> index 21b1e2596c..15e92fa61e 100644
> --- a/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> +++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
> @@ -1,4 +1,4 @@
> -From 5e390467b26a3cf3fecc04e1a0d482dff3162fc4 Mon Sep 17 00:00:00 2001
> +From 0000ca30646d03f9dfbab9f62a5ce21a939c1018 Mon Sep 17 00:00:00 2001
>  From: Karel Zak <kzak@redhat.com>
>  Date: Thu, 19 Feb 2026 13:59:46 +0100
>  Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
> @@ -47,9 +47,8 @@ Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4
>  Signed-off-by: Karel Zak <kzak@redhat.com>
>  
>  CVE: CVE-2026-27456
> -Upstream: https://github.com/util-linux/util-linux/commit/5e390467b26a3cf3fecc04e1a0d482dff3162fc4
> -[Titouan: Adapt patch to apply cleanly onto util-linux 2.40]
> -Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +Upstream: https://github.com/util-linux/util-linux/commit/0000ca30646d03f9dfbab9f62a5ce21a939c1018
> +Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
>  ---
>   include/loopdev.h           | 3 ++-
>   lib/loopdev.c               | 7 ++++++-
> @@ -57,7 +56,7 @@ Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
>   3 files changed, 10 insertions(+), 3 deletions(-)
>  
>  diff --git a/include/loopdev.h b/include/loopdev.h
> -index d10bf7f37..0f85dd254 100644
> +index d10bf7f3765..0f85dd25456 100644
>  --- a/include/loopdev.h
>  +++ b/include/loopdev.h
>  @@ -139,7 +139,8 @@ enum {
> @@ -71,7 +70,7 @@ index d10bf7f37..0f85dd254 100644
>   
>   /*
>  diff --git a/lib/loopdev.c b/lib/loopdev.c
> -index c72fb2c40..3d2274693 100644
> +index c72fb2c404b..28fb489e402 100644
>  --- a/lib/loopdev.c
>  +++ b/lib/loopdev.c
>  @@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
> @@ -82,7 +81,7 @@ index c72fb2c40..3d2274693 100644
>  +	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
>  +		lc->filename = strdup(filename);
>  +	else
> -+		lc->filename = ul_canonicalize_path(filename);
> ++		lc->filename = canonicalize_path(filename);
>   	if (!lc->filename)
>   		return -errno;
>   
> @@ -96,7 +95,7 @@ index c72fb2c40..3d2274693 100644
>   	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
>   		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
>  diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
> -index 597b9339a..4df1915a6 100644
> +index 597b9339ac0..4df1915a619 100644
>  --- a/libmount/src/hook_loopdev.c
>  +++ b/libmount/src/hook_loopdev.c
>  @@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
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
