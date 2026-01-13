Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE50D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B38FC8422C;
	Tue, 13 Jan 2026 19:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lV7IWttOtZUp; Tue, 13 Jan 2026 19:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54E4E8422D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333595;
	bh=hPa9M4g1QXB3JC80OCHp7ukI1gF0OcwC5GLcLIoizN0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cjZhzWmf9DhNIvuj3epYCRCwZVvU7Knnx2+C+ufV25Xy7uxQj0ayttv8xKszVxcQx
	 Pf7aIgYy03mUS/GLfDnNedPReQdB80hd+u9/i16Ze2um586914Nyk/MD7Xbybywvo0
	 75KV8ybiZvYjlodpCH6PLsnLflC5U0s/K9o12t0mrV6zKKbTYHsinbr7UfobvbUh2i
	 Ez+5HNlq0zQWVNowwW+ePZk7CSlFAkE7TVvZ/3C43zqJ7nl3Yo0pJENtMf0NiOtYNh
	 M+DEWH5fHqCnBz+SYjdxYC+qAt6jBPqgzi75/PtP15njHUJgraRInJh6DplzcG9yRe
	 n8SBPVSsKUtDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54E4E8422D;
	Tue, 13 Jan 2026 19:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 479B0231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 381B340376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1tS5WzoOV90 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 328C040373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 328C040373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 328C040373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 455FEB97A863; Tue, 13 Jan 2026 20:46:30 +0100 (CET)
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:28 +0100
Message-ID: <20260113194628.98611-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229181303.1813920-1-pkerbrat@free.fr>
References: <20251229181303.1813920-1-pkerbrat@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333590; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=hX1BkyS7uTu/oGo+Gibdjr8BDodjAc9cG5BrsDhv1Fo=;
 b=XvYmYmvMdn3e28fAsumTc9PP5140KHsec8ygxHGstviHj8FQjvcoygBZyUlOINXAQpF7O3
 FS6riBqzjn/fhUZeebC6qQRoVz3eBWtosps215rGrYNDkMSW9Rbdq4TauR5u1Do4H4wvAa
 lsPM6cmWNMG2c/5dTW2yOgwukDyRltaCcvxeciS3IPsPwtzeFA0Sq2zBHNRiiZImNigBnd
 1DtjxAM6Rr5Sqq6R5TelGCEilp1u/1y4TWoFrFKlozELDshMVlu1ZNsk3x2c3X+nLWWXy8
 KjL8rggMOngEb5bclm4m2kRHm3pfeATMYCJZgwaq/32qsZbrLOCQl7qPtnWxvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XvYmYmvM
Subject: Re: [Buildroot] [PATCH] package/imagemagick: bump to 7.1.2-12
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
> Changelog:
> https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 3dbea6d8bc76..eead3a9f97b8 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  acf76a9dafbd18f4dd7b24c45ca10c77e31289fc28e4da0ce5cc3929fd0aef16  imagemagick-7.1.2-8.tar.gz
> +sha256  521fa7a8c0f664a3f5cf7437cbcc219f12bd6d5fe0c1fb014f212fa145076e60  imagemagick-7.1.2-12.tar.gz
>  sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 4e6a810631e8..0d5eb2aa34a8 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.2-8
> +IMAGEMAGICK_VERSION = 7.1.2-12
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
