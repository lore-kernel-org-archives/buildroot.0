Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB52D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5358240D5C;
	Wed,  7 Jan 2026 17:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3rUPkjLwQKG; Wed,  7 Jan 2026 17:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7EF40D4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808166;
	bh=fDqnyc563PJgcSPjpzYmauhJfyKlElcm1GQ+1tNvr2M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RZpluJ2UnyNVMpMuxkvQvisRbWa8SoBdF2RuRp2+OjggNJYyESbGxPXM7Bpc9IpzK
	 JQEqj+zFqlFDr85q2OGBWYEb3Cy7H8ib+/dch6Azbs86VLpupU62rZGkXIkkZ5y/38
	 hPqDe47gcH4bT8u5P7//N1WJ1Guty0zG3jC6MyZXddr/8yAXQJsxnFXjvTDmEG8vVb
	 7UNlGRM8CPWV0ZtxxuVGAe9OJFR0RBH5hMAwF7l5x50OTLtSw23fAMGXJuQOtCBVrf
	 /zgPjHbhIV4Mb0H4KNb+LbXltvnQnyrllEz7I4uf7RBcxaPjuSkQEkuUid4YAwpp0H
	 3kGypu1xjbftA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7EF40D4B;
	Wed,  7 Jan 2026 17:49:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6295A25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 549F6607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDS0ITgGr4OL for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 472B1607FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 472B1607FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 472B1607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7EED6B97A192; Wed,  7 Jan 2026 18:49:21 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:19 +0100
Message-ID: <20260107174919.225159-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216231456.347739-1-ju.o@free.fr>
References: <20251216231456.347739-1-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808161; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=X33lcnnrWxZnnR4JmA73uI5ochzAqiBdBUnEdPkHAfA=;
 b=mBc5Ecx2ZIPO6zF0l6XmPJWAy5AQgGYRwS1ztOppcikDLE+XTD2cbGF7iYJDb9iFMCWM/n
 gapiKnmc71vyFEX15mB0tLEHwaeHI0cG976okJxVvXEF8wGcfw3I8jqssnJ5Y/Hh1mmpEP
 IiRLu6E4NFR8JjbuLhWKk6hMokiN+08arHsbPMXpy11gynb5ZbllA5gwUQ5TBZ6PaI3kEL
 O1ZN/fHwmhWFPRrihutGoQjLqaMqgEud3meYAgxrGliFmZIxC1V0QII6lRtfnw1gbNWGlu
 bOdq+rYG1HikDmMwAQ7/TjmDwqqNz2TxGEm70EjyRzW/BakgKP//I4CphreBxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mBc5Ecx2
Subject: Re: [Buildroot] [PATCH 1/3] package/kvmtool: remove unneeded
 KVMTOOL_EXTRA_LDFLAGS
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
> Buildroot commit [1] "kvmtool: bump to f77d646ba0" removed the
> definition of KVMTOOL_EXTRA_LDFLAGS but forgot to remove its usage
> in KVMTOOL_MAKE_OPTS.
> 
> This commit removes it since it is no longer needed.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/f20615b53e83d6263346cb038d59df8e8d6b2b74
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/kvmtool/kvmtool.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
> index f5637e5384..58ca2d3642 100644
> --- a/package/kvmtool/kvmtool.mk
> +++ b/package/kvmtool/kvmtool.mk
> @@ -22,7 +22,7 @@ KVMTOOL_CPE_ID_VALID = YES
>  # Disable -Werror, otherwise musl is not happy
>  KVMTOOL_MAKE_OPTS = \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> -	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
>  	WERROR=0
>  
>  define KVMTOOL_BUILD_CMDS
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
