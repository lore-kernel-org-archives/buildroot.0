Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCE7C5DF6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 12:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92DA56069A;
	Sun, 16 Aug 2026 12:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obil0oEuBOIM; Sun, 16 Aug 2026 12:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 489C760614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786884139;
	bh=9DaHcQqeT0RcoD6TWszQObAqY/qs562KDDwFSpTxd/0=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9xx5LTVG9il4a3112EPJ217wBhoPmZj/siUxm1UfTEvKahxRec0oN9PlTplfM4JI
	 o0T3t/H4yezjcBvaoVbMTLrtUM2C3aq11AHd+5bciW3ZPNQbORiuLlEYFDoeB8UXfL
	 HAk/hcZWYVLjOMD9Z+02fPfK0d9zAlSIJsDyiDLLnR2dqk+spBerrkJ5A0J4pFT6tc
	 niQbITFSENAhYivcW++39ueSQysLcLRxrObQ4Rg0lGA+DSbmV3oEkEwcBGHPEswi7i
	 UVWtxr4f5hmHjbKjghznW/fKknIic6gVxqaOKg7ZbrFXEElum1f01/D0PoHM9hkj5Q
	 xW2lenAyLJ0cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489C760614;
	Sun, 16 Aug 2026 12:42:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D442B2
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52B1460614
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fA1xZpcLwwzj for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 12:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39107605F8
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39107605F8
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39107605F8
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786884135; bh=DxDPPGfONucCcHISRdXLKyh3FaburdLEVzYgmw7TF7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIwdu794y4LVANMtje91hYks2okjM/vObXOsveG6LKb4jw/NXtWgRLtrcz+R8aP3O
 GEQqDNdQZ2dHjnM8UXSeECpEdNls91KGuJdnaPHRwijasjtbYUOQsvIxQsIyG1Xmil
 2A4/HBYxZYF0fybd4Xa573bixr6MT4f1bPa6KZLAmt1lzmHCcnOEF+FYIx481ec8D3
 qZ5onS7+dao6sH5WFsGKiEP6RgeaInLWenIcinZJTXNthy8nIrTGrllQMmy1alGbJE
 s3ID/ig0ye0j7juQs1uNbAF4H2sLl5duhHPRAXYQz4VxBfb9c03Z2He+p+gqL83YFF
 mrGG3tWRZbtIw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1738131E0A0D; Sun, 16 Aug 2026 14:42:15 +0200 (CEST)
Date: Sun, 16 Aug 2026 14:42:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Message-ID: <aoGwJidOrpQIFCAd@waldemar-brodkorb.de>
References: <aoGDFa6rPRC6pXm6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoGDFa6rPRC6pXm6@waldemar-brodkorb.de>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/quickjs: bump to 2026-06-04
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

forgot to add Maintainer to CC.

Waldemar Brodkorb wrote,

> See here for a Changelog:
> https://bellard.org/quickjs/Changelog
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/quickjs/quickjs.hash | 2 +-
>  package/quickjs/quickjs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
> index 70dfb2d19c..4509e54e99 100644
> --- a/package/quickjs/quickjs.hash
> +++ b/package/quickjs/quickjs.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
> +sha256  b376e839b322978313d929fd20663b11ba58b75df5a46c126dd19ea2fa70ad2a  quickjs-2026-06-04.tar.xz
>  sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
> diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
> index 511f142456..72535ff4ef 100644
> --- a/package/quickjs/quickjs.mk
> +++ b/package/quickjs/quickjs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QUICKJS_VERSION = 2025-09-13
> +QUICKJS_VERSION = 2026-06-04
>  QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
>  QUICKJS_SITE = https://bellard.org/quickjs
>  QUICKJS_LICENSE = MIT
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
