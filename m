Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB032D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A55A0409B0;
	Wed,  7 Jan 2026 17:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYXxqQbS3IOn; Wed,  7 Jan 2026 17:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C728E41067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808533;
	bh=s0mIX8qwpdUN6QvR/EBaxuFM/OwTuxdiKAnWhiM26o0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LpI/dagoK4n72PcuXrl8dtQTP/agjPYn5TXNew7SeOOkdgo58AqA1fiNuMSLjiq9K
	 psGddFxBmTtARrJKMPXODMtaCtCvz8iShbVo+XD27JjMnKOGtUEN10ZCLEX+Q3V/Tw
	 +ogvL6wDzTwAIhhbjzF4s9OAAVhVWEKxHdYMCKVGL+CORBB3GXCdbNZZbnqE3tNmkr
	 UmITCzD/9nCKHYYtlzKm7TUfGCUbylVWAnLSCm8R+SHKvnCBiIx9sd2DWl8jYPxv1U
	 Ky0yeRAn6jkF6sAMh4tFxW3ndrnXO8GrJcXu4fCzdv8c70CUyMB2JssMREb+9ZZDN5
	 TScTeLOd2+lWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C728E41067;
	Wed,  7 Jan 2026 17:55:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C64525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EE1A827A0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vC3PtB6-KWsg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9FC480BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9FC480BAE
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9FC480BAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02922B97A704; Wed,  7 Jan 2026 18:55:28 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:26 +0100
Message-ID: <20260107175526.229986-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214153711.766150-1-thomas.petazzoni@bootlin.com>
References: <20251214153711.766150-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808529; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=gNQpGqSskplkWBQ4R7luSHxUog3PkOOhIHtFnNuHj/g=;
 b=gVGuG32aRanXG5vqD1Uqj2hv9koolID4loaeWAtYtk1iBMAJkzgZQaPAyQMF+9EbdeEwBL
 Q7EiIsE9+DO/KPk/qvtjvOI4VKn6uPrIJ2bi5O7+koFxpm8iNuXbz0YiUpfHGATd7pB1MI
 mNoOp7UIlFBkv4fKSu3yMkXeQy4B2Rl2Hz2NBvd5nvvk+yWyvFF3S/5XvJ52aIcPMc2W7M
 V6gASJImyG6OgSkjq5SYmOhdu/nRX+c8SRKCJVwul4FZ91yphenyb4JvVOnEvD7VQy/18E
 wbOCh9MdXH5X5KUykBu/kutPekKhyrlwuIckQNxwSrRbZkSYkOe9B+fDObjUcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gVGuG32a
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: make SuperH tweak
 actually effective
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
> In commit a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9 ("package/python3:
> work around GCC bug 121567"), we introduced a work around for a gcc
> bug, by reducing to -O1 the optimization level on SuperH.
> 
> However, it turns out that this is not sufficient, as the build will
> only succeeded at -O0.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/31f/31f34a983036b4135c12e5797b5c2258ab33e6c2/
> 
> Which is a config with BR2_OPTIMIZE_2=y, which means
> BR2_TOOLCHAIN_HAS_GCC_BUG_121567=y, and therefore -O1 is passed, but
> still the build fails. At -O0 the build doesn't fail.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.11.x. Thanks

> ---
>  package/python3/python3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 0189a505b4..4e660ecee2 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -192,7 +192,7 @@ endif
>  PYTHON3_CFLAGS = $(TARGET_CFLAGS)
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_121567),y)
> -PYTHON3_CFLAGS += -O1
> +PYTHON3_CFLAGS += -O0
>  endif
>  
>  PYTHON3_CONF_ENV += \
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
