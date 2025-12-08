Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEE9D3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 18:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7928C80EFB;
	Mon,  8 Dec 2025 18:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS3B3QhXZ3cr; Mon,  8 Dec 2025 18:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B82880EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765220090;
	bh=Nx75hvOBzCYIUWx0dzZ7P04wXY7vwyaJ9NsvxUTmKms=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SBEgUcRu6odYfp+M+Z1aGgU08Z/yYvcoda1kj4Lkw+QWh0+DDGY80wLbeEXOVPJAU
	 IcRF/q6V8X4P88I40vwM9imsPd01l6W009l/oNJUwalguSAO3/h3NGxmi1zbJ5xbL9
	 2XOX3eTyRPvKadHngs6nd6tveFJZbngFtZZjx/99BzIgXywqSRHWHCQTOgxgOVo384
	 BriPrlnNxlOY/ZwP5Y3y3X5zMQ3nC6rdcdFlVckMuXN7GbLDHIMKPKFoESSgf0wspX
	 4fz11++ogOLX0Yl1oYiaeE+ow9KLx1Ae4dMZEJJvHMcIy1/oQ8zM6XWq0K9ii0A+mD
	 RNi1DDejXi0CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B82880EB1;
	Mon,  8 Dec 2025 18:54:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9988197
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB89D40257
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id es3k-sRH46sS for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 18:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E35F401E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E35F401E0
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E35F401E0
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:54:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 54D6B418FA;
 Mon,  8 Dec 2025 18:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9BFC4CEF1;
 Mon,  8 Dec 2025 18:54:47 +0000 (UTC)
Date: Mon, 8 Dec 2025 20:54:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aTce9PuTTZ4YWali@kernel.org>
References: <20251208174427.3459324-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251208174427.3459324-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1765220088;
 bh=+jqDK+ypeomM4rdIY+CZHj5fipaOCOIHl7bKsM/6ASw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qMET2C3jYWTLh5ys0C3xI1f4i5KGneuxmXO6BuGDRoqJNk3Q7tzDnZaWmc8zYV3al
 /385UWilR6C1zpdO+9PjvPE6mEUuNlagIHse3N2ehjJ2d4GTV2KXIu8BEj7/z3rGRO
 +OqfnN+3x+tJX0wTL1aD6iURXCbwoW4pzbhQg8DfmREE9lwGNpec9YgBVuVYwx071w
 0Y4/MiJtOKif0Uz4Ix7fvjoM/leinvAchipXZAF3EK0twk4Ax+LOBi1ht71k9ZITyl
 ty8FgjL3TqBtlxeOoLoKZpMgTq+lN8QjO6OCjZ3TOsP83QOCFwmeZ3b2bbCqH0/tCb
 zahBRHby0J8tQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qMET2C3j
Subject: Re: [Buildroot] [PATCH 1/1] package/swtpm: needs gmp
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Dec 08, 2025 at 06:44:27PM +0100, Bernd Kuhls wrote:
> Buildroot commit 2b449935c2e8e19a03a8962f49493a76ccca11f9 bumped swtpm
> from version 0.8.2 to 0.10.1.
> 
> Upstream added gmp as dependency in version 0.9.0:
> https://github.com/stefanberger/swtpm/commit/605e0ce8800201fca2a9a37dea5e99be7bdb2233
> 
> This causes build errors which are fixed by adding host-gmp as
> dependency.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d14/d14b2953e04b488b2f357386870d557d50190d34/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/swtpm/swtpm.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> index 25377f5771..de7f2fa05e 100644
> --- a/package/swtpm/swtpm.mk
> +++ b/package/swtpm/swtpm.mk
> @@ -10,6 +10,7 @@ SWTPM_LICENSE = BSD-4-Clause
>  SWTPM_LICENSE_FILES = LICENSE
>  
>  HOST_SWTPM_DEPENDENCIES = \
> +	host-gmp \
>  	host-json-glib \
>  	host-libopenssl \
>  	host-libtasn1 \
> -- 
> 2.47.3
> 

Thanks! I missed that sorry.


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
