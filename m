Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ABED0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17551810E0;
	Wed,  7 Jan 2026 17:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsTavtcY9KFC; Wed,  7 Jan 2026 17:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3775D810CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808267;
	bh=NgwBvRGHY49lrQ2MkBV+0abcKuNS9/4MTT/til1m+Lk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T9foHznX8b0bYEt2CqjREtrkSv28HuyyAe/pRv+Q2BHi6Wh6M2YKTEx9Dd6PfORL3
	 VXadsP0wSFDzQlsLZ14fhksX9ok/VVqcK+8sj59CwD+PEgZ2KyDbH6KedwrNW270kC
	 NamZLjPGSnwY4jyggmuGwyEj9K3IYC0HRUA9QbxJ0UEuxGVBujo2LBR7J/pgdUxvvd
	 y1i9T9ziQN7yFR3spYz5Cm4PKQG7uUoSmowvOy7OrBmk+S3DSbv1dZCocgaAVFH7V1
	 H8iwEutQE2Cim5r0ffg7fNR1khXc68790PLuyC70rIxaUls9LoMnChUzLzLVkpCTd7
	 hwTCOuCR1GciQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3775D810CA;
	Wed,  7 Jan 2026 17:51:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8A4325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9D13605D8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9GrJByuQNfD for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 161BF6062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161BF6062A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 161BF6062A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37005B97A192; Wed,  7 Jan 2026 18:51:02 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:00 +0100
Message-ID: <20260107175101.227301-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223181013.383914-3-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808262; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=aNK4rqw5cppWpr15UU5R/tENladTKzT+DZdoHttlSjs=;
 b=NJgZKRfreimsBbUL/pnbbxVwcTrm/EoVza1QOnTWnWmb9Tyzg7XivNh0qDDNAYy4dId9D1
 iDYuuIQgIdg771mVeoDCNVPE9OE5/rqwOHLKHs5QNAV1x2ILkq8/OTEhGyJ+EJ5LPoLuu+
 ws+FgX0zVVX6t5gj6EjHHOcW+cBcg8MqrL57vh5KrlXbswpIOr16SO0R7JzhhTNGvlVFOl
 dMmvR4pxDLmp0TR99BICfD5bdTCIJTfstgfuDn4F01eGzQsjEarmVrbaxw+7a/BwFXGqWD
 gmhkcYpsiSlK1vSlEG/uO7ypuWpLYdASHMuWglNj+CDHBFGKHCh5lokdy2QmLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NJgZKRfr
Subject: Re: [Buildroot] [PATCH 2/4] package/vim: use more conventional
 $(MAKE) construct
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
> In Buildroot, we more commonly do:
> 
>    $(MAKE) -C $(@D)/src
> 
> than:
> 
>    cd $(@D)/src; $(MAKE)
> 
> so let's adopt this more conventional style.
> 
> This coding style in vim.mk dates from when the package was introduced
> by Peter Korsgaard back in 2010.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/vim/vim.mk | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 43c9bfc0f1..10ff3a109b 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -48,17 +48,15 @@ endif
>  
>  define VIM_INSTALL_TARGET_CMDS
>  	$(RM) -f $(TARGET_DIR)/usr/bin/{ex,view,rvim,rview,vimdiff}
> -	cd $(@D)/src; \
> -		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
> -		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
> -		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
> -		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installvimbin
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installpack
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installtools
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installlinks
>  endef
>  
>  define VIM_INSTALL_RUNTIME_CMDS
> -	cd $(@D)/src; \
> -		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
> -		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installmacros
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installrtbase
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) installmacros
>  endef
>  
>  define VIM_REMOVE_DOCS
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
