Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E173CD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B979841277;
	Wed,  7 Jan 2026 17:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svWpQvU3qVt6; Wed,  7 Jan 2026 17:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5A341286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808577;
	bh=Yow3fAUQrP3CLEd8Ya47J4wqHN/lO5UArNa2VGguh5g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NanZVJLNAvsFwo8Fr0QudGLMAbyZf2Gj+17voWH9nJnWRGKzCBSGRHNfobz+f7qF+
	 2XRzx26en8M0AVeU45FZjA1Uoncc84cbFtJkl9ikj0XOleVEa7ebxSrtIC/ddcy+ms
	 abPlhJeBQr4AuYKMjGlzWki6FLDM8fwD2SHBk7Lhpx8GrrRclUspQ7HHIvRgpYIqXz
	 xRyUJ+1K1QWvJJtXczfaBqYkqq4dKVQUSk4bpdIwABEfJqk34FW+YJMDhf0OqcH84D
	 OKE06T7DDe7/AEN7sr+n7ck3I68Tu8/KohrniSV7LEUPKZ+Eh1ugi/9oSA6BNzOcv0
	 Bqj9K8399/tyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA5A341286;
	Wed,  7 Jan 2026 17:56:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92C119ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90A6E40160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z9YoFbw0NEg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9465F40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9465F40128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9465F40128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9AA41B97A596; Wed,  7 Jan 2026 18:56:13 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:56:12 +0100
Message-ID: <20260107175612.230927-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-14-thomas.perale@mind.be>
References: <20251229090719.13291-14-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808573; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=XTQfOGFx0nK8klsWTp4wnWWVVkjbvzaMeVwMOtXiyvI=;
 b=iwgmrAeJVUAk/0fDnPRkK1o5Yf7w+PXLEAgSUX24QCMZkav7erNotFzIR0ynpm76659DEC
 1JCzA7eJRPiVmW9+eBkhLwMUbDlzUeksNGmkk2NAAeRluVH2eoTroBIT/x4EI5nugaSMOQ
 91yv5Li+e7roSyy7FkPi1OACTUGnbHAAmzna9oXpOHRkel5zBSwZx4l4zovTyUyOOzuzb+
 UDLdq+vQ4EAqnIElSSMZySrajmaqv057bh1yz7KS0K5qRHbbMuUPW8Ch3NEwfTHdx4qIvq
 dknPehDvczVGtyRTqYhtMTPCbwlK3uwwDm02fg7y9yavnQ8OptygrHCEOheg6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=iwgmrAeJ
Subject: Re: [Buildroot] [PATCH 14/14] package/mupdf: add CVE-2024-2425{8,
 9} to IGNORE_CVES
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
> Buildroot commit [1] removed the IGNORE_CVES entries for
> CVE-2024-24258 & CVE-2024-24259 because they referenced a patches no
> longer existing.
> 
> Those IGNORE_CVES entries are still required because the CVEs reference
> the exact mupdf version Buildroot is using.
> 
> Re-introduce those IGNORE_CVES entries with an updated comment instead.
> 
> [1] f2e442a14d package/mupdf: remove stale IGNORE_CVES
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.11.x. Thanks

> ---
>  package/mupdf/mupdf.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index 9eecb84232..57501ab954 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -21,6 +21,12 @@ MUPDF_DEPENDENCIES = \
>  	lcms2 openjpeg \
>  	zlib
>  
> +# Fix is in libfreeglut, but CVE applied to mupdf 1.23.9.
> +# Buildroot libfreeglut is >3.4.0 then is not affected.
> +MUPDF_IGNORE_CVES = \
> +	CVE-2024-24258 \
> +	CVE-2024-24259
> +
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
