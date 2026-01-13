Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D43BD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13296807C6;
	Tue, 13 Jan 2026 19:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMFAl__69lmS; Tue, 13 Jan 2026 19:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F9380333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333459;
	bh=yt4SJEbxQXdfK6MMiklv+wW9pgsNraoOFe1m8ETt86Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dy1fXYuxFXERV0vCo5NZ9R+wLN+I1mKYdcmwHvUJ2NcIVJ0X+kkdZ2+uj/eRSjqBW
	 8vpeEGriUUKvhx1hDHEYa3cQxZ1VTY12HV0PGKROzSrxuEjM5izd97OL4Is5VRp/e5
	 O1u4I5VBLzt4OAKhHNqySVSQ91IN2hNudZB2CB/REUjzvn5oM2IgwaZBTKeFqqbImF
	 +BTNLm/qBacsWY+SOke2G5HvyxI1yOxu5ODy4P46EMK/KZJ7pjkkV3QFvPX+wnZEU6
	 tlOSqpxjsbBQxqeXxj0+h7FCI7dVWvTtBiQf6tDEcNqVDmuPAgeYnJG1SbfP8QRR/4
	 kUN1asapPK50w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F9380333;
	Tue, 13 Jan 2026 19:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F111C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 767B440B3C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DG_kNI0WxdGU for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1014540343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1014540343
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1014540343
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:44:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 15C63B97A863; Tue, 13 Jan 2026 20:44:13 +0100 (CET)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:44:11 +0100
Message-ID: <20260113194411.97170-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226171313.1982585-1-dario.binacchi@amarulasolutions.com>
References: <20251226171313.1982585-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333454; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=QSQ2OJIm21lBWtv/edZwf7Fh5B++TDxBdVK+NoEeYWg=;
 b=FgzHcOhZnLC5Q5hzcmsU5HRHFjXbM6adgNsUkzXLoUxJc53hWKcHKYN0WrzzZR/2OyYZ0L
 CgNfizTY62BAOgCzJfobRPuvndPyLvqNHKBJ2MUeuJvf/hKdmWLgMnFPXttjnTDQdd6hkl
 ytKRSXOo3JwMNFlG/DqF97960j3PVgOLDdkkCRCn6yMCDvgRmf2BHKb+tBY6vzcpifF0a7
 tsVXp6+LxXBK0+A7NEw889LHH0crlJVs7KjjiY5PneDCY9kotTyF5/JbdzqZGfBDPMmfYC
 pIRsrlZz+Yb95TPpNKWHATsK5xP6jJRa3pQdFejZL5HAYE+pnaRpEXW5Cfdqmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FgzHcOhZ
Subject: Re: [Buildroot] [PATCH 1/1] package/xinetd: fix build w/ gcc-14
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
> Building xinetd with gcc-14 raises the following error:
> 
> cvt.c: In function 'fcvt_r':
> cvt.c:113:9: error: implicit declaration of function 'strx_nprint' [-Wimplicit-function-declaration]
>   113 |     n = strx_nprint (buf, len, "%.*" FLOAT_FMT_FLAG "f", ndigit, value);
>       |
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x. Thanks

> ---
>  ...libs-src-portable-fix-build-w-gcc-14.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch
> 
> diff --git a/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch b/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch
> new file mode 100644
> index 000000000000..8bfbcd6d8ddf
> --- /dev/null
> +++ b/package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch
> @@ -0,0 +1,46 @@
> +From 499087df7c0aaa01f0f64aa7aa355d2e543665bc Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Wed, 24 Dec 2025 11:36:20 +0100
> +Subject: [PATCH] libs/src/portable: fix build w/ gcc-14
> +
> +Building xinetd with gcc-14 in Buildroot raises the following error:
> +
> +cvt.c: In function 'fcvt_r':
> +cvt.c:113:9: error: implicit declaration of function 'strx_nprint' [-Wimplicit-function-declaration]
> +  113 |     n = strx_nprint (buf, len, "%.*" FLOAT_FMT_FLAG "f", ndigit, value);
> +      |         ^~~~~~~~~~~
> +
> +Including "str.h" header to fix the compiler error would add a
> +build-time dependency of libportable on libstr, creating a circular
> +dependency chhain:
> +
> +  libportable -> libstr -> libsio -> libportable
> +
> +which results in GNU make dropping dependency edges and therefore not
> +fixing the original build error.
> +
> +The commit keeps the existing library layering unchanged while restoring
> +successful builds with modern compilers.
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://github.com/xinetd-org/xinetd/pull/39
> +---
> + libs/src/portable/cvt.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libs/src/portable/cvt.c b/libs/src/portable/cvt.c
> +index 4bd99fc80c26..4badab1cbd42 100644
> +--- a/libs/src/portable/cvt.c
> ++++ b/libs/src/portable/cvt.c
> +@@ -64,6 +64,8 @@
> + #endif
> + 
> + #ifndef HAVE_FCVT
> ++int strx_nprint ( char *buf, int len, const char *fmt, ... );
> ++
> + int
> + APPEND (FUNC_PREFIX, fcvt_r) (FLOAT_TYPE value, 
> +                               int ndigit, 
> +-- 
> +2.43.0
> +
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
