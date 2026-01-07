Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F44D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0D680C8F;
	Wed,  7 Jan 2026 17:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDzz0rJmVeoo; Wed,  7 Jan 2026 17:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1A1880C2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808575;
	bh=Qew+Y8gLkP+mYUvTOcXKDsTcvFiLi3egSQO0RN2h5AM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pdLKQ6741i3wbBlPdu0zC9r8TMxbedn3jG8tWYc/RMHfSe5/ZR346NsxBi84jS5j4
	 9TPgZlIg6yFsm0W1gGZ+dGmSgIWyHOu+QWhYcTJ3A1ZKOc1E+wn/dnx7fq85/Nz/p3
	 LGS5wrFVAhFWBDILVvlalcWPadXSAogsbkhB0LS2i7i0Kh6eQvuMpukoPHo5Yhx/O1
	 txSaRUzUAi8rLNDpU2lSQspu84nux3b8fAy6T6WFL3UYPAp8achaCZMe7I+9YBN9EH
	 pR5gN7CwiBR2cVECxs9qL9q+Ozj/bHFLJQQX4FF2SXuGj/+jAVQ0pOi5qeeqObjbPQ
	 MAPKurzS3GTTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A1880C2C;
	Wed,  7 Jan 2026 17:56:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A0A125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B4780C2C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3mvz6V14Yd2 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32A3180C26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A3180C26
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32A3180C26
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 694BBB97A711; Wed,  7 Jan 2026 18:56:11 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:56:10 +0100
Message-ID: <20260107175610.230880-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-3-thomas.perale@mind.be>
References: <20251228185637.58072-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808571; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=enB9AxHzvx6hCoVjm8mltfMX2rv8dJQRA0clivV5kpU=;
 b=khBqk/nq3a0jbdrQUXWQK6FSJ/SGabn8etpah7UnmBve+OWhnqo5WfTwyl77gGnnfJB9eW
 lM31AfSbbQK0cYmSG192z7tsyuP6bfO15DXbJoeWoj3qwWu1+nNTkbOdtOd1u+yZaNtSUp
 x1bETNnxxgPz2hXYRD2v4AemwMfTc+VNZMHi5niUNBd9pxjHlkFxonYtKw+qYXDLI7VdEw
 SS68JXJrEi7iUrOAKuMhkfIs69Sbgy1T+4wXoYfC539FJzlNvFPd+WpLn2AkZn5F50pPKu
 wx4SVxC/SsGaKDieH7hXGw1LmiyMGtjCQSgzgOTiHplT3o2vUt4aQGR4Sgqbng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=khBqk/nq
Subject: Re: [Buildroot] [PATCH 03/10] package/mupdf: remove stale
 IGNORE_CVES
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
> The fixes for the CVE-2024-24258 & CVE-2024-24259 were introduced in [1]
> and targeted the package libfreeglut.
> 
> The patches that fixed CVE-2024-24258 & CVE-2024-24259 in libfreeglut
> were removed in Buildroot commit [2]. With this bump the IGNORE_CVES
> entries for mupdf were not removed.
> 
> [1] 0f4fef076f package/libfreeglut: add upstream security fix for CVE-2024-2425{8, 9}
> [2] b1c77090ef package/libfreeglut: bump version to 3.6.0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.11.x. Thanks

> ---
>  package/mupdf/mupdf.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index 6b666033eb..9eecb84232 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -21,12 +21,6 @@ MUPDF_DEPENDENCIES = \
>  	lcms2 openjpeg \
>  	zlib
>  
> -# libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
> -# Fix is in libfreeglut, but CVE applied to mupdf.
> -MUPDF_IGNORE_CVES = \
> -	CVE-2024-24258 \
> -	CVE-2024-24259
> -
>  # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
>  # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
>  MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
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
