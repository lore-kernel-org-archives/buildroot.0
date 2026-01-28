Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D9DD3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729DB40C2C;
	Wed, 28 Jan 2026 17:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoM3zFPl-V8E; Wed, 28 Jan 2026 17:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A18940C2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621073;
	bh=LEgqDjoSD8c5Jt1E2JLXnghT3e/6IgZw8boIt6JaFkQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUSdzTG3qwwZKO4NRnbpyffJiWqptkG9Z7kY/fxmrcjOB/5Kd9tHaVMjllRAYUl3h
	 6kgIBpNyct3NuLhqVbXaci0CqSAgMdlMnBrQjQ57JSGZTIzxQ57ZUh99fk0ya34lwz
	 zz3VMwbZzMcuHogsNhYB+7pj1LpZgOpd1mJYX+mfn9IwxYApeXeNv4pfBdMmwZ+gJt
	 6cnjYQNvZ9Q1mXC3CwnCx0MWhKEZk4QDGmcm0piaWrWeR33rLb2T/sxk5Ms6u3eLfB
	 gmVeF+MLRTxWwRrb36G6wKSG52Gj8DEheuYAmqlGJLzlzDxIJgeDVcvap2ABnmc0H+
	 jEPN7XhgJKjXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A18940C2D;
	Wed, 28 Jan 2026 17:24:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4589B118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3426B409B1
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9tOl6VhBgsK for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FA8240513
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA8240513
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FA8240513
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CDB7B97AC12; Wed, 28 Jan 2026 18:24:25 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:24 +0100
Message-ID: <20260128172424.342959-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106200115.1985522-9-bernd@kuhls.net>
References: <20260106200115.1985522-9-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621065; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=GbQYjCRe0wKLw9EqFHGMT6fPJZDH4HBx0CTr3LraEz0=;
 b=YzQ095o/b+ENurVAufhUYpkUfF+4t0YlHyFRgukmD3Z3pnC0RGo6xU6YiLsMJDZQg5zv+S
 A+TTS7Byba7aKWMWhI0iUVZBBQ8m9zRwEZlO5D17mgrONwBhXwvwXYzAUxUNnx/m+zqXfa
 QpOk2RuQaSuz62pYvpAkLfM0ajqtL+xX7Wplz3d0177O5J8sKSibbOovEIQtKDH/JhzjgA
 dukYgfPDF3lks6tJJDA9KlnHg8h8BmARcmcEH6WQDRJs98i8KiP/a5XGBDBTyySqeglTI6
 /if4dNlyWFEaBSlNGi4rzbR28f4KgUOp0zQIrU/WoSNAs83Bg4XRUFIO0ZNq8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YzQ095o/
Subject: Re: [Buildroot] [PATCH v2 8/9] package/libgphoto2: remove optional
 dependency to lockdev
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
> The lockdev package is unmaintainted and will be removed from buildroot.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libgphoto2/libgphoto2.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
> index 851eb401a1..95c0190ee6 100644
> --- a/package/libgphoto2/libgphoto2.mk
> +++ b/package/libgphoto2/libgphoto2.mk
> @@ -53,8 +53,4 @@ else
>  LIBGPHOTO2_CONF_OPTS += --with-gdlib=no
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LOCKDEV),y)
> -LIBGPHOTO2_DEPENDENCIES += lockdev
> -endif
> -
>  $(eval $(autotools-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
