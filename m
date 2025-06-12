Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3C5C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F940406D2;
	Thu, 12 Jun 2025 19:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjeKSdGlA1cq; Thu, 12 Jun 2025 19:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CB38406F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CB38406F8;
	Thu, 12 Jun 2025 19:58:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D555183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13EBB406D2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zeOOdOz2AUa for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:58:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6959B406C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6959B406C1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6959B406C1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 303531C0D69; Thu, 12 Jun 2025 21:58:03 +0200 (CEST)
Message-ID: <ae966dcd-f182-4876-a9f8-908184ceec8b@rnout.be>
Date: Thu, 12 Jun 2025 21:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
References: <20250528160355.1607644-1-yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250528160355.1607644-1-yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nMxhUYoEUTPjjFRNhsMKSxDjWooonVYvKhWQ3sNhTeI=;
 b=pnABV6B1GRt+kPuVcBubrXh75RQX1F8Aq6UHicxke/ApW+aSoECNxwyLZfOU2RfnlEWo7U
 aZRbs9lUsJea4ISKHIFAo+AajlJUOe0q4BQrP7T0QRF+mbLe84mDCqZEc8C8PGHe82obfL
 TvilVQbrAbKhqbU91MqQCc1uKaGKHwkiqbNuS1lq4aRUmy1jswuB/IE+iRnutY3gXrLPuj
 8dVfue7MGpMDCkIrwAnTyrwolgCAanuiCHOBjry5W+D1KiO/PwyZEPfr1G8V35g8mXuRxX
 HxqFlMVN71UEGCShEcMqC5Bw+1tZgLds2gc2SVWXsHUe8JBtRsCZu/iGdAypKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pnABV6B1
Subject: Re: [Buildroot] [PATCH] package/uacme: drop unneeded autoreconf
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/05/2025 18:03, Yann E. MORIN wrote:
> Commit 8c9c1222b79a (package/uacme: bump version to 1.7.6) bumperd the
> version to 1.7.6 which includes the patch we carried, so the patch was
> dropped, but the corresponding autoreconf was not.
> 
> Do so now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/uacme/uacme.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
> index 9a2c972604..fc5b97d23d 100644
> --- a/package/uacme/uacme.mk
> +++ b/package/uacme/uacme.mk
> @@ -13,9 +13,6 @@ UACME_LICENSE = GPL-3.0+
>   UACME_LICENSE_FILES = COPYING
>   UACME_DEPENDENCIES = libcurl
>   
> -# 0001-Fix-cross-compilation.patch touches configure.ac
> -UACME_AUTORECONF = YES
> -
>   UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_LIBS)"
>   
>   ifeq ($(BR2_PACKAGE_GNUTLS),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
